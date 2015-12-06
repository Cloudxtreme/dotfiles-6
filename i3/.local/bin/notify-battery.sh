#!/bin/zsh

#
# Battery notification script
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.local/bin/notify-battery.sh
#

# Battery power levels
readonly level_critical=15
readonly level_low=30
readonly level_high=80
readonly level_full=95

# Sends notification
battery_notify() {
	local urgency=$1
	local expire=$(($2 * 1000))
	local info=$3
	local message=$4

	/usr/bin/notify-send -u $urgency -t $expire $info $message
}

# Get battery state and power level
state=$(acpi -b | cut -d ' ' -f 3 | cut -d ',' -f 1)
level=$(acpi -b | cut -d ' ' -f 4 | cut -d '%' -f 1)

# Notify on certain conditions
if [ $state = 'Discharging' ]; then
	if [ $level -le $level_critical ]; then
		battery_notify critical 60 \
		'Battery critical' \
		'Connect power supply.'
	elif [ $level -le $level_low ]; then
		battery_notify low 15 \
		'Battery low' \
		'Connect power supply to save battery life.'
	fi
elif [ $state = 'Charging' ]; then
	if [ $level -ge $level_full ]; then
		battery_notify normal 60 \
		'Battery full'\
		'Disconnect power supply.'
	elif [ $level -ge $level_high ]; then
		battery_notify low 15 \
		'Battery high' \
		'Disconnect power supply to save battery life.'
	fi
fi
