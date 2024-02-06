local status, neogit = pcall(require, "neogit")
if (not status) then return end

local map = require("utils").map

neogit.setup()

map('n', '<leader>g', function () neogit.open() end, 'Neogit')
