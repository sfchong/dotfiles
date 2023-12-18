local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        formatting.prettier.with({
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less",
                "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars"}
        }),
        diagnostics.eslint_d,
        formatting.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        formatting.gofmt,
    },
    on_attach = function(client, bufnr)
        -- auto-format on save
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})

vim.api.nvim_create_user_command('SaveWithoutFormatting',
    function()
        vim.cmd[[noautocmd write]]
    end,
    {}
)

