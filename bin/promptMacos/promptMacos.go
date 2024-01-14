package main

import (
	"fmt"
	"os"
	"strings"
	"time"

	gosysinfo "github.com/elastic/go-sysinfo"
)

func main() {
	cwd, _ := os.Getwd()
	host, _ := os.Hostname()
	home := os.Getenv("HOME")
	var parts []string
	if strings.HasPrefix(cwd, home) {
		cwd = "~" + cwd[len(home):]
	}

	var hostInfo, err = gosysinfo.Host()
	if err != nil {
		os.Exit(1)
	}
	uptime := time.Duration(hostInfo.Info().Uptime())
	fmt.Printf("[%d:%02d:%02d] %s ", int64(uptime.Hours()),
		int64(uptime.Minutes())%60, int64(uptime.Seconds())%60,
		host)

	parts = strings.Split(cwd, "/")
	for i, part := range parts {
		if i == len(parts)-1 {
			fmt.Printf("%s", part)
		} else {
			if len(part) != 0 {
				fmt.Printf("%c/", part[0])
			} else {
				fmt.Printf("/")
			}
		}
	}
}
