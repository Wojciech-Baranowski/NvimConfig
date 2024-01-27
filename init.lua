require("plugins")

vim.opt.mouse=a
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.colorcolumn="200"
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ let g:deoplete#enable_at_startup = 1 ]])
vim.cmd([[ let g:deoplete#disable_auto_complete = 0 ]])
vim.cmd([[ colorscheme molokai ]])

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("NvimTreeOpen")
	end,
})

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
