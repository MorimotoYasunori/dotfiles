" Common ----------------------
filetype off

if &compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.vim') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

filetype plugin indent on      " required!
filetype indent on

syntax enable
if !has("gui_running")
  let g:gruvbox_italic=0
endif
set background=dark            " 背景色の傾向(カラースキームがそれに併せて色の明暗を変えてくれる)
colorscheme gruvbox            " カラースキームの設定(GUI版用のカラースキームを入れている場合はそちらが優先される)

" File ------------------------
set autoread                   " 更新時自動再読込み
set hidden                     " 編集中でも他のファイルを開けるようにする
set noswapfile                 " スワップファイルを作らない
set nobackup                   " バックアップを取らない
set undodir=~/var/vim/undo     " アンドゥファイルをホーム直下のvar/vim/undoにまとめる
set clipboard=unnamed          " クリップボードを無名レジスタと連携する
set clipboard+=unnamed

" Indent ----------------------
" tabstop:                         " Tab文字を画面上で何文字分に展開するか
" shiftwidth:                      " cindentやautoindent時に挿入されるインデントの幅
set expandtab                      " Tabの代わりに空白文字を指定する
set tabstop=2 shiftwidth=2 softtabstop=0
set autoindent smartindent         " 自動インデント, スマートインデント

" Assist imputing -------------
set backspace=indent,eol,start     " バックスペースで特殊記号も削除可能に
set formatoptions=lmoq             " 整形オプション, マルチバイト系を追加
set whichwrap=b,s,h,l,[,],<,>,~    " カーソルを行頭, 行末で止まらないようにする
set mouse=                         " マウスを無効に

"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
 
"インクリメンタルサーチを行う
set incsearch

"行番号を表示する
set number
set ruler
 
"ステータスバーを常に表示
set laststatus=2
"ステータスバーに文字コードを表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"閉括弧が入力された時、対応する括弧を強調する
set showmatch
 
"新しい行を作った時に高度な自動インデントを行う
set smarttab

" ctagのPATHを設定
set tags=<tags_path>
 
" migemoの辞書をutf-8に指定
if has('migemo')
  set migemodict=/usr/local/share/migemo/utf-8/migemo-dict
endif

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" 表示単位で上下移動する
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k

" MacVimでCtrl-Vが矩形モードではなくペーストになってしまう問題を回避。
nnoremap <C-V> <C-V>

"全角スペースの定義
hi ZenkakuSpace gui=underline guibg=DarkBlue cterm=underline ctermfg=LightBlue 
" 全角スペースの色を変更
match ZenkakuSpace /　/ 
" ESCでIMEを確実にOFF
inoremap <ESC> <ESC>:set iminsert=0<CR> 

if dein#check_install()
  call dein#install()
endif
