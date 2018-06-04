#!/usr/bin/env bash
set -ue

buffer="$(mktemp -t tmux-buffer)"
open="$(dirname "$0")/open_url.rb"
/usr/local/bin/tmux capture-pane -J
/usr/local/bin/tmux save-buffer "$buffer"
/usr/local/bin/tmux split-window -l 10 -f "/usr/local/bin/gtac $buffer | BROWSER=\"$open\" /usr/local/bin/extract_url"
