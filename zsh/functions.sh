#!/bin/zsh

function tty_escape() { printf "\033[%sm" "$1"; }
function tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

# log header function to print a header with asterisk decoration above and below and one char before and after
function log_header() {
    local header="$1"
    local length=${#header}
    local decoration_line="$(printf '%*s' $((length + 4)) '' | tr ' ' '*')"
    printf "${tty_blue}%s\n* %s *\n%s${tty_reset}\n" "$decoration_line" "$header" "$decoration_line"
}

function echo() {
    printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$(shell_join "$@")"
}

function shell_join() {
    local arg
    if [ $# -eq 0 ]; then
        printf " "
        return
    fi
    printf "%s" "$1"
    shift
    for arg in "$@"; do
        printf " "
        printf "%s" "${arg// /\ }"
    done
}

function mkd() {
    mkdir -p "$@" && cd "$_"
}
