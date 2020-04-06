echo "Get 0.1% better than yesterday."
" For neovim + pyenv
let g:python3_host_prog = $PYENV_ROOT . '/versions/anaconda3-2.4.0/bin/python3'
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
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('thinca/vim-quickrun')
  call dein#add('jmcantrell/vim-virtualenv')
  call dein#add('hynek/vim-python-pep8-indent')
  call dein#add('Shutnik/jshint2.vim')
  call dein#add('nrocco/vim-phplint')
  call dein#add('stephpy/vim-php-cs-fixer')
  call dein#add('joonty/vim-phpqa.git')
  call dein#add('nvie/vim-flake8')
  call dein#add('mileszs/ack.vim')
  call dein#add('rking/ag.vim')
  call dein#add('nvie/vim-flake8')
  call dein#add('rust-lang/rust.vim')
  call dein#add('racer-rust/vim-racer')
  call dein#add('mxw/vim-jsx')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
call dein#end()

filetype plugin indent on
" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

let g:deoplete#enable_at_startup = 1

" vim-template
let g:template_basedir = '~/.config/nvim/'

" deoplete
let g:deoplete#enable_at_startup = 1

" Some shortcut key often used
" Emmet : <c-y>,
" vit select text inside tag
" key for <leader>
let mapleader =","
let maplocalleader ="\\"
" defalut encoding
:set encoding=utf-8
" encoding to try when opening files
" :set fileencodings=utf-8
:set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
" automatically recognize line feed
set fileformats=unix,dos,mac
" copy yanked text to clipboard
" when block pasting, set empty (only for neovim)
" :set clipboard=
" when you want to insert space to the end of lines
" :set virtualedit+=block
" and delete by d and paste by p
:set clipboard=unnamed
" display line number
:set number
" open in binary mode and don't insert line feed at the last of file
:set binary noeol
"""""""""""" Key Mapping 
" exchange ; and :
" (for US key)
" nnoremap ; :
" nnoremap : ;
" open vimrc
nnoremap <leader>ev :vsplit ~/Dropbox/dotfiles/init.vim<cr>
" reload vimrc
noremap <leader>sv :source ~/.config/nvim/init.vim<cr>
" noremap: mapping
" inoremap: mapping when insert mode
" jk as ESC 
inoremap <silent> jk <ESC>
" move by displayed line
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" auto complete brackets
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap {<Space> {<Space><Space>}<LEFT><LEFT>
inoremap (<Space> ()<LEFT>
inoremap '<Space> ''<LEFT>
" tab and window division
" divide horizontally 
nnoremap fs :<C-u>sp<CR>
" divide vertically
nnoremap fv :<C-u>vs<CR>
" move window
nnoremap fn gt
nnoremap fp gT
nnoremap fh <C-w>h
nnoremap fl <C-w>l
nnoremap fj <C-w>j
nnoremap fk <C-w>k
" new tab
"nnoremap ft :<C-u>tabnew<CR>
nnoremap ft :tabnew<Return>
" jump 1st window by f1 
for n in range(1, 9)
  execute 'nnoremap f' .n. ' ' .n.'<C-W><C-W>'
endfor
" The prefix key for tab jump
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" treee view in netrw
let g:netrw_liststyle=3
" indent setting
" display tab by default
:set list
" insert space by tab key
:set expandtab
" when disable inserting space by tab
" :set noet
:set shiftwidth=2
" no swap file
:set noswapfile
" overwrite
set backupcopy=yes
" start terminal with insert mode by :te
autocmd BufWinEnter,WinEnter term://* startinsert
" FileType setting
autocmd BufRead,BufNewFile *.php setfiletype php
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
colorscheme japanesque
set ttyfast
set lazyredraw

" 隠しファイルを表示する
let NERDTreeShowHidden = 1

"
" keymap for snippet 
imap <C-e>     <Plug>(neosnippet_expand_or_jump)
smap <C-e>     <Plug>(neosnippet_expand_or_jump)
xmap <C-e>     <Plug>(neosnippet_expand_target)

" 

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
"
if has('conceal')
  set conceallevel=0
endif
" assign snippet directory
let g:neosnippet#snippets_directory='~/Dropbox/dotfiles/snippets/'

" ack + ag
let g:memo_path = '/Users/kazumasa/GoogleDrive/text/coding/'
let g:ackprg = 'ag --vimgrep'
nnoremap <Space>a :SearchMemo<Space> 
function! SearchMemoFunc(keyword)
  execute 'Ack! '.eval("a:keyword").' '. eval("g:memo_path")
endfunction
command! -nargs=1 SearchMemo call SearchMemoFunc("<args>") " markdown
:nnoremap <Space>1 mx0i<C-r>'#<ESC>`x
:nnoremap <Space>2 mx0i<C-r>'##<ESC>`x
:nnoremap <Space>3 mx0i<C-r>'###<ESC>`x
:nnoremap <Space>0 mx0dw`x

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
set hidden
let g:racer_cmd = '$HOME/.cargo/bin/racer'

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Shell like behavior(not recommended).
"set completeopt+=longest
" inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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

" ctrlpvim
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ }
if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif

" vim-quickrun
" run by <leader>r
" * : すべての言語に対して
let g:quickrun_config = {
      \'*': {
      \'hook/time/enable': '1',
      \'outputter/buffer/split': ':40vsplit'},}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" jshint2.vim
set runtimepath+=~/.vim/bundle/jshint2.vim/

" YouComleteMe
let g:ycm_python_binary_path = 'python'

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

" ------- not needed for neovim? --------
" if has("vms")
"   set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file
" endif
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
" syntax on