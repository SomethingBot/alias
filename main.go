package main

import (
	"log"
	"os"
)

var (
	GitCommit string
	GitTag string
	Mode string
)

func parseAliasConfig() {

}

func main() {
	logger := log.New(os.Stdout, "", log.LUTC|log.Ldate|log.Ltime)
	logger.Printf("Starting alias, commit:%v, tag:%v, Mode:%v", GitCommit, GitTag, Mode)

}
