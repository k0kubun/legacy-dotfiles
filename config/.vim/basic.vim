" Basic Settings
set encoding=utf-8               " UTF-8
set browsedir=buffer             " Exploreの初期ディレクトリ
" set hidden                       " 編集中でも他のファイルを開けるようにする
set incsearch                    " インクリメンタル検索を行う
set number                       " 行番号表示
set showmatch                    " 対応するカッコを表示
set ignorecase                   " 検索で大文字小文字を区別しない
" set cursorline                   " カレント行ハイライト（激しく重い）
set noswapfile                   " .swpを作らない
set nowrap                       " 画面端で折り返さない
set autoread                     " 更新時自動再読み込み
set hlsearch                     " 検索結果ハイライト
set laststatus=2                 " 常にステータスラインを表示
set bs=start,indent              " インサートモードで文字を消せるようにする
set clipboard=unnamed,autoselect " ヤンクでクリップボードにコピー
set cmdheight=2                  " コマンドラインウィンドウを2行で表示

" 自動コメント防止
autocmd FileType * set formatoptions-=ro

" ファイルタイプ判定をon
filetype plugin on

" clipboard=unnamedによるクリップボード汚染対策
autocmd QuitPre * set clipboard-=unnamed
