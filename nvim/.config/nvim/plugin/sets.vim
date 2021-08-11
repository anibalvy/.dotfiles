" "GENERAL"
set history=10000
set number 
set relativenumber "So I can see the queantity of lines of yank, delete, etc.
"set splitbelow splitright    "by default split vertical
"set mouse=a " Enable mouse click for nvim
"inoremap <S-Tab> <C-d>  " Shift + Tab does inverse tab
"set list listchars=tab:>\ ,trail:+,eol:$ ""See invisible characters
set guicursor= " "Fix cursor replacement after closing nvim
set guifont=Hack\ Nerd\ Font\ Mono\ 11
set nohlsearch
set hidden
set noerrorbells
" "Indentation" (for particular file check: filetype.vim)
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" "UNDO / SAVING"
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
" "NAVIGATION"
set nowrap
set incsearch "incrementa search
set scrolloff=10 " when scrolling down, not wait to end to show new lines.
set noshowmode "get rid of original mode indicator.
set whichwrap+=<,>,[,]  ""wrap to next line when end of line is reached
"set isfname+=@-@
"set ls=0
set cmdheight=1    " Give more space for displaying messages.
set updatetime=50  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
"set shortmess+=c   " Don't pass messages to |ins-completion-menu|.
" "Colors"
set termguicolors
set colorcolumn=80 " Visual delimiter line
set cursorline     " Highlight current cursor line
"set cursorcolumn  " Highlight current cursor column line
set foldcolumn=1   " Place a width 1 margin on the left
set signcolumn=yes " Extra left column for linting
"set background=dark
" Use clipboard as default register
set clipboard=unnamedplus "set clipboard=unnamed


set exrc " Whenever you have an .vimrc on the folder, and open with "vim ." it will excecute it.
