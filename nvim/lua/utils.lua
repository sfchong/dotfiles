local M = {}

function M.map(mode, lhs, rhs, desc, opts)
    local options = { noremap = true }
    if desc then 
        options.desc = desc
    end
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    -- vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    vim.keymap.set(mode, lhs, rhs, options)
end

return M