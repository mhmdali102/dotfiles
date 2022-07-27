local status_ok, _ = pcall(require, "registers")
if not status_ok then
  return
end

vim.g.registers_window_border = "rounded"
