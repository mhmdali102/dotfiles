local status_ok, _ = pcall(require, "icon-picker")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-i>", "<cmd>PickIcons<cr>", opts)
vim.keymap.set("i", "<C-i>", "<cmd>PickInsert<cr>", opts)
vim.keymap.set("i", "<A-i>", "<cmd>PickAltFontAndSymbolsInsert<cr>", opts)
