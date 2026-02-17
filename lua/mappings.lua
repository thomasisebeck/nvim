require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>n", ":bn<CR>", { desc = "Go to the next buffer" })
map("n", "<leader>p", ":bp<CR>", { desc = "Go to the previous buffer" })
map("n", "<leader>ca", "<Plug>(coc-codeaction-cursor)", { desc = "LSP Code Action", remap = true })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action", remap = true })

local wk = require "which-key"

wk.add {
  {
    "<leader>d",
    group = "Debugger",
    nowait = true,
    remap = false,
  },
  {
    "<leader>dt",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "Toggle Breakpoint",
    nowait = true,
    remap = false,
  },
  {
    "<leader>dh",
    function()
      require("dap.ui.widgets").hover()
    end,
    desc = "Hover variable",
    nowait = true,
    remap = false,
  },

  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "Continue",
    nowait = true,
    remap = false,
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "Step Into",
    nowait = true,
    remap = false,
  },
  {
    "<leader>do",
    function()
      require("dap").step_over()
    end,
    desc = "Step Over",
    nowait = true,
    remap = false,
  },
  {
    "<leader>du",
    function()
      require("dap").step_out()
    end,
    desc = "Step Out",
    nowait = true,
    remap = false,
  },
  {
    "<leader>dr",
    function()
      require("dap").repl.open()
    end,
    desc = "Open REPL",
    nowait = true,
    remap = false,
  },
  {
    "<leader>dl",
    function()
      require("dap").run_last()
    end,
    desc = "Run Last",
    nowait = true,
    remap = false,
  },
  {
    "<leader>dq",
    function()
      require("dap").terminate()
      require("dapui").close()
      require("nvim-dap-virtual-text").toggle()
    end,
    desc = "Terminate",
    nowait = true,
    remap = false,
  },
  {
    "<leader>db",
    function()
      require("dap").list_breakpoints()
    end,
    desc = "List Breakpoints",
    nowait = true,
    remap = false,
  },
  {
    "<leader>de",
    function()
      require("dap").set_exception_breakpoints { "all" }
    end,
    desc = "Set Exception Breakpoints",
    nowait = true,
    remap = false,
  },
}

wk.add {
  { "<leader>tc", { icon = "" } },
}

wk.add {
  { "<leader>s", group = "Diagnostics" },
  { "<leader>sr", icon = "⟲" },
  { "<leader>sd", icon = "🐞" },
  { "<leader>sa", icon = "" },
  { "<leader>sl", icon = "" },
  { "<leader>sc", icon = "␥" },
}

local diagnostics = require "configs.trigger_diagnostics"

map("n", "<leader>sr", diagnostics.trigger_workspace_diagnostics, {
  desc = "Refresh workspace diagnostics",
  silent = true,
})
map("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", {
  desc = "Open diagnostics",
  silent = true,
})

map("n", "<leader>sc", function()
  local folders = vim.lsp.buf.list_workspace_folders()
  if #folders == 0 then
    vim.notify("No workspace folders to clear.", vim.log.levels.INFO)
    return
  end
  for _, folder in ipairs(folders) do
    vim.lsp.buf.remove_workspace_folder(folder)
  end
  vim.notify("Cleared all workspace folders.", vim.log.levels.INFO)
end, { desc = "Clear workspaces" })

-- Add current folder to workspace (safely)
map("n", "<leader>sa", function()
  local cwd = vim.fn.getcwd()
  local folders = vim.lsp.buf.list_workspace_folders()

  -- normalize cwd (resolve symbolic links, remove trailing slash)
  cwd = vim.loop.fs_realpath(cwd) or cwd

  -- prevent duplicates
  for _, f in ipairs(folders) do
    if vim.loop.fs_realpath(f) == cwd then
      vim.notify("Workspace folder already added: " .. cwd, vim.log.levels.INFO)
      return
    end
  end

  vim.lsp.buf.add_workspace_folder(cwd)
  vim.notify("Added workspace folder: " .. cwd, vim.log.levels.INFO)
end, { desc = "Add current folder to workspace" })

map("n", "<leader>sl", function()
  -- 1. Get the list of workspace folders (which may contain duplicates)
  local folders = vim.lsp.buf.list_workspace_folders() or {}

  -- 2. Create a new table to store unique folders
  local unique_folders = {}
  local seen = {} -- A set (table used as a set) to track unique paths

  for _, folder in ipairs(folders) do
    -- Check if we've already seen this folder path
    if not seen[folder] then
      -- If it's new, add it to our unique list and mark it as seen
      table.insert(unique_folders, folder)
      seen[folder] = true
    end
  end

  -- 3. Print the de-duplicated list
  print(vim.inspect(unique_folders))
end, { desc = "List diagnostics folders" })

-- TEST: this function
-- TODO: learn tags
-- BUG: fix me
-- NOTE: informative note
-- FAIL: this test failed
-- PASS: this test passed
