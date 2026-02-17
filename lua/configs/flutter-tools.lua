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
