require("conflict-marker").setup {
  highlights = true,
  on_attach = function(conflict)
    local MID = "^=======$"
    local bufnr = conflict.bufnr or conflict.buf

    -- Navigation keymaps (Buffer-local)
    vim.keymap.set("n", "[x", function()
      vim.cmd("?" .. MID)
    end, { buffer = bufnr, desc = "Prev conflict marker" })

    vim.keymap.set("n", "]x", function()
      vim.cmd("/" .. MID)
    end, { buffer = bufnr, desc = "Next conflict marker" })

    -- Resolution keymaps (Buffer-local)
    vim.keymap.set("n", "co", function()
      conflict:choose_ours()
    end, { buffer = bufnr, desc = "Choose ours" })

    vim.keymap.set("n", "ct", function()
      conflict:choose_theirs()
    end, { buffer = bufnr, desc = "Choose theirs" })

    vim.keymap.set("n", "cb", function()
      conflict:choose_both()
    end, { buffer = bufnr, desc = "Choose both" })

    vim.keymap.set("n", "cn", function()
      conflict:choose_none()
    end, { buffer = bufnr, desc = "Choose none" })
  end,
}
