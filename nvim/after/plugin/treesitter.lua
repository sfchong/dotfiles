require("nvim-treesitter.configs").setup({
    ensure_installed = { 'bash', 'css', 'go', 'html', 'javascript', 'json', 'lua',  'scss', 'tsx', 'typescript', 'yaml' },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    -- playground = {
    --     enable = true,
    --     disable = {},
    --     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    --     persist_queries = false, -- Whether the query persists across vim sessions
    -- },
})
