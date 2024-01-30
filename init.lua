require("plugins")

vim.opt.mouse=a
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.colorcolumn="200"
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_respect_buf_cwd = 1

vim.cmd([[ let g:deoplete#enable_at_startup = 1 ]])
vim.cmd([[ let g:deoplete#disable_auto_complete = 0 ]])
vim.cmd([[ colorscheme molokai ]])

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("NvimTreeOpen")
		vim.cmd("set autochdir")
	end,
})

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 60,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})
