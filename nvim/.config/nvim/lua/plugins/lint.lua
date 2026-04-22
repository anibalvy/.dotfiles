return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            markdown = { "markdownlint-cli2" },
        }

        -- Clonamos la configuración por defecto para no romper nada
        local mlint = lint.linters["markdownlint-cli2"]

        -- Añadimos los argumentos para deshabilitar MD013
        mlint.args = {
            "--disable",
            "MD013",
            "--", -- Este guion doble es importante para separar flags de archivos
        }

        -- Autocomando para que funcione al guardar/leer
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
