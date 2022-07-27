local status_ok, eyeliner = pcall(require, "eyeliner")
if not status_ok then
  return
end

local opts = {
  highlight_on_key = true,
}

eyeliner.setup(opts)
