"#"let mapleader =" " " edit on .dotfiles/.vimrc set nocompatible              " be iMproved, required
"#filetype off                  " required
"#set encoding=UTF-8
"#set number relativenumber    "So I can see the queantity of lines of yank, delete, etc.
"#"set splitbelow splitright    "by default split vertical
"#set guifont=Hack\ Nerd\ Font\ Mono\ 11
"#
"#""" History settings
"#" to check parameter type
"#" :verbose set history
"#"  history=50
"#"          Last set from ~/.vimrc
"#"
"#" so, it's need to be set
"#set history=10000
"#"""
"#""" TABs
"#" dimension:
"#set tabstop=4
"#set softtabstop=4
"#set shiftwidth=4   " Number of space characters inserted for indentation (>>)
"#set expandtab " Insert space characters whenever the tab key is pressed
"#set smartindent "do clever autoindenting
"#" add point indicating indentation
"#"set list listchars=space:·,trail:·,extends:»,precedes:«,nbsp:×
"#"set smartcase "Override the 'ignorecase' option if the search pattern contains upper case characters.
"#"
"#"
"#set scrolloff=10 " when scrolling down, not wait to end to show new lines.
"#
"#"to continue the cursor in the line at the end of the screen...
"#set nowrap
"#
"#set cursorline " Highlight current cursor line
"#"set cursorcolumn " Highlight current cursor column line
"#set foldcolumn=1 " Place a width 1 margin on the left
"#
"#"to use after get use to UNDO
"#" set noswapfile
"#" set nobackup
"#
"#"UNDO
"#set undodir=~/.vim/undodir
"#set undofile
"#"incrementa search
"#set incsearch
"#
"#
"#" set the runtime path to include Vundle and initialize
"#set rtp+=~/.vim/bundle/Vundle.vim
"#call vundle#begin()
"#" alternatively, pass a path where Vundle should install plugins
"#"call vundle#begin('~/some/path/here')
"#
"#" let Vundle manage Vundle, required
"#" Plugin 'VundleVim/Vundle.vim'
"#
"#
"#" The following are examples of different formats supported.
"#" Keep Plugin commands between vundle#begin/end.
"#" plugin for Git repo
"#" Plugin 'tpope/vim-fugitive'
"#" Commands:
"#" :Git or :G
"#" :Git + {commit, rebase -i, diff, log, blame... etc}
"#
"#" plugin from http://vim-scripts.org/vim/scripts.html
"#"Plugin 'L9'
"#" Git plugin not hosted on GitHub
"#Plugin 'git://git.wincent.com/command-t.git'
"#" git repos on your local machine (i.e. when working on your own plugin)
"#"Plugin 'file:///home/gmarik/path/to/plugin'
"#" The sparkup vim script is in a subdirectory of this repo called vim.
"#" Pass the path to set the runtimepath properly.
"#"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"#" Install L9 and avoid a Naming conflict if you've already installed a
"#" different version somewhere else.
"#"Plugin 'ascenator/L9', {'name': 'newL9'}
"#
"#"KANIBAL"
"#" Give diff option on file swap present
"#Plugin 'chrisbra/recover.vim'
"#
"#" Instalar EMMET
"#Plugin 'mattn/emmet-vim'
"#"Redefine trigger key - remap the default <C-Y> leader:
"#"let g:user_emmet_leader_key='<C-Z>'
"#""Note that the trailing , still needs to be entered, so the new keymap would be <C-Z>,.
"#
"#Plugin 'amiorin/vim-fenced-code-blocks'
"#
"#" CSS Colors
"#Plugin 'ap/vim-css-color'
"#"g:cssColorVimDoNotMessMyUpdatetime "is used when updatetime value set by plugin (100ms) is interfering with your configuration.
"#"let g:cssColorVimDoNotMessMyUpdatetime = 1
"#
"#"Code completion
"#Plugin 'valloric/youcompleteme'
"#
"#" Markdown Syntax - Begin
"#" https://github.com/plasticboy/vim-markdown
"#"Plugin 'godlygeek/tabular'
"#" Plugin 'plasticboy/vim-markdown'
"#"disable the folding configuration:
"#"let g:vim_markdown_folding_disabled = 1
"#"In Vim's standard folding configuration.
"#" set [no]foldenable
"#"To fold in a style like python-mode, add the following to your .vimrc:
"#"let g:vim_markdown_folding_style_pythonic = 1
"#" Json, toml, yaml para Hugo, Jekyll
"#"let g:vim_markdown_json_frontmatter = 1
"#"let g:vim_markdown_toml_frontmatter = 1
"#"let g:vim_markdown_frontmatter = 1
"#" LaTeX math
"#" Used as $x^2$, $$x^2$$, escapable as \$x\$ and \$\$x\$\$.
"#"let g:vim_markdown_math = 1
"#" Markdown Syntax - End
"#
"#" Markdown Live Preview
"#Plugin 'shime/vim-livedown'
"#"Usage
"#" launch the Livedown server and preview your markdown file
"#" :LivedownPreview
"#"
"#" stop the Livedown server
"#" :LivedownKill
"#"
"#" launch/kill the Livedown server
"#" :LivedownToggle
"#"
"#" setting your own mapping
"#"
"#" nmap gm :LivedownToggle<CR>
"#" Configuration
"#"
"#" There are several configuration variables you can customize to suit your
"#" needs, with the following defaults.
"#"
"#" should markdown preview get shown automatically upon opening markdown
"#" buffer
"#let g:livedown_autorun = 0
"#" should the browser window pop-up upon previewing
"#let g:livedown_open = 1
"#" the port on which Livedown server will run
"#let g:livedown_port = 1337
"#" the browser to use
"#let g:livedown_browser = "firefox"
"#
"#"goyo.vim (고요)
"#"Distraction-free writing in Vim.
"#Plugin 'junegunn/goyo.vim'
"#
"#"Usage
"#"    :Goyo
"#"        Toggle Goyo
"#"    :Goyo [dimension]
"#"        Turn on or resize Goyo
"#"    :Goyo!
"#"        Turn Goyo off
"#"
"#""The window can be resized with the usual [count]<CTRL-W> + >, <, +, - keys, and <CTRL-W> + = will resize it back to the initial size.
"#"Dimension expression
"#"
"#"The expected format of a dimension expression is [WIDTH][XOFFSET][x[HEIGHT][YOFFSET]]. XOFFSET and YOFFSET should be prefixed by + or -. Each component can be given in percentage.
"#"
"#"" Width
"#"Goyo 120
"#"
"#"" Height
"#"Goyo x30
"#"
"#"" Both
"#"Goyo 120x30
"#"
"#"" In percentage
"#"Goyo 120x50%
"#"
"#"" With offsets
"#"Goyo 50%+25%x50%-25%
"#"
"#"Configuration
"#"    g:goyo_width (default: 80)
"#"    g:goyo_height (default: 85%)
"#"    g:goyo_linenr (default: 0)
"#
"#
"#"NERTTree
"#Plugin 'scrooloose/nerdtree'
"#Plugin 'Xuyuanp/nerdtree-git-plugin'
"#
"#Plugin 'ryanoasis/vim-devicons'
"#
"#"At start
"#autocmd StdinReadPre * let s:std_in=1
"#"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"#" Show hidden files
"#"let NERDTreeShowHidden=1
"#" color to icons
"#Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
"#" Highlight full name
"#let g:NERDTreeFileExtensionHighlightFullName = 1
"#let g:NERDTreeExactMatchHighlightFullName = 1
"#let g:NERDTreePatternMatchHighlightFullName = 1
"#" Highlight folders using exact match
"#let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
"#let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
"#
"#"Syntastic
"#"https://github.com/vim-syntastic/syntastic
"#Plugin 'scrooloose/syntastic'
"#set statusline+=%#warningmsg#
"#set statusline+=%{SyntasticStatuslineFlag()}
"#set statusline+=%*
"#
"#let g:syntastic_always_populate_loc_list = 1
"#let g:syntastic_auto_loc_list = 1
"#let g:syntastic_check_on_open = 1
"#let g:syntastic_check_on_wq = 1
"#"Add checkers
"#"let g:syntastic_<filetype>_checkers = ['<checker-name>','<checker-name2>']
"#" To check checkers run :SyntasticInfo
"#" To show enable/disable show all checkers revision (fallback at no errors by default)
"#let g:syntastic_aggregate_errors = 0
"#let g:syntastic_go_checkers = ['go']
"#let g:syntastic_python_checkers = ['pylint']
"#let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"#
"#"GOLANG
"#Plugin 'nsf/gocode'
"#
"#"Fuzzy search files
"#Plugin 'ctrlp.vim'
"#
"#" Python Black - Syntax check
"#" Commands and shortcuts:
"#"   :Black to format the entire file (ranges not supported);
"#"   :BlackUpgrade to upgrade Black inside the virtualenv;
"#"  :BlackVersion to get the current version of Black inside the virtualenv.
"#
"#" Configuration:
"#"  g:black_fast (defaults to 0)
"#"   g:black_linelength (defaults to 88)
"#"   g:black_skip_string_normalization (defaults to 0)
"#"   g:black_virtualenv (defaults to ~/.vim/black or ~/.local/share/nvim/black)
"#
"#"Plugin 'psf/black'
"#
"#"Jinja syntax
"#Plugin 'glench/vim-jinja2-syntax'
"#
"#
"#"Colorscheme
"#" Se debe corregir el path para que se aplique al inicio.
"#" → ln -s ~/vim/bundle/vim-colorschemes/colors colors
"#Plugin 'flazz/vim-colorschemes'
"#colorscheme gruvbox
"#""o en vim
"#":colorscheme molokai
"#"set highlight to bright yellow
"#hi Visual ctermfg=11 ctermbg=11 guifg=#0F1419 guibg=#FFEE99
"#
"#"Visual delimiter line
"#set colorcolumn=80
"#" Extra left column for linting
"#set signcolumn=yes
"#"highlight ColorColumn ctermbg=0 guibg=lightgrey
"#set background=dark
"#
"#" Enable true color
"#if exists('+termguicolors')
"#  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"#  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"#  set termguicolors
"#endif
"#
"#"make background transparent
"#hi Normal guibg=NONE ctermbg=NONE
"#
"#
"#"Set Colort for change themes
"#" F8      : to use next color scheme
"#" Shift-F8: to use previous
"#" Alt - F8: to use a random
"#Plugin 'felixhummel/setcolors.vim'
"#
"#" Overwrite color background to transparent
"#"highlight Normal guibg=NONE ctermbg=NONE
"#
"#"A light and configurable statusline/tabline plugin for Vim
"#Plugin 'itchyny/lightline.vim'
"#set laststatus=2
"#set noshowmode "get rid of original mode indicator.
"#"Color mode for lightline
"#"let g:lightline = { 'colorscheme': 'wombat', }
"#"set g:lightline = { 'colorscheme': 'OldHope',
"#"            \ 'inactive': {
"#"            \         'left': [ [ 'filename', 'modified' ] ],
"#"            \         'right': [ [ 'lineinfo' ], [ 'percent' ] ]
"#"            \   },
"#"            \  }
"#let g:lightline = {
"#            \ 'colorscheme': 'OldHope',
"#            \ 'active': {
"#            \   'left': [[ 'mode', 'paste' ], [ 'modified', 'filename' ] ],
"#            \   'right': [ [ 'lineinfo' ], [ 'percent' ],
"#            \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ]]
"#            \ },
"#            \ 'inactive': {
"#            \   'left': [ [ 'modified', 'filename' ] ],
"#            \   'right': [ [ 'lineinfo' ], [ 'percent' ],
"#            \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ]]
"#            \ },
"#            \ 'component': {
"#            \   'charvaluehex': '0x%B'
"#            \ },
"#            \ }
"#
"#" Add maktaba and bazel to the runtimepath.
"#" (The latter must be installed before it can be used.)
"#Plugin 'google/vim-maktaba'
"#Plugin 'bazelbuild/vim-bazel'
"#" editorconfig.org
"#Plugin 'editorconfig/editorconfig-vim'
"#" Peekaboo will show you the contents of the registers on the sidebar
"#" when you hit " or @ in normal mode or <CTRL-R> in insert mode.
"#Plugin 'junegunn/vim-peekaboo'
"#
"#" Autocompletion
"#Plugin 'codota/tabnine-vim'
"#
"#" All of your Plugins must be added before the following line
"#call vundle#end()            " required
"#filetype plugin indent on    " required
"#" To ignore plugin indent changes, instead use:
"#"filetype plugin on
"#"
"#" Brief help
"#" :PluginList       - lists configured plugins
"#" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"#" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"#" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"#"
"#" see :h vundle for more details or wiki for FAQ
"#" Put your non-Plugin stuff after this line
"#
"#" Set TAB dimesion formatting by language
"#" For Python
"#autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
"#" For YAML
"#autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab
"#autocmd FileType yml set tabstop=2|set shiftwidth=2|set expandtab
"#" for CSS
"#"autocmd Filetype css setlocal tabstop=4
"#
"#"turn off expandtab for editing makefiles
"#autocmd FileType make setlocal noexpandtab
"#
"#" Use clipboard as default register
"#"set clipboard=unnamed
"#set clipboard=unnamedplus
"#
"#" Sessions
"#" save always the current files to a ~/.vim/sessions/current.session
"#" (first close NERDTree because it fails)
"#autocmd VimLeave * NERDTreeClose
"#autocmd VimLeave * NERDTreeClose
"#autocmd VimLeave * NERDTreeClose
"#autocmd VimLeave * NERDTreeClose
"#autocmd VimLeave * NERDTreeClose
"#autocmd VimLeave * NERDTreeClose
"#autocmd VimLeave * NERDTreeClose
"#"autocmd VimLeave * mksession! ~/.vim/sessions/current.session
"#"Restore Session at start
"#"autocmd VimEnter * source ~/.vim/sessions/current.session
"#"autocmd VimEnter * NERDTree
"#
"#
"#" # HELP commands
"#"
"#" ## Split
"#" - Hotizontal Split
"#"   :sp
"#" - Vertical Split
"#"   :vs
"#" - Reverse Windows
"#"   <Ctrl+W>+r
"#"
"#" ## TABS
"#" :tabnew
"#" :tabner <file>
"#"
"#" ## SORT
"#" :%sort
"#"
"#" Sort in reverseEdit
"#" :%sort!
"#"
"#" Sort, removing duplicate linesEdit
"#" :%sort u
"#" Sort using the external Unix sort utility, respecting month-name orderEdit
"#" :%!sort -M
"#" ("respecting month-name order" means January < February < ... < December)
"#"
"#" Numeric sortEdit (this way, 100 doesn't precede 20 in the sort)
"#" :sort n
"#"
"#" Sort subsections independently, in this example sort numbers between "start" and "end" markersEdit
"#"
"#" Sort only specific lines using ranges Edit
"#" sort lines 296 to 349, inclusive
"#" :296,349sort
"#"
"#" #VIMDIFF
"#"
"#" vimdiff <file1> <file2>
"#" - having a split view
"#" :windo diffthis
"#" - Closing the diff
"#" :windo diffoff
"#"
"#" # Execute command
"#" after invoke with :! the % is an alias of the current file
"#" :! ./%
"#" :! wc %
"#"
"#" # Generate Sequence
"#"
"#"vector[0] = 1;       vector[0] = A;
"#"vector[0] = 1;       vector[1] = B;
"#"vector[0] = 1;  -->  vector[2] = C;
"#"vector[0] = 1;       vector[3] = D;
"#"vector[0] = 1;       vector[4] = E;
"#"
"#" 1.-Write the original line: A = mapping[0] Esc
"#" 2.-Yank line and put 25 copies of it below: yy25p
"#" 3.-Visually select the column containing the 0 char (block selection, using Ctrl-v), excluding the 0 from the 1st line (so you end up with a column containing the last 25 zeroes), then increment them with g Ctrl-a.
"#" 4.-Apply the same method for the column containing A.
"#" For letters it is needed here:
"#set nrformats+=hex,alpha
"#"
"#" # SYNTAX
"#" http://vimdoc.sourceforge.net/htmldoc/syntax.html
"#"
"#"
"#" "Tutorial"
"#" Navigation:
"#" h/j/k/l - Left/Down/Up/Right
"#" ^ / $ - move to the beginning/end of line
"#" I / A - move to the beginning/end of line and insert
"#" o / O - insert new line above/below current line and insert
"#"
"#" ( / ) - jump to the previous/next sentence
"#" { / } - jump to the previous/next paragraph
"#" [[ / ]] - jump previous/next section
"#" [] / ][ - jump to the end of the previous/next section
"#"
"#" ^E - scroll the window down
"#" ^Y - scroll the window up
"#" ^F - scroll down one page
"#" ^B - scroll up one page
"#" H - move cursor to the top of the window
"#" M - move cursor to the middle of the window
"#" L - move cursor to the bottom of the window
"#" gg - go to top of file
"#" G - go to bottom of file
"#"
"#" w - words
"#" b - word backward
"#" s - sentences
"#" p - paragraphs
"#" t - tags[^1]
"#"
"#" 10w - Move 10 words
"#" 10b - Move back 10 words
"#"
"#" a - all
"#" i - in
"#" t - 'til
"#" f - find forward
"#" F - find backward
"#" n - move to next find match
"#" N - move to previous find match
"#"
"#" Edits:
"#" x - delete character at cursor
"#" d - delete (also cut)
"#" c - change (delete, then place in insert mode)
"#" y - yank (copy)
"#" v - visually select
"#" dd / yy - delete/yank the current line
"#" D / C - delete/change until end of line
"#" r - replace the character under the cursor
"#" R - Replace mode
"#" ["x]yy - copy the current lines into the register x
"#"
"#" d5w - delete 5 words forwards
"#" c5w - delete 5 words forwards and enter insert mode
"#" d5b - delete 5 words backwards
"#" c5b - delete 5 words backwards and enter insert mode
"#"
"#" di( - delete inside parentesis
"#" ci( - delete inside parentesis and enter insert mode
"#" da( - delete inside parentesis and the parentesis
"#" ca( - delete inside parentesis, the parentesis and enter insert mode.
"#"
"#" dip - delete paragraph
"#" cip - delete paragraph and enter insert mode
"#"
"#" dis - delete sentence
"#" cis - delete sentence and enter insert mode
"#"
"#" dit - delete inside tag a
"#" dat - delete inside tag and tag
"#" cit - delete inside tag and enter insert mode
"#"
"#" dw - delete characters if a word from cursor forward
"#" diw - delete in word (the word I'm in)
"#" db - delete charaters if a word from cursor backwards
"#"
"#" d0 - delete to the beginning of the line
"#" d$ - delete to the end of the line
"#"
"#" dgg - delete to the beginning of the file
"#" dG - delete to the end of the file
"#"
"#" Special Insert:
"#" :r [filename] - Insert the file [filename] below the cursor.
"#" :r ![command] - Execute [command] and insert the output below the cursor.
"#"
"#" . - Repetition
"#"
"#" Record a Macro
"#"    q{register} - Record a macro
"#"    (do the things)
"#"    q
"#" Play a Macro
"#"    @{register}
"#" Play a Macro 23 times
"#"    23@{register}
"#"
"#" Show Registers
"#"    :registers
"#"
"#" "{register}p  - Paste a Register after current line
"#" "{register}P  - Paste a Register before current line
"#"
"#"  Marks - Bookmarks
"#" m{mark} - create a mark
"#" '{mark} - go to a mark
"#" :marks  - list marks
"#"
"#" set numbers
"#"     :set number
"#"
"#
"#
"#" Macros
"#"ilet @y='i```^M```^[ka^[<80><fd>a'
"#
"#
"#set exrc " Whenever you have an .vimrc on the folder, and open with "vim ." it will excecute it.
"#
"#nnoremap <silent> <leader><bar> :call ToggleIndentGuides()<cr>
"#
"#function! ToggleIndentGuides()
"#	if !exists('b:indentguides')
"#		if !&expandtab && &tabstop == &shiftwidth
"#			let b:indentguides = 'tabs'
"#			let b:indentguides_listopt = &l:list
"#			let b:indentguides_listcharsopt = &l:listchars
"#			exe 'setl listchars' . '+'[!&l:list] . '=tab:˙\  list'
"#		else
"#			let b:indentguides = 'spaces'
"#			let pos = range(1, &textwidth > 0 ? &textwidth : 80, &shiftwidth)
"#			call map(pos, '"\\%" . v:val . "v"')
"#			let pat = '\%(\_^ *\)\@<=\%(' . join(pos, '\|') . '\) '
"#			let b:indentguides_match = matchadd('ColorColumn', pat)
"#		endif
"#	else
"#		if b:indentguides == 'tabs'
"#			let &l:list = b:indentguides_listopt
"#			let &l:listchars = b:indentguides_listcharsopt
"#			unlet b:indentguides_listopt b:indentguides_listcharsopt
"#		else
"#			call matchdelete(b:indentguides_match)
"#			unlet b:indentguides_match
"#		endif
"#		unlet b:indentguides
"#	endif
"#endfunction
"#
"#call ToggleIndentGuides()
