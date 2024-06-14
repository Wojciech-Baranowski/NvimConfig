require("plugins")

vim.opt.mouse=a
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.colorcolumn="200"
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1
vim.g.equalalways = false

vim.cmd("let g:deoplete#enable_at_startup = 1")
vim.cmd("let g:deoplete#disable_auto_complete = 0")
vim.cmd("colorscheme molokai")
vim.cmd("highlight cursor guifg=white guibg=black guisp=3")
vim.cmd("set number")
vim.cmd("set autochdir")

vim.cmd("belowright split")
vim.cmd("terminal")
vim.schedule(function()
  vim.api.nvim_set_current_win(1001) 
  vim.cmd("resize 10")
  vim.api.nvim_set_current_win(1000) 
end)


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
	end,
})

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 60,
    preserve_window_proportions = true
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


function switch_to_default()
  vim.api.nvim_set_current_win(1000) 
end

function switch_to_terminal()
  vim.api.nvim_set_current_win(1001) 
end

function switch_to_tree()
  vim.api.nvim_set_current_win(1003) 
end

vim.api.nvim_set_keymap('n', '1', '<cmd>lua switch_to_tree()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '2', '<cmd>lua switch_to_default()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '3', '<cmd>lua switch_to_terminal()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'n', '<cmd>AdvancedNewFile<CR>', { noremap=true, silent = true })

