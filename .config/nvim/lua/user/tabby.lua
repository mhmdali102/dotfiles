local status_ok, tabby = pcall(require, "tabby")
if not status_ok then
	return
end

tabby.setup({
    tabline = require("tabby.presets").tab_only,
})
