#!/bin/bash
# see Clang Static Analyzer (http://clang-analyzer.llvm.org/)
#

type -P clang &>/dev/null || { echo "clang not installed" >&2; exit 1; }
type -P scan-build &>/dev/null || { echo "scan-build not installed" >&2; exit 1; }

SOURCE_DIR=.
if [ $# -eq 1 ]; then
    SOURCE_DIR=$1
fi

cmake -DCMAKE_C_COMPILER=ccc-analyzer -DCMAKE_CXX_COMPILER=c++-analyzer $SOURCE_DIR \
    || { echo "usage: $0 SOURCE_DIR" >&2; exit 1; }
scan-build make clean all
