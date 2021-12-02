"BASIC CONFIG
syntax on
set enc=utf-8
set nu rnu
set nowrap
set expandtab
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set ignorecase
set smartcase
set noswapfile
set background=dark 

call plug#begin('~/.vim/autoload/plugged')

  "COC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "TYPESCRIPT SYNTAX
  Plug 'herringtondarkholme/yats.vim'

  "NERD COMMENTER
  Plug 'preservim/nerdcommenter'

  "QUICK SCOPE
  Plug 'unblevable/quick-scope'

  "SNEAK
  Plug 'justinmk/vim-sneak'

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
  
  "Markdown preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  "THEMES
  Plug 'tomasiser/vim-code-dark'
  Plug 'marko-cerovac/material.nvim'
  Plug 'bluz71/vim-moonfly-colors'
  Plug 'tanvirtin/monokai.nvim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'tjdevries/colorbuddy.vim'
  Plug 'morhetz/gruvbox'

call plug#end()

"CLIPBOARD EVERYWHERE
set clipboard=unnamedplus

"YANK TO THE END OF A LINE
nnoremap Y yg_

"COMMENT SHORTCUT
vmap <A-x> <plug>NERDCommenterToggle
nmap <A-x> <plug>NERDCommenterToggle
nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>

"CONFIG QUICK SCOPE
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline
let g:qs_max_chars=150

"CONFIG SNEAK
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1
let g:sneak#prompt = '🔎 '

"CONFIG COC-EXPLORER
nmap <C-t> :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

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

"CONFIG COC-SNIPPET
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

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

"MOVE WINDOWS
nnoremap <A-h> <C-w>H
nnoremap <A-j> <C-w>J
nnoremap <A-k> <C-w>K
nnoremap <A-l> <C-w>L

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

"OPEN TERMINAL
command! -nargs=* VT vsplit | terminal <args>
command! -nargs=* T split | terminal <args>

"KEEP CURSOR CENTERED
nnoremap n nzz
nnoremap N Nzz

"TOGGLE WRAP
nnoremap <A-z> :set wrap!<CR>

"EDIT VIM CONFIG FILE
map <Leader>ev :tabnew $MYVIMRC<CR>

"SOURCE VIM CONFIG FILE
map <Leader>sv :source $MYVIMRC<CR>

"Markdown Preview
map <Leader>p :MarkdownPreview<CR>

"AUTO-RESIZE SPLITS
autocmd VimResized * wincmd =

colorscheme gruvbox
