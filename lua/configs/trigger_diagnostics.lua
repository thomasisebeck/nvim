local M = {}

function M.trigger_workspace_diagnostics()
  local clients = vim.lsp.get_clients()

  for _, client in ipairs(clients) do
    -- Get workspace folders for this client
    local workspaces = client.config.workspace_folders or {}
    if #workspaces > 0 then
      for _, ws in ipairs(workspaces) do
        local folder = ws.name or ws.uri or ws
        vim.notify("Running workspace diagnostics for: " .. folder, vim.log.levels.INFO)
      end
    end

    -- Iterate through *all open buffers* that belong to this client
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) and vim.lsp.buf_is_attached(buf, client.id) then
        require("workspace-diagnostics").populate_workspace_diagnostics(client, buf)
      end
    end
  end

  vim.notify("Workspace diagnostics triggered for all buffers ✅", vim.log.levels.INFO)
end

return M
