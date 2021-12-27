"BASIC CONFIG
syntax on
set enc=utf-8
set nu rnu
set nowrap
set expandtab
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set smarttab
set ignorecase
set smartcase
set noswapfile
set nobackup
set background=dark 
set noshowmode
set fillchars+=vert:\ 
set nocompatible
set splitbelow splitright
set showtabline=2
set clipboard=unnamedplus
set ttyfast

call plug#begin('~/.vim/autoload/plugged')
  "COC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  "VIFM
  Plug 'vifm/vifm.vim'

  "TYPESCRIPT SYNTAX
  Plug 'herringtondarkholme/yats.vim'

  "LANGUAGE PACK
  Plug 'sheerun/vim-polyglot'

  "NERD COMMENTER
  Plug 'preservim/nerdcommenter'

  "QUICK SCOPE
  Plug 'unblevable/quick-scope'

  "SNEAK
  Plug 'justinmk/vim-sneak'

  "AUTO PAIRS
  Plug 'jiangmiao/auto-pairs'

  "VIM RAINBOW
  Plug 'frazrepo/vim-rainbow'
  
  "SURROUND
  Plug 'tpope/vim-surround'

  "XMLATTR
  Plug 'kana/vim-textobj-user'
  Plug 'whatyouhide/vim-textobj-xmlattr'

  "STATUS LINE
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'

  "INDENT LINE
  Plug 'Yggdroot/indentLine'

  "Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'fannheyward/telescope-coc.nvim'

  "CSS HEX COLORS
  "Plug 'ap/vim-css-color'
  Plug 'KabbAmine/vCoolor.vim'

  "DASHBOARD
  Plug 'glepnir/dashboard-nvim'
  
  "Markdown preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  "NVIM TRANSPARENT
  Plug 'xiyaowong/nvim-transparent'

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
  Plug 'joshdick/onedark.vim'
  Plug 'tomasr/molokai'
  Plug 'catppuccin/nvim'

call plug#end()

"YANK TO THE END OF THE LINE
nnoremap Y yg_

"GO TO START/MIDDLE/END OF THE LINE
nnoremap <A-j> g^
nnoremap <A-k> g_
nnoremap <A-m> :exe 'normal ' . len(getline('.'))/2 . '\|'<CR>

"COMMENT SHORTCUT
vmap <A-x> <plug>NERDCommenterToggle
nmap <A-x> <plug>NERDCommenterToggle

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

"TELESCOPE CONFIG
nmap <C-p> :Telescope find_files<CR>
lua << EOF
require('telescope').setup{
  defaults = {
          prompt_prefix = "$ ",
          file_ignore_patterns = {"./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*"}
      }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
EOF

"CONFIG DASHBOARD
let g:dashboard_default_executive ='telescope'

"SETUP COC PRETTIER
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"COCCONFIG
source $HOME/.config/nvim/CocConfig.vim

"COC-CSS | SASS
autocmd FileType scss setl iskeyword+=@-@

"CONFIG COC-SNIPPET
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

"EMMET FOR JSX
augroup filetype_jsx
    autocmd!
    autocmd FileType javascript set filetype=javascriptreact
augroup END

"CONFIG INDENT LINE
let g:indentLine_color_term = 238
let g:indentLine_char_list = ['│', '¦', '┆', '┊', '|']

"CONFIG LIGHTLINE
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ],
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
    \ },
    \ 'component': {
    \   'charvaluehex': '0x%B',
    \   'gitbranch':  ':' . gitbranch#name(),
    \ },
    \ 'mode_map': {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'VL',
      \ "\<C-v>": 'VB',
      \ 'c' : 'C',
      \ 's' : 'S',
      \ 'S' : 'SL',
      \ "\<C-s>": 'SB',
      \ 't': 'T',
      \ },
    \ }

"CONFIG MATERIAL THEME = darker | lighter | oceanic | palenight | deep ocean
let g:material_style = 'darker'

"CONFIG GRUVQUEEN THEME = original | mix | material
let g:gruvqueen_style = 'original'

"CONFIG AYU THEME = light | mirage | dark
let ayucolor="dark" 
set termguicolors     

"CONFIG GRUVBOX THEME = soft | default | hard
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'soft'

"CONFIG NVIM TRANSPARENT
map <Leader>te :TransparentEnable<CR>
map <Leader>td :TransparentDisable<CR>

lua << EOF
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be clear
    -- In particular, when you set it to 'all', that means all avaliable groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})
EOF

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
nnoremap <A--> :sp<CR>

"REMAP ESC TO jk
inoremap jk <ESC>

"COMMA IS THE <Leader> KEY
let mapleader=','
let maplocalleader=','

"SWITCH WINDOWS DIRECTION
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"NEW TAB
nnoremap <A-t> :tabedit .<CR>

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

"SAVE IN INSERT MODE
inoremap <C-s> <ESC>:w<CR>a

"OPEN TERMINAL
map <Leader>ht :new term://fish<CR>
map <Leader>vt :vnew term://fish<CR>

"COMPILE AND RUN JAVA
map <Leader>jv :w<CR> :!javac % && java %:r <CR>

"CONFIG VIFM
map <Leader>ve :EditVifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>tv :TabVifm<CR>

"KEEP CURSOR CENTERED
nnoremap n nzz
nnoremap N Nzz

"TOGGLE WRAP
nnoremap <A-z> :set wrap!<CR>

"EDIT & SOURCE VIM CONFIG FILE
map <Leader>ev :tabnew $MYVIMRC<CR>
map <Leader>sv :source $MYVIMRC<CR>

"MARKDOWN PREVIEW
map <Leader>mp :MarkdownPreview<CR>
let g:mkdp_refresh_slow = 1

"ENABLE RAINBOW
let g:rainbow_active = 1

"AUTO-RESIZE SPLITS
autocmd VimResized * wincmd =

colorscheme gruvbox
"nvim dap
