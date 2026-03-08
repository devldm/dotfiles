#!/bin/bash

while true; do
  bat_capacity=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null | head -1)
  bat_status=$(cat /sys/class/power_supply/BAT*/status 2>/dev/null | head -1)

  if [ -n "$bat_capacity" ]; then
    if [ "$bat_status" = "Charging" ]; then
      bat_icon="󰂄"
    elif [ "$bat_capacity" -ge 90 ]; then
      bat_icon="󰁹"
    elif [ "$bat_capacity" -ge 70 ]; then
      bat_icon="󰂁"
    elif [ "$bat_capacity" -ge 50 ]; then
      bat_icon="󰁿"
    elif [ "$bat_capacity" -ge 30 ]; then
      bat_icon="󰁽"
    elif [ "$bat_capacity" -ge 10 ]; then
      bat_icon="󰁻"
    else
      bat_icon="󰂃"
    fi
    battery="${bat_icon} ${bat_capacity}%"
  fi

  clock=$(date '+%a %d %b  %H:%M')

  if [ -n "$battery" ]; then
    echo "${battery}   ${clock}"
  else
    echo "${clock}"
  fi

  sleep 30
done
