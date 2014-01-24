#!/usr/bin/env zsh

PREFIX=$1
PREFIX=${PREFIX:-$HOME}

function abspath()
{
    case "$(uname)" in
        Darwin)
            perl -e 'use Cwd qw(abs_path); printf("%s\n", abs_path($ARGV[0]));' "$1"
            ;;
        *)
            readlink -f "$1"
            ;;
    esac
}

CONF_DIR="${0%/*}"
FILES=(vim vimrc gvimrc)

for item in $FILES; do
    src="${CONF_DIR}/${item}"
    dest="${PREFIX}/.${item}"
    ln -v -sfn "$(abspath "$src")" "$dest"

    if [[ ! -d vim/bundle/vundle ]]; then
        git clone https://github.com/gmarik/vundle.git vim/bundle/vundle
    fi
done

# vim:set ft=zsh:
