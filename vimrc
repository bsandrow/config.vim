" My vimrc

" Todo:
" - Look through vim 'snippets' plugins and decide on one to use.
" - Figure out the difference between enhanced netrw and nerdtree
" - Better comments/docs for various plugin includes

" =======================================
"            Initialization
" =======================================

let mapleader = "\<Space>"
let maplocalleader = ","

" Vim-plug
"
" Automatic installaion of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" =======================================
"                Plugins
" =======================================

" vim-airline
"
Plug 'bling/vim-airline'
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='powerlineish'
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" let g:airline_section_z=''

"
" file-line
"
" Jumps to {line} in {file} when opening {file}:{line} from
" the command-line.
"
Plug 'bogado/file-line'

Plug 'danro/rename.vim'

"
" ag.vim -- `:Ag` wraps `ag` file-search command
"
Plug 'rking/ag.vim'

" Expand / wrap hashes etc.
Plug 'AndrewRadev/splitjoin.vim'
" nmap sj :SplitjoinSplit<CR>
" nmap sk :SplitjoinJoin<CR>

"
" ack.vim -- `:Ack` wraps `ack` file-search command
"
Plug 'mileszs/ack.vim'

"
" vim-gnupg -- Transparent wrapper around GnuPG command-line
"
Plug 'jamessan/vim-gnupg'

"
" NERDTree -- File browser ( or project browser) plugin
"
Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-pandoc/vim-pandoc'

Plug 'klen/python-mode', { 'for': 'python' }
let g:pymode_rope = 0

Plug 'Shutnik/jshint2.vim', { 'for': 'javascript' }
let jshint2_save = 1  " Run jshint when saving .js files

Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [ {'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'} ]

Plug 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](node_modules)$',
                            \ 'file': '\v\.(pyc)$' }

" Disable the keybindings because the defaults conflict with my personal
" bindings, and cause warning messages about conflicts.
let g:bufExplorerDisableDefaultKeyMapping = 1
Plug 'jlanzarotta/bufexplorer'

"
" LustyExplorer -- A Ruby-based fuzzy file finder. Superceded by CtrlP
"
"Plug 'sjbach/lusty'

"
" nose.vim -- A Compiler definition for Python's `nose` testing library.
"
"Plug 'vim-scripts/nose.vim'

" Included in Vim since 6.0
"Plug 'vim-scripts/matchit.zip'

" ======================================
"             Colorschemes
" ======================================

Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/tango.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'endel/vim-github-colorscheme'
"Plug 'shawncplus/skittles_berry'
"Plug 'vim-scripts/Zenburn'
"Plug 'vim-scripts/darktango.vim'
"Plug 'vim-scripts/tango-morning.vim'
"Plug 'vim-scripts/win9xblueback.vim'
"Plug 'vim-scripts/ansi_blows.vim'
"Plug 'vim-scripts/asu1dark.vim'
"Plug 'vim-scripts/codeburn'
"Plug 'vim-scripts/256-jungle'
"Plug 'vim-scripts/Colorzone'
"Plug 'vim-scripts/darkburn'
"Plug 'vim-scripts/darkdot'
"Plug 'vim-scripts/desert256.vim'
"Plug 'vim-scripts/darkerdesert'
"Plug 'vim-scripts/vylight'
"Plug 'vim-scripts/twilight'
"Plug 'vim-scripts/tango-desert.vim'
"Plug 'vim-scripts/moria'
"Plug 'vim-scripts/metacosm.vim'
"Plug 'vim-scripts/matrix.vim'
"Plug 'vim-scripts/lettuce.vim'
"Plug 'vim-scripts/jellybeans.vim'
"Plug 'vim-scripts/DesertedOceanBurnt'

"" My fork of vim-scripts/mayansmoke
"Plug 'bsandrow/mayansmoke'
"let g:mayansmoke_search_visibility = 2 " high visibility

" ======================================
"             Syntax Files
" ======================================

"
" vim-javascript-syntax -- Enhanced javascript syntax file for Vim
"
Plug 'jelera/vim-javascript-syntax'

" JSON
"
" An updated version of this:
" http://www.vim.org/scripts/script.php?script_id=1945
Plug 'elzr/vim-json'

" Jinja2
"
" Note: There is an updated jinja.vim in the main jinja repo (under
" ext/Vim/jinja.vim) that removes the need to also have htmljinja.vim, but
" there isn't an easy Vundle for it, so this should suffice for the time
" being.
Plug 'estin/htmljinja'

" Markdown
"
" The plasticboy repo seems more often updated, but the tpope one is extended
" by the vim-flavored-markdown plugin, so let's use the tpope one for now.
"Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'

" The puppetlabs Vim syntax file looks like it hasn't been updated since Jacob
" left the company (last commit is by Jacob in 2011), so I've disabled this in
" favour of 'rodjek/vim-puppet' which seems more recent.
"Plug 'puppetlabs/puppet-syntax-vim'

Plug 'rodjek/vim-puppet'
Plug 'tmatilai/gitolite.vim'
Plug 'vim-scripts/moin.vim'
Plug 'groenewege/vim-less'
Plug 'nono/vim-handlebars'
Plug 'vim-scripts/nginx.vim'

"
" python-syntax -- Enhanced version of Python syntax highlighting
"
"Plug 'hdima/python-syntax'

