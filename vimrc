set nocompatible

" ===========================
"           Vundle
" ===========================

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" ===========================
"          Search
" ===========================
Bundle 'rking/ag.vim'
Bundle 'mileszs/ack.vim'

" ===========================
"         Buffers
" ===========================
let g:bufExplorerDisableDefaultKeyMapping = 1
Bundle 'jlanzarotta/bufexplorer'

Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'vimwiki/vimwiki'
Bundle 'jamessan/vim-gnupg'
Bundle 'scrooloose/nerdtree'
Bundle 'bogado/file-line'
Bundle 'vim-scripts/nose.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'Shutnik/jshint2.vim'
"Bundle 'sjbach/lusty'


" Included in Vim since 6.0
"Bundle 'vim-scripts/matchit.zip'

" Colorschemes
Bundle 'chriskempson/base16-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'shawncplus/skittles_berry'
Bundle 'vim-scripts/Zenburn'
Bundle 'vim-scripts/darktango.vim'
Bundle 'vim-scripts/tango-morning.vim'
Bundle 'vim-scripts/tango.vim'
Bundle 'vim-scripts/win9xblueback.vim'
Bundle 'vim-scripts/ansi_blows.vim'
Bundle 'vim-scripts/asu1dark.vim'
Bundle 'vim-scripts/codeburn'
Bundle 'vim-scripts/256-jungle'
Bundle 'vim-scripts/Colorzone'
Bundle 'vim-scripts/darkburn'
Bundle 'vim-scripts/darkdot'
Bundle 'vim-scripts/desert256.vim'
Bundle 'vim-scripts/darkerdesert'
Bundle 'vim-scripts/vylight'
Bundle 'vim-scripts/twilight'
Bundle 'vim-scripts/tango-desert.vim'
Bundle 'vim-scripts/moria'
Bundle 'vim-scripts/metacosm.vim'
Bundle 'vim-scripts/matrix.vim'
Bundle 'vim-scripts/lettuce.vim'
Bundle 'vim-scripts/jellybeans.vim'
Bundle 'vim-scripts/DesertedOceanBurnt'
Bundle 'endel/vim-github-colorscheme'

" My fork of vim-scripts/mayansmoke
Bundle 'bsandrow/mayansmoke'

" Mising Colorschemes:
"   - github.vim
"   - ir_black.vim
"   - twilight2.vim
"   - gardener.vim
"   - gentooish.vim
"   - digerati.vim
"   - CloudsMidnight.vim
"   - DarkDefault.vim

" Vim Syntax files
Bundle 'tmatilai/gitolite.vim'
Bundle 'vim-scripts/moin.vim'
Bundle 'groenewege/vim-less'
Bundle 'nono/vim-handlebars'
Bundle 'vim-scripts/nginx.vim'
"Bundle 'hdima/python-syntax'
Bundle 'klen/python-mode'

" Enhanced Javascript Syntax support
Bundle 'jelera/vim-javascript-syntax'

" The puppetlabs Vim syntax file looks like it hasn't been updated since Jacob
" left the company.
"Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'rodjek/vim-puppet'

" An updated version of this:
" http://www.vim.org/scripts/script.php?script_id=1945
Bundle 'elzr/vim-json'

Bundle 'vim-pandoc/vim-pandoc'

" Note: There is an updated jinja.vim in the main jinja repo (under
" ext/Vim/jinja.vim) that removes the need to also have htmljinja.vim, but
" there isn't an easy Vundle for it, so this should suffice for the time
" being.
Bundle 'estin/htmljinja'

" Markdown for Vim
" ~~~~~~~~~~~~~~~~
" The plasticboy repo seems more often updated, but the tpope one is extended
" by the vim-flavored-markdown plugin, so let's use the tpope one for now.
"Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-markdown'
Bundle 'jtratner/vim-flavored-markdown'

filetype plugin indent on
syntax on

runtime! macros/matchit.vim

"-------------------------------------------------------------------------------
" Vim Settings
"-------------------------------------------------------------------------------
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set bg=light
set hidden
set modelines=5
set virtualedit=all
set vb t_vb=    " disable visual/audible 'bells'
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

" `Y` should match the behaviour of other operations like `D` and `C`, which
" perform their operation from the cursor to the end of the line, rather then
" `D` being an alias for `dd` (or `C` for `cc`).
nnoremap Y y$

