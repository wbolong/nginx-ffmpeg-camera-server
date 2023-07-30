#!/usr/bin/env bash

exec ffmpeg \
    -f v4l2 \
    -input_format yuyv422 \
    -framerate 30 \
    -video_size 640x480 \
    -i /dev/video0 \
    -f alsa \
    -ac 1 \
    -i sysdefault:CARD=U0x46d0x825 \
    -c:v libx264 \
    -preset ultrafast \
    -c:a aac \
    -f flv \
    -vf "transpose=2, drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf: text='$(hostname) /dev/video0
%{localtime\:%Y-%m-%dT%T}': fontcolor=white: fontsize=20: x=20: y=20: box=1: boxcolor=black@0.5: boxborderw=10: line_spacing=5" \
    -loglevel error \
    rtmp://127.0.0.1:41935/live/stream

