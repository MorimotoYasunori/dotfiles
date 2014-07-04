" Common ----------------------
set nocompatible               " vim互換をオフにする
colorscheme solarized          " カラースキームの設定
set background=dark            " 背景色の傾向(カラースキームがそれに併せて色の明暗を変えてくれる

" File ------------------------
set autoread                   " 更新時自動再読込み
set hidden                     " 編集中でも他のファイルを開けるようにする
set noswapfile                 " スワップファイルを作らない
"set nobackup                   " バックアップを取らない
set backupdir=$HOME/vimbackup  "バックアップファイルのディレクトリを指定する
syntax on                      " シンタックスカラーリングオン
set clipboard=unnamed          "クリップボードをと連携する

"スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup
    
" Indent ----------------------
" tabstop:                     " Tab文字を画面上で何文字分に展開するか
" shiftwidth:                  " cindentやautoindent時に挿入されるインデントの幅
set expandtab                  " Tabの代わりに空白文字を指定する
set tabstop=2 shiftwidth=2 softtabstop=0
set autoindent smartindent     " 自動インデント, スマートインデント

" Assist imputing -------------
set backspace=indent,eol,start " バックスペースで特殊記号も削除可能に
set formatoptions=lmoq         " 整形オプション, マルチバイト系を追加
set whichwrap=b,s,<,>,[,]  " カーソルを行頭, 行末で止まらないようにする

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
inoremap <ESC> <ESC>:set iminsert=0<CR> 
