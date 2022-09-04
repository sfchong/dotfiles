local telescope = require('telescope.builtin')
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
    map('n', '<space>cd', function() telescope.diagnostics() end, 'Lists Diagnostics', bufopts)

    if client.name == 'tsserver' or client.name == 'gopls' then
        client.resolved_capabilities.document_formatting = false
    end
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- show diagnostics message in float
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	float = {
		border = "single",
		format = function(diagnostic)
			return string.format(
				"%s (%s) [%s]",
				diagnostic.message,
				diagnostic.source,
				diagnostic.code or diagnostic.user_data.lsp.code
			)
		end,
	},
})
map("n", "<leader>e", function() vim.diagnostic.open_float() end, "Show error popup")

require("lspconfig").tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

require("lspconfig").gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

require("lspconfig").sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = on_attach,
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
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
