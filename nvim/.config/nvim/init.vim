
"Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Neovim Tree-Sitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" Markdown Live Preview
Plug 'shime/vim-livedown'

"goyo.vim (고요)
"Distraction-free writing in Vim.
Plug 'junegunn/goyo.vim'

" lualine (replacing lighline
Plug 'hoob3rt/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'



" Initialize plugin system
call plug#end()

nnoremap <silent> Q <nop>


