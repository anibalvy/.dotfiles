require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,
        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        media_files = {
--          -- filetypes whitelist
--          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
--          filetypes = {"png", "webp", "jpg", "jpeg"},
--          find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}

--require("telescope").load_extension("git_worktree")
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('media_files')
