set nocompatible

" ===========================
"           Vundle
" ===========================

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'

Bundle 'gmarik/vundle'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'vimwiki/vimwiki'
Bundle 'groenewege/vim-less'
Bundle 'nono/vim-handlebars'
Bundle 'vim-scripts/nginx.vim'
Bundle 'jamessan/vim-gnupg'

" Enhanced Javascript Syntax support
Bundle 'jelera/vim-javascript-syntax'

" Note: There is an updated jinja.vim in the main jinja repo (under
" ext/Vim/jinja.vim) that removes the need to also have htmljinja.vim, but
" there isn't an easy Vundle for it, so this should suffice for the time
" being.
Bundle 'estin/htmljinja'

" Markdown for Vim - There are two github repos. Currently the plasticboy one
" was last updated 21 days ago, but tpope's one was last updated 4 months ago.
" The plasticboy one sounds familiar (like I've seen/used it before), but
" tpope has a _lot_ of excellent vim plugins, so it's not like he's some
" no-name developer. plasticboy one seems more up-to-date, so I'll use it.
Bundle 'plasticboy/vim-markdown'
"Bundle 'tpope/vim-markdown'

filetype plugin indent on
syntax on

" ===========================
"         Settings
" ===========================
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set bg=light
set hidden

" Setup <Leader> and <LocalLeader> for keymaps
let mapleader=","
let maplocaleader=","

noremap <Leader>bp :CtrlPBuffer<Return>

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](node_modules|sowingo/web/static|sowingo/web/client/vendor|sowingo/was/client/vendor|sowingo/was/static)$',
    \ 'file': '\v\.(pyc)$'
    \ }

" ~~ colorscheme ~~
if has("gui_running") && has("gui_macvim")
    set background=light
    colorscheme macvim
else
    set background=light
    colorscheme default
endif

set modelines=5
