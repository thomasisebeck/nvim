require("nvchad.configs.lspconfig").defaults()

local servers = {
  vtsls = {},
  tailwindcss = {},
  eslint = {},
  lua_ls = {},
  pyright = {},
  cssls = {},
  clangd = {
    cmd = {
      "clangd",
      "--clang-tidy",
      "--completion-style=detailed",
      "--header-insertion=never",
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