" Plug 'vim-scripts/perl-support.vim'
" let g:Perl_Support_Root_Dir = $HOME . "/.vim/plugged/perl-support"
" let g:Perl_NoKeyMappings=0 " turn off key mappings
" TODO disable the .pm file template
" TODO disable the stupid { bracket delay

call plug#end()

filetype plugin indent on
syntax on

"
" Load the matchit plugin. It's part of the base Vim install (since Vim 6.0),
" but it's not enabled by default. (See :help matchit-install)
"
runtime! macros/matchit.vim

"
" Disable matching parenthesis. This was turned on by default in Vim 7.2, but
" I don't like it. (See help: pi_paren.txt)
"
" Source: http://vimrc-dissection.blogspot.com/2006/09/vim-7-re-turn-off-parenparenthesiswhat.html
let loaded_matchparen = 1


" =======================================
"            Vim Settings
" =======================================

set expandtab tabstop=4 softtabstop=4 shiftwidth=4
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
set fillchars="fold: "

" =======================================
"           Syntax Settings
" =======================================

let perl_extended_vars = 1
let perl_include_pod = 1
let perl_string_as_statement = 1
let perl_fold = 1
let perl_nofold_packages = 1
let java_space_errors = 1
let java_ignore_javadoc = 1
let java_highlight_functions = 1
let java_allow_cpp_keywords = 1 " don't warn when using c++ keywords
let groovy_allow_cpp_keywords = 1 " don't warn when using c++ keywords in groovy
let sh_fold_enabled = 1  " enable folding (filetype=sh)

" =======================================
"            Keybindings
" =======================================

"
" By default, `Y` works the same as `yy`, but similar operatings to 'yank'
" (delete or change) map the uppercase letter to "perform operation from
" cursor to the end of the current line." I want 'yank' to be consistent with
" these.
"
nnoremap Y y$

nnoremap <Leader>wo :edit ~/Dropbox/Wiki/index.md<CR>
nnoremap <Leader>be :BufExplorer<CR>
nnoremap <Leader>bs :CtrlPBuffer<CR>
nnoremap <Leader>bd :bdelete<Return>
nnoremap <Leader>ff :CtrlP<Return>
nnoremap <Leader>fs :write<Return>
nnoremap <Leader>vo :edit ~/.vimrc<Return>
nnoremap <Leader>vs :source $MYVIMRC<Return>:echomsg "vimrc (" . $MYVIMRC . ") reloaded"<Return>

"
" Remove trailing whitespace.
"
nnoremap <Leader>rw :RemoveTrailingWhitespace<CR>
vnoremap <Leader>rw :RemoveTrailingWhitespace<CR>

"
" This makes sure that we don't lose the functionality of the ',' keystroke
" because we want to use it as a leader. We now just have to hit ',,' to get
" the same functionality. It's less convenient, but if you don't use ',' much,
" then it could be a worthwhile trade-off. (Note: this assumes that
" `maplocaleader` is set to ",")
"
nnoremap <LocalLeader>, :normal ,<CR>:<CR>

" =======================================
"            Autocommands
" =======================================

augroup my_autocmds
    autocmd!
    autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
    autocmd FileType html setlocal sw=2 sts=2 ts=2 et
    autocmd FileType css setlocal sw=2 sts=2 ts=2 et
    autocmd FileType less setlocal sw=2 sts=2 ts=2 et
    autocmd FileType sass setlocal sw=2 sts=2 ts=2 et
    autocmd FileType scss setlocal sw=2 sts=2 ts=2 et
    autocmd FileType json setlocal sw=2 sts=2 ts=2 et " Only indent by 2 spaces
    autocmd FileType yaml setlocal sw=2 sts=2 ts=2 et " Only indent by 2 spaces
    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd FileType vimwiki setlocal formatoptions+=cq
    autocmd BufRead,BufNewFile ~/vimwiki/* lcd ~/vimwiki
    autocmd BufRead,BufNewFile ~/Dropbox/Wiki/* lcd ~/Dropbox/Wiki
    autocmd BufRead,BufNewFile *.md,*.markdown setlocal spell
augroup END

" =======================================
"              Fonts
" =======================================

if has('gui_macvim')
    set guifont=Menlo\ for\ Powerline:h11,Menlo:h11,Monaco:h11,Consolas:h11
elseif has('gui_gtk2')
    set guifont=Consolas\ 10,Liberation\ Mono\ 9,Terminus\ 9
endif

" =======================================
"            Functions
" =======================================

"
" Remove Trailing Whitespace
"
" Source: http://vim.wikia.com/wiki/Remove_unwanted_spaces
" Source: nnoremap <silent> <Leader><BS> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"
function! RemoveTrailingWhitespace() range
    if &binary || &filetype == "diff"
        return
    endif
    let _s=@/
    execute a:firstline . "," . a:lastline . "s/\\s\\+$//ge"
    let @/=_s
    nohl
    echomsg "trailing whitespace removed"
endfunction

command! -bar -nargs=0 -range=% RemoveTrailingWhitespace <line1>,<line2>call RemoveTrailingWhitespace()

" =======================================
"            Finalize
" =======================================

"
" Set the colorscheme
"
colorscheme solarized | set bg=light

"
" Load local Vim config
"
let g:local_vimrc = expand("$HOME/.vim/local.vim")

if filereadable(g:local_vimrc)
    execute "source" . g:local_vimrc
endif
