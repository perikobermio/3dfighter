#!/bin/sh
echo -ne '\033c\033]0;3dfighter\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/3dfighter.x86_64" "$@"
