require("nvchad.configs.lspconfig").defaults()

local servers = {
  vtsls = {},
  tailwindcss = {
    filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte" },
    root_markers = {
      "package.json",
      "tailwind.config.js",
      "tailwind.config.ts",
      "postcss.config.js",
      "postcss.config.mjs",
      ".git",
    },
  },
  -- rust installed using rustacenvim
  eslint = {},
  lua_ls = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
        venvPath = ".",
        venv = ".venv",
      },
    },
  },
  ts_ls = {},
  cssls = {},
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
  -- zig
  zls = {
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    root_markers = { "zls.json", "build.zig", ".git" },
    settings = {
      zls = {
        -- Enable features like inlay hints if your LSP client supports them
        enable_inlay_hints = true,
        enable_snippets = true,
        warn_style = true,
      },
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
