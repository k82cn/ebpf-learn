#!/bin/bash

bpftool btf dump file ${1:-/sys/kernel/btf/vmlinux} format c 
