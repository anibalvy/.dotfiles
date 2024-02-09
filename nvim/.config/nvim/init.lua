--[[
=====================================================================
========================= NVIM CONFIG ===============================
=====================================================================

Started from Kickstart.nvim as a configuration template .
  a Lua guide: https://learnxinyminutes.com/docs/lua/
  nvim Lua:
  - `:help lua-guide`
  - https://neovim.io/doc/user/lua-guide.html
--]]

-- Set <space> as the leader key. See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim - `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
--  You can configure plugins using the `config` key.
--  You can also configure plugins after the setup call, as they will be available in your neovim runtime.
require('lazy').setup({
    -- NOTE: First, some plugins that don't require any configuration
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

    -- NOTE: This is where your plugins related to LSP can be installed. The configuration is done below. Search for lspconfig to find it below.
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} }, -- Useful status updates for LSP. NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            'folke/neodev.nvim',                                -- Additional lua configuration, makes nvim stuff amazing!
        },
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',         -- Adds LSP completion capabilities
            'rafamadriz/friendly-snippets', -- Adds a number of user-friendly snippets
            'hrsh7th/cmp-emoji',
            {'roobert/tailwindcss-colorizer-cmp.nvim', config = true},
            'amarakon/nvim-cmp-fonts',
        },
        -- opts = function (_, opts)
        --     local format_kinds = opts.formatting.format
        --     opts.formatting.format = function(entry, item)
        --         format_kinds(entry, item)
        --         return require("tailwindcss-colorizer-cmp").formatter(entry, item)
        --     end
        -- end,
        -- opts = function(_, opts)
        --     local cmp = require("cmp")
        --     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
        --   end,
    },

    -- Useful plugin to show you keybinds. show with <leader>
    { 'folke/which-key.nvim',  opts = {} },
    {
      "aurum77/live-server.nvim",
        run = function()
          require"live_server.util".install()
        end,
        cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
      },

    -- gitsigns
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = 'Preview git hunk' })

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, ']c', function()
                    if vim.wo.diff then
                        return ']c'
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
                vim.keymap.set({ 'n', 'v' }, '[c', function()
                    if vim.wo.diff then
                        return '[c'
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
            end,
        },
    },
    {'joerdav/templ.vim'},

    -- Theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "storm",
            light_style = "night",
            transparent = true,
            terminal_colors = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
            sidebars = { "qf", "help", "bufferline" },
            lualine_bold = true,
            -- dim_inactive = true,
        },
        -- config = function ()
        --     vim.cmd.colorscheme 'tokyonight'
        -- end,
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                --theme = 'onedark',
                theme = 'tokyonight',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    {
        'nvim-tree/nvim-web-devicons',
        version = "*",
    },

    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
    },

    {
        'nacro90/numb.nvim',
        version = "*",
        config = function()
            require 'numb'.setup({
                show_numbers = true,          -- Enable 'number' for the window while peeking
                show_cursorline = true,       -- Enable 'cursorline' for the window while peeking
                hide_relativenumbers = false, -- Enable turning off 'relativenumber' for the window while peeking
                number_only = false,          -- Peek only when the command is only a number instead of when it starts with a number
                centered_peeking = true,      -- Peeked line will be centered relative to window
            })
        end,
    },
    -- pick up where you left off
    {
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = {
                    "gitcommit", "gitrebase", "svn", "hgcommit",
                },
                lastplace_open_folds = true,
            })
        end,
    },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    -- TODO highlight
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      -- opts = {
      --   -- your configuration comes here
      --   -- or leave it empty to use the default settings
      --   -- refer to the configuration section below
      -- }
    },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            {
                "windwp/nvim-ts-autotag",
                config = function()
                    require("nvim-ts-autotag").setup()
                end,
            },
            'HiPhish/nvim-ts-rainbow2',
        },
        build = ':TSUpdate',
    },

    -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
    --       These are some example plugins that I've included in the kickstart repository.
    --       Uncomment any of the lines below to enable them.
    -- require 'kickstart.plugins.autoformat',
    -- require 'kickstart.plugins.debug',

    -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
    --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
    --    up-to-date with whatever is in the kickstart repo.
    --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
    --
    --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
    -- { import = 'custom.plugins' },
    -- neoTree
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            {
                's1n7ax/nvim-window-picker',
                version = '2.*',
                config = function()
                    require 'window-picker'.setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal', "quickfix" },
                            },
                        },
                    })
                end,
            },

        },
        config = function()
            require 'neo-tree'.setup {
                close_if_last_window = true,
                window = {
                    width = 30,
                },
                buffers = {
                    follow_current_file = { enabled = true },
                },
                default_component_configs = {
                    file_size = {
                        enabled = true,
                        required_width = 64, -- min width of window required to show this column
                    },
                },
                filesystem = {
                    filtered_items = {
                        visible = false, -- when true, they will just be displayed differently than normal items
                        show_hidden_count = true,
                        -- hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_hidden = false, -- only works on Windows for hidden files/directories
                    },
                },


            }
        end,
    },

    {
        "windwp/nvim-autopairs",
        -- Optional dependency
        dependencies = { 'hrsh7th/nvim-cmp' },
        config = function()
            require("nvim-autopairs").setup {}
            -- If you want to automatically add `(` after selecting a function or method
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end,
    },
    -- The interactive scratchpad
    {
        "metakirby5/codi.vim",
        cmd = "Codi",
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function (_, opts)
            require("gopher").setup(opts)
        end,
        build = function ()
           vim.cmd [[silent! GoInstallDeps]]
        end,
    },

    -- Terminal
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            active = true,
            on_config_done = nil,
            open_mapping = [[<c-\>]], -- use CTRL + "\" to toggle
            -- size can be a number or function which is passed the current terminal
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            hide_numbers = true, -- hide the number column in toggleterm buffers
            shade_filetypes = {},
            autochdir = false,   -- when neovim changes it current directory the terminal will change it's own when next it's opened
            -- highlights = {
            --   -- highlights which map to a highlight group name and a table of it's values
            --   -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
            --   Normal = {
            --     guibg = "NONE", --"<VALUE-HERE>",
            --   },
            --   NormalFloat = {
            --     link = 'Normal'
            --   },
            --   FloatBorder = {
            --     guifg = "NONE", --"<VALUE-HERE>",
            --     guibg = "NONE", --"<VALUE-HERE>",
            --   },
            -- },
            shade_terminals = true,   -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
            shading_factor = 2,       --'<number>', -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
            -- start_in_insert = true,
            insert_mappings = true,   -- whether or not the open mapping applies in insert mode
            terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
            -- persist_size = true,
            -- persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
            direction = 'float',  -- 'vertical' | 'horizontal' | 'tab' | 'float',
            close_on_exit = true, -- close the terminal window when the process exits
            -- Change the default shell. Can be a string or a function returning a string
            -- shell = vim.o.shell,
            auto_scroll = true, -- automatically scroll to the bottom on terminal output
            -- This field is only relevant if direction is set to 'float'
            float_opts = {
                -- The border key is *almost* the same as 'nvim_open_win'
                -- see :h nvim_open_win for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = 'curved', --'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                -- -- like `size`, width and height can be a number or function which is passed the current terminal
                -- width = <value>,
                -- height = <value>,
                winblend = 0,
                -- zindex = <value>,
            },
            winbar = {
                enabled = false,
                name_formatter = function(term) --  term: Terminal
                    return term.name
                end
            },
        },
        -- cmd = {
        --     "ToggleTerm",
        --     "TermExec",
        --     "ToggleTermToggleAll",
        --     "ToggleTermSendCurrentLine",
        --     "ToggleTermSendVisualLines",
        --     "ToggleTermSendVisualSelection",
        -- },
    },

}, {})

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

vim.o.hlsearch = false                 -- Set highlight on search
vim.wo.number = true                   -- Make line numbers default
vim.wo.relativenumber = true           -- Make line numbers relative
vim.o.mouse = 'a'                      -- Enable mouse mode
vim.o.clipboard = 'unnamedplus'        -- Sync clipboard between OS and Neovim. See `:help 'clipboard'`
vim.o.breakindent = true               -- Enable break indent
-- vim.o.undodir = undodir                          -- set an undo directory
vim.o.undofile = true                  -- Save undo history
vim.o.ignorecase = true                -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true                 --
vim.wo.signcolumn = 'yes'              -- Keep signcolumn on by default
vim.o.updatetime = 250                 -- Decrease update time
vim.o.timeoutlen = 300                 -- Decrease timeout time
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.termguicolors = true             -- NOTE: You should make sure your terminal supports this
vim.o.wrap = false                     -- no wrap
vim.o.smartindent = true               -- do clever autoindenting
vim.o.tabstop = 4                      -- wh  adsf
vim.o.softtabstop = 4
vim.o.shiftwidth = 4                   -- Number of space characters inserted for indentation (>>)
vim.o.expandtab = true                 -- Insert space characters whenever the tab key is pressed
vim.o.scrolloff = 10                   -- window scroll before bottom or top
vim.o.sidescrolloff = 5                -- window scroll before getting to the side
vim.o.signcolumn = "yes"               -- always show the sign column otherwise it would shift the text each time
vim.o.splitbelow = true                -- force all horizontal splits to go below current window
vim.o.splitright = true                -- force all vertical splits to go to the right of current window
vim.o.cursorline = true                -- highlight current line
vim.o.showmode = false                 -- we don't need to see things like -- INSERT -- anymore
-- vim.o.cmdheight = 1                              -- more space in the neovim command line for displaying messages
vim.o.spell = true                     -- activate spelling
vim.o.spelllang = "en,es"              -- set spelling language hola
-- vim.o.backup = false                          -- creates a backup file
-- vim.o.fileencoding = "utf-8"                  -- the encoding written to a file
-- vim.o.foldmethod = "manual"                   -- folding, set to "expr" for treesitter based folding
-- vim.o.title = true                            -- set the title of window to the value of the titlestring
-- vim.o.titlestring = "%<%F%=%l/%L - nvim"      -- what the title of the window will be set to
-- vim.o.conceallevel = 0                        -- so that `` is visible in markdown files
-- vim.o.foldexpr = ""                           -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
-- vim.o.guifont = "monospace:h17"               -- the font used in graphical neovim applications
-- vim.o.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- vim.o.shadafile = join_paths(get_cache_dir()  -- "lvim.shada"),
-- vim.o.ruler = false
-- vim.o.laststatus = 3


-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- insert_mode = "i",
-- normal_mode = "n",
-- term_mode = "t",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- command_mode = "c",
-- operator_pending_mode = "o",
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>f', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- bufferline maps
vim.keymap.set('n', "<S-l>", ":BufferLineCycleNext<CR>", { desc = 'Go next TAB' })
vim.keymap.set('n', "<S-h>", ":BufferLineCyclePrev<CR>", { desc = 'Go previous TAB' })

-- neoTree
vim.keymap.set('n', '<leader>e', ":Neotree toggle<CR>", { desc = 'Open/Close NeoTree' })

-- no insert mode on new line
vim.keymap.set('n', "<Leader>o", " o<ESC>", { desc = 'add space below' }) -- insert line DOWN and not enter to insert mode
vim.keymap.set('n', "<Leader>O", " O<ESC>", { desc = 'add space up' })    -- insert line UP   and not enter to insert mode

-- Better window movements
vim.keymap.set('n', "<C-h>", "<C-w>h", { desc = 'Move left window' })
vim.keymap.set('n', "<C-j>", "<C-w>j", { desc = 'Move down window' })
vim.keymap.set('n', "<C-k>", "<C-w>k", { desc = 'Move upper window' })
vim.keymap.set('n', "<C-l>", "<C-w>l", { desc = 'Move right window' })

-- Resize with arrows
vim.keymap.set('n', "<A-j>", ":resize +3<CR>", { desc = 'Resize up window' })
vim.keymap.set('n', "<A-k>", ":resize -3<CR>", { desc = 'Resize down window' })
vim.keymap.set('n', "<A-h>", ":vertical resize -2<CR>", { desc = 'Resize down horizontally window' })
vim.keymap.set('n', "<A-l>", ":vertical resize +2<CR>", { desc = 'Resize up horizontally window' })

-- Move current line / block with Alt-j/k a la vscode.
vim.keymap.set('n', "<A-j>", ":m .+1<CR>==", { desc = 'Move current line up' })
vim.keymap.set('n', "<A-k>", ":m .-2<CR>==", { desc = 'Move current line down' })
vim.keymap.set('i', "<A-j>", "<ESC>:m .+1<CR>==gi", { desc = 'Move current line up' })
vim.keymap.set('i', "<A-k>", "<ESC>:m .-2<CR>==gi", { desc = 'Move current line down' })
vim.keymap.set('x', "<A-j>", ":m '>+1<CR>gv-gv", { desc = 'Move current line up' })
vim.keymap.set('x', "<A-k>", ":m '<-2<CR>gv-gv", { desc = 'Move current line down' })

-- Better indenting
vim.keymap.set('v', "<", "<gv", { desc = 'indent line to left' })
vim.keymap.set('v', ">", ">gv", { desc = 'indent line to right' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- AVY - call remove trailing spaces function
-- AVY - remove trailing spaces function
local function trim_trailing_whitespaces()
    local view = vim.fn.winsaveview()
    vim.cmd [[keeppatterns %s/\s\+$//e]]
    if view ~= nil then
        vim.fn.winrestview(view)
    end
end

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = trim_trailing_whitespaces
})


-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
    -- Use the current buffer's path as the starting point for the git search
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_dir
    local cwd = vim.fn.getcwd()
    -- If the buffer is not associated with a file, return nil
    if current_file == "" then
        current_dir = cwd
    else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ":h")
    end

    -- Find the Git root directory from the current file's path
    local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
    if vim.v.shell_error ~= 0 then
        print("Not a git repository. Searching on current working directory")
        return cwd
    end
    return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
    local git_root = find_git_root()
    if git_root then
        require('telescope.builtin').live_grep({
            search_dirs = { git_root },
        })
    end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>\\', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })


vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
    require 'nvim-treesitter.configs'.setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = {
            'c',
            'cpp',
            'go',
            'lua',
            'python',
            'rust',
            'templ',
            'tsx',
            'javascript',
            'typescript',
            'vimdoc',
            'vim',
            'terraform',
            'bash'
        },
        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = true,

        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-space>',
                node_incremental = '<c-space>',
                scope_incremental = '<c-s>',
                node_decremental = '<M-space>',
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    [']m'] = '@function.outer',
                    [']]'] = '@class.outer',
                },
                goto_next_end = {
                    [']M'] = '@function.outer',
                    [']['] = '@class.outer',
                },
                goto_previous_start = {
                    ['[m'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
                goto_previous_end = {
                    ['[M'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ['<leader>a'] = '@parameter.inner',
                },
                swap_previous = {
                    ['<leader>A'] = '@parameter.inner',
                },
            },
        },
        rainbow = {
            enable = true,
            disable = {},                                     -- 'jsx', 'cpp' }, -- list of languages you want to disable the plugin for
            query = 'rainbow-parens',                         -- Which query to use for finding delimiters
            strategy = require('ts-rainbow').strategy.global, -- Highlight the entire buffer all at once
        }
    }
end, 0)

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

-- document existing key chains
require('which-key').register {
    ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
    ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
    ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
    ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
    ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
    ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
}

-- mason-lspconfig requires that these setup functions are called in this order before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
    -- clangd = {},
    gopls = {
        gopls = {
            usePlaceholders = true
        },
    },
    templ = {
        filetypes = { 'templ'},
        templ = {
            usePlaceholders = true
        },
    },
    -- pyright = {},
    -- rust_analyzer = {},
    -- tsserver = {},
    -- html = { filetypes = { 'html', 'twig', 'hbs'} },
    tailwindcss = {
        filetypes = { 'templ', 'html'},
        init_options = {
            userLanguages = {
                templ = "html"
            }
        }
    },

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },

    emmet_ls = {
        filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "templ", "vue" }
    }
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end,
}

local icons = {
    Array = " ",
    Boolean = " ",
    Class = " ",
    Color = "🎨 ", -- 
    Constant = " ",
    Constructor = " ",
    Copilot = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = " ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = " ",
    Number = " ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = "",
  kind = {
    Array = " ",
    Boolean = " ",
    Class = " ",
    Color = "🎨 ", -- 
    Constant = " ",
    Constructor = " ",
    Copilot = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = " ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = " ",
    Number = " ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = "",
  },
  git = {
    LineAdded = "",
    LineModified = "",
    LineRemoved = "",
    FileDeleted = "",
    FileIgnored = "◌",
    FileRenamed = "",
    FileStaged = "S",
    FileUnmerged = "",
    FileUnstaged = "",
    FileUntracked = "U",
    Diff = "",
    Repo = "",
    Octoface = "",
    Branch = "",
  },
  ui = {
    ArrowCircleDown = "",
    ArrowCircleLeft = "",
    ArrowCircleRight = "",
    ArrowCircleUp = "",
    BoldArrowDown = "",
    BoldArrowLeft = "",
    BoldArrowRight = "",
    BoldArrowUp = "",
    BoldClose = "",
    BoldDividerLeft = "",
    BoldDividerRight = "",
    BoldLineLeft = "▎",
    BookMark = "",
    BoxChecked = "",
    Bug = "",
    Stacks = "",
    Scopes = "",
    Watches = "",
    DebugConsole = "",
    Calendar = "",
    Check = "",
    ChevronRight = ">",
    ChevronShortDown = "",
    ChevronShortLeft = "",
    ChevronShortRight = "",
    ChevronShortUp = "",
    Circle = "",
    Close = "",
    CloudDownload = "",
    Code = "",
    Comment = "",
    Dashboard = "",
    DividerLeft = "",
    DividerRight = "",
    DoubleChevronRight = "»",
    Ellipsis = "",
    EmptyFolder = "",
    EmptyFolderOpen = "",
    File = "",
    FileSymlink = "",
    Files = "",
    FindFile = "",
    FindText = "",
    Fire = "",
    Folder = "",
    FolderOpen = "",
    FolderSymlink = "",
    Forward = "",
    Gear = "",
    History = "",
    Lightbulb = "",
    LineLeft = "▏",
    LineMiddle = "│",
    List = "",
    Lock = "",
    NewFile = "",
    Note = "",
    Package = "",
    Pencil = "✏️",
    Plus = "",
    Project = "",
    Search = "",
    SignIn = "",
    SignOut = "",
    Tab = "",
    Table = "",
    Target = "",
    Telescope = "",
    Text = "",
    Tree = "",
    Triangle = "契",
    TriangleShortArrowDown = "",
    TriangleShortArrowLeft = "",
    TriangleShortArrowRight = "",
    TriangleShortArrowUp = "",
  },
  diagnostics = {
    BoldError = "",
    Error = "",
    BoldWarning = "",
    Warning = "",
    BoldInformation = "",
    Information = "",
    BoldQuestion = "",
    Question = "",
    BoldHint = "",
    Hint = "",
    Debug = "",
    Trace = "✎",
  },
  misc = {
    Robot = "ﮧ",
    Squirrel = "",
    Tag = "",
    Watch = "",
    Smiley = "",
    Package = "",
    CircuitBoard = "",
  },
  dap = {
    Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
    Breakpoint = " ",
    BreakpointCondition = " ",
    BreakpointRejected = { " ", "DiagnosticError" },
    LogPoint = ".>",
  },
  source = {
        nvim_lsp = '🚀',
        luasnip = '🔎',
        fonts = '',
    }
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'emoji' },
        -- { name = "fonts", option = { space_filter = "-" } },
    },
    -- formatting = {
    --     format = require( "tailwindcss-colorizer-cmp").formatter,
    -- },
    -- formatting = function (_, formatting)
    --     local format_kinds = formatting.format
    --     formatting.format = function(entry, item)
    --             format_kinds(entry, item)
    --             return require("tailwindcss-colorizer-cmp").formatter(entry, item)
    --     end
    -- end,
    -- formatting = {
    --     format = function (_, format)
    --         local format_kinds = format
    --         format = function(entry, item)
    --                 format_kinds(entry, item)
    --                 return require("tailwindcss-colorizer-cmp").formatter(entry, item)
    --         end
    --     end,
    -- }
    -- working
    formatting = {
        format = function (entry, vim_item) --, sources)
            local kind = vim_item.kind --> Class, variables,method...
            local source = entry.source.name
            vim_item.kind = ( icons.kind[kind] or "?") .. " " .. kind
            vim_item.menu = "[" .. (icons.source[source] or "?") .. "]" -- .. source
            return require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
            -- return vim_item

        end
    }
}

-- [[ set colorscheme ]]
vim.cmd [[colorscheme tokyonight]]

-- [[ Configure bufferline]]
require("bufferline").setup {
    options = {
        -- mode = "buffers", -- set to "tabs" to only show tabpages instead
        separator_style = "slant",    -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        show_duplicate_prefix = true, -- true | false, -- whether to show duplicate buffer prefix
        offsets = {
            --{
            --    filetype = "NvimTree",
            --    text = "Explorer" , -- "File Explorer" | function ,
            --    text_align = "center", --"left" | "center" | "right"
            --    separator = true
            --},
            {
                filetype = "neo-tree",           --"neo-tree",
                text = "Neo-Tree File Explorer", -- "File Explorer" | function ,
                text_align = "center",           --"left" | "center" | "right"
                separator = true
            }
        },

    },

}

-- [[ comment ]]
require('Comment').setup({
    ignore = '^$',
    toggler = {
        line = '<leader>/',
        block = '<leader>bc',
    },
    opleader = {
        line = '<leader>/', -- to work in visual mode
        block = '<leader>b',
    },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
