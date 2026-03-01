local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    html = { "prettierd" },
    css = { "prettierd" },
    cmake = { "cmake_format" },
    ts = { "prettierd" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    lsp_fallback = true,
  },
}

return options
