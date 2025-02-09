#!/bin/bash

# Capture the area selected by the user
gnome-screenshot -a -f /tmp/my_ocr_screenshot.png

# Check if the screenshot was successfully captured
if [[ ! -f /tmp/my_ocr_screenshot.png ]]; then
    exit 1
fi

# Perform OCR on the screenshot and store the text
TEXT=$(tesseract /tmp/my_ocr_screenshot.png stdout 2>/dev/null)

# If text is detected, copy it to the clipboard
[[ -n "$TEXT" ]] && echo -n "$TEXT" | xclip -selection clipboard

# Cleanup temporary file
rm /tmp/my_ocr_screenshot.png

