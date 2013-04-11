"reload :source ~/.vimrc
set nocompatible
set number
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle'))

"git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
let g:solarized_termtrans=0
let g:solarized_hitrail=1
let g:solarized_visibility=1
syntax enable
set background=dark
"set background=light
colorscheme solarized

NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  guibg=#202020 ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   guibg=#262626 ctermbg=235
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

NeoBundle 'mattn/ctrlp-launcher'
nnoremap <c-e> :<c-u>CtrlPLauncher<cr>

":Ack
NeoBundle 'ack.vim'
":MRU
NeoBundle 'mru.vim'
" U
NeoBundle 'sjl/gundo.vim'
nmap U :<C-u>GundoToggle<CR>

" :Gitt
NeoBundle 'tpope/vim-fugitive'
" for Fugitive {{{
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>
" }}}

NeoBundle 'fuenor/qfixhowm'
source ~/.dot/vimrc-qfixhowm

" NeoBundle 'buftabs'
NeoBundle 'Shougo/neocomplcache.git'
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'tpope/vim-surround.git'

" autocmd FileType php :set dictionary=~/maplecore/wordpress.dict

" kwbdはレイアウトを壊さずにバッファを閉じる機能
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>
nmap <C-k> :Kwbd<CR>

"matchit setting
source $VIMRUNTIME/macros/matchit.vim
NeoBundle 'vimtaku/hl_matchit.vim.git'
"" for hl_matchit
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'Title'
let g:hl_matchit_allow_ft_regexp = 'html\|vim\|ruby\|sh'

filetype plugin indent on

" statusline setting
source ~/.dot/vimrc-statusline

"Visual ModeでのTab/shift+Tab indent/unindentをハイライトされたブロックに対し
""て行う。
" In visual mode, tab means insert <tab> into highlighted block.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"vimrcをリローダブルにする
" reload vimrc
noremap <C-c><C-c> <C-c>
noremap <C-c>e :edit $HOME/.vimrc<CR>
noremap <C-c>s :source $HOME/.vimrc<CR>

"Enterでいつでも一行挿入
" <Enter> always means inserting line.
map <S-Enter> O<ESC>
map <Enter> o<ESC>

"フォーカスを失ったら自動的に上書き。
au FocusLost * :wa

" ヤンクでクリップボードと共有する
set clipboard=unnamed

nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
  
nnoremap <Space>ps i<?php 
imap <c-p>s <?php 
imap <c-p>e ?>

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <silent> <C-c><C-c> <ESC>

" カーソル後の文字削除
inoremap <silent> <C-d> <Del>
" カーソルから行末まで削除
inoremap <silent> <C-d>0 <Esc>lc$

nnoremap <silent> <C-x>1 :only<CR>
nnoremap <silent> <C-x>2 :sp<CR>
nnoremap <silent> <C-x>3 :vsp<CR>
