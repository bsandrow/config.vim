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
set modelines=5
set virtualedit=all
set vb t_vb=    " disable visual/audible 'bells'

" ~~ search ~~
set hlsearch    " highlight all of the matches when searching
set incsearch   " we want to see the first match before actually searching
set ignorecase  " make searches case-insensitive by default
set smartcase   " make searches case-sensitive if contains upper-case chars

set nonumber
set nowrap
set noshowmatch
set ruler
set laststatus=2

set list
set listchars=tab:»·,trail:·

" ~~ disable matching parens ~~
"   This is enabled by default starting with Vim 7.2, but I don't like it.
"
"   SOURCE:
"   http://vimrc-dissection.blogspot.com/2006/09/vim-7-re-turn-off-parenparenthesiswhat.html
let loaded_matchparen = 1

" Setup <Leader> and <LocalLeader> for keymaps
let mapleader=","
let maplocaleader=","

" Let's not lose the functionality of ',', just remap it to ',,'
nnoremap <leader>, :normal ,<CR>:<CR>

noremap <Leader>bp :CtrlPBuffer<Return>

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](node_modules|sowingo/web/static|sowingo/web/client/vendor|sowingo/was/client/vendor|sowingo/was/static)$',
    \ 'file': '\v\.(pyc)$'
    \ }

" `Y` should match the behaviour of other operations like `D` and `C`, which
" perform their operation from the cursor to the end of the line, rather then
" `D` being an alias for `dd` (or `C` for `cc`).
noremap Y y$

" ~~ colorscheme ~~
if has("gui_running") && has("gui_macvim")
    set background=light
    colorscheme macvim
else
    set background=light
    colorscheme default
endif

" ~~ Perl syntax ~~
let perl_extended_vars = 1
let perl_include_pod = 1
let perl_string_as_statement = 1
let perl_fold = 1
let perl_nofold_packages = 1

" ~~ Java syntax ~~
let java_space_errors = 1
let java_ignore_javadoc = 1
let java_highlight_functions = 1
let java_allow_cpp_keywords = 1 " don't warn when using c++ keywords

" ~~ Groovy syntax ~~
let groovy_allow_cpp_keywords = 1 " don't warn when using c++ keywords in
                                  " groovy

" ~~ Shell Script syntax ~~
let g:sh_fold_enabled = 1 " enable folding for shell file (Note: zsh filetype
                          " doesn't have any folding)

" ~~ perl-support plugin settings ~~
"   todo: disable the .pm file template
"   todo: disable the stupid { bracket delay
let g:Perl_NoKeyMappings=0 " turn off the perl-support key mappings
let g:Perl_Support_Root_Dir = $HOME . "/.vim/bundle/perl-support"

" ~~ Remove Trailing Whitespace ~~
"   ref: http://vim.wikia.com/wiki/Remove_unwanted_spaces
function! RemoveTrailingWhitespace() range
    if !&binary && &filetype != "diff"
        execute a:firstline . "," . a:lastline . "s/\\s\\+$//ge"
    endif
    echomsg "trailing whitespace removed"
endfunction
command -bar -nargs=0 -range=% RemoveTrailingWhitespace <line1>,<line2>call RemoveTrailingWhitespace()
nnoremap <leader>rw :RemoveTrailingWhitespace<CR>
vnoremap <leader>rw :RemoveTrailingWhitespace<CR>

" ~~ Load Local Settings ~~
let g:local_vimrc = expand("$HOME/.vim/local.vim")
if filereadable(g:local_vimrc)
    execute "source" . g:local_vimrc
endif
