"----------------------------------------
" Neobundle（プラグイン）関連
"----------------------------------------
" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

" neobundle.vim自身をneobundle.vimで管理する
NeoBundleFetch 'Shougo/neobundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""
" ここにインストールしたいプラグインを記載
""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/unite.vim'

" 日本語版ヘルプ
NeoBundle 'vim-jp/vimdoc-ja'

"ファイルブラウザ
NeoBundle 'scrooloose/nerdtree'

" Markdown
NeoBundle 'plasticboy/vim-markdown'
"markdownをブラウザでプレビュー
NeoBundle 'kannokanno/previm'
"vimからブラウザを開く
NeoBundle 'tyru/open-browser.vim'

" シンボルリスト表示
"NeoBundle 'vim-scripts/taglist.vim'

" quickrun, vim内でプログラムを実行し、結果を表示
"NeoBundle 'thinca/vim-quickrun'
"let g:quickrun_config = {'*': {'hook/time/enable': '1'},}

""""""""""""""""""""""""""""""""""""""""""""""""
" ここまで
""""""""""""""""""""""""""""""""""""""""""""""""
call neobundle#end()

" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" インストールのチェック
NeoBundleCheck

if !has('vim_starting')
        ".vimrcを読み込みなおしたときのための設定
        call neobundle#call_hook('on_source')
endif

" pluginを使用可能にする
filetype plugin on

"----------------------------------------------------------------
" 汎用設定
"----------------------------------------------------------------
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
set nocompatible
filetype off

set clipboard+=unnamed

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" □や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

" コマンドライン補完するときに強化されたものを使う
set wildmenu

" マウスを有効にする
if has('mouse')
  set mouse=a
endif 

 " タブの代わりに空白を挿入
set expandtab 

" 自動折り返しの文字幅(txtのみ80文字で折り返し)
    autocmd BufNewfile,Bufread *.txt setlocal textwidth=70

" 80文字目を強調(txtのみ)
if exists('&colorcolumn')
    autocmd BufNewfile,Bufread *.txt setlocal colorcolumn=70
endif

" マークダウンファイル (md) のプレビューを firefoxでオープンする用
" （.mdをmarkdownファイルに紐付け）
" 「:PrevimOpen」で実行
au BufRead,BufNewFile *.md set filetype=markdown
"let g:previm_open_cmd = 'open -a Firefox'

" helpの言語を日本語優先に
set helplang=ja,en

"----------------------------------------
" gtags
"----------------------------------------
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <C-j> :GtagsCursor<CR>
map <C-g> :Gtags<CR>

"----------------------------------------
" 検索
"----------------------------------------
" 検索の時に大文字小文字を区別しない
" ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase

" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan

" インクリメンタルサーチ
set incsearch

" 検索文字の強調表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" 行番号表示
set number

" 括弧の対応表示時間
set showmatch matchtime=1

" 自動的にインデントする
set autoindent
set cindent

" Cインデントの設定
set cinoptions+=:0

" タイトルを表示
set title

" コマンドをステータス行に表示
set showcmd

" 画面最後の行をできる限り表示する
set display=lastline

" Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~

" タブの色付け
:highlight SpecialKey guifg=orange
:highlight SpecialKey guibg=#012345

"背景色
colorscheme evening
syntax on


"----------------------------------------
" ノーマルモード
"----------------------------------------

" カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p>
" キーボードマクロには物理行移動を推奨
" h l は行末、行頭を超えることが可能に設定(whichwrap)
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>zv
nnoremap j gj
nnoremap k gk
nnoremap l <Right>zv
set whichwrap=b,s,h,l,>,<,[,]

 ""ノーマルモードでEnter改行
noremap <CR> o<ESC>

" ファイルブラウザ（NERDTree）を「\N」で表示
nnoremap <leader>n :NERDTreeToggle<cr>

"----------------------------------------
" ファイルを開いたら前回のカーソル位置へ移動
" $VIMRUNTIME/vimrc_example.vim
"----------------------------------------
augroup vimrcEx
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal! g`\"" | endif
augroup END
