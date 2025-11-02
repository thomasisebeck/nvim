require "nvchad.options"

local cmp = require "cmp"

cmp.setup {
  sources = cmp.config.sources {
    {
      name = "nvim_lsp",
      entry_filter = function(entry, ctx)
        return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
      end,
    },
  },
}
