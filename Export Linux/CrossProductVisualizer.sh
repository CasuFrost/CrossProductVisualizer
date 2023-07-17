#!/bin/sh
echo -ne '\033c\033]0;CrossProductVisualizer\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/CrossProductVisualizer.x86_64" "$@"
