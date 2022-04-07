#!/bin/bash

set -ex

: "${THEME:=simple}"
: "${SIZE:=790x500}"
SLIDES=${1?-markdown slide file required}
PDF=${2:-$SLIDES.pdf}

BIN=reveal-md
if ! type ${BIN} > /dev/null 2>&1; then
    echo "Requires ${BIN} node module globally available"
    exit 1
fi

${BIN} "${SLIDES}" --theme="${THEME}" --print="${PDF}" --print-size="${SIZE}"