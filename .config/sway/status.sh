# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# Produces "21 days", for example
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M")

# Returns the battery percentage
energy_full_0=$(cat /sys/class/power_supply/BAT0/energy_full)
energy_full_1=$(cat /sys/class/power_supply/BAT1/energy_full)
energy_full_total=$(echo "$energy_full_0 + $energy_full_1" | bc)
percent_0=$(cat /sys/class/power_supply/BAT0/capacity)
percent_1=$(cat /sys/class/power_supply/BAT1/capacity)
capacity_0=$(echo "$percent_0 * $energy_full_0" | bc)
capacity_1=$(echo "$percent_1 * $energy_full_1" | bc)
capacity_total=$(echo "$capacity_0 + $capacity_1" | bc)
battery_status=$(echo "$capacity_total / $energy_full_total" | bc)
#battery_status=$capacity_total

# Emojis and characters for the status bar
echo $uptime_formatted ↑ $battery_status% $date_formatted
