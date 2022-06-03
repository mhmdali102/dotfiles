local status_ok, neozoom = pcall(require, "neo-zoom")
if not status_ok then
  return
end

neozoom.setup {
  left_ratio = 1,
  top_ratio = 1,
  width_ratio = 1,
  height_ratio = 1,
  border = 'none',
}

vim.keymap.set('n', '<CR>', function()
  vim.cmd('NeoZoomToggle')
end)
