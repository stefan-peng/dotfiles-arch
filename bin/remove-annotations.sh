#!/bin/bash

FILE=$(basename $1 .pdf)
echo "Removing annotations from $FILE.pdf"

pdftk $FILE.pdf output $FILE-uncompressed.pdf uncompress
LANG=C sed -n '/^\/Annots/!p' $FILE-uncompressed.pdf > $FILE-stripped.pdf
pdftk $FILE-stripped.pdf output $FILE-final.pdf compress
rm $FILE-stripped.pdf $FILE-uncompressed.pdf
