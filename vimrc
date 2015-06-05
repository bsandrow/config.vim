set nocompatible

" ===========================
"           Vundle
" ===========================

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'rking/ag.vim'
Bundle 'mileszs/ack.vim'

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
let g:mayansmoke_search_visibility = 2 " high visibility
set background=dark
colorscheme solarized

" ~~ vimwiki ~~
let g:vimwiki_list = [ { 'path': '~/vimwiki',
                     \ 'syntax': 'markdown', 'ext': '.md' } ]

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

" ~~~~~~~~~~~~~
" JSON Settings
" ~~~~~~~~~~~~~
augroup json_settings
  autocmd!
  autocmd FileType json setlocal sw=2 sts=2 ts=2 et " Only indent by 2 spaces
augroup END

augroup sql_files
    autocmd!
    autocmd FileType sql setlocal commentstring=--\ %s
augroup END

" ~~~~~~~~~~~~~~~~~
" Markdown Settings
" ~~~~~~~~~~~~~~~~~
augroup markdown_extras
    autocmd!
    autocmd FileType vimwiki setlocal formatoptions+=cq
augroup END

augroup vimwiki_extras
    autocmd!
    autocmd BufRead,BufNewFile ~/vimwiki/* lcd ~/vimwiki
augroup END

augroup js_extras
    autocmd!
    autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
    autocmd FileType html setlocal sw=2 sts=2 ts=2 et
    autocmd FileType css setlocal sw=2 sts=2 ts=2 et
    autocmd FileType less setlocal sw=2 sts=2 ts=2 et
    autocmd FileType sass setlocal sw=2 sts=2 ts=2 et
augroup END

" ~~~~~~~~~~~~~
" YAML Settings
" ~~~~~~~~~~~~~
augroup yaml_settings
    autocmd!
    autocmd FileType yaml setlocal sw=2 sts=2 ts=2 et " Only indent by 2 spaces
augroup END

" ~~ Load Local Settings ~~
let g:local_vimrc = expand("$HOME/.vim/local.vim")
if filereadable(g:local_vimrc)
    execute "source" . g:local_vimrc
endif


let g:pymode_rope = 0
