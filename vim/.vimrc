" edit on .dotfiles/.vimrc 
set nocompatible              " be iMproved, required
filetype off                  " required



""" History settings
" to check parameter type
" :verbose set history
"  history=50
"          Last set from ~/.vimrc 
"
" so, it's need to be set
set history=10000
"""
""" TABs 
" dimension:
set tabstop=4 "set to 4 spaces.
":set  tabstop=4
" TAB dimesion for a particular file type like CSS here.
"autocmd Filetype css setlocal tabstop=4

" Insert space characters whenever the tab key is pressed
:set expandtab
" Number of space characters inserted for indentation
:set shiftwidth=4
" For Python
"autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

"turn off expandtab for editing makefiles
autocmd FileType make setlocal noexpandtab


" # HELP commands
"
" ## Split
" - Hotizontal Split
"   :sp
" - Vertical Split
"   :vs
" - Reverse Windows
"   <Ctrl+W>+r
"
" ## TABS
" :tabnew
" :tabner <file>
"
" ## SORT
" :%sort
"
" Sort in reverseEdit
" :%sort!
"
" Sort, removing duplicate linesEdit
" :%sort u
" Sort using the external Unix sort utility, respecting month-name orderEdit
" :%!sort -M
" ("respecting month-name order" means January < February < ... < December)
"
" Numeric sortEdit (this way, 100 doesn't precede 20 in the sort)
" :sort n
"
" Sort subsections independently, in this example sort numbers between "start" and "end" markersEdit
"
" Sort only specific lines using ranges Edit
" sort lines 296 to 349, inclusive
" :296,349sort
"
" #VIMDIFF
"
" vimdiff <file1> <file2>
" - having a split view
" :windo diffthis
" - Closing the diff
" :windo diffoff
"
" # Execute command
" after invoke with :! the % is an alias of the current file
" :! ./%
" :! wc %
" 
" # Generate Sequence
" 
"vector[0] = 1;       vector[0] = A;
"vector[0] = 1;       vector[1] = B;
"vector[0] = 1;  -->  vector[2] = C;
"vector[0] = 1;       vector[3] = D;
"vector[0] = 1;       vector[4] = E;
"
" 1.-Write the original line: A = mapping[0] Esc
" 2.-Yank line and put 25 copies of it below: yy25p
" 3.-Visually select the column containing the 0 char (block selection, using Ctrl-v), excluding the 0 from the 1st line (so you end up with a column containing the last 25 zeroes), then increment them with g Ctrl-a.
" 4.-Apply the same method for the column containing A.
" For letters it is needed here:
set nrformats+=hex,alpha
"
" # SYNTAX
" http://vimdoc.sourceforge.net/htmldoc/syntax.html
"
"
" "Tutorial"
" Navigation:
" h/j/k/l - Left/Down/Up/Right
" ^ / $ - move to the beginning/end of line
" I / A - move to the beginning/end of line and insert
" o / O - insert new line above/below current line and insert
"
" ( / ) - jump to the previous/next sentence
" { / } - jump to the previous/next paragraph
" [[ / ]] - jump previous/next section
" [] / ][ - jump to the end of the previous/next section
"
" ^E - scroll the window down
" ^Y - scroll the window up
" ^F - scroll down one page
" ^B - scroll up one page
" H - move cursor to the top of the window
" M - move cursor to the middle of the window
" L - move cursor to the bottom of the window
" gg - go to top of file
" G - go to bottom of file
"
" w - words
" b - word backward
" s - sentences
" p - paragraphs
" t - tags[^1]
"
" 10w - Move 10 words
" 10b - Move back 10 words
" 
" a - all
" i - in
" t - 'til
" f - find forward
" F - find backward
" n - move to next find match
" N - move to previous find match
"
" Edits:
" x - delete character at cursor
" d - delete (also cut)
" c - change (delete, then place in insert mode)
" y - yank (copy)
" v - visually select
" dd / yy - delete/yank the current line
" D / C - delete/change until end of line
" r - replace the character under the cursor
" R - Replace mode
" ["x]yy - copy the current lines into the register x
"
" d5w - delete 5 words forwards
" c5w - delete 5 words forwards and enter insert mode
" d5b - delete 5 words backwards
" c5b - delete 5 words backwards and enter insert mode
"
" di( - delete inside parentesis
" ci( - delete inside parentesis and enter insert mode
" da( - delete inside parentesis and the parentesis
" ca( - delete inside parentesis, the parentesis and enter insert mode.
"
" dip - delete paragraph
" cip - delete paragraph and enter insert mode
" 
" dis - delete sentence
" cis - delete sentence and enter insert mode
" 
" dit - delete inside tag a
" dat - delete inside tag and tag 
" cit - delete inside tag and enter insert mode
"
" dw - delete characters if a word from cursor forward
" diw - delete all word
" db - delete charaters if a word from cursor backwards
" 
" d0 - delete to the beginning of the line
" d$ - delete to the end of the line
"
" dgg - delete to the beginning of the file
" dG - delete to the end of the file
"
" Special Insert:
" :r [filename] - Insert the file [filename] below the cursor.
" :r ![command] - Execute [command] and insert the output below the cursor.
"
"
"
" . - Repetition
"
" Record a Macro
"    q{register} - Record a macro
"    (do the things)
"    q
" Play a Macro
"    @{register}
" Play a Macro 23 times
"    23@{register}
"  
" Show Registers
"    :registers
"
" 
" "{reister}p  - Paste a Register after current line
" "{reister}P  - Paste a Register before current line
" 
"  Marks - Bookmarks
" m{mark} - create a mark
" '{mark} - go to a mark
" :marks  - list marks
"
" set numbers
"     :set number
"
