-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "ts_ls", "tailwindcss", "eslint", "lua_ls", "pyright", "cssls", "rust-analyzer", "zls" }

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.enable(servers)
