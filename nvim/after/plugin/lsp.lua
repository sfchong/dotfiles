local status_cmp, cmp = pcall(require, 'cmp_nvim_lsp')
local status_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
local status_lspconfig, lspconfig = pcall(require, 'lspconfig')
local status_telescope, telescope = pcall(require, 'telescope.builtin')

if (not status_cmp or not status_mason_lspconfig or not status_lspconfig or not status_telescope) then return end

local map = require("utils").map

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    map('n', 'gd', function() telescope.lsp_definitions() end, 'Go to definition', bufopts)
    map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration', bufopts)
    map('n', 'gt', function() telescope.lsp_type_definitions() end, 'Go to type definition', bufopts)
    map('n', 'gr', function() telescope.lsp_references() end, 'Go to reference', bufopts)
    map('n', 'gI', function() telescope.lsp_implementations() end, 'Go to implementation', bufopts)
    map('n', 'K', vim.lsp.buf.hover, 'Hover', bufopts)
    map('i', '<C-k>', vim.lsp.buf.signature_help, 'Display function signature', bufopts)
    map('n', '<leader>cr', vim.lsp.buf.rename, 'Rename', bufopts)
    map('n', '<leader>.', vim.lsp.buf.code_action, 'Code action', bufopts)
    map('n', '<space>cf', vim.lsp.buf.formatting, 'Format', bufopts)

    if client.name == 'tsserver' or client.name == 'gopls' then
        client.server_capabilities.documentFormattingProvider = false
    end
end

-- nvim-cmp supports additional completion capabilities
local capabilities = cmp.default_capabilities()

-- show diagnostics message in float
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    -- float = {
    --     border = "single",
    --     format = function(diagnostic)
    --         return string.format(
    --             "%s (%s) [%s]",
    --             diagnostic.message,
    --             diagnostic.source,
    --             diagnostic.code or diagnostic.user_data.lsp.code
    --         )
    --     end,
    -- },
})
map("n", "<leader>ce", function() vim.diagnostic.open_float() end, "Show error popup")

local lsp_options = {
    capabilities = capabilities,
    on_attach = on_attach
}

mason_lspconfig.setup_handlers({
    function (server_name)
        lspconfig[server_name].setup(lsp_options)
    end,
    ["lua_ls"] = function ()
        lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", lsp_options, {
            cmd = { 'lua-language-server' },
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                        -- Setup your lua path
                        path = vim.split(package.path, ";"),
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }))
    end,
    ["omnisharp"] = function ()
        lspconfig.omnisharp.setup(vim.tbl_deep_extend("force", lsp_options, {
            cmd = { "dotnet", vim.fn.expand("$HOME/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll")},
        }))
    end
})
