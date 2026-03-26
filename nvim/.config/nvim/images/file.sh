#!/usr/bin/env bash


IMG_DIR="$HOME/.config/nvim/images"
LAST_FILE_TRACKER="$IMG_DIR/.last_meme"


touch "$LAST_FILE_TRACKER"
LAST_PLAYED=$(cat "$LAST_FILE_TRACKER")

# 2. Optimized file picking (Filter once, store in variable)
MAPFILE=($(find "$IMG_DIR" -maxdepth 1 -type f | grep -E '\.(gif|png|jpg|jpeg|webp)$'))
FILE_COUNT=${#MAPFILE[@]}

if [ "$FILE_COUNT" -eq 0 ]; then
    echo "No images found"
    exit 1
fi

# Pick random until different
while true; do
    CURRENT_FILE="${MAPFILE[$((RANDOM % FILE_COUNT))]}"
    if [[ "$CURRENT_FILE" != "$LAST_PLAYED" || "$FILE_COUNT" -le 1 ]]; then
        break
    fi
done

# Save and Run
echo "$CURRENT_FILE" > "$LAST_FILE_TRACKER"

exec chafa "$CURRENT_FILE" \
    --format symbols \
    --symbols block \
    -c full \
    --clear \
    --size 58x28 \
    --align mid,mid \
    --speed=0.8 \
    --animate on \
    --watch
