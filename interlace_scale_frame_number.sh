#!/bin/bash

ls -l
echo "Please enter the input file:"
read in_file

out_file=output.ts

ffmpeg -i $in_file \
        -vf 'scale=1280x720, bwdif=0:-1:0, drawtext=fontfile=Arial.ttf: text=%{n}: x=(w-tw)/2: y=h-(2*lh): \
        fontsize=35: fontcolor=white: box=1: boxcolor=0x00000099' \
        -c:v libx264 -r 50 -x264opts nal-hrd=cbr \
        -b:v 50M -minrate:v 50M -maxrate:v 50M -muxrate 65M -bufsize:v 130M \
        -c:a aac -ac 2 -b:a 128k \
        -f mpegts $out_file

ffprobe $out_file &> test.log \
&& grep -i video test.log \
&& grep -i audio test.log \
&& rm test.log
