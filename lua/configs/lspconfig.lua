local lspconfig = require "nvchad.configs.lspconfig"
lspconfig.defaults()

local servers = {
  -- lua ls set up with nvchad
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
    root_markers = { "CMakeLists.txt" },
  },
  -- zig
  zls = {
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    root_markers = { "zls.json", "build.zig" },
    settings = {
      zls = {
        -- Enable features like inlay hints if your LSP client supports them
        enable_inlay_hints = true,
        enable_snippets = true,
        warn_style = true,
        enable_build_on_save = true,
      },
    },
  },
}

for name, opts in pairs(servers) do
  -- Safely inject NvChad's default capabilities and on_init into every server config
  opts.capabilities = vim.tbl_deep_extend("force", lspconfig.capabilities, opts.capabilities or {})
  opts.on_init = opts.on_init or lspconfig.on_init

  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
