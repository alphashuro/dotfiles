-- a fuzzy finder

return {
  "ibhagwan/fzf-lua",
  opts = {},
  init = function()
    local fzf = require('fzf-lua')
    local set = vim.keymap.set

    -- ungrouped
    set('n', '<leader><leader>', fzf.files, { desc = "find file" })
    set('n', '<leader>/', fzf.live_grep_native, { desc = "live grep" })
    set('n', '<leader>:', fzf.commands, { desc = "find command" })

    -- tabs
    set('n', '<leader>f<tab>', fzf.tabs, { desc = "find tabs" })

    -- find
    set('n', '<leader>fb', fzf.buffers, { desc = "find buffer" })
    set('n', '<leader>ff', fzf.files, { desc = "find file" })
    set('n', '<leader>ft', fzf.treesitter, { desc = "find treesitter symbols" })
    set('n', '<leader>f?', fzf.builtin, { desc = "find fzf command" })
    set('n', '<leader>fw', fzf.grep_cword, { desc = "grep current word" })
    set('n', '<leader>fr', fzf.resume, { desc = "resume previous find" })

    -- code/lsp
    set('n', '<leader>cs', fzf.lsp_document_symbols, { desc = "document symbols" })
    set('n', '<leader>cS', fzf.lsp_workspace_symbols, { desc = "workspace symbols" })
    set('n', '<leader>cx', fzf.lsp_document_diagnostics, { desc = "document diagnostics" })
    set('n', '<leader>cX', fzf.lsp_workspace_diagnostics, { desc = "workspace diagnostics" })
    set('n', '<leader>cR', fzf.lsp_references, { desc = "workspace diagnostics" })
    set('n', '<leader>cd', fzf.lsp_definitions, { desc = "workspace diagnostics" })
    set('n', '<leader>cD', fzf.lsp_declarations, { desc = "workspace diagnostics" })
    set('n', '<leader>ci', fzf.lsp_implementations, { desc = "workspace diagnostics" })
    set('n', '<leader>ct', fzf.lsp_typedefs, { desc = "workspace diagnostics" })
    set('n', '<leader>ca', fzf.lsp_code_actions, { desc = "workspace diagnostics" })
    set('n', '<leader>cCi', fzf.lsp_incoming_calls, { desc = "workspace diagnostics" })
    set('n', '<leader>cCo', fzf.lsp_outgoing_calls, { desc = "workspace diagnostics" })

    -- help
    set('n', '<leader>hh', fzf.helptags, { desc = 'help tags' })
    set('n', '<leader>hk', fzf.keymaps, { desc = 'keymaps' })

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
      { silent = true, desc = "fuzzy complete file" }
    )
  end,
}
