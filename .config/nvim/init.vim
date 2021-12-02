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
set nobackup
set background=dark 
set noshowmode

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
  Plug 'Murtaza-Udaipurwala/gruvqueen'
  Plug 'ayu-theme/ayu-vim'

call plug#end()

"CLIPBOARD EVERYWHERE
set clipboard=unnamedplus

"YANK TO THE END OF THE LINE
nnoremap Y yg_

"GO TO START /END OF THE LINE
nnoremap H g^
nnoremap L g$


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

"CONFIG MATERIAL THEME = darker | lighter | oceanic | palenight | deep ocean
let g:material_style = 'darker'

"CONFIG GRUVQUEEN THEME = original | mix | material
let g:gruvqueen_style = 'original'

"CONFIG AYU THEME = light | mirage | dark
let ayucolor="mirage" 
set termguicolors     

"NAVIGATE WINDOWS"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"MOVE WINDOWS
nnoremap <A-Left> <C-w>H
nnoremap <A-Down> <C-w>J
nnoremap <A-Up> <C-w>K
nnoremap <A-Right> <C-w>L

"RESIZE WINDOWS
nnoremap _ <C-W>-
nnoremap + <C-W>+
nnoremap <S-Right> <C-W>>
nnoremap <S-Left>  <C-W><
nnoremap <S-Down>  <C-W>-
nnoremap <S-Up>    <C-W>+

"SPLIT WINDOWS
nnoremap <A-M-Bslash> :vs<CR>
nnoremap <A-_> :sp<CR>

"EXIT INSERT MODE
inoremap jk <ESC>

"COMMA IS THE <Leader> KEY
let mapleader=','
let maplocalleader=','

"SWITCH WINDOWS DIRECTION
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"NEW TAB
nnoremap <A-t> :tabedit .<CR>
set showtabline=2

"TAB NAVIGATION
nnoremap <A-h> gT
nnoremap <A-l> gt
nnoremap 1 1gt
nnoremap 2 2gt
nnoremap 3 3gt
nnoremap 4 4gt
nnoremap 5 5gt
nnoremap 6 6gt
nnoremap 7 7gt
nnoremap 8 8gt
nnoremap 9 9gt

"KEEP IN VISUAL MODE WHEN SHIFTING
vnoremap < <gv
vnoremap > >gv

"FORCE SPLIT DIRECTRION
set splitbelow splitright

"SAVE IN INSERT MODE
inoremap <C-s> <ESC>:w<CR>a

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

colorscheme gruvqueen
