return {
  'nvim-treesitter/nvim-treesitter',
  opt = {
    ensure_installed = { "c", "lua", "markdown", "markdown_inline", "java" }
  },
  sync_install = false,
  auto_install = true,
  build = ':TSUpdate',
  highlight = {
    enable = true,
  }
}

