vim.cmd [[
try
  colorscheme tomorrow
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- configure colorschemes
vim.g.tokyonight_style = "night"
