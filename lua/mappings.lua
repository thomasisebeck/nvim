require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>n", ":bn<CR>", { desc = "Go to the next buffer" })
map("n", "<leader>p", ":bp<CR>", { desc = "Go to the previous buffer" })
-- map("n", "<leader>tc", ":TodoTelescope<CR>", { desc = "See all TODOs" })

local wk = require "which-key"
wk.add {
  { "<leader>tc", { icon = "" } },
}

-- TEST: this function
-- TODO: learn tags
-- BUG: fix me
-- NOTE: informative note
-- FAIL: this test failed
-- PASS: this test passed
