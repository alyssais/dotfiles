#!/bin/bash

profile="$HOME/.config/bash/profile"
test -s "$profile" && . "$profile"
unset -f profile
