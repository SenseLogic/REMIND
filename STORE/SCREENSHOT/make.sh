#!/bin/sh
set -x
for file_path in *.png
do
    file_name=${file_path##*/}
    convert "$file_name" -gravity North -chop  0x72 "CROPPED/$file_name"
done
