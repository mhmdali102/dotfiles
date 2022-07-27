local status_ok, _ = pcall(require, "gitblame")
if not status_ok then
  return
end

vim.g.gitblame_enabled = 0
