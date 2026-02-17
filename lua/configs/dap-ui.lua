local mason_dap = require "mason-nvim-dap"
local dap = require "dap"
local ui = require "dapui"
local dap_virtual_text = require "nvim-dap-virtual-text"

-- Dap Virtual Text
dap_virtual_text.setup()

mason_dap.setup {
  ensure_installed = { "codelldb" },
  automatic_installation = true,
  handlers = {
    function(config)
      require("mason-nvim-dap").default_setup(config)
    end,
  },
}

dap.adapters.codelldb = {
  type = "executable",
  command = vim.fn.expand "$HOME" .. "/.local/share/nvim/mason/bin/codelldb",
}

dap.configurations.cpp = {
  {
    name = "Launch Practice",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.getcwd() .. "/build/out"
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {}, -- Add any command line args here if needed
  },
}

-- Apply the same config to C and Rust
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- Dap UI
ui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

dap.listeners.before.attach.dapui_config = function()
  ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end
