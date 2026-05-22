package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"time"

	"golang.org/x/sys/unix"
)

func getUptime() (time.Duration, error) {
	boottime, err := unix.SysctlTimeval("kern.boottime")
	if err != nil {
		return 0, err
	}
	bootTime := time.Unix(int64(boottime.Sec), int64(boottime.Usec)*1000)
	return time.Since(bootTime), nil
}

func main() {
	cwd, _ := os.Getwd()
	host, _ := os.Hostname()
	if dotIdx := strings.Index(host, "."); dotIdx != -1 {
		host = host[:dotIdx]
	}

	home := os.Getenv("HOME")
	if home != "" && (cwd == home || strings.HasPrefix(cwd, home+string(filepath.Separator))) {
		cwd = "~" + cwd[len(home):]
	}

	uptime, err := getUptime()
	if err != nil {
		fmt.Printf("%s ", host)
	} else {
		fmt.Printf("[%d:%02d:%02d] %s ", int64(uptime.Hours()),
			int64(uptime.Minutes())%60, int64(uptime.Seconds())%60,
			host)
	}

	parts := strings.Split(cwd, "/")
	for i, part := range parts {
		if i == len(parts)-1 {
			fmt.Printf("%s", part)
		} else {
			if len(part) != 0 {
				runes := []rune(part)
				fmt.Printf("%c/", runes[0])
			} else {
				fmt.Printf("/")
			}
		}
	}
	fmt.Print(" ")
}

