require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    buffers = {
      mappings = {
          i = {
              ["<C-d>"] = "delete_buffer"
          }
      }
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    file_browser = {
      initial_mode = "normal"
    }
  }
}

require('telescope').load_extension "file_browser"

-- keymap
local map = require("utils").map
local telescope = require('telescope.builtin')

map('n', '<leader>ff', function() 
    telescope.find_files()
end)

map('n', '<leader>fg', function() 
    telescope.live_grep()
end)

map('n', '<leader>fb', function() 
    telescope.buffers()
end)

map('n', '<leader>fh', function() 
    telescope.help_tags()
end)

map('n', '<leader>fs', function()
    telescope.current_buffer_fuzzy_find()
end)

map("n", "<leader>fe", ":Telescope file_browser<cr>")
