local status_ok, browse = pcall(require, "browse")
if not status_ok then
  return
end

browse.setup({
  -- search provider you want to use
  provider = "google", -- default
})

-- Keybindings
local opts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

local bookmarks = {
  "https://github.com/mhmdali102",
}

keymap("n", "<A-s>", "<cmd>lua require('browse').input_search()<CR>", opts)
keymap("n", "<A-d>", "<cmd>lua require('browse.devdocs').search_with_filetype()<CR>", opts)

keymap("n", "<A-b>", "<cmd>BrowseBookmarks<CR>", opts)
vim.api.nvim_create_user_command("BrowseBookmarks", function()
  browse.open_bookmarks({ bookmarks = bookmarks })
end, {})
