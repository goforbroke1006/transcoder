#!/usr/bin/env bash

docker run goforbroke1006/transcoder bash

docker-compose exec workspace ffmpeg -y -i /bucket/input/H264_720p.ts /bucket/output/H264_720p.mp4


sudo chmod -R 0777 ./bucket/output/

docker-compose exec workspace transcoder


ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 /bucket/input/katamari-star8-10s.rmvb

ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 /bucket/input/small.3gp | tail -1
ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 /bucket/input/sample.3gp | tail -1


ffmpeg -i /bucket/input/small.3gp -vcodec copy -acodec copy /bucket/output/small.mp4




docker-compose exec workspace transcoder "drop.avi flame.avi H264_720p.ts katamari-star8-10s.mpg katamari-star8-10s.rmvb katamari-star8-10s.wmv katamari-star8-10s-h264.mov sample.3gp"
docker-compose exec workspace transcoder "flame.avi H264_720p.ts katamari-star8-10s.mpg katamari-star8-10s.rmvb katamari-star8-10s.wmv katamari-star8-10s-h264.mov sample.3gp"