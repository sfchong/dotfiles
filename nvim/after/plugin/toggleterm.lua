local map = require("utils").map

require("toggleterm").setup({
    open_mapping = [[<F4>]],
    direction = 'float'
})

map('n', '<leader>tv', ':ToggleTerm direction=vertical size=60<cr>')
map('n', '<leader>th', ':ToggleTerm direction=horizontal<cr>')

