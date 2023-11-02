local status, harpoon = pcall(require, 'harpoon')
if (not status) then return end

local map = require("utils").map

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

harpoon.setup()

map('n', '<leader>pp', function() ui.toggle_quick_menu() end, 'harpoon menu')
map('n', '<leader>pa', function() mark.add_file() end, 'add file')
map('n', '<leader>n', function() ui.nav_next() end, 'next file')
map('n', '<leader>,', function() ui.nav_prev() end, 'previous file')

for i = 1, 9, 1 do
  map('n', '<leader>p' .. i, function() ui.nav_file(i) end, 'go to ' .. i)
end

