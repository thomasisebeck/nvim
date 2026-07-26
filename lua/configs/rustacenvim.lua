vim.g.rustaceanvim = {
  -- Server configuration
  server = {
    on_attach = function(client, bufnr)
      -- Native Neovim Hover (Equivalent to C-space)
      vim.keymap.set("n", "<C-space>", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })

      -- Rustaceanvim's enhanced Code Action Groups (Equivalent to Leader-a)
      vim.keymap.set("n", "<leader>a", function()
        vim.cmd.RustLsp "codeAction"
      end, { buffer = bufnr, desc = "Rust LSP Code Action" })
    end,
    default_settings = {
      -- Your custom rust-analyzer settings go here
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        procMacro = { enable = true },
      },
    },
  },
}
