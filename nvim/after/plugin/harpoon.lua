local status, harpoon = pcall(require, 'harpoon')
if (not status) then return end

local map = require("utils").map

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

harpoon.setup()

map('n', '<leader>pp', '<cmd>Telescope harpoon marks<cr>', 'harpoon menu')
map('n', '<leader>ph', function() ui.toggle_quick_menu() end , 'harpoon menu original')
map('n', '<leader>pa', function() mark.add_file() end, 'harpoon add file')
map('n', '<leader>pn', function() ui.nav_next() end, 'harpoon next file')
map('n', '<leader>n', function() ui.nav_next() end, 'harpoon next file')
map('n', '<leader>p,', function() ui.nav_prev() end, 'harpoon previous file')
map('n', '<leader>,', function() ui.nav_prev() end, 'harpoon previous file')

for i = 1, 9, 1 do
  map('n', '<leader>p' .. i, function() ui.nav_file(i) end, 'go to ' .. i)
end

