return {
  'nvim-treesitter/nvim-treesitter',
  opt = {
    ensure_installed = { "lua", "markdown", "markdown_inline" }
  },
  sync_install = false,
  auto_install = true,
  build = ':TSUpdate'
}

