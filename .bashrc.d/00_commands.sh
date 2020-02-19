#! /bin/bash


# Quick alias to reset network, VM's frequently have with network when
# pausing and resuming
alias network-reset="sudo systemctl restart network-manager.service"


# Uses bash string expansion to get the filename
function dirname() {
    for d in $@; do
        local directory=${d%*/*.sh}
        echo $directory
    done
}
export -f dirname


# Uses bash string expansion to get the filename
function filename() {
    for f in $@; do
        local fname=${f##*/}
        echo $fname
    done
}
export -f filename


# Uses bash string expansion to get the extension of file(s)
function extension() {
    for e in $@; do
        local ext=${e##*.}
        echo $ext
    done
}
export -f extension


# Uses bash string expansion to get the basename of a file(s) ie. filename without extension
function basename() {
    for b in $@; do
        local fname=$(filename $b)
        echo ${fname%%.*}
    done
}
export -f basename


# Make the copy command make a numbered backup copy
# VERSION_CONTROL="existing"
