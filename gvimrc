"
" ~~ Color ~~
"
colors solarized | set bg=light

"
" ~~ Fonts ~~
"
if has('gui_macvim')
    set guifont=Consolas:h11,Menlo:h11,Monaco:h11
elseif has('gui_gtk2')
    set guifont=Consolas\ 10,Liberation\ Mono\ 9,Terminus\ 9
endif

"
" ~~ GUI Options ~~
"
if has('gui_gtk2')
    set guioptions=aceih
endif
