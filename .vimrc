set nu
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_dir = expand('~/.config/nvim')

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" keymap settings
:nmap <silent> <F5> :VersDiff -<cr>
:nmap <silent> <F6> :VersDiff +<cr>
:nmap <silent> <F8> :VersDiff -c<cr>
:nmap , :e /Users/yu/.vimrc<cr>
:nmap <c-_> :ar $file<cr>
:imap <C-G>  <ESC>pi
:imap <c-a> <ESC>
:nmap ` :Exp $pyprogdir<cr>
:nmap <Space>V :Vexplore! .<CR>
:set nocursorline
"For NERDTree setting
let NERDTreeWinPos="left"
let NERDTreeWinSize=25
:nmap [ :NERDTree<CR>
:nmap ] :NERDTreeToggle<CR>
:nmap _ :NERDTreeClose<CR>
:nmap \ :w<CR> :! /usr/local/bin/vitex %<CR>
let NERDTreeShowHidden=1
:set expandtab
:set tabstop=4
:set ts=4 sw=4 sts=0

:let g:miniBufExplMapWindowNavVim = 1
:let g:miniBufExplMapWindowNavArrows = 1
:let g:miniBufExplMapCTabSwitchBuffs = 1
:nmap > :bn<CR>
:nmap < :bp <CR>
function! s:Exec()
    exe "!" . &ft . " %"
:endfunction
command! Exec call <SID>Exec()
":map <silent> " :call <SID>Exec()<CR>
:set ic
:map <F2> a<C-R>=strftime("%c")<CR><Esc>
:nmap <C-O> :!g95 %<cr> !./a.out<cr>

filetype off

filetype plugin on
filetype indent on

"In case with print.

if has('gui_macvim')
  "  set transparency=10 " 透明度を指定
    set guifont=Courier:h14 " フォント指定
    set lines=90 columns=200 " ウィンドウサイズをセット はみだした部分は自動的に修正させて画面いっぱいに表示させる
    set guioptions-=T " ウィンドウ上部のタブ部分を無効に
    set imdisable " IMEを無効に
    set printfont = Courier:h14
    colorscheme desert " カラースキーマを指定
endif
