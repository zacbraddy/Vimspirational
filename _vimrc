" {{{ Begin settings that were here by default
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
" End settings that were here by default}}}

" {{{1 Begin Zac's changes 
" Pathogen install variables
execute pathogen#infect()
syntax on
filetype plugin indent on

" {{{2 Start Shell setup for windows and initialisation
set shell=cmd
set shellcmdflag=/c
set noshellslash

if isdirectory("D:/Projects/") 
  cd D:\Projects
endif

if isdirectory("C:/Projects/") 
  cd C:\Projects
endif

" Put all the swap files and other crap in a temp folder
" GOTCHA: Don't forget to create the vimtmp directory in your ~ folder
set backupdir=$VIM/vimfiles/vimtmp/backup//
set directory=$VIM/vimfiles/vimtmp/swap//
set undodir=$VIM/vimfiles/vimtmp/undo//

" set fold method to marker by default
set foldmethod=marker

" turn on line numbers by default
set number

" !!! End Shell setup for windows and initialisation}}}2

" {{{2 Start Custom commands

" close all open buffers
:command CAB silent %bd|echo "All buffers just got blow'd up"

" !!! End Custom commands}}}2

" {{{2 Start Key Remaps
" Window navigation without having to use Ctrl-W first
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NerdTree keybinds
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :NERDTreeFind<CR>

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Toggle line numbers
nnoremap <F4> :NumbersToggle<CR>
nnoremap <F5> :NumbersOnOff<CR>

" Set and unset shellslash
nnoremap <F6> :set shellslash<CR>
nnoremap <F7> :set noshellslash<CR>

" Set tab setting correctly
nnoremap <leader>w :set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab <bar> echo "Sorry you're at work fella" <CR>
nnoremap <leader>h :set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab <bar> echo "You're at home my dude!" <CR>

" Change pwd to current open buffer path with ,cd
nnoremap ,cd : cd %:p:h<CR>:pwd<CR>

" Get out of insert mode with a ;n (pnemonic go normal)
inoremap ;n <esc>

" switch between foldmethods
nnoremap <leader>fm :set foldmethod=marker <bar> echo "Foldmethod changed to market" <CR>
nnoremap <leader>fi :set foldmethod=indent <bar> echo "Foldmethod changed to indent" <CR>

" !!! End Key Remaps}}}2

" {{{2 Start NerdTree settings
let g:NERDTreeWinSize=60

" !!! Set nerdfont for vimdevicons
set encoding=utf8
set guifont=SauceCodePro\ NF:h11

" !!! NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
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

" !!! End NerdTree settings}}}2

" {{{2 Start Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm-exec eslint -f compact --'

" Use custom symbols for the gutter icons for errors and warnings
" turn these on when you can be bothered to source some icons
let g:syntastic_error_symbol = '' 
let g:syntastic_style_error_symbol = '💩'
let g:syntastic_warning_symbol = ''
let g:syntastic_style_warning_symbol = '⁉️'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" !!! End Syntastic settings}}}2

" {{{2 Start vim-airline settings
let g:airline_theme='deus'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" !!! End vim-airline settings}}}2

" Ctrl-P Settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Vim-rooter settings
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1

" vim-jsx settings
let g:jsx_ext_required = 0

" End Zac's changes}}}1
