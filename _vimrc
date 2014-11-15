" Common ----------------------
set nocompatible               " vim互換をオフにする
filetype off

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set columns=82
set lines=40

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim " neobundleのディレクトリ
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'haya14busa/vim-migemo'

call neobundle#end()

filetype plugin indent on      " required!
filetype indent on

let g:solarized_temcolors=16
let g:solarized_termtrans=1
let g:solarized_degrade=0
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_italic=0
let g:solarized_contrast='normal'
let g:solarized_visibility='normal'

syntax enable
colorscheme solarized          " カラースキームの設定
set background=dark            " 背景色の傾向(カラースキームがそれに併せて色の明暗を変えてくれる

" File ------------------------
set autoread                   " 更新時自動再読込み
set hidden                     " 編集中でも他のファイルを開けるようにする
set noswapfile                 " スワップファイルを作らない
"set directory=$HOME/vimbackup  "スワップファイル用のディレクトリを指定する
"set nobackup                   " バックアップを取らない
set backupdir=$HOME/vimbackup  "バックアップファイルのディレクトリを指定する
set clipboard=unnamed          "クリップボードを無名レジスタと連携する

" Indent ----------------------
" tabstop:                     " Tab文字を画面上で何文字分に展開するか
" shiftwidth:                  " cindentやautoindent時に挿入されるインデントの幅
set expandtab                  " Tabの代わりに空白文字を指定する
set tabstop=2 shiftwidth=2 softtabstop=0
set autoindent smartindent     " 自動インデント, スマートインデント

" Assist imputing -------------
set backspace=indent,eol,start " バックスペースで特殊記号も削除可能に
set formatoptions=lmoq         " 整形オプション, マルチバイト系を追加
set whichwrap=b,s,[,],<,>,~    " カーソルを行頭, 行末で止まらないようにする
set mouse=                     " マウスを無効に

"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
 
"インクリメンタルサーチを行う
set incsearch

"行番号を表示する
set number
set ruler
 
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
 
"新しい行を作った時に高度な自動インデントを行う
set smarttab
 
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

"全角スペースの定義
hi ZenkakuSpace gui=underline guibg=DarkBlue cterm=underline ctermfg=LightBlue 
" 全角スペースの色を変更
match ZenkakuSpace /　/ 
" ESCでIMEを確実にOFF
"inoremap <ESC> <ESC>:set iminsert=0<CR> 

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
