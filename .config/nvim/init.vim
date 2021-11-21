"BASIC CONFIG
syntax on
set nu rnu
set nowrap
set expandtab
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set smartcase
set noswapfile
set background=dark 

"CLIPBOARD EVERYWHERE
set clipboard=unnamedplus

"YANK TO THE END OF A LINE
nnoremap Y yg_

call plug#begin('~/.vim/autoload/plugged')

  "COC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "NEOVIM VIFM
  Plug 'vifm/neovim-vifm'

  "NERD COMMENTER
  Plug 'preservim/nerdcommenter'

  "AUTO PAIRS
  Plug 'jiangmiao/auto-pairs'
  
  "SURROUND
  Plug 'tpope/vim-surround'

  "STATUS LINE
  Plug 'itchyny/lightline.vim'

  "INDENT LINE
  Plug 'Yggdroot/indentLine'

  "Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'fannheyward/telescope-coc.nvim'

  "CSS HEX COLORS
  Plug 'ap/vim-css-color'

  "THEMES
  Plug 'tomasiser/vim-code-dark'
  Plug 'marko-cerovac/material.nvim'
  Plug 'bluz71/vim-moonfly-colors'
  Plug 'tanvirtin/monokai.nvim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'tjdevries/colorbuddy.vim'
  Plug 'RishabhRD/nvim-rdark'
  Plug 'morhetz/gruvbox'
  Plug 'romgrk/doom-one.vim'


call plug#end()

"COMMENT SHORTCUT
vmap <A-x> <plug>NERDCommenterToggle
nmap <A-x> <plug>NERDCommenterToggle
nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>

"VIFM SHORTCUT
:nnoremap <C-t> :VifmToggle .<CR>

"Telescope CONFIG
nmap <C-p> :Telescope find_files<CR>
lua << EOF
require('telescope').setup{
  defaults = {
          prompt_prefix = "$ "
      }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
EOF

"SETUP COC PRETTIER
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"CocConfig
source $HOME/.config/nvim/CocConfig.vim

"COC-CSS | SASS
autocmd FileType scss setl iskeyword+=@-@

"EMMET FOR JS
augroup filetype_jsx
    autocmd!
    autocmd FileType javascript set filetype=javascriptreact
augroup END

"CONFIG INDENT LINE
let g:indentLine_color_term = 238
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"CONFIG MATERIAL THEME
"darker | lighter | oceanic | palenight | deep ocean
let g:material_style = 'darker'

"NAVIGATE WINDOWS"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"RESIZE WINDOWS
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

"SWITCH WINDOWS DIRECTION
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"FORCE SPLIT DIRECTRION
set splitbelow splitright

"OPEN NEW TAB
nnoremap <A-t> :tabedit .<CR>

"MAP CAPSLOCK TO ESCAPE
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

"KEEP CURSOR CENTERED
nnoremap n nzz
nnoremap N Nzz
nnoremap J mzJ'z

"TOGGLE WRAP
nnoremap <A-z> :set wrap!<CR>

"EDIT VIM CONFIG FILE
map <Leader>ev :tabnew $MYVIMRC<CR>

"SOURCE VIM CONFIG FILE
map <Leader>sv :source $MYVIMRC<CR>

"AUTO-RESIZE SPLITS
autocmd VimResized * wincmd =

colorscheme gruvbox
