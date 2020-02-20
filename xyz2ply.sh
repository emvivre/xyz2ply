#!/bin/sh

#  Copyright: (c) 2020 François Lozes <emvivre@urdn.com.ua>
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the Do What The Fuck You Want To
#  Public License, Version 2, as published by Sam Hocevar. See
#  http://www.wtfpl.net/ for more details.

if [ $# -ne 4 ]; then
    echo "Usage: $0 <X_TEXT_FILE> <Y_TEXT_FILE> <Z_TEXT_FILE> <OUTPUT_PLY>"
    exit 1
fi

set -eux

X_FILE=$1
Y_FILE=$2
Z_FILE=$3
OUTPUT_PLY=$4

NB_POINTS=$(wc -l $X_FILE | cut -d' ' -f1)
echo "ply
format ascii 1.0
comment $0
element vertex $NB_POINTS
property float x
property float y
property float z
end_header" > $OUTPUT_PLY
paste -d' ' $X_FILE $Y_FILE $Z_FILE >> $OUTPUT_PLY
