#!/bin/bash

# is valid? oWo
if [ "$1" != "normal" ] && [ "$1" != "left" ] && [ "$1" != "right" ] && [ "$1" != "inverted" ]; then
  echo "Invalid argument. Please enter one of the following: normal, left, right, or inverted."
  exit 1
fi

# Rotate UwU 
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  for x in $(kscreen-doctor -o | grep "enabled" | awk '{print $3}'); do
    kscreen-doctor output.$x.rotation.$1
  done
else
  for x in $(xrandr | grep "connected" | awk '{print $1}'); do
    xrandr --output "$x" --rotate $1
  done
fi
