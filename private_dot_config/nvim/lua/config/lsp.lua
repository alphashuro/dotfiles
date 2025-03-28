-- :h lsp

vim.lsp.enable({'lua_ls'})

-- enable virtual diagnostics
vim.diagnostic.config({
  -- virtual_text = {
  --   current_line = true,
  -- },

  virtual_lines = {
    current_line = true,
  }
})

-- autocompletion
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

-- prevent autocompletion from auto-inserting text
vim.cmd("set completeopt+=noselect")

