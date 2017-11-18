package main

import (
	"fmt"
	"log"
	"os/exec"
	"strings"
	"time"
)

func main() {
	filename := "sample_iTunes.mov"
	parts := strings.Split(filename, ".")
	name, _ := parts[0], parts[1]
	for {
		codec, err := exec.Command("sh", "-c", fmt.Sprintf(
			"ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 /bucket/input/%s | tail -1",
			filename,
		)).Output()
		if err != nil {
			log.Fatal(err)
		}

		var convertCmd string

		switch string(codec) {
		case "h264": // m4v, mov, ts
			convertCmd = fmt.Sprintf("ffmpeg -y -i /bucket/input/%s /bucket/output/%s.mp4", filename, name)
		case "mpeg4": // 3g2, 3gp
			convertCmd = fmt.Sprintf("ffmpeg -i /bucket/input/%s -vcodec copy -acodec copy /bucket/output/%s.mp4", filename, name)
		case "theora": // ogv
			//
		case "h263": // 3gp
			//
		case "mpeg2video": // mpg
			//
		case "svq1": // mov
			//
		case "rv40": // rmvb
			//
		case "vp8": // webm
			//
		case "wmv3": // wmv
			//
		case "indeo4": // avi
			//
		}

		out, err := exec.Command("sh", "-c", convertCmd).Output()

		if err != nil {
			log.Fatal(err)
		}

		out, err = exec.Command("sh", "-c",
			fmt.Sprintf("rm -f /bucket/input/%s", filename)).Output()

		if err != nil {
			log.Fatal(err)
		}
		fmt.Print(out)

		time.Sleep(5 * time.Second)
	}
}
