#!/bin/bash

set -euo pipefail

### Script for downloading albums from Youtube Music ##########
### Usage: ./yt-music-album-download.sh <youtube music url> ###

# - Converts to MP3 from the best quality audio feed
# - Adds track number, album, artist, title, and release year into id3 tags
# - Adds album art embedded thumbnails

if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <youtube music url>" >&2
        exit 1
fi

echo "Retrieving album information..."
# Downloading the json data of the first track only
jsondata=$(yt-dlp -j --playlist-items 1 "$1")

# Grabbing the "release_year" and "release_date" and comparing which is lowest integer.
# Sometimes Youtube Music doesn't even populate the "release_date" field, but when it does we need to compare it to "release_year"
# If both the "release_date" and "release_year" exist, check which one is the lower integer, and that should be the actual album release year.
jq_release_year_1=$(printf '%s\n' "$jsondata" | jq -r '.release_year')
jq_release_date=$(printf '%s\n' "$jsondata" | jq -r '.release_date')

if [ "$jq_release_date" != 'null' ] && [ "${#jq_release_date}" -ge 4 ]; then
        jq_release_year_2=${jq_release_date:0:4}
else
        jq_release_year_2=""
fi

if [[ "$jq_release_year_1" =~ ^[0-9]+$ && "$jq_release_year_2" =~ ^[0-9]+$ ]]; then
        year=$((jq_release_year_1 < jq_release_year_2 ? jq_release_year_1 : jq_release_year_2));
elif [[ "$jq_release_year_1" =~ ^[0-9]+$ ]]; then
        year=$jq_release_year_1
elif [[ "$jq_release_year_2" =~ ^[0-9]+$ ]]; then
        year=$jq_release_year_2
else
        year=""
fi

# Grabbing the artist then removing any superfluous information after the first comma. Some artists put every band memember into the artist field.
jq_artist=$(printf '%s\n' "$jsondata" | jq -r '.artist')
artist=${jq_artist%%,*}
artist_escaped=${artist//\"/\\\"}

postprocessor_args="-metadata artist=\"${artist_escaped}\""
if [ -n "$year" ]; then
        postprocessor_args="-metadata date=${year} ${postprocessor_args}"
fi

echo "Album information retrieved..."
# Pass to yt-dlp and begin download all the music!
yt-dlp  --ignore-errors \
        --format "(bestaudio[acodec^=opus]/bestaudio)/best" \
        --extract-audio \
        --audio-format mp3 \
        --audio-quality 0 \
        --parse-metadata "playlist_index:%(track_number)s" \
        --parse-metadata ":(?P<webpage_url>)" \
        --parse-metadata ":(?P<synopsis>)" \
        --parse-metadata ":(?P<description>)" \
        --add-metadata \
        --postprocessor-args "$postprocessor_args" \
        -o "${artist}/%(album)s/%(playlist_index)s %(title)s.%(ext)s" "$1"
