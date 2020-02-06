#!/bin/bash

alias octave-gui="octave &> /dev/null &"

[ ! -z "$DISPLAY" ] && echo_success "Custom octave configuration loaded."