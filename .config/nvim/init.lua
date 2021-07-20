require("plugins")

vim.bo.expandtab = true                         -- Use spaces instead of tabs
vim.wo.number = true                            -- Show line numbers
vim.opt.hidden = true                           -- Enable background buffers
vim.opt.ignorecase = true                       -- Ignore case when searching
vim.opt.joinspaces = false                      -- No double spaces with join
vim.opt.list = true                             -- Show some invisible characters
vim.opt.relativenumber = true                   -- Relative line numbers
vim.opt.scrolloff = 4                           -- Lines of context when scrolling
vim.opt.shiftround = true                       -- Round indent
vim.opt.shiftwidth = 2                          -- Size of an indent
vim.opt.sidescrolloff = 8                       -- Columns of context
vim.opt.smartcase = true                        -- Do not ignore case with capitals
vim.opt.smartindent = true                      -- Insert indents automatically
vim.opt.splitbelow = true                       -- Put new windows below current
vim.opt.splitright = true                       -- Put new windows right of current
vim.opt.tabstop = 2                             -- Number of spaces tabs count for
vim.opt.wildmode = {'list', 'longest'}          -- Command-line completion mode
vim.opt.wrap = false                            -- Disable line wrap
vim.o.mouse = 'a'                               -- Enable mouse mode
vim.o.updatetime = 250                          -- Decrease update time?
vim.o.hlsearch = false                          --Set highlight on search
vim.cmd 'set wildmenu wildmode=full'
vim.g.ackprg = 'ag --nogroup --nocolor --column'

-- colorscheme options - order is important
vim.opt.termguicolors = true                    -- True color support
vim.g.gruvbox_italic = 1
vim.cmd 'colorscheme gruvbox'

-- escape term codes and keycodes in remappings
-- otherwise '<C-y' is inserted instead of Ctrl+y
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- remap space to leader
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- use jj to escape
vim.api.nvim_set_keymap('i', 'jj', t'<Esc>', {})

vim.cmd [[nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"]]

-- config for comp
-- TODO move to lua/configs/compe.lua
vim.o.completeopt = "menuone,noselect"
vim.o.inccommand = 'nosplit' -- incremental live completion
-- Compe setup
-- enable it
require('compe').setup {
  source = {
    path = true,
    nvim_lsp = true,
    luasnip = true,
    buffer = false,
    calc = false,
    nvim_lua = false,
    vsnip = false,
    ultisnips = false,
  },
}
-- set keymaps
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', {expr = true})
vim.api.nvim_set_keymap('i', '<c-e>', 'compe#close("<c-e>")', {expr = true})

-- config for lightline
--Set statusbar
vim.g.lightline = {
  colorscheme = 'gruvbox',
  active = {
    left = { { 'mode', 'paste' }, {'filename', 'gitbranch', 'modified' } },
    right = { { 'lineinfo' }, { 'percent' }, { 'filetype' } }
  },
  component_function = { gitbranch = 'fugitive#head' },
}
vim.cmd [[set noshowmode]] -- lightline shows the mode now

-- config for treesitter
-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- configure nerdtree
-- Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
-- vim.cmd [[autocmd StdinReadPre * let s:std_in=1]]
-- vim.cmd [[autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif]]
-- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
vim.cmd [[autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif]]
-- Exit Vim if NERDTree is the only window remaining in the only tab.
vim.cmd [[autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]]
-- Close the tab if NERDTree is the only window remaining in it.
vim.cmd [[autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]]
-- convenient shortcuts
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-n>', ':NERDTree<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-t>', ':NERDTreeToggle<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-f>', ':NERDTreeFind<cr>', {noremap = true})
-- nerdtree config
vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeMinimalUI = 1

-- configure telescope
vim.cmd [[
nnoremap <c-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
]]

vim.bo.expandtab = true                         -- Use spaces instead of tabs

