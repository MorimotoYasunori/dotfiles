" Common ----------------------
set nocompatible               " vim互換をオフにする
filetype off

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim " neobundleのディレクトリ
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplchache.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'

filetype plugin indent on      " required!
filetype indent on
syntax on

colorscheme solarized          " カラースキームの設定
set background=dark            " 背景色の傾向(カラースキームがそれに併せて色の明暗を変えてくれる

" File ------------------------
set autoread                   " 更新時自動再読込み
set hidden                     " 編集中でも他のファイルを開けるようにする
set noswapfile                 " スワップファイルを作らない
"set directory=$HOME/vimbackup  "スワップファイル用のディレクトリを指定する
"set nobackup                   " バックアップを取らない
set backupdir=$HOME/vimbackup  "バックアップファイルのディレクトリを指定する
syntax on                      " シンタックスカラーリングオン
set clipboard=unnamed          "クリップボードをと連携する

    
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

