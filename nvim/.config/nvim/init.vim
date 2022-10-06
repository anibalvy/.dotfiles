
"Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" To disable a Plugin temporarily
" Plug 'foo/bar', { 'on': [] }

" Theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" formatter
" Requirement: pip install black
" check https://black.readthedocs.io
Plug 'ambv/black'

" Neovim LSP
Plug 'neovim/nvim-lspconfig'
" A completion engine plugin: nvim-cmp
Plug 'hrsh7th/nvim-cmp'
" Install snippet engine (This example installs [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip))
" Install the buffer completion source
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
"Plug 'hrsh7th/vim-vsnip'
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'tamago324/cmp-zsh'
Plug 'L3MON4D3/LuaSnip'  " Snippets plugin
Plug 'tzachar/cmp-tabnine'

Plug 'glepnir/lspsaga.nvim'

" Neovim Tree-Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

" prettier
Plug 'sbdchd/neoformat'

Plug 'mbbill/undotree'

" Markdown Live Preview
Plug 'shime/vim-livedown'

"goyo.vim (고요)
"Distraction-free writing in Vim.
Plug 'junegunn/goyo.vim'

" lualine (replacing lighline)
Plug 'hoob3rt/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

"  fades your inactive buffers and preserves syntax highlighting!!
"Plug 'TaDaa/vimade'

" Initialize plugin system
call plug#end()

nnoremap <silent> Q <nop>

let mapleader = " "

" Add aliases for write
command! W w

" call configs
lua require("KANIBAL")

" setup python version for nvim
let g:python_host_prog="~/.pyenv-old/versions/2.7.16/bin/python"
let g:python3_host_prog='~/.pyenv/versions/3.8.8/bin/python'

" function to delete end white spaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Define the autocmd group name for the following ":autocmd" commands
augroup KANIBAL
    "Autocommands -- like a Event listener
    "next line because when sourcing, this group gets rebuild
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    "BufWrite or BufWritePre is an event that is triggered Before writing the whole buffer to a file.
augroup END

" Will flash highlighted piece
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
augroup END
