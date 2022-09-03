local map = require("utils").map

map("i", "kj", "<esc>")

-- prevent clipboard override by selected text when pasting
map("x", "p", "\"_dP")

-- exit vim
map("n", "<leader>q", ":q<cr>", "Exit")
map("n", "<leader>Q", ":q!<cr>", "Force exit")

-- buffer
map("n", "<leader>bn", ":bnext<cr>", 'Next buffer')
map("n", "<leader>bp", ":bprev<cr>", 'Previous buffer')
map("n", "<leader>bc", ":bd<cr>", 'Delete buffer')
map("n", "<leader>bc", ":bd!<cr>", 'Force delete buffer')

-- window
map("n", "<leader>w", "<C-w>", "Window actions")

-- save
map("n", "<leader>s", ":w<cr>", "Save file")

-- select all
map("n", "<leader>a", "ggVG", "Select all")

-- Redo
map("n", "U", "<C-r>", "Redo")

-- keep visual mode after indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- vim fugitive
map("n", "<leader>gg", ":0Git<cr>")

-- exit terminal mode
-- map("t", "<Esc>", [[<C-\><C-n><CR>]])
