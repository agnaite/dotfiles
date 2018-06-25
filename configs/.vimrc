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
let maplocalleader = ","

syntax enable
set synmaxcol=800 " avoid syntax highlighting on large lines
set t_Co=256

set noerrorbells
set novisualbell

set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2

set pyxversion=3

nnoremap q :q<cr> " kill window with q

set backspace=indent,eol,start " backspace over anything

" language-specific whitespace things
au FileType python set shiftwidth=4 tabstop=4
autocmd BufNewFile,BufRead *.R set shiftwidth=2

set expandtab " expand tabs to spaces
set nosmarttab " no tabs to begin with

set mouse=vin

" does not work in tmuxy ?
" set clipboard+=unnamed " use system clipboard

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

" clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

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
set background=dark
colorscheme hybrid
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.


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
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-go', { 'do': 'make'}

call plug#end()

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

"
" Mappings
"

" Wrap selection
nnoremap <leader>W :set wrap!<cr>

"
" Plugin Settings
"

" language-specific syntax highlighting in markdown ''' blocks
let g:markdown_fenced_languages = ['sh', 'css', 'javascript', 'python', 'ruby', 'xml', 'go']

" CtrlP
let g:UltiSnipsNoPythonWarning = 1 " silence python version warnings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*pyc
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|build|venv)$',
  \ 'file': '\v\.(exe|so|dll|png|jpeg|jpg|gif|pdf)$',
  \ }
let g:ctrlp_max_files=4096

" run goimports on save
let g:go_fmt_command = "goimports"

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Path to python interpreter for neovim
" " always use python3 (for iron.nvim)
let g:python3_host_prog = '/usr/local/bin/python3'

" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
