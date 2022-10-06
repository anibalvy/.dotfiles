-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall

--require('nvim')

--require('nvim-treesitter.configs').setup {
require'nvim-treesitter.configs'.setup {
  ensure_installed = {all},
--  ignore_install = {},
  modules = {
    highlight = {
      additional_vim_regex_highlighting = true,
      custom_captures = {
          ["keyword"] = "TSString",
      },
      disable = { "markdown" },
      enable = true,
      loaded = true,
      --module_path = "nvim-treesitter.highlight"
    },
    incremental_selection = {
      disable = {},
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_decremental = "grm",
        node_incremental = "grn",
        scope_incremental = "grc"
      },
      --module_path = "nvim-treesitter.incremental_selection"
    },
    indent = {
      disable = {},
      enable = true,
      --module_path = "nvim-treesitter.indent"
    },
    playground = {
      disable = {},
      enable = true,
      keybindings = {
        focus_language = "f",
        goto_node = "<cr>",
        show_help = "?",
        toggle_anonymous_nodes = "a",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_language_display = "I",
        toggle_query_editor = "o",
        unfocus_language = "F",
        update = "R"
      },
      --module_path = "nvim-treesitter-playground.internal",
      persist_queries = false,
      updatetime = 25
    },
    query_linter = {
      disable = {},
      enable = true,
      lint_events = { "BufWrite", "CursorHold" },
     -- module_path = "nvim-treesitter-playground.query_linter",
      use_virtual_text = true
    }
  },
  update_strategy = "lockfile"
}

