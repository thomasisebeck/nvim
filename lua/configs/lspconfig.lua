require("nvchad.configs.lspconfig").defaults()

local servers = {
  vtsls = {},
  tailwindcss = {},
  eslint = {},
  lua_ls = {},
  pyright = {},
  ts_ls = {},
  cssls = {},
  cmake_language_server = {},
  clangd = {
    cmd = {
      "clangd",
      "--clang-tidy",
      "--completion-style=detailed",
      "--header-insertion=iwyu",
      "--all-scopes-completion",
      "--background-index",
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
