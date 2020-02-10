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
  elseif has("unix")
    execute "source " . g:pathToVimspirationalRepo . "mydotfiles-linux.vim"
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
  set guifont=Jetbrains\ Mono

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

  " A fix for the screen not refreshing properly when scrolling in tmux
  if &term =~ '256color'
    " disable Background Color Erase (BCE)
    set t_ut=
  endif

  " make it so that the current directory is always set to the file I
  " currently have open
  " could use set autochdir but sometimes doesn't play nice with plugins so
  " this is a softer touch approach
  autocmd BufEnter * lcd %:p:h
" }}}

" Productivity commands ---------------------- {{{
  " Toggle case on the current word
  inoremap <c-u> <esc>viw~<esc>ea
  nnoremap <c-u> viw~<esc>

  " Exit insert/visual mode easier
  inoremap jk <esc>
  vnoremap jk <esc>

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

  " Replace line with something else
  nnoremap <leader>rr Pj"_dd
  nnoremap <leader>rs ddko<esc>"*p

  " * register helpers
  nnoremap <Leader>y "+y
  nnoremap <Leader>c "+c
  nnoremap <Leader>d "+d
  nnoremap <Leader>p "+p
  nnoremap <Leader>P "+P

  " quicksave
  nnoremap <Leader>f :w<cr>
  nnoremap <Leader>F :wa<cr>

  " Switch between buffers
  nnoremap gp :bn<cr> 
  nnoremap gb :bp<cr> 

  nnoremap <Leader>l :ll<cr>
  nnoremap <Leader>ln :ll<cr>
  nnoremap <Leader>lp :ll<cr>

  " Koodoo specific timesavers
  " Use these for moving variables from dotenv format to envalid js format
  nmap <Leader>deb 0f=s: envalid.jklys${ysa{(jklx%lxh%ladefault: jkF.abooljkA,jkj
  nmap <Leader>des 0f=s: envalid.jklys$'ysa'{ysa{(jklx%lxh%ladefault: jkF.astrjkA,jkj
  nmap <Leader>den 0f=s: envalid.jklys${ysa{(jklx%lxh%ladefault: jkF.anumjkA,jkj
  
"}}}

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
    autocmd FileType javascript :setlocal foldlevelstart=99
    autocmd FileType javascript.jsx :setlocal foldmethod=syntax
    autocmd FileType javascript.jsx :setlocal foldlevelstart=99
  augroup END

  " Comment and uncomment out a line in javascript
  augroup comment_javascript
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript nnoremap <buffer> <localleader>u :s/\/\///<cr>
  augroup END

" }}}

" Python settings {{{
  " Settings for python files
  au BufNewFile,BufRead *.py; 
      \ set tabstop=4
      \ set softtabstop=4
      \ set shiftwidth=4
      \ set textwidth=79
      \ set expandtab
      \ set autoindent
      \ set fileformat=unix

  " Show whitespace that shouldn't be there
  highlight BadWhitespace ctermbg=red guibg=red
  au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

  let python_highlight_all=1

  " Save and run the python program in the current buffer
  autocmd FileType python nnoremap <buffer> <leader>r :w<CR>:vert ter python3 "%"<CR>
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

  " enable line numbers
  let NERDTreeShowLineNumbers=1

  " make sure relative line numbers are used
  autocmd FileType nerdtree setlocal relativenumber
  
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

  let g:airline_theme='onedark'

" }}}

" ALE Settings --------------------- {{{

  let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}

  " Set which fixers to use with Ale
  let g:ale_fixers = {}
  let g:ale_fixers['javascript'] = ['prettier', 'eslint']
  let g:ale_fixers['javascript.jsx'] = ['prettier', 'eslint']
  let g:ale_fixers['typescript'] = ['prettier', 'tslint']
  let g:ale_fixers['svelte'] = ['prettier', 'eslint']

  " Set which linters to use with Ale
  let g:ale_linters = {}
  let g:ale_linters['javascript'] = ['flow', 'eslint']
  let g:ale_linters['javascript.jsx'] = ['flow', 'eslint']
  let g:ale_linters['typescript'] = ['tslint']
  let g:ale_linters = {'svelte': ['stylelint', 'eslint']}

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
  let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
  let g:ale_javascript_prettier_use_local_config = 1

  " Leader key mappings for go to next and previous error
  nmap <silent> <leader>aj :ALENext<cr>
  nmap <silent> <leader>ak :ALEPrevious<cr>

  autocmd BufEnter * let g:filePathForAle = expand('%:p')

  " Make it so that the cursor doesn't disappear on linux on lines with
  " linting errors
  let g:ale_echo_cursor = 0

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

" CoC settings -------------- {{{
  " SUGGESTED COC SETTINGS {{{
    " if hidden is not set, TextEdit might fail.
    set hidden

    " Some servers have issues with backup files, see #649
    set nobackup
    set nowritebackup

    " Better display for messages
    set cmdheight=2

    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[c` and `]c` to navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    "xmap <leader>f  <Plug>(coc-format-selected)
    "nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    " nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    " nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
    let g:coc_global_extensions=['coc-tsserver', 'coc-git', 'coc-json', 'coc-css', 'coc-yaml', 'coc-html', 'coc-prettier', 'coc-svelte']
  " }}}
" }}}

" Ctrl-P settings ------- {{{
  set runtimepath^=~/.vim/plugged/ctrlp.vim

  let g:ctrlp_cache_dir = $HOME . '/.vim/.cache/ctrlp'
  if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif
  let g:ctrlp_show_hidden = 1
" }}}

" Itchy settings ------- {{{
  let g:ctrlp_reuse_window = 'Scratch'
  nmap <Leader>gs <Plug>(itchy-open-scratch)
  vmap <Leader>gs <Plug>(itchy-open-scratch)
" }}}

" Vim-Plug Settings -------------------- {{{

  command! PS :PlugStatus
  command! PI :PlugInstall
  
" }}}

" vim-table-mode settings {{{
  let g:table_mode_corner='|'
" }}}

" Plugins ---------------------------- {{{

  call CreateDirectoryIfNotExist(g:vimPlugDir)
  call plug#begin(g:vimPlugDir)

    Plug 'tpope/vim-sensible'

    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

    Plug 'ryanoasis/vim-devicons'

    Plug 'airblade/vim-gitgutter'

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

    Plug 'jiangmiao/auto-pairs'

    Plug 'tpope/vim-repeat'

    Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }

    Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript'] }

    Plug 'Xuyuanp/nerdtree-git-plugin'

    Plug 'dart-lang/dart-vim-plugin', { 'for': ['dart'] }

    Plug 'ctrlpvim/ctrlp.vim'

    Plug 'mustache/vim-mustache-handlebars'

    Plug 'vim-scripts/indentpython.vim', { 'for': ['python'] }

    Plug 'nvie/vim-flake8', { 'for': ['python'] }

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'wellle/targets.vim'

    Plug 'airblade/vim-rooter'

    Plug 'joshdick/onedark.vim'

    Plug 'getgauge-contrib/neovim-gauge'

    Plug 'dhruvasagar/vim-table-mode'

    Plug 'evanleck/vim-svelte'

    Plug 'tpope/vim-obsession'
  call plug#end()
" }}}

  color onedark
" Devicons Settings ------------------ {{{

  " Gotcha!!! This only works if you put it after the plugins
  if exists('g:loaded_webdevicons')     
    call webdevicons#refresh()
  endif
  
" }}}
