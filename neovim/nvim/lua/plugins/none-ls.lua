return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                -- null_ls.builtins.diagnostics.mypy,
                -- null_ls.builtins.formatting.goimports_reviser,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.diagnostics.eslint,
                null_ls.builtins.formatting.prettier.with({
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "css",
                        "scss",
                        "html",
                        "json",
                        "vue",
                    },
                }),
            },
        })
        vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, {})
    end,
}
