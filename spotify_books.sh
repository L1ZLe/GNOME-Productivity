#!/bin/bash

# Function to start the playlist via DBus
start_playlist() {
    echo "Starting Spotify playlist..."

    # Check if Spotify is running; if not, start it
    if ! pgrep -x "spotify" > /dev/null; then
        echo "Spotify is not running. Starting Spotify..."
        spotify &
        sleep 5  # Wait for Spotify to initialize
    fi

    # Use DBus to play the specified playlist
    dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.OpenUri string:"spotify:playlist:76Cspb5cC3lxf9eJ0FyuNm" > /dev/null 2>&1
    sleep 2  # Ensure the playlist has time to load
    dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play > /dev/null 2>&1
}

# Function to stop the playlist
stop_playlist() {
    echo "Stopping Spotify playlist..."
    dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause > /dev/null 2>&1
}

# Monitor evince processes
while true; do
    # Check if evince is running
    if pgrep -x "evince" > /dev/null; then
        # If evince is running and the playlist isn't already started
        if [ -z "$playlist_started" ]; then
            start_playlist
            playlist_started=1
        fi
    else
        # If evince is not running and the playlist was started
        if [ -n "$playlist_started" ]; then
            stop_playlist
            playlist_started=
        fi
    fi

    # Sleep for a short interval to avoid high CPU usage
    sleep 60
done
