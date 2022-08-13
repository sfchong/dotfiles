local map = require("utils").map

map("i", "kj", "<esc>")

-- prevent clipboard override by selected text when pasting
map("x", "p", "\"_dP")

-- exit vim
map("n", "<leader>q", ":q<cr>")
map("n", "<leader>Q", ":q!<cr>")

-- switch buffer
map("n", "<leader>bn", ":bnext<cr>")
map("n", "<leader>bp", ":bprev<cr>")

-- window
map("n", "<leader>ws", "<C-w>s<cr>")
map("n", "<leader>wv", "<C-w>v<cr>")
map("n", "<leader>wh", "<C-w>h<cr>")
map("n", "<leader>wj", "<C-w>j<cr>")
map("n", "<leader>wk", "<C-w>k<cr>")
map("n", "<leader>wl", "<C-w>l<cr>")
map("n", "<leader>wq", "<C-w>q<cr>")

-- exit terminal mode
map("t", "<Esc>", [[<C-\><C-n><CR>]])