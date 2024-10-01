#!/bin/zsh

ACTIVE_DISPLAY_ID=$(yabai -m query --spaces | jq '.[] | select(."has-focus" == true).display')

for WINDOW_ID in $(yabai -m query --windows | jq ".[] | select(.display == $ACTIVE_DISPLAY_ID).id"); do
  echo "$WINDOW_ID"
  # yabai -m window --focus $WINDOW_ID
  # yabai -m window --toggle zoom-fullscreen
  yabai -m window $WINDOW_ID --grid 1:1:0:0:1:1
  # yabai -m window $WINDOW_ID --toggle zoom-fullscreen
  # yabai -m window $WINDOW_ID --toggle native-fullscreen
done

