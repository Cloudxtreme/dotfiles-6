#!/bin/zsh

#
# Lemonbar script
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.local/bin/bar.sh
#

color_00='#FF282828'
color_01='#FFCC241d'
color_02='#FF98971A'
color_03='#FFD79921'
color_04='#FF458588'
color_05='#FFB16286'
color_06='#FF689D6A'
color_07='#FFA89984'
color_08='#FF928374'
color_09='#FFFB4934'
color_10='#FFB8BB26'
color_11='#FFFABD2F'
color_12='#FF83A598'
color_13='#FFD3869B'
color_14='#FF8EC07C'
color_15='#FFEBDBB2'

bg0_h='#FF1D2021'
bg0_s='#32302f'

bg0='#FF282828'
bg1='#FF3C3836'
bg2='#FF504945'
bg3='#FF665C54'
bg4='#FF7C6F64'

gray='#FF928374'

fg4='#FFA89984'
fg3='#FFBDAE93'
fg2='#FFD5C4A1'
fg1='#FFEBDBB2'
fg0='#FFFBF1C7'

orange_d='#FFD65D0E'
orange_l='#FFFE8019'

panel_height=32
panel_font='tewi:size=8'
panel_font_icon='siji:size=8'

panel_fifo='/tmp/panel.fifo'

if [[ $(pgrep -cx lemonbar) -gt 1 ]]; then
  printf "%s\n" 'The panel is already running.' >&2
  exit 1
fi

[ -e "$panel_fifo" ] && rm "$panel_fifo"
mkfifo "$panel_fifo"

# Init sound
sink_name=$(pactl info | grep 'Default Sink' | cut -d' ' -f3)
sink_id=$(pactl list short sinks | grep "$sink_name" | cut -f1)

# Workspaces
while true; do
  ws_data=()
  for ((i=1; i < 9; i++)); do
    name=" $i "
    ws_data+=("%{A:i3-msg 'workspace ${name}':}%{F$bg3}  %{F-}%{A}")
  done

  ws_infos=$(i3-msg -t get_workspaces)
  workspaces=$(echo $ws_infos | jq '. | length')
  for ((i=0; i < $workspaces; i++)); do
    num=$(echo $ws_infos | jq -r --arg i "$i" '.[$i | tonumber].num')
    name=$(echo $ws_infos | jq -r --arg i "$i" '.[$i | tonumber].name')
    focused=$(echo $ws_infos | jq -r --arg i "$i" '.[$i | tonumber].focused')
    urgent=$(echo $ws_infos | jq -r --arg i "$i" '.[$i | tonumber].urgent')

    if [ "$urgent" = "true" ]; then
      ws_data[$num]="%{A:i3-msg 'workspace ${name}':}%{F$color_09}  %{F-}%{A}"
    elif [ "$focused" = "true" ]; then
      ws_data[$num]="%{A:i3-msg 'workspace ${name}':}%{F$fg3}  %{F-}%{A}"
    else
      ws_data[$num]="%{A:i3-msg 'workspace ${name}':}%{F$bg3}  %{F-}%{A}"
    fi
  done

  ws_output=''
  for ws in $ws_data; do
    ws_output="$ws_output$ws"
  done

  echo "W$ws_output"
  sleep 0.2
done > "$panel_fifo" &

# Window title
#function window_title() {
#  title="$(xtitle)"
#  if [ ${#title} -gt 120 ]; then
#    title="${title:0:120}..."
#  fi
#  title="T%{F$fg2}$title%{F-}"
#  echo $title
#}
#while true; do
#  echo $(window_title)
#  sleep 0.2
#done > "$panel_fifo" &

# Date and time
while true; do
  d_date="%{F$color_14}%{F$fg2} $(date '+%a, %d %b')%{F-}"
  d_time="%{F$color_14}%{F$fg2} $(date '+%H:%M')%{F-}"
  echo "C%{A:firefox --new-tab 'calendar.sunrise.am':}$d_date%{A}  $d_time"
  sleep 1
done > "$panel_fifo" &

