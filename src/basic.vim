"------------------------------------------------------------------------------
" General
"------------------------------------------------------------------------------

" let's make sure we are in noncompatble mode
set nocp

" Enable syntax highlighting
syntax enable

let mapleader = ","
let g:mapleader = ","

" ; to : while in normal mode
nnoremap ; :

" Clipboard
if has('unnamedplus')
    " By default, Vim will not use the system clipboard when yanking/pasting to
    " the default register. This option makes Vim use the system default
    " clipboard.
    " Note that on X11, there are _two_ system clipboards: the "standard" one, and
    " the selection/mouse-middle-click one. Vim sees the standard one as register
    " '+' (and this option makes Vim use it by default) and the selection one as
    " '*'.
    " See :h 'clipboard' for details.
    set clipboard=unnamedplus,unnamed
else
    " Vim now also uses the selection system clipboard for default yank/paste.
    set clipboard+=unnamed
endif

" Ctrl+P to duplicate visual selection
vmap <C-p> y'>p
