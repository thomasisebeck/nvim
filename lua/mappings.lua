require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>n", ":bn<CR>", { desc = "Go to the next buffer" })
map("n", "<leader>p", ":bp<CR>", { desc = "Go to the previous buffer" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
