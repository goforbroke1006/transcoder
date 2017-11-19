package main

import (
	"fmt"
	"github.com/goforbroke1006/transcoder/preset"
	"os"
	"strings"
)

func main() {
	inFiles:=strings.Split(os.Args[1] , " ")

	var p preset.WebVideo
	out, err := p.Execute(inFiles)
	if nil != err {
		panic(err.Error())
	}

	for _, val := range out {
		fmt.Println(val)
	}
}
