" Initialise ---------------------------------- {{{
  " windows prefers noshellslash
  set noshellslash

  " Look for where I normally keep my project directories
  if isdirectory("D:/Projects/") 
    cd D:\Projects
  endif

  if isdirectory("C:/Projects/") 
    cd C:\Projects
  endif

  function! CreateDirectoryIfNotExist(path)
    if !isdirectory(a:path)
      call mkdir(a:path, "p", 700)
    endif
  endfunction

" }}}

" Vim Settings ------------------------------ {{{
  " Put all the swap files and other crap in a temp folder
  set backupdir=$VIM/vimfiles/vimtmp/backup//
  set directory=$VIM/vimfiles/vimtmp/swap//
  set undodir=$VIM/vimfiles/vimtmp/undo//
  call CreateDirectoryIfNotExist(&backupdir)
  call CreateDirectoryIfNotExist(&directory)
  call CreateDirectoryIfNotExist(&undodir)

" }}}

" Productivity commands ---------------------- {{{
  " Set and unset shellslash - Particularly important in a windows setup
  " because sometimes plugins prefer noshellslash but other can handle windoze
  nnoremap <F6> :set shellslash<CR>
  nnoremap <F7> :set noshellslash<CR>
  inoremap <F6> :set shellslash<CR>
  inoremap <F7> :set noshellslash<CR>
" }}}

" Vim-Plug Settings -------------------- {{{

  let g:vimPlugDir = $VIM . '/vimfiles/plugged'

" }}}

