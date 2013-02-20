set number numberwidth=1
" Tab/space settings and auto indent
set ts=2 sw=2 sta sts=2 et ai
set gfn=Monospace\ 9 " Default font

" Set the vertical split character to a vertical bar instead of just a pipe
" (eliminates visible space between each character).
set fillchars+=vert:│

" Default window size. This is actually kind of annoying when in a console
" instead of gvim, maybe this is worth changing to be conditional.
"set columns=200

set autoread
set noswapfile
set nobackup

set hlsearch " Highlight search terms
set incsearch " Incrementally highlight terms (just one while typing?)

" Space unhighlights the search terms.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Automatically change the cwd to whatever buffer is open to make :e (blah)
" work much more nicely.
set autochdir

set background=dark
colors solarized

" Reduce the vim timeout time for checking if a key is an escape sequence
" causing delays. I don't intentionally use escape sequences so I'm not sure
" if I'm missing
" something.
set tm=200

" Jump to the line you were on when you reopen it
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

syntax enable
filetype on
filetype plugin on
filetype indent on

" Show a horizontal line guide at (max-columns + 1) for relevant styleguides
au BufEnter,BufRead,BufNewFile * set colorcolumn=81
au BufEnter,BufRead,BufNewFile *.java set colorcolumn=101

au BufEnter,BufRead,BufNewFile *.soy setfiletype soy
au BufEnter,BufRead,BufNewFile *.gss setfiletype css

" Map C-h and C-l to left/right tab switching
map <C-h> gT
map <C-l> gt

" Map W and Q so that accidentally holding down shift for too long during :wq
" works as expected.
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev WQ wq
cnoreabbrev Wq wq

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Autocomplete settings
inoremap <S-space> <C-x><C-n>
set completeopt=longest,menuone
" Enter selects the highlighted 
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Search case insensitive unless there is \C
set ic 

" Status bar options.
" It's like prohibition; close all the bars (menubars, toolbars, scroll bars).
set guioptions=
set laststatus=2 " Always show the status bar
set statusline=%<[%n]\ %f%=%{v:register}\ %-14.(%l,%c%V%)\ %P
set guitablabel=%-0.25t%M

" Swap ' and ` since they are very similar (nearly adjacent or dvorak) but `
" is almost strictly better and further to reach.
nnoremap ' `
nnoremap ` '

" Improved % key jumping (still want to figure out how to be able to use 
" arbitrary characters for di / ci / da / ca)
" runtime is the same as source except relative to the vim directory
runtime macros/matchit.vim 

" Use the + register by default as the unnamed register (allows easier
" copy/pasting since you don't need to do "+ before a y or p but vim will
" overwrite the system clipboard incidentally more often.
set clipboard=unnamedplus

" Hide hidden files in the vim file viewer (can hit a to show hidden files)
let g:netrw_list_hide='^\.,\~$*'
set wildignore+=.git,blaze-bin,blaze-out,blaze-google3,blaze-testlogs,blaze-genfiles

let mapleader=","
