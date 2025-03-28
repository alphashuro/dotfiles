vim.keymap.set({ 'n', 'x' }, 'grf', function()
  vim.lsp.buf.format()
end, { desc = 'vim.lsp.buf.format()' })