# Battery
while true; do
  battery_status=$(cat '/sys/class/power_supply/BAT0/status')
  capacity=$(cat '/sys/class/power_supply/BAT0/capacity')

  if [ "$battery_status" = "Charging" ]; then
    battery_icon=''
    color="$color_11"
  elif [ $capacity -le 15 ]; then
    battery_icon=''
    color="$color_09"
  elif [ $capacity -lt 85 ]; then
    battery_icon=''
    color="$color_12"
  else
    battery_icon=''
    color="$color_10"
  fi

  echo "B%{F$color}$battery_icon%{F$fg2} $capacity%{F-}"
  sleep 1
done > "$panel_fifo" &

# Network
while true; do
  eth=$(nmcli c show --active | grep 'enp1s0')
  wifi=$(iwgetid | cut -d \" -f 2)
  output=''
  if [[ "$eth" = '' && "$wifi" = '' ]]; then
    output="%{F$fg4}disconnected%{F-}"
  else
    if [[ "$wifi" != '' ]]; then
      quality=$(iwconfig wlp2s0 | grep Quality | cut -d = -f 2 \
        | cut -d / -f 1)
      if [ $quality -ge 50 ]; then
        wifi_color="$color_10"
        wifi_icon=''
      elif [ $quality -ge 35 ]; then
        wifi_color="$color_11"
        wifi_icon=''
      elif [ $quality -ge 15 ]; then
        wifi_color="$orange_l"
        wifi_icon=''
      else
        wifi_color="$color_09"
        wifi_icon=''
      fi
      output="$output%{F$wifi_color}$wifi_icon%{F$fg2} $wifi%{F-}"
      [[ "$eth" != '' ]] && output="$output  "
    fi

    [[ "$eth" != '' ]] && output="$output%{F$color_10}%{F$fg2} wired%{F-}"
  fi

  echo "N%{A:nm-menu.sh:}%{A3:nm-prefs.sh:}$output%{A}%{A}"
  sleep 1
done > "$panel_fifo" &

# Volume
while true; do
  mute=$(pactl list sinks | grep '^[[:space:]]Mute:' \
    | head -n $(($sink_id + 1)) | tail -n 1 | cut -d' ' -f2)
  vol=$(pactl list sinks | grep '^[[:space:]]Volume:' \
    | head -n $(($sink_id + 1)) | tail -n 1 \
    | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

  if [ "$mute" = 'yes' ]; then
    volume_icon=''
    color="$fg4"
  else
    volume_icon=''
    color="$fg2"
  fi

  echo "V%{A:pactl set-sink-mute ${sink_id} toggle:}%{A4:pactl set-sink-volume ${sink_id} +5%:}%{A5:pactl set-sink-volume ${sink_id} -5%:}%{F$color_13}${volume_icon}%{F$color} ${vol}%{F-}%{A}%{A}%{A}"
  sleep 0.5
done > "$panel_fifo" &

# MPD
while true; do
  mpd_s=$(mpc status)
  s_len=$(echo $mpd_s | wc -l)
  if [ $s_len -gt 2 ]; then
    track=$(echo $mpd_s | head -n 1)
    details=$(echo $mpd_s | head -n 2 | tail -n 1 | tr -s ' ')
    ttime=$(echo $details | cut -d ' ' -f 3)
    mode=$(echo $details | cut -d ' ' -f 1)

    case "$mode" in
      '[paused]')
        icon=''
        color="$fg4"
        color_time="$fg4"
        ;;
      '[playing]')
        icon=''
        color="$fg2"
        color_time="$fg3"
        ;;
    esac

    echo "M%{A:mpc toggle:}%{A3:mpc stop:}%{A4:mpc prev:}%{A5:mpc next:}%{F$fg1}%{F$color_13}%{F$color} $track %{F$fg1}$icon %{F$color_time}$ttime%{F-}%{A}%{A}%{A}%{A}"
  else
    echo "M"
  fi
  sleep 0.5
done > "$panel_fifo" &

bar_parser.sh < "$panel_fifo" | lemonbar \
  -g "x$panel_height" \
  -F "$bg3" \
  -B "$bg0" \
  -u 2 \
  -f "$panel_font" \
  -f "$panel_font_icon" \
  | zsh

wait

# vim:ft=zsh
