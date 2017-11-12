package main

import (
	"fmt"
	"log"
	"os/exec"
	"time"
)

func main() {
	for {
		out, err := exec.Command("touch TROLOLO.txt").Output()
		if err != nil {
			log.Fatal(err)
		}
		fmt.Printf("The date is %s\n", out)

		time.Sleep(5 * time.Second)
	}
}
