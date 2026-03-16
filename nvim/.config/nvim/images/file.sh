#!/usr/bin/env bash

GIF_PATH="$HOME/.config/nvim/images/nerd.gif"

# Loop forever
while true; do
    # We removed 'exec' so the loop can continue
    chafa "$GIF_PATH" \
        --format symbols \
        --symbols vhalf \
				-c full \
        --clear \
				--speed=0.8 \
        --animate on \
        --watch


done
