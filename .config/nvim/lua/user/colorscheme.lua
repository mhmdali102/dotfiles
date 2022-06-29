vim.cmd [[
try
  colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- configure colorschemes: night, storm, day
vim.g.tokyonight_style = "storm"

-- configure sonokai : hard, medium (default), soft
vim.g.everforest_background = 'hard'

-- configure sonokai : default, andromeda, atlantis, shusia, maia, espresso
vim.g.sonokai_style = 'default'
