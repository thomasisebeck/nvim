-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

require "lspconfig"

local servers = { "clangd", "ts_ls", "tailwindcss", "eslint", "lua_ls", "pyright", "cssls" }

vim.lsp.enable(servers)
