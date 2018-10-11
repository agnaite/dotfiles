"
"
"     .  o ..
"     o . o o.o
"          ...oo
"            __[]__
"         __|_o_o_o\__
"         \""""""""""/
"          \. ..  . /
"     ^^^^^^^^^^^^^^^^^^^^
"
"

set nocompatible

set encoding=utf-8

" leader/local leader
let mapleader = " "
let maplocalleader = "-"

syntax enable
set synmaxcol=800 " avoid syntax highlighting on large lines
set t_Co=256
set background=dark

" don't show mode because lightline
set noshowmode
set laststatus=2

set noerrorbells
set novisualbell
set belloff=all

set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set pyxversion=3

set backspace=indent,eol,start " backspace over anything

" language-specific whitespace things
au FileType python set shiftwidth=4 tabstop=4
autocmd BufNewFile,BufRead *.R set shiftwidth=2

set expandtab " expand tabs to spaces
set nosmarttab " no tabs to begin with

set mouse=r

" use version control for version control
set autowrite
set autoread

set backup
set noswapfile

set ttyfast " I think this is turbo mode?
set number

" undo
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set undofile
set undoreload=10000



" return to same line when you reopen vim
augroup line_return
  au!
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     execute 'normal! g`"zvzz' |
    \ endif
augroup END

"
" Everything after this is for Fancy Stuff™
"

"
" Search
"
set incsearch " use incremental searching
set ic " base case sensitive, unless not
set smartcase " be case insensitive, or don't

" colorscheme
colorscheme hybrid

" disable visual bell in MacVim
autocmd! GUIEnter * set vb t_vb=

" highlight pesky invisible chars
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

" custom file extensions
au BufNewFile,BufRead *.coffee set filetype=coffeescript
au BufNewFile,BufRead *.jbuilder set filetype=ruby
au BufNewFile,BufRead *.ts set filetype=typescript
au BufNewFile,BufRead *.go set filetype=go
au BufNewFile,BufReadPost *.md set filetype=markdown

" always use system ruby
let g:ruby_path = ['/usr/local/bin/ruby', '/usr/bin/ruby']

"
" Time For Plugins!
"

call plug#begin('~/.vim/plugged')

Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'godlygeek/tabular'                        " Tab /=
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'vim-python/python-syntax'
Plug 'faceleg/delete-surrounding-function-call.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dsawardekar/ember.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
"
" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'mattn/emmet-vim'


" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'


" python
"" Python Bundle
"Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'vim-ruby/vim-ruby'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'Shougo/echodoc'

call plug#end()

"
" Mappings
"

" Open .vimrc in vertical split
nnoremap <leader>ev :vsp $MYVIMRC<cr>
" Source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Wrap word in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel<cr>

" clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" move cursor to beginning of line
inoremap <localleader>H <esc>0i

" move cursor to end of line
inoremap <localleader>L <esc>$i

" run current python program
nnoremap <leader>z :exec '!python' shellescape(@%, 1)<cr>

nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"
" Plugin Settings
"

" language-specific syntax highlighting in markdown ''' blocks
let g:markdown_fenced_languages = ['sh', 'css', 'javascript', 'python', 'ruby', 'xml', 'go']

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect
" no preview for autocomplete
set completeopt-=preview

" lighline settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \ 'left': [ [ 'mode', 'paste' ],
      \ [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \ 'gitbranch': 'fugitive#head'
      \ },
      \ }

" Path to python interpreter for neovim
" " always use python3 (for iron.nvim)
let g:python3_host_prog = '/usr/local/bin/python3'
"
" Skip the check of neovim module
let g:python3_host_skip_check = 0

" Run echodoc at startup
let g:echodoc_enable_at_startup = 0

"close the preview window after completion is done
autocmd CompleteDone * silent! pclose!

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1

" do not use deoplete for python
 "autocmd FileType python :call deoplete#custom#buffer_option('auto_complete', v:false)

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" run goimports on save
let g:go_fmt_command = "goimports"
let g:deoplete#sources#go#pointer = 1
