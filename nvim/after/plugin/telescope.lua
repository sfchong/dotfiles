local actions = require("telescope.actions")

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<esc>"] = actions.close,
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
    find_files = {
        find_command = {'rg', '--files', '--hidden', '-g', '!.git'}
    },
    buffers = {
      sort_lastused = true,
      mappings = {
          i = {
              ["<C-d>"] = "delete_buffer",
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
end, 'Find files')

map('n', '<leader><space>', function() 
    telescope.find_files()
end, 'Find files')

map('n', '<leader>fg', function() 
    telescope.live_grep()
end, 'Live grep')

map('n', '<leader>b', function() 
    telescope.buffers()
end, 'List buffers')

map('n', '<leader>h', function() 
    telescope.help_tags()
end, 'Help page')

map('n', '<leader>fs', function()
    telescope.current_buffer_fuzzy_find()
end, 'Find current file')

map("n", "<leader>fe", ":Telescope file_browser<cr>")
