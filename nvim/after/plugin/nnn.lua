local status, nnn = pcall(require, "nnn")
if (not status) then return end

nnn.setup({
    explorer = { cmd = "nnn -eo", session = "shared", side = "topleft" },
    picker = { cmd = "nnn -eo", style = { border = "rounded" }, tabs = false },
    mappings = {
        { "<C-t>", nnn.builtin.open_in_tab },       -- open file(s) in tab
        { "<C-s>", nnn.builtin.open_in_split },     -- open file(s) in split
        { "<C-v>", nnn.builtin.open_in_vsplit },    -- open file(s) in vertical split
        { "<C-y>", nnn.builtin.copy_to_clipboard }, -- copy file(s) to clipboard
        { "<C-w>", nnn.builtin.cd_to_path },        -- cd to file directory
        { "<C-p>", nnn.builtin.open_in_preview },   -- open file in preview split keeping nnn focused
        { "<C-e>", nnn.builtin.populate_cmdline },  -- populate cmdline (:) with file(s)
    },
})

local map = require("utils").map

map('n', '<F2>', '<cmd>NnnExplorer %:p:h<CR>')
map('t', '<F2>', '<cmd>NnnExplorer<CR>')
map('n', '<leader>e', '<cmd>NnnPicker<CR>')
