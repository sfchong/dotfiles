local map = require("utils").map

map('n', '<leader>tt', ':ToggleTerm direction=float<cr>')
map('n', '<leader>tv', ':ToggleTerm direction=vertical size=60<cr>')
map('n', '<leader>th', ':ToggleTerm direction=horizontal<cr>')