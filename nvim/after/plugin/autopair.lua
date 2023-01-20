local status, npairs = pcall(require, "nvim-autopairs")
if (not status) then return end

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = { 'string' }, -- it will not add a pair on that treesitter node
        javascript = { 'template_string' },
        java = false, -- don't check treesitter on java
    }
})

-- auto-tag for html
require('nvim-ts-autotag').setup()
