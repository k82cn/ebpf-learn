#!/bin/bash

set -euo pipefail

DUMMY_SRC=hello.c
DUMMY_OBJ=hello.o
INCLUDE_FILES=
clang -O2 -emit-llvm -c ${DUMMY_SRC} -o - | llc -march=bpf -filetype=obj -o ${DUMMY_OBJ}
for kernel in 48; do
  clang -DKERNEL_VERSION="${kernel}" -O2 -emit-llvm -c ${DUMMY_SRC} -o - | llc -march=bpf -filetype=obj -o "dummy-${kernel}.o"
done
