return {
  {
    "rhysd/conflict-marker.vim",
    lazy = false,
    config = function()
      vim.api.nvim_set_hl(0, "ConflictMarkerBegin", { bg = "#3f7366" })
      vim.api.nvim_set_hl(0, "ConflictMarkerOurs", { bg = "#2e5049" })
      vim.api.nvim_set_hl(0, "ConflictMarkerTheirs", { bg = "#344f69" })
      vim.api.nvim_set_hl(0, "ConflictMarkerEnd", { bg = "#2f628e" })
      vim.api.nvim_set_hl(0, "ConflictMarkerCommonAncestorsHunk", { bg = "#7548a1" })
    end,
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
