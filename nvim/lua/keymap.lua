local map = require("utils").map

-- prevent clipboard override by selected text when pasting
map("x", "p", "\"_dP")

-- no override clipboard when x and c
map("n", "x", "\"_x")
map("v", "x", "\"_x")
map("n", "c", "\"_c")

-- exit vim
map("n", "<leader>q", ":q<cr>", "Exit")
map("n", "<leader>Q", ":q!<cr>", "Force exit")

-- buffer
map("n", "<leader>bn", ":bnext<cr>", 'Next buffer')
map("n", "<leader>n", ":bnext<cr>", 'Next buffer')
map("n", "<leader>b,", ":bprev<cr>", 'Previous buffer')
map("n", "<leader>,", ":bprev<cr>", 'Previous buffer')
map("n", "<leader>bx", ":bd<cr>", 'Delete buffer')
map("n", "<leader>bX", ":bd!<cr>", 'Force delete buffer')

-- window
map("n", "<leader>w", "<C-w>", "Window actions")

-- save
map("n", "<leader>s", ":w<cr>", "Save file")
map("n", "<leader>S", ":wq<cr>", "Save and quit")

-- select all
map("n", "<leader>a", "ggVG", "Select all")

-- Redo
map("n", "U", "<C-r>", "Redo")

-- keep visual mode after indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- re-center after scroll
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- disable q:
map("n", "q:", "<nop>")

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

-- close all other buffers
vim.api.nvim_create_user_command('BufferCloseOther',
    function()
        -- :w - save current buffer
        -- %bd - close all the buffers_color
        -- e# - open last edited files
        -- bd# - close the unnamed buffer
        vim.cmd[[:w|%bd|e#|bd#]]
    end,
    {}
)

-- exit terminal mode
-- map("t", "<Esc>", [[<C-\><C-n><CR>]])
