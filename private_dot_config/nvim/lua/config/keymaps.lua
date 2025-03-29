local set = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
set('n', '<esc>', '<cmd>nohlsearch<cr>')

-- TODO: find out if I can replace this
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- lsp
set({ 'n', 'x' }, 'grf', vim.lsp.buf.format, { desc = 'lsp format' })
set({ 'n', 'x' }, 'grd', vim.lsp.buf.definition, { desc = 'go to definition' })
set({ 'n', 'x' }, 'grD', vim.lsp.buf.declaration, { desc = 'go to declaration' })
set({ 'n', 'x' }, 'grt', vim.lsp.buf.type_definition, { desc = 'go to type definition' })
set({ 'n', 'x' }, 'grci', vim.lsp.buf.incoming_calls, { desc = 'incoming calls' })
set({ 'n', 'x' }, 'grco', vim.lsp.buf.outgoing_calls, { desc = 'outgoing calls' })
set({ 'n', 'x' }, 'grs', vim.lsp.buf.signature_help, { desc = 'signature help' })
-- better lsp bindings
set({ 'n', 'x' }, 'cr', vim.lsp.buf.rename, { desc = 'rename' })
set({ 'n', 'x' }, 'cf', vim.lsp.buf.format, { desc = 'format' })

-- tabs
set('n', '<leader><tab>]', ':tabnext<cr>', { desc = 'next tab' })
set('n', '<leader><tab>[', ':tabprevious<cr>', { desc = 'previous tab' })
set('n', '<leader><tab>n', ':tabnew<cr>', { desc = 'new tab' })
set('n', '<leader><tab>d', ':tabclose<cr>', { desc = 'close tab' })

-- easier keymap for exiting term window
set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Exit terminal mode' })

