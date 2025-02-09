#!/bin/bash

# Mute the system volume
/usr/bin/amixer set Master 0% 

LOCK_DURATION=300
lockduration=$LOCK_DURATION  # Initialize lockduration to the LOCK_DURATION value

# Lock the screen every second
while [ $lockduration -gt 0 ]; do
  /usr/bin/gnome-screensaver-command --lock
  ((lockduration--))  # Decrease lockduration by 1
  sleep 1
done

