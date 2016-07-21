" defalut encoding
:set encoding=utf-8
" encoding to try when opening files
" :set fileencodings=utf-8
:set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
" 改行コードを自動認識
set fileformats=unix,dos,mac
" ヤンクしたテキストをクリップボードにコピー
:set clipboard+=unnamed
" 行番号を表示
:set number
" バイナリモードで開いて最後に改行コードを入れない
:set binary noeol
" 空白文字を表示
" :set list
"""""""""""" Key Mapping 
" noremap: mapping
" inoremap: mapping when insert mode
" jj as ESC 
inoremap <silent> jj <ESC>
" move when insert mode 
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
" 表示行単位で移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" auto complete brackets
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" tab and window division
" 水平分割
nnoremap ss :<C-u>sp<CR>
" 垂直分割
nnoremap sv :<C-u>vs<CR>
" ウィンドウの移動
nnoremap sn gt
nnoremap sp gT
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sj <C-w>j
nnoremap sk <C-w>k
" 新規タブ
nnoremap st :<C-u>tabnew<CR>
" s1 で1番左のウィンドウ、s2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap s' .n. ' ' .n.'<C-W><C-W>'
endfor
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

" コロンとセミコロンを入れ替え
noremap ; :

" netrwは常にtree view
let g:netrw_liststyle=3

" インデントの設定
" 最初はタブかスペースどちらか確認
:set list
" タブをスペースにする
:set expandtab
" やっぱりタブにしたいとき
" :set noet
:set shiftwidth=2
:set tabstop=2

" 色
colorscheme mydefault

" swapファイルを作らない
:set noswapfile
" 上書き保存にする
set backupcopy=yes

" FileType setting
autocmd BufRead,BufNewFile *.php setfiletype php

" keymap for snippet 
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
"
if has('conceal')
  set conceallevel=0
endif
" assign snippet directory
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'


" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" dein.vim
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tomtom/tcomment_vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('thinca/vim-template')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('mattn/emmet-vim')
call dein#add('wakatime/vim-wakatime')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('thinca/vim-quickrun')
call dein#add('jmcantrell/vim-virtualenv')
call dein#add('hynek/vim-python-pep8-indent')
call dein#add('Shutnik/jshint2.vim')
call dein#add('nrocco/vim-phplint')
call dein#add('mileszs/ack.vim')
call dein#add('rking/ag.vim')
call dein#add('stephpy/vim-php-cs-fixer')
call dein#add('joonty/vim-phpqa.git')
call dein#add('nvie/vim-flake8')
call dein#add('mileszs/ack.vim')
call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown')
call dein#end()

filetype plugin indent on
" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" ack + ag
let g:memo_path = '/Users/kazumasa/karadaharu.org/content'
let amemo_path = '/Users/kazumasa/karadaharu.org/content'
let g:ackprg = 'ag --vimgrep'
nnoremap <Space>a :SearchMemo<Space>
function SearchMemoFunc(keyword)
  execute 'Ack! '.eval("a:keyword").' '. eval("g:memo_path")
endfunction
let g:keyw = 'ruby'
command -nargs=1 SearchMemo call SearchMemoFunc("<args>")

" vim-markdown
let g:vim_markdown_folding_disabled = 1
:nnoremap h1 mx0i<C-r>'#<ESC>`x
:nnoremap h2 mx0i<C-r>'###<ESC>`x
:nnoremap h3 mx0i<C-r>'##<ESC>`x
:nnoremap hh mx0dw`x

" neocomplete
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" end of neocomplete

" vim-indent-guides
let g:indent_guides_auto_colors = 0
" Vim 起動時 vim-indent-guides を自動起動
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラー無効
let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
" ガイドの幅
let g:indent_guides_guide_size = 1

let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ }
" vim-quickrun
" * : すべての言語に対して
let g:quickrun_config = {
      \'*': {
      \'hook/time/enable': '1',
      \'outputter/buffer/vsplit': 'vertical 10sp'},}

" jshint2.vim
set runtimepath+=~/.vim/bundle/jshint2.vim/

" vim-phplint
noremap <C-l> :Phplint<CR>

function! s:vimdiff_in_newtab(...)
  if a:0 == 1
    tabedit %:p
    exec 'rightbelow vertical diffsplit ' . a:1
  else
    exec 'tabedit ' . a:1
    for l:file in a:000[1 :]
      exec 'rightbelow vertical diffsplit ' . l:file
    endfor
  endif
endfunction
command! -bar -nargs=+ -complete=file Diff  call s:vimdiff_in_newtab(<f-args>)

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

filetype plugin indent on     " required!
filetype indent on
syntax on

