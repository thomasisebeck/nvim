return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup {
        options = {
          multilines = {
            enabled = true,
          },
        },
      }
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
  },
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

  -- flutter stuff
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup {

        debugger = {
          -- make these two params true to enable debug mode
          enabled = false,
          run_via_dap = false,
          register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.stdpath "data" .. "/mason/bin/dart-debug-adapter",
              args = { "flutter" },
            }

            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = "home/flutter/bin/cache/dart-sdk/",
                flutterSdkPath = "home/flutter",
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
            }
          end,
        },
        dev_log = {
          -- toggle it when you run without DAP
          enabled = false,
          open_cmd = "tabedit",
        },
        lsp = {
          on_attach = require("lvim.lsp").common_on_attach,
          capabilities = require("lvim.lsp").default_capabilities,
        },
      }
    end,
  },

  {
    "dart-lang/dart-vim-plugin",
  },
  { "mfussenegger/nvim-dap" },
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
    "artemave/workspace-diagnostics.nvim",
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
        "zig",
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
