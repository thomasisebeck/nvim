require "nvchad.options"

local o = vim.opt

o.clipboard = "unnamed,unnamedplus"

-- remove me!
vim.deprecate = function() end

local cmp = require "cmp"
-- hi

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

-- add x-clip, NB: need to install xclip on windows!
-- winget install --id=FelipeSantos.ClipboardSync  -e
vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}
