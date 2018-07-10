" Initialise ---------------------------------- {{{
  " Kill splash screen
  redraw

  " Startup text
  augroup hello_on_enter
    autocmd!
    autocmd VimEnter * echo "Jacking into the matrix..."
  augroup END
  " turn on filetype detection and syntax highlighting
  filetype plugin indent on
  syntax on

  " Map leader key
  let mapleader = "-"
  let maplocalleader = "="

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
  " Turn on line numbers
  set number

  " Turn on relative line number
  set relativenumber

  " Use force two spaces for indent
  set shiftround
  set shiftwidth=2 
  
  " Put all the swap files and other crap in a temp folder
  set backupdir=$VIM/vimfiles/vimtmp/backup//
  set directory=$VIM/vimfiles/vimtmp/swap//
  set undodir=$VIM/vimfiles/vimtmp/undo//
  call CreateDirectoryIfNotExist(&backupdir)
  call CreateDirectoryIfNotExist(&directory)
  call CreateDirectoryIfNotExist(&undodir)

  " Set encoding and set the font to SauceCodePro to use vimdevicons
  set encoding=utf8
  set guifont=SauceCodePro\ NF:h11

" }}}

" Productivity commands ---------------------- {{{
  " Toggle case on the current word
  inoremap <c-u> <esc>viw~<esc>ea
  nnoremap <c-u> viw~<esc>

  " Surround word with quotes
  nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
  nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

  " Exit insert/visual mode easier
  inoremap jk <esc>
  vnoremap jk <esc>

  " Cool parentheses operator pending mappings
  onoremap in( :<c-u>normal! f(vi(<cr>
  onoremap il( :<c-u>normal! F)vi(<cr>
  onoremap an( :<c-u>normal! f(va(<cr>
  onoremap al( :<c-u>normal! F(va(<cr>

  " [E]dit my [V]imrc
  execute "nnoremap <leader>ev :vsplit " . g:pathToVimRc . "<cr>"

  " [S]ource my [V]imrc
  nnoremap <leader>sv :source $MYVIMRC<cr>

  " Move between windows with less keystrokes
  nnoremap <c-h> <c-w>h
  nnoremap <c-j> <c-w>j
  nnoremap <c-k> <c-w>k
  nnoremap <c-l> <c-w>l
  
  " [C]lose [A]ll [B]uffers
  command! CAB silent %bd|echo "All buffers just got blow'd up"

  " Clear highlighting on escape in normal mode
  nnoremap <esc> :noh<cr><esc>

  " Set and unset shellslash - Particularly important in a windows setup
  " because sometimes plugins prefer noshellslash but other can handle windoze
  nnoremap <F6> :set shellslash<CR>
  nnoremap <F7> :set noshellslash<CR>
  inoremap <F6> :set shellslash<CR>
  inoremap <F7> :set noshellslash<CR>

  " Set tab setting correctly - because at home I prefer two spaces but my
  " work insists on using 4 like animals
  nnoremap <leader>w :set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab <CR> :let g:ale_fixers['javascript'] = ['eslint'] <CR> :let g:ale_fixers['javascript.jsx'] = ['eslint'] <bar> echo "Sorry you're at work fella" <CR>
  nnoremap <leader>h :set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab <bar> echo "You're at home my dude!" <CR>

  " Change pwd to current open buffer path
  nnoremap <leader>cd : cd %:p:h<CR>:pwd<CR>

" }}}

" Javascript settings ------------------------ {{{
  augroup javascript_settings
    autocmd!
    autocmd FileType javascript :setlocal foldmethod=syntax
    autocmd FileType javascript :setlocal foldlevel=99
    autocmd FileType javascript.jsx :setlocal foldmethod=syntax
    autocmd FileType javascript.jsx :setlocal foldlevel=99
  augroup END

  " Comment and uncomment out a line in javascript
  augroup comment_javascript
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript nnoremap <buffer> <localleader>u :s/\/\///<cr>
  augroup END

" }}}

" Abbreviations --------------------- {{{
  " Corrections for common typos
  :iabbrev adn and
  :iabbrev tehn then
  :iabbrev fro for
  :iabbrev teh the
" }}}

" Stop being a noob remaps -------------------- {{{
  " Exit insert mode properly dickhead
  inoremap <esc> <nop>
  vnoremap <esc> <nop>

  " Stop being a noob
  noremap <left> <nop>
  noremap <right> <nop>
  noremap <down> <nop>
  noremap <up> <nop>
  noremap <home> <nop>
  noremap <end> <nop>
  nnoremap <del> <nop>
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=0
augroup END

  " Comment and uncomment out a line in javascript
  augroup comment_vimscript
    autocmd!
    autocmd FileType vim nnoremap <buffer> <localleader>c I" <esc>
    autocmd FileType vim nnoremap <buffer> <localleader>u :s/" //<cr>
  augroup END

" }}}

" NERDTree settings ------------------------------ {{{

  " NERDTree File highlighting - function used below to make all the
  " different files different pretty colours!
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    execute 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    execute 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
  call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

  " Widen out that tray size, I gotta see up in there
  let g:NERDTreeWinSize=60

  " Make the expander arrows use the SauceCodePro font arrows so that look
  " cooler
  let g:NERDTreeDirArrowExpandable = '►'
  let g:NERDTreeDirArrowCollapsible = '▽'

  " Change the pwd whenever you change the root director in NERDTree
  let g:NERDTreeChDirMode = 2

  " Get rid of the highlight of the files in NERDTree because my colour
  " scheme makes it hard to see with a highlight
  let g:NERDTreeHighlightCursorline = 0

  nnoremap <F2> :NERDTreeToggle<cr>
" }}}

" vim-javascript settings ------------------- {{{

  " Turn on syntax highlighting for flow code
  let g:javascript_plugin_flow = 1

" }}}

" vim-flow settings ------------------ {{{
  
  " Auto close the quick fix list once all flow exceptions have been cleared
  " up
  let g:flow#autoclose = 1

  " This script will look to see if there is a node_modules nearby and see if
  " flow is installed there, if it is it will set the path that vim-flow uses
  " to use that pacakage instead of the global flow if possible
  function! UseLocalFlowIfPossible()
    silent! echom "Finding local flow"
    let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
    if matchstr(local_flow, "^\/\\w") == ''
	let local_flow= getcwd() . "/" . local_flow
    endif
    if executable(local_flow)
      silent! echom "Local flow found!!"
      let g:flow#flowpath = local_flow
    endif
  endfunction

  " Just in case we can use local flow as soon as we load up run the function
  call UseLocalFlowIfPossible()

  " Add a command to javascript buffers that allow them to setup again the
  " flow path to local if available
  " GOTCHA!!! I haven't cleared previous commands because I'm piggy backing on
  " to the javascript_settings autocommand group from above
  augroup javascript_settings
    autocmd FileType javascript :call UseLocalFlowIfPossible()
    autocmd FileType javascript.jsx :call UseLocalFlowIfPossible()
  augroup END

" }}}

" vim-airline settings --------------- {{{
  
  " Make the tabline show at the top with all the open buffers
  let g:airline#extensions#tabline#enabled = 1
  
  " Make it so the tabline also shows the buffer number
  let g:airline#extensions#tabline#buffer_nr_show = 1

  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  " First set the unicode symbols in case we don't have nerdfont equalivalents
  " then overwrite with nerdfont equivalents
  " unicode symbols
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '◀'
  let g:airline#extensions#tabline#left_sep = '▶'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = ''
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'

  " airline symbols
  let g:airline_left_sep = ''
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

" }}}

" vim-airline-themes settings -------------------- {{{

  let g:airline_theme='deus'

" }}}

" ALE Settings --------------------- {{{

  " Set which fixers to use with Ale
  let g:ale_fixers = {}
  let g:ale_fixers['javascript'] = ['prettier', 'eslint']
  let g:ale_fixers['javascript.jsx'] = ['prettier', 'eslint']

  " Set which linters to use with Ale
  let g:ale_linters = {}
  let g:ale_linters['javascript'] = ['flow', 'eslint']
  let g:ale_linters['javascript.jsx'] = ['flow', 'eslint']

  " Run fixers on save
  let g:ale_fix_on_save = 1

  " Make the gutter symbols look cooler
  let g:ale_sign_error = '' 
  let g:ale_sign_warning = ''

  " Put the errors found on the line highlighted show up in the airline status
  " bar
  let g:airline#extensions#ale#enabled = 1

  " Use ale completiong
  let g:ale_completion_enabled = 1

  " Setup prettier options for use with Ale
  let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'

  " highlight clear ALEErrorSign
  " highlight clear ALEWarningSign

" }}}

" Vim-Plug Settings -------------------- {{{

  command! PS :PlugStatus
  command! PI :PlugInstall
  
" }}}

" Plugins ---------------------------- {{{

let g:vimPlugDir = $VIM . '/vimfiles/plugged'
call CreateDirectoryIfNotExist(g:vimPlugDir)
call plug#begin(g:vimPlugDir)

  Plug 'tpope/vim-sensible'

  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  
  Plug 'ryanoasis/vim-devicons'

  Plug 'airblade/vim-gitgutter'

  Plug 'tpope/vim-fugitive', { 'on': ['Gwrite', 'Gread', 'Gblame', 'Gedit', 'Gdiff', 'Gmove', 'Grep', 'Gcommit', 'Git'] }

  Plug 'tpope/vim-unimpaired'

  Plug 'pangloss/vim-javascript'

  Plug 'mxw/vim-jsx'

  Plug 'flowtype/vim-flow'

  Plug 'vim-airline/vim-airline'

  Plug 'vim-airline/vim-airline-themes'

  Plug 'enricobacis/vim-airline-clock'

  Plug 'tpope/vim-surround'

  Plug 'mileszs/ack.vim', { 'on': 'Ack' }

  Plug 'w0rp/ale'

  Plug 'townk/vim-autoclose'

call plug#end()
" }}}

" Devicons Settings ------------------ {{{

  " Gotcha!!! This only works if you put it after the plugins
  if exists('g:loaded_webdevicons')     
    call webdevicons#refresh()
  endif
  
" }}}