" ~~ colorscheme ~~
let g:mayansmoke_search_visibility = 2 " high visibility
set background=dark
colorscheme solarized

"-------------------------------------------------------------------------------
" Vim Plugin Settings
"-------------------------------------------------------------------------------

"
" VimWiki
"
let g:vimwiki_list = [
  \ {'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}
\]

"
" CtrlP
"
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](node_modules)$',
    \ 'file': '\v\.(pyc)$'
    \ }

"
" Perl
"
let perl_extended_vars = 1
let perl_include_pod = 1
let perl_string_as_statement = 1
let perl_fold = 1
let perl_nofold_packages = 1

" perl-support Plugin Settings:
let g:Perl_Support_Root_Dir = $HOME . "/.vim/bundle/perl-support"

" turn off the perl-support key mappings
let g:Perl_NoKeyMappings=0

" TODO disable the .pm file template (perl-support)
" TODO disable the stupid { bracket delay (perl-support)

"
" Java
"
let java_space_errors = 1
let java_ignore_javadoc = 1
let java_highlight_functions = 1

" don't warn when using c++ keywords
let java_allow_cpp_keywords = 1

"
" Vim Plugin: python-mode
"
let g:pymode_rope = 0

"
" Vim Syntax: Groovy
"
" don't warn when using c++ keywords in groovy
let groovy_allow_cpp_keywords = 1

"
" Vim Syntax: Shell Script
"
let g:sh_fold_enabled = 1  " enable folding (filetype=sh)

"
" Vim Plugin: jshint2.vim
"
let jshint2_save = 1  " Run jshint when saving .js files


"
" AutoCommands
"
augroup my_autocmds
    autocmd!
    autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
    autocmd FileType html setlocal sw=2 sts=2 ts=2 et
    autocmd FileType css setlocal sw=2 sts=2 ts=2 et
    autocmd FileType less setlocal sw=2 sts=2 ts=2 et
    autocmd FileType sass setlocal sw=2 sts=2 ts=2 et
    autocmd FileType json setlocal sw=2 sts=2 ts=2 et " Only indent by 2 spaces
    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd FileType vimwiki setlocal formatoptions+=cq
    autocmd BufRead,BufNewFile ~/vimwiki/* lcd ~/vimwiki
    autocmd BufRead,BufNewFile ~/Dropbox/Wiki/* lcd ~/Dropbox/Wiki
    autocmd FileType yaml setlocal sw=2 sts=2 ts=2 et " Only indent by 2 spaces
augroup END

"
" Vim <Leader> Setup
"
let mapleader="\<Space>"

nnoremap <Leader>vm :e ~/Dropbox/Wiki/index.md<CR>
nnoremap <Leader>be :BufExplorer<CR>
nnoremap <Leader>bs :CtrlPBuffer<CR>
nnoremap <Leader>bd :bd<Return>
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>fs :w<Return>

" Notes:
" - <Leader>bs overrides a binding set by BufExplorer. I've added the force
"   option (!) because I don't like seeing the warnings.

"
" Vim <LocalLeader> Setup
"
let maplocaleader=","

" This makes sure that we don't lose the functionality of the ',' keystroke
" because we want to use it as a leader. We now just have to hit ',,' to get
" the same functionality. It's less convenient, but if you don't use ',' much,
" then it could be a worthwhile trade-off. (Note: this assumes that
" `maplocaleader` is set to ",")
nnoremap <LocalLeader>, :normal ,<CR>:<CR>

"-------------------------------------------------------------------------------
" Remove Trailing Whitespace
"
" Source: http://vim.wikia.com/wiki/Remove_unwanted_spaces
function! RemoveTrailingWhitespace() range
    if !&binary && &filetype != "diff"
        execute a:firstline . "," . a:lastline . "s/\\s\\+$//ge"
    endif
    echomsg "trailing whitespace removed"
endfunction

command -bar -nargs=0 -range=% RemoveTrailingWhitespace <line1>,<line2>call RemoveTrailingWhitespace()

nnoremap <Leader>rw :RemoveTrailingWhitespace<CR>
vnoremap <Leader>rw :RemoveTrailingWhitespace<CR>

"-------------------------------------------------------------------------------
" Local Settings
"
let g:local_vimrc = expand("$HOME/.vim/local.vim")

if filereadable(g:local_vimrc)
    execute "source" . g:local_vimrc
endif

