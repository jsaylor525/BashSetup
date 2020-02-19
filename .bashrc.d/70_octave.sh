#!/bin/bash


if [[ ! -z "${USE_OCTAVE}" ]]; then
    alias octave-gui="octave &> /dev/null &"

    [ ! -z "$DISPLAY" ] && log_success "Custom octave configuration loaded."
fi
