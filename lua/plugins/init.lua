return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
    init = function()
      vim.g.VM_silent_exit = 1

      vim.g.VM_show_warnings = 0
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
        ["Find Next"] = "<C-n>",
      }
    end,
  },
  {
    -- NB: need to run
    -- rustup component add rust-analyzer
    "mrcjkb/rustaceanvim",
    version = "^9", -- Keeps you updated without breaking changes
    lazy = false,
    config = function()
      require "configs.rustacenvim"
    end,
  },
  {
    "ziglang/zig.vim",
    init = function()
      -- Disable format-on-save from zig.vim
      -- we'll let the LSP handle it
      vim.g.zig_fmt_autosave = 0
    end,
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
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
      "williamboman/mason.nvim",
    },
    config = function()
      require "configs.dap-ui"
    end,
  },

  -- flutter stuff
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require "configs.flutter-tools"
    end,
  },
  {
    "dart-lang/dart-vim-plugin",
  },
  {
    "tronikelis/conflict-marker.nvim",
    config = function()
      require "configs.git-conflict-marker"
    end,
    lazy = false,
  },
  {
    "artemave/workspace-diagnostics.nvim",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
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
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {},
  },
  { "neovim/nvim-lspconfig" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "rust",
        "toml",
        "javascript",
        "typescript",
        "tsx",
        "python",
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
  { "neoclide/coc.nvim", branch = "release" },
  {
    "prettier/vim-prettier",
    run = "yarn install --frozen-lockfile --production",
    ft = { "javascript", "typescript", "css", "scss", "json", "graphql", "markdown", "vue", "yaml", "html" },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascriptreact",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
