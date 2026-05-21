#!/bin/bash

for img in *.jpg; do
    ffmpeg -y -i "$img" -vf scale=1500:-1 "$img"
done
