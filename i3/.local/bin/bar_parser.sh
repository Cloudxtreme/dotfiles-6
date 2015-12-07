#!/bin/zsh

#
# Lemonbar parser
#
# Author: Sebastian Potasiak <sebpot@protonmail.com>
# Date:   2015-12-06
# File:   ~/.local/bin/bar_parser.sh
#

while read -r line; do
  case $line in
    B* )
      battery="${line#?}"
      ;;
    W* )
      wm_infos="${line#?}"
      ;;
    N* )
      network="${line#?}"
      ;;
    C* )
      clock="${line#?}"
      ;;
    V* )
      volume="${line#?}"
      ;;
    M* )
      music="${line#?}"
      ;;
  esac

  printf "%s\n" "%{l} $music%{c}  $wm_infos  %{r} $volume    $network    $battery    $clock  "
done

# vim:ft=zsh
