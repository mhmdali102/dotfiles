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
set autoindent
set ttyfast
set shell=bash
let g:polyglot_disabled = ['markdown']

call plug#begin('~/.vim/autoload/plugged')
  "COC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  "VIFM
  Plug 'vifm/vifm.vim'

  "TYPESCRIPT SYNTAX
  Plug 'herringtondarkholme/yats.vim'

  "LANGUAGE PACK
  Plug 'sheerun/vim-polyglot'

 " GIT DIFFVIEW
  Plug 'nvim-lua/plenary.nvim'
  Plug 'sindrets/diffview.nvim'

  " GDIFF
  Plug 'oguzbilgic/vim-gdiff'

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
  
  "VIM CLOSETAG
  Plug 'alvan/vim-closetag'

  "STATUS LINE
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'

  "INDENT LINE
  Plug 'Yggdroot/indentLine'
  
  "FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  "VIM FUGITIVE'
  Plug 'tpope/vim-fugitive'

  "NVIM TREESITTER
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  "VIM COLOR DISPLAY
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  "DASHBOARD
  Plug 'glepnir/dashboard-nvim'
  
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
  Plug 'joshdick/onedark.vim'
  Plug 'tomasr/molokai'
  Plug 'catppuccin/nvim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'sainnhe/everforest'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

"SPACE IS THE <Leader> KEY
let mapleader=' '
let maplocalleader=' '

"YANK TO THE END OF THE LINE
nnoremap Y yg_

"GO TO START/MIDDLE/END OF THE LINE
nnoremap <A-,> ^
nnoremap <A-.> g_
nnoremap <A-m> :exe 'normal ' . len(getline('.'))/2 . '\|'<CR>

"MOVE LINE UP AND DOWN
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv
nnoremap <A-C-Up> yyP
nnoremap <A-C-Down> yyp

"COMMENT SHORTCUT
vmap <A-x> <plug>NERDCommenterToggle
nmap <A-x> <plug>NERDCommenterToggle

"CONFIG AUTOPAIRS
let g:AutoPairsShortcutToggle = '<A-P>'

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

"Config diffview
let g:use_icons = "false"
map <Leader>do :DiffviewOpen<CR>
map <Leader>dc :DiffviewClose<CR>
map <Leader>df :DiffviewFileHistory<CR>

"CONFIG COC-EXPLORER
nmap <C-t> :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

"CONFIG HEXOKINASE
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript']

"CONFIG GIT GUTTER
map <Leader>g] :GitGutterNextHunk<CR>
map <Leader>g[ :GitGutterPrevHunk<CR>
map <Leader>gp :GitGutterPreviewHunk<CR>
map <Leader>gf :GitGutterFold<CR>
map <Leader>gt :GitGutterLineHighlightsToggle<CR>

"CONFIG FZF
nmap <C-p> :GFiles<CR>
nmap <A-f> :Files<CR>
nmap <A-c> :Colors<CR>
nmap <A-m> :Marks<CR>
nmap <A-w> :Windows<CR>
nmap <A-h> :History<CR>
nmap <A-g> :Commits<CR>
nmap <A-b> :BCommits<CR>
nmap <A-o> :Commands<CR>
nmap <A-r> :Maps<CR>
nmap <A-l> :BLines<CR>

"CONFIG DASHBOARD
let g:dashboard_default_executive ='fzf'
let g:indentLine_fileTypeExclude = ['dashboard']

"SETUP COC PRETTIER
map <Leader>pr :CocCommand prettier.formatFile<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"COCCONFIG
source $HOME/.config/nvim/CocConfig.vim
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-html',
  \ 'coc-explorer',
  \ 'coc-eslint',
  \ 'coc-emmet',
  \ 'coc-cssmodules',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-java',
  \ 'coc-css',
  \ 'coc-json',
  \ ]

"COC-CSS | SASS
autocmd FileType scss setl iskeyword+=@-@

"CONFIG COC-SNIPPET
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

"COC RENAME
nmap <F2> <Plug>(coc-rename)

"CONFIG VIM CLOSETAG
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

"EMMET FOR JSX
augroup filetype_jsx
    autocmd!
    autocmd FileType javascript set filetype=javascriptreact
    autocmd FileType jsx set filetype=javascriptreact
augroup END

"SOURCE SYNTAX HIGHLIGHT FOR JAVASCRIPT
map <Leader>js :runtime! syntax/javascript.vim<CR>

"CONFIG INDENT LINE
let g:indentLine_color_term = 238
let g:indentLine_char_list = ['│']

"CONFIG LIGHTLINE
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
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

"CONFIG EVERFOREST THEME = soft | medium | hard
let g:everforest_background = "medium"

"CONFIG AYU THEME = light | mirage | dark
let ayucolor="mirage" 
set termguicolors

"CONFIG GRUVBOX THEME = soft | default | hard
let g:gruvbox_contrast_dark = 'default'
let g:gruvbox_contrast_light = 'soft'

"CONFIG TOKYONIGHT THEME = day | storm | night
let g:tokyonight_style = "night"

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
nnoremap <A-NL> <C-W>-
nnoremap <A-C-K> <C-W>+
nnoremap <A-C-L> <C-W>>
nnoremap <A-C-H>  <C-W><

"SPLIT WINDOWS
nnoremap <A-M-Bslash> :vs<CR>
nnoremap <A--> :sp<CR>

"REMAP ESC TO jk
"inoremap jk <ESC>

"SWITCH WINDOWS DIRECTION
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"NEW TAB
nnoremap <A-t> :tabedit .<CR>

"TAB NAVIGATION
nnoremap <A-j> gT
nnoremap <A-k> gt
nnoremap <A-h> :tabm -1<CR>
nnoremap <A-l> :tabm +1<CR>
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

"SIGN COLUMN
set signcolumn=yes:1
highlight clear SignColumn

colorscheme gruvbox
"nvim dap
"https://github.com/puremourning/vimspector
