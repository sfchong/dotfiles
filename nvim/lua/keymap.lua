local map = require("utils").map

-- prevent clipboard override by selected text when pasting
map("x", "p", "\"_dP")

-- no override clipboard when x
map("n", "x", "\"_x")
map("v", "x", "\"_x")

-- exit vim
map("n", "<leader>q", ":q<cr>", "Exit")
map("n", "<leader>Q", ":q!<cr>", "Force exit")

-- buffer
map("n", "<leader>n", ":bnext<cr>", 'Next buffer')
map("n", "<leader>,", ":bprev<cr>", 'Previous buffer')
map("n", "<leader>bc", ":bd<cr>", 'Delete buffer')
map("n", "<leader>bC", ":bd!<cr>", 'Force delete buffer')

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
map("n", "<leader>gP", ":Git push<cr>")
map("n", "<leader>gp", ":Git pull<cr>")
map("n", "<leader>gf", ":Git fetch<cr>")

-- netrw
-- map("n", "<F2>", "<cmd>Lexplore<cr>")
vim.api.nvim_create_autocmd('filetype', {
    pattern = 'netrw',
    desc = 'Better mappings for netrw',
    callback = function()
        local bind = function(lhs, rhs)
            vim.keymap.set('n', lhs, rhs, { remap = true, buffer = true })
        end

        -- edit new file
        bind('n', '%')

        -- rename file
        bind('r', 'R')
    end
})

-- exit terminal mode
-- map("t", "<Esc>", [[<C-\><C-n><CR>]])
