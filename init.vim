set mouse=a
set tabstop=4
set shiftwidth=4
set colorcolumn=200
let $VIMHOME = $HOME."/.vim"
let g:tmpl_search_paths = [ $VIMHOME.'/templates' ]
call plug#begin($VIMHOME.'/plugged')
    Plug 'lervag/vimtex'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'rafi/awesome-vim-colorschemes'
call plug#end()
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 0
call deoplete#custom#var('omni', 'input_patterns', {
          \ 'tex': g:vimtex#re#deoplete
\})
colorscheme molokai 

