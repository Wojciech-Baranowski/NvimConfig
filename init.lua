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

local function touch(name)
	end

vim.api.nvim_create_user_command('touch',
	function(args)
		command = 'touch ' .. args.fargs[1]
		os.execute(command)
	end,
{ nargs = 1 })

vim.api.nvim_create_user_command('rm',
	function(args)
		command = 'rm -rf ' .. args.fargs[1]
		os.execute(command)
	end,
{ nargs = 1 })

vim.api.nvim_create_user_command('mv',
	function(args)
		command = 'mv ' .. args.fargs[1] .. ' ' .. args.fargs[2]
		os.execute(command)
	end,
{ nargs = '*' })

vim.api.nvim_create_user_command('cp',
	function(args)
		command = 'cp ' .. args.fargs[1] .. ' ' .. args.fargs[2]
		os.execute(command)
	end,
{ nargs = '*' })

vim.api.nvim_create_user_command('ls',
	function(args)
		command = 'ls'
		os.execute(command)
	end,
{ nargs = 0 })

vim.api.nvim_create_user_command('mkdir',
	function(args)
		command = 'mkdir ' .. args.fargs[1]
		os.execute(command)
	end,
{ nargs = 1 })

vim.api.nvim_create_autocmd("vimenter", {
	callback = function()
		vim.cmd("nvimtreeopen")
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
