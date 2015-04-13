"
" GUI Vim Colorscheme
"
colors solarized | set bg=light
" colors molokai
" colors base16-flat

"
" MacOSX / MacVim
"
if has('gui_macvim')
    set guifont=Consolas:h11,Menlo:h11,Monaco:h11
endif

"
" Linux / GTK2 / gVim
"
if has('gui_gtk2')
    set guifont=Consolas\ 10,Liberation\ Mono\ 9,Terminus\ 9

    " Turn off scrollbars, toolbars, etc when we're running in GTK. (I don't
    " want to disable them when I'm running under OSX because they don't get
    " in the way).
    set guioptions=aceih
endif
