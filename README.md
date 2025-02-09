# GNOME Automation Scripts for Productivity

This repository contains three Bash scripts designed to enhance productivity and focus on GNOME-based Linux systems (Debian). Each script automates a useful task to help with eye strain relief, text extraction, and improved concentration while reading.

## Scripts Overview

### 1. **Cooldown Script** (`salah_cooldown.sh`)
This script prevents you from logging into your laptop for 5 minutes, giving you a break to rest your eyes, meditate, or pray. It is integrated with `crontab` to trigger at specific intervals.

**Usage:**
```bash
./salah_cooldown.sh
```
- Once executed, the script will log you out and prevent login for 5 minutes.
- Can be scheduled via `crontab` for automatic execution.

### 2. **OCR Screenshot to Text Script** (`my_ocr_to_text.sh`)
This script allows you to extract text from a screenshot and automatically copy it to the clipboard. It is linked to a shortcut for quick access.

**Usage:**
- Take a screenshot of the desired text using your shortcut.
- The extracted text will be available in the clipboard.
- Press `Ctrl + V` to paste the extracted text anywhere.

### 3. **Spotify Books Script** (`spotify_books.sh`)
Whenever you open a PDF file (e.g., a book for reading), this script automatically plays a focus-enhancing Spotify playlist (beta waves binaural beats) to help you concentrate.

**Usage:**
- Open any PDF file.
- The Spotify playlist will start playing in the background.

## Installation & Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/L1ZLe/GNOME-Productivity
   ```
2. Grant execution permissions:
   ```bash
   chmod +x salah_cooldown.sh my_ocr_to_text.sh spotify_books.sh
   ```
3. Configure crontab (for the cooldown script):
   ```bash
   crontab -e
   ```
   Add the following line to run the cooldown script at desired intervals:
   ```
   0 * * * * /path/to/salah_cooldown.sh
   ```
4. Link the `my_ocr_to_text.sh` script to a keyboard shortcut in GNOME Settings.
5. Ensure the `spotify_books.sh` script is triggered automatically when opening PDFs by associating it with your PDF reader.

## License
This project is open-source and available under the MIT License.

## Contributions
Feel free to contribute, suggest improvements, or report issues!

---
