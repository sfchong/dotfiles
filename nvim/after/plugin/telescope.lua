local status, telescope = pcall(require, "telescope")
local action_status, actions = pcall(require, "telescope.actions")

if (not status or not action_status) then return end

telescope.setup {
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
        },
        file_ignore_patterns = { "node_modules/" }
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
            find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }
        },
        live_grep = {
            file_ignore_patterns = { 'node_modules', '.git' },
            additional_args = function(_)
                return { "--hidden" }
            end
        },
        buffers = {
            sort_lastused = true,
            mappings = {
                i = {
                    ["<C-d>"] = "delete_buffer",
                }
            }
        },
        lsp_references = {
            -- fname_width = 100
            show_line = false
        },
        colorscheme = {
            enable_preview = true
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
require('telescope').load_extension 'harpoon'

-- keymap
local map = require("utils").map
local telescope_builtin = require('telescope.builtin')

map('n', '<leader>ff', function() telescope_builtin.find_files() end, 'Find files')
map('n', '<leader><space>', function() telescope_builtin.find_files() end, 'Find files')
map('n', '<leader>fg', function() telescope_builtin.live_grep() end, 'Live grep')
map('n', '<leader>bb', function() telescope_builtin.buffers() end, 'List buffers')
map('n', '<leader>h', function() telescope_builtin.help_tags() end, 'Help page')
map('n', '<leader>fn', function() telescope_builtin.current_buffer_fuzzy_find() end, 'Find current file')
map('n', '<leader>ft', function () telescope_builtin.tagstack() end, 'List tagstack')
map('n', '<leader>fo', function () telescope_builtin.jumplist() end, 'List jumplist')
map('n', '<leader>fs', function () telescope_builtin.treesitter() end, 'List treesitter symbol')
map('n', '<leader>fr', function () telescope_builtin.resume() end, 'Resume telescope')
map('n', '<leader>fc', function () telescope_builtin.colorscheme() end, 'List colorscheme')
map("n", "<leader>fe", ":Telescope file_browser<cr>")

map('n', '<space>cd', function() telescope_builtin.diagnostics() end, 'Lists Diagnostics')

