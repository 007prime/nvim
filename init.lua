vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

vim.cmd(":set relativenumber ")
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
		config = function()
			require("options")
		end,
	},

	{ import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("nvchad.autocmds")

vim.schedule(function()
	require("mappings")
end)

vim.api.nvim_set_keymap("n", "dw", '""dw', { noremap = true })
vim.api.nvim_set_keymap("n", "dd", '""dd', { noremap = true })
vim.api.nvim_set_keymap("v", "d", '""d', { noremap = true })
vim.api.nvim_set_keymap("n", "p", '""p', { noremap = true })
vim.api.nvim_set_keymap("v", "x", '""x', { noremap = true })
vim.api.nvim_set_keymap("n", "x", '""x', { noremap = true })
vim.opt.guicursor = "i:hor1000,a:blinkon1000-blinkoff1000"
