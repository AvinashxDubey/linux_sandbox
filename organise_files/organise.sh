#!/bin/bash

TARGET_DIR="${1:-$(pwd)}"
cd "$TARGET_DIR" || { echo "Directory not found"; exit 1; }

# creating folders if they dont exist
mkdir -p Pictures Documents Music Videos Others

# moving image files to Pictures folder
mv *.jpg *.jpeg *.png *.gif Pictures 2>/dev/null

# Move document files
mv *.pdf *.doc *.docx *.txt Documents 2>/dev/null

# Move music files
mv *.mp3 *.wav *.flac Music 2>/dev/null

# Move video files
mv *.mp4 *.avi *.mov Videos 2>/dev/null

# Remaining files go in "Others"
for f in *
do
  if [ -f "$f" ] && [[ "$f" != "organize.sh" ]] && [[ ! "$f" =~ ^(Images|Documents|Music|Videos|Others)$ ]]; then
    mv "$f" Others
  fi
done

echo "Files sorted!"
