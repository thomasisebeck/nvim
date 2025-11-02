return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },

    opts = {}, -- your configuration
  },
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup {
        -- your tmux.nvim settings here (optional)
      }

      -- Keybindings for resizing tmux panes
      -- Use control and arrows
      vim.keymap.set("n", "<C-h>", [[<cmd>lua require("tmux").resize_left()<CR>]], { silent = true })
      vim.keymap.set("n", "<C-j>", [[<cmd>lua require("tmux").resize_bottom()<CR>]], { silent = true })
      vim.keymap.set("n", "<C-k>", [[<cmd>lua require("tmux").resize_top()<CR>]], { silent = true })
      vim.keymap.set("n", "<C-l>", [[<cmd>lua require("tmux").resize_right()<CR>]], { silent = true })
    end,
  },

  { "mfussenegger/nvim-dap" },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>dt",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>db",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ds",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>dl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>ds",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>dq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
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
    "Civitasv/cmake-tools.nvim",
    ft = "cmake",
    opts = {},
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
  {
    "prettier/vim-prettier",
    run = "yarn install --frozen-lockfile --production",
    ft = { "javascript", "typescript", "css", "scss", "json", "graphql", "markdown", "vue", "yaml", "html" },
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
