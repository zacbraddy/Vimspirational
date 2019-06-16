" Initialise ---------------------------------- {{{
  if isdirectory($HOME . '/Projects/')
    cd ~/Projects
  endif

  function! CreateDirectoryIfNotExist(path)
    if !isdirectory(a:path)
      call mkdir(a:path, "p", 755)
    endif
  endfunction

" }}}

" Vim Settings ------------------------------ {{{
  " Put all the swap files and other crap in a temp folder
  set backupdir=$HOME/.vim/vimtmp/backup//
  set directory=$HOME/.vim/vimtmp/swap//
  set undodir=$HOME/.vim/vimtmp/undo//
  call CreateDirectoryIfNotExist(&backupdir)
  call CreateDirectoryIfNotExist(&directory)
  call CreateDirectoryIfNotExist(&undodir)

" }}}

" Deoplete Settings -------------------- {{{
  let g:python3_host_prog = '/usr/bin/python3'
" }}}

" Vim-Plug Settings -------------------- {{{

  let g:vimPlugDir = $HOME . '/.vim/plugged'

" }}}
