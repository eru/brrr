#! /bin/sh
#
# brrr.sh
# Copyright (C) 2019 Kazuki Hashimoto <eru.tndl@gmail.com>
#
# Distributed under terms of the MIT license.
#


TMP_FILE=$(mktemp --suffix=.png)
ORIG_FILE="$1"
convert "$ORIG_FILE" -resize 64x64 -gravity center -extent 128x128 -background white -flatten "$TMP_FILE"
convert "$TMP_FILE" -page +1+1 -rotate -1.5 -gravity center -crop 64x64+0+0! "${TMP_FILE}_001.png"
convert "$TMP_FILE" -page -1-1 -rotate +2.0 -gravity center -crop 64x64+0+0! "${TMP_FILE}_002.png"
convert "$TMP_FILE" -page -2+0 -rotate -1.5 -gravity center -crop 64x64+0+0! "${TMP_FILE}_003.png"
convert "$TMP_FILE" -page +2+1 -rotate +1.5 -gravity center -crop 64x64+0+0! "${TMP_FILE}_004.png"
convert "$TMP_FILE" -page +1-1 -rotate -2.0 -gravity center -crop 64x64+0+0! "${TMP_FILE}_005.png"
convert "$TMP_FILE" -page -1+2 -rotate +2.0 -gravity center -crop 64x64+0+0! "${TMP_FILE}_006.png"
convert "$TMP_FILE" -page -2+1 -rotate -2.0 -gravity center -crop 64x64+0+0! "${TMP_FILE}_007.png"
convert "$TMP_FILE" -page +2+1 -rotate +1.5 -gravity center -crop 64x64+0+0! "${TMP_FILE}_008.png"
convert "$TMP_FILE" -page -1-1 -rotate -2.0 -gravity center -crop 64x64+0+0! "${TMP_FILE}_009.png"
convert "$TMP_FILE" -page +1-2 -rotate +1.5 -gravity center -crop 64x64+0+0! "${TMP_FILE}_010.png"
convert "$TMP_FILE" -page +1+1 -rotate -1.5 -gravity center -crop 64x64+0+0! "${TMP_FILE}_011.png"
convert "$TMP_FILE" -page -1+2 -rotate +2.0 -gravity center -crop 64x64+0+0! "${TMP_FILE}_012.png"
mogrify +repage "${TMP_FILE}_"*
convert -delay 5 -loop 0 "${TMP_FILE}_"* "${ORIG_FILE%.*}".gif
/bin/rm -f "${TMP_FILE}"*
