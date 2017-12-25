#!/bin/bash
#
# Script for generating a blurred lock screen
#

TEXT="Enter your password or insert your YubiKey to unlock"
LOCK=/tools/lock.png

# Capture screen
scrot /tmp/screen.png

# Make it blurry
convert /tmp/screen.png -blur 0x20 /tmp/screen.png

# Add locked screen
convert /tmp/screen.png \( $LOCK -background None -scale 300 \) \
   -gravity Center -composite -matte /tmp/screen.png

# Primary X offset
convert /tmp/screen.png \
	-font 'Hack-Bold' -pointsize 48 -fill '#FFFFFFC0' \
	-gravity South -annotate +0+128 "$TEXT" \
	/tmp/screen.png

i3lock -i /tmp/screen.png -t -f
rm /tmp/screen.png
