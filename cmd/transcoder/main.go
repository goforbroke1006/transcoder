package main

import (
	"fmt"
	"github.com/goforbroke1006/transcoder/preset"
)

func main() {
	var p preset.WebVideo
	out, err := p.Execute([]string{
		//"480i.ts",
		"drop.avi",
		"flame.avi",
		"H264_720p.ts",
		"katamari-star8-10s.mpg",
		"katamari-star8-10s.rmvb",
		"katamari-star8-10s.wmv",
		"katamari-star8-10s-h264.mov",
		"sample.3gp",
	})
	if nil != err {
		panic(err)
	}

	for _, val := range out {
		fmt.Println(val)
	}
}
