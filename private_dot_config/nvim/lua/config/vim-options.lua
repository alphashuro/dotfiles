vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- use spaces for tabs
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- show line numbers
vim.opt.number = true

-- load project-local .nvim.rc
-- `:h exrc`
vim.opt.exrc = true

-- enable rounded borders in floating windows?
vim.o.winborder = 'rounded'

-- save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- more intuitive splits
-- by default, the split opens in your current window position,
-- and you get pushed out to the split
-- this keeps you in place
-- opening the split in the new split position instead
vim.opt.splitright = true
vim.opt.splitbelow = true

-- show 'unfortunate' space chars
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- `:help 'confirm'`
vim.opt.confirm = true

