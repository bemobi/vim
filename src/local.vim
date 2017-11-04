"------------------------------------------------------------------------------
" Include ~/.vimrc.local, if file exists
"------------------------------------------------------------------------------

let vimrc_local=expand("~/.vimrc.local")
if filereadable(vimrc_local)
    exec ":source " . vimrc_local
endif
