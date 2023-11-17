local status, lualine = pcall(require, 'lualine')
if (not status) then return end

local custom_gruvbox = require'lualine.themes.gruvbox'

custom_gruvbox.normal.c.fg = '#ebdbb2' --white
custom_gruvbox.visual.c.fg = '#ebdbb2' --white
custom_gruvbox.visual.c.bg = '#3c3836' --darkgray

lualine.setup {
    options = {
        theme = custom_gruvbox
    },
    sections = {
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
        }
    }
}

