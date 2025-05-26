return {
  {
    "tronikelis/conflict-marker.nvim",
    config = function()
      require("conflict-marker").setup {
        highlights = true,
        on_attach = function(conflict)
          local MID = "^=======$"

          vim.keymap.set("n", "[x", function()
            vim.cmd("?" .. MID)
          end, { buffer = conflict.bufnr })

          vim.keymap.set("n", "]x", function()
            vim.cmd("/" .. MID)
          end, { buffer = conflict.bufnr })

          vim.keymap.set("n", "co", function()
            conflict:choose_ours()
          end)
          vim.keymap.set("n", "ct", function()
            conflict:choose_theirs()
          end)
          vim.keymap.set("n", "cb", function()
            conflict:choose_both()
          end)
          vim.keymap.set("n", "cn", function()
            conflict:choose_none()
          end)
        end,
      }
    end,
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      keywords = {
        TEST = { icon = "⏲ ", color = "#b392e9", alt = { "TESTING" } },
        PASS = { icon = "✅", color = "#56d364", alt = { "PASSED" } },
        FAIL = { icon = "❎", color = "#ff7f8d" },
        TODO = { color = "#ffdf5d" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      require "configs.none-ls"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
