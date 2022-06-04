local opts = { noremap = true, silent = false }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate tabs
keymap("n", "<A-j>", "gT", opts)
keymap("n", "<A-k>", "gt", opts)
keymap("n", "<A-h>", ":tabm -1<CR>", opts)
keymap("n", "<A-l>", ":tabm +1<CR>", opts)
keymap("n", "<A-1>", "1gt", opts)
keymap("n", "<A-2>", "2gt", opts)
keymap("n", "<A-3>", "3gt", opts)
keymap("n", "<A-4>", "4gt", opts)
keymap("n", "<A-5>", "5gt", opts)
keymap("n", "<A-6>", "6gt", opts)
keymap("n", "<A-7>", "7gt", opts)
keymap("n", "<A-8>", "8gt", opts)
keymap("n", "<A-9>", "9gt", opts)
keymap("n", "<A-0>", "<cmd>tablast<CR>", opts)

-- Harpoon
keymap("n", "<Leader>u", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<Leader>A", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<Leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<Leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<Leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<Leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
keymap("n", "<Leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Other
-- keep cursor centered
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- toggle wrap
keymap("n", "<A-z>", ":set wrap!<CR>", opts)
