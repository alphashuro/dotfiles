-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

require('packer').startup(function()
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- the successor to solarized
  use 'morhetz/gruvbox'

  -- "gc" to comment visual regions/lines
  use 'tpope/vim-commentary' 

  -- configure and enhance the built in lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- fuzzy file finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons' -- icons
    }
  }

  -- on demand language support 
  use 'sheerun/vim-polyglot'

  -- git integration
  use 'tpope/vim-fugitive'

  -- NERD TREE
  use 'scrooloose/nerdtree'

  -- editorconfig file support
  use 'editorconfig/editorconfig-vim'

  -- show git signs for added, removed and changed lines
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- fancy statusline
  use 'itchyny/lightline.vim'

  -- session management
  use 'rmagatti/auto-session'

  -- git blame
  use 'APZelos/blamer.nvim'

  -- surround magic
  use 'tpope/vim-surround'

  -- use separators , . ; : + - = ~ _ * # / | \ & $ and arguments (a) as text objects
  -- e.g. ci_ = change inner _
  use 'wellle/targets.vim' 

  -- connect to dbs from vim
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui' 

  -- move across each word in camel/snake case
  use 'bkad/CamelCaseMotion'
  
  -- distraction free writing
  use 'junegunn/goyo.vim'

  -- gleam syntax
  use 'gleam-lang/gleam.vim'
end)

require('configs/lspconfig')
