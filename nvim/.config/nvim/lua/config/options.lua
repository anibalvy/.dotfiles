-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true -- Ajuste visual de línea (sin romper el archivo)
        vim.opt_local.linebreak = true -- Rompe por palabras, no por letras
        vim.opt_local.textwidth = 0 -- DESACTIVA el salto de línea automático
        vim.opt_local.formatoptions:remove("t") -- Evita que auto-formatee el texto
    end,
})
