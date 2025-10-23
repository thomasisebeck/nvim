local M = {}

function M.trigger_workspace_diagnostics()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients()

  for _, client in ipairs(clients) do
    if vim.lsp.buf_is_attached(bufnr, client.id) then
      vim.notify("Populating diagnostics for " .. client.name, vim.log.levels.INFO)
      require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
    end
  end
end

return M
