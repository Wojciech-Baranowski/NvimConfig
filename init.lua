require("plugins")

vim.opt.mouse=a
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.colorcolumn="200"
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1

vim.cmd([[ let g:deoplete#enable_at_startup = 1 ]])
vim.cmd([[ let g:deoplete#disable_auto_complete = 0 ]])
vim.cmd([[ colorscheme molokai ]])
vim.cmd([[ highlight cursor guifg=white guibg=black guisp=3 ]])
vim.cmd([[ set number ]])

vim.api.nvim_create_user_command('Touch',
	function(args)
		command = 'touch ' .. args.fargs[1]
		os.execute(command)
	end,
{ nargs = 1 })

vim.api.nvim_create_user_command('Rm',
	function(args)
		command = 'rm -rf ' .. args.fargs[1]
		os.execute(command)
	end,
{ nargs = 1 })

vim.api.nvim_create_user_command('Mv',
	function(args)
		command = 'mv ' .. args.fargs[1] .. ' ' .. args.fargs[2]
		os.execute(command)
	end,
{ nargs = '*' })

vim.api.nvim_create_user_command('Cp',
	function(args)
		command = 'cp ' .. args.fargs[1] .. ' ' .. args.fargs[2]
		os.execute(command)
	end,
{ nargs = '*' })

vim.api.nvim_create_user_command('Mkdir',
	function(args)
		command = 'mkdir ' .. args.fargs[1]
		os.execute(command)
	end,
{ nargs = 1 })

vim.api.nvim_create_autocmd("Vimenter", {
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
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.git_branches, {})

