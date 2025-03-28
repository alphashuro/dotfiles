-- a fuzzy finder

return {
  "ibhagwan/fzf-lua",
  opts = {},
  init = function()
    local fzf = require('fzf-lua')
    local set = vim.keymap.set

    set('n', '<leader>b', fzf.buffers, { desc = "find buffer" })
    set('n', '<leader><leader>', fzf.files, { desc = "find file" })
    set('n', '<leader>ft', fzf.treesitter, { desc = "treesitter symbols" })
    set('n', '<leader>cs', fzf.lsp_document_symbols, { desc = "document symbols" })
    set('n', '<leader>cS', fzf.lsp_workspace_symbols, { desc = "workspace symbols" })
    set('n', '<leader>/', fzf.live_grep_native, { desc = "live grep" })
    set('n', '<leader>f?', fzf.builtin, { desc = "fzf commands" })
    set('n', '<leader>?', fzf.commands, { desc = "commands" })

    -- augment file completion
    set(
      "i",
      "<C-x><C-f>",
      function()
        fzf.complete_file({
          cmd = "rg --files",
          winopts = { preview = { hidden = true } }
        })
      end,
      { silent = true, desc = "Fuzzy complete file" }
    )
  end,
}
