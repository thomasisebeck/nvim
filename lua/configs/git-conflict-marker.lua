require("conflict-marker").setup {
  highlights = true,
  on_attach = function(conflict)
    local MID = "^=======$"

    vim.keymap.set("n", "[x", function()
      vim.cmd("?" .. MID)
    end, { buffer = conflict.bufnr })

    vim.keymap.set("n", "]x", function()
      vim.cmd("/" .. MID)
    end, { buffer = conflict.bufnr })

    vim.keymap.set("n", "co", function()
      conflict:choose_ours()
    end)
    vim.keymap.set("n", "ct", function()
      conflict:choose_theirs()
    end)
    vim.keymap.set("n", "cb", function()
      conflict:choose_both()
    end)
    vim.keymap.set("n", "cn", function()
      conflict:choose_none()
    end)
  end,
}
