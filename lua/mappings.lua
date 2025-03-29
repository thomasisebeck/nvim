require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-------------------- custom mappings --------------------

map("n", "<leader>n", ":bn<CR>", { desc = "Next Buffer" })

-- map gs to git status and remove the gt
map("n", "<leader>gs", "<cmd> Telescope git_status<cr>", { desc = "Git status"})
nomap("n", "<leader>gt", { desc = "Unmap the old git status"})
