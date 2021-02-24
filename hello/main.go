package main

import (
	"fmt"
	"time"

	"github.com/iovisor/gobpf/elf"
)

func main() {
	mod := elf.NewModule("hello/dummy-48.o")

	err := mod.Load(nil)
	if err != nil {
		panic(err)
	}

	err = mod.EnableKprobes(0)
	if err != nil {
		panic(err)
	}

	for {
		fmt.Println("Waiting...")
		time.Sleep(10 * time.Second)
	}
}
