#!/usr/bin/env zsh

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

CONFDIR="${0%/*}"
PREFIX="${1:-$HOME}"
VIM_PLUG_REMOTE='git@github.com:junegunn/vim-plug.git'
VIM_AUTOLOAD_DIR=$PREFIX/.vim/autoload

ln -v -sfn "$(abspath "$CONFDIR/vimrc")" "$PREFIX/.vimrc"
ln -v -sfn "$(abspath "$CONFDIR/gvimrc")" "$PREFIX/.gvimrc"

if [[ ! -d $VIM_AUTOLOAD_DIR ]]; then
    mkdir -p $VIM_AUTOLOAD_DIR
    git clone --depth=1 $VIM_PLUG_REMOTE $VIM_AUTOLOAD_DIR
    # git clone $VIM_PLUG_REMOTE $VIM_AUTOLOAD_DIR
fi

# vim:set ft=zsh:
