#!/bin/bash

alias octave-gui="octave &> /dev/null &"

[ ! -z "$DISPLAY" ] && log_success "Custom octave configuration loaded."
