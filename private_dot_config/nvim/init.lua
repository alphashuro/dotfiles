-- use spaces for tabs
-- `:h expandtab`
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- load project-local .nvim.rc
-- `:h exrc`
vim.opt.exrc = true

-- lsp
-- `:h lsp`
vim.lsp.enable({'luals'})

-- lsp autocompletion
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

-- enable rounded borders in floating windows?
vim.o.winborder = 'rounded'

-- enable virtual diagnostics
vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  }
})


