local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup({
    ensure_installed = { 'bash', 'css', 'c_sharp', 'go', 'html', 'javascript', 'json', 'lua', 'scss', 'svelte', 'tsx', 'typescript',
        'yaml' },
    highlight = {
        enable = true,
    },
    indent = {
        enable = false,
    },
    -- playground = {
    --     enable = true,
    --     disable = {},
    --     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    --     persist_queries = false, -- Whether the query persists across vim sessions
    -- },
})
