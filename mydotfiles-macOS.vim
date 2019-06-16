" Initialise ---------------------------------- {{{
  if isdirectory("~/Projects/")
    cd ~/Projects
  endif

  function! CreateDirectoryIfNotExist(path)
    if !isdirectory(a:path)
      call mkdir(a:path, "p", 755)
    endif
  endfunction

" }}}

" {{{ Mac specific settings -------------------------
  if ($TERM == 'xterm-256color' || $TERM == 'screen-256color')
    " Change the folded highlight to something a bit darker because native
    " hyperterm highlight colour is way too bright
    hi Folded ctermbg=242

    " Don't be tempted to do noremaps here they do have to be maps because we
    " WANT to call whatever the f keys are mapped to when they're pressed
    map <Esc>OP <F1>
    map <Esc>OQ <F2>
    map <Esc>OR <F3>
    map <Esc>OS <F4>
    map <Esc>[16~ <F5>
    map <Esc>[17~ <F6>
    map <Esc>[18~ <F7>
    map <Esc>[19~ <F8>
    map <Esc>[20~ <F9>
    map <Esc>[21~ <F10>
    map <Esc>[23~ <F11>
    map <Esc>[24~ <F12>
  endif
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
  let g:python3_host_prog = '/usr/local/bin/python3'
" }}}

" Vim-Plug Settings -------------------- {{{

  let g:vimPlugDir = $HOME . '/.vim/plugged'

" }}}
