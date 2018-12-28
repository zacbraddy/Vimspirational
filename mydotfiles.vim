" Initialise ---------------------------------- {{{
  " Kill splash screen
  redraw

  " Startup text
  augroup hello_on_enter
    autocmd!
    autocmd VimEnter * echo "Jacking into the matrix..."
  augroup END

  " Map leader key
  let mapleader = "\<Space>"
  let maplocalleader = "="

  if has("mac")
    execute "source " . g:pathToVimspirationalRepo . "mydotfiles-macOS.vim"
  elseif has("win32")
    execute "source " . g:pathToVimspirationalRepo . "mydotfiles-windoze.vim"
  endif
" }}}

" Vim Settings ------------------------------ {{{

  " turn on filetype detection and syntax highlighting
  filetype plugin indent on
  syntax on

  " Turn on line numbers
  set number

  " Turn on relative line number
  set relativenumber

  " Use force two spaces for indent
  set shiftround
  set shiftwidth=2 
  
  " Set encoding and set the font to SauceCodePro to use vimdevicons
  set encoding=utf8
  set guifont=SauceCodePro\ NF:h11

  " Finally I work somewhere that uses sensible defaults so I can set the tab
  " settings and worry changing this to silly 4 spaces later with me leader
  " keybindings if I need to

  set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab 

  " Show keystrokes made or incomplete motions at the bottom right
  set showcmd

  " Make it so that you don't have to save changes if there are unwritten
  " changes in a buffer and you just want to open another buffer
  set hidden

  " Make it so that the search finds as I type. Make it case insensitive. Make
  " it case sensitive if I type a capital though
  set incsearch
  set ignorecase
  set smartcase
  
  " Turn on persistent undo history
  set undofile

  " Make it so I can't accidentally dump out of vim in my brain goes back to
  " my windows days
  map <c-z> <Nop> 

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

  " Set tab setting correctly - because at home I prefer two spaces but my
  " work insists on using 4 like animals
  nnoremap <leader>w :set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab <CR> :let g:ale_fixers['javascript'] = ['eslint'] <CR> :let g:ale_fixers['javascript.jsx'] = ['eslint'] <bar> echo "Sorry you're at work fella" <CR>
  nnoremap <leader>h :set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab <bar> echo "You're at home my dude!" <CR>

  " Change pwd to current open buffer path
  nnoremap <leader>cd : cd %:p:h<CR>:pwd<CR>

  " shortcut for find and replace all instances of word under cursor
  nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

  " Replace line with something else
  nnoremap <leader>rr Pj"_dd
  nnoremap <leader>rs ddko<esc>"*p

  " * register helpers
  vmap <Leader>y "*y
  vmap <Leader>d "*d
  nmap <Leader>y "*y
  nmap <Leader>d "*d
  nmap <Leader>p "*p
  nmap <Leader>P "*P
  vmap <Leader>p "*p
  vmap <Leader>P "*P
" }}}

" Config Editing settings -------------------- {{{
  augroup filetype_zsh
    autocmd!
    autocmd FileType zsh setlocal foldmethod=marker
    autocmd FileType zsh setlocal foldlevelstart=0
  augroup END
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

  let g:NERDTreeQuitOnOpen = 1

  nnoremap <F2> :NERDTreeToggle<cr>
  nnoremap <leader>nt :NERDTreeToggle<cr>
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

  " Leader key mappings for go to next and previous error
  nmap <silent> <leader>aj :ALENext<cr>
  nmap <silent> <leader>ak :ALEPrevious<cr>

" }}}

" {{{ buffergator settings 

  " Make the buffer window display on the right of the screen in a vertical
  " split 
  let g:buffergator_viewport_split_policy =  "B"

  " Automatically update the buffer window when a new buffer is opened
  let g:buffergator_autoupdate = 1

  " sort buffers by their name
  let g:buffergator_sort_regime = "basename"

" }}}

" nerd-tree-git settings {{{
  let g:NERDTreeShowIgnoredStatus=1
  let g:NERDTreeIndicatorMapCustom = {}
  let g:NERDTreeIndicatorMapCustom['Ignored']=' '
" }}}

" Deoplete settings ------- {{{
  let g:deoplete#enable_at_startup = 1
  let g:python3_host_prog = '/usr/local/bin/python3'
" }}}

" Ctrl-P settings ------- {{{
  set runtimepath^=~/.vim/plugged/ctrlp.vim

  let g:ctrlp_cache_dir = $HOME . '/.vim/.cache/ctrlp'
  if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif
  let g:ctrlp_show_hidden = 1
" }}}

" Vim-Plug Settings -------------------- {{{

  command! PS :PlugStatus
  command! PI :PlugInstall
  
" }}}

" Plugins ---------------------------- {{{

  call CreateDirectoryIfNotExist(g:vimPlugDir)
  call plug#begin(g:vimPlugDir)

    Plug 'tpope/vim-sensible'

    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    
    Plug 'ryanoasis/vim-devicons'

    Plug 'airblade/vim-gitgutter'

    Plug 'tpope/vim-fugitive'

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

    Plug 'rstacruz/vim-closer'

    Plug 'tpope/vim-repeat'

    Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }

    Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript'] }

    Plug 'jeetsukumaran/vim-buffergator'

    Plug 'Xuyuanp/nerdtree-git-plugin'

    Plug 'dart-lang/dart-vim-plugin', { 'for': ['dart'] }

    Plug 'idanarye/vim-merginal'

    Plug 'ctrlpvim/ctrlp.vim'

    " Plugins required for Neoplete -- {{{

      Plug 'Shougo/deoplete.nvim'
      " Not that this plugin requires a few extra steps for setup, refer to git
      " repo for details
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'

    " }}}
    
  call plug#end()
" }}}

" Devicons Settings ------------------ {{{

  " Gotcha!!! This only works if you put it after the plugins
  if exists('g:loaded_webdevicons')     
    call webdevicons#refresh()
  endif
  
" }}}
