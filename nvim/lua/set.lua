vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = false

-- auto scroll when reaching top/end
vim.opt.scrolloff = 8

vim.opt.clipboard = "unnamedplus"

-- enable mouse
vim.opt.mouse = "a"

vim.g.wildignorecase = true

vim.opt.signcolumn = "yes:1"

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4

vim.opt.splitright = true
vim.opt.splitbelow = true

-- use space as leader key
vim.g.mapleader = " "

-- tab size for js and ts
vim.api.nvim_create_autocmd("FileType", {
	pattern = "javascript",
	command = "setlocal shiftwidth=2 tabstop=2"
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "typescript",
	command = "setlocal shiftwidth=2 tabstop=2"
})
