
---------- install mini.nvim
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.nvim",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps'
require("mini.deps").setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  vim.o.termguicolors = true
  vim.cmd("colorscheme minischeme")

end)

now(function()
  require("mini.basics").setup({
    options = {
      extra_ui = true
    }
  })
  require("mini.notify").setup()
  vim.notify = require("mini.notify").make_notify()
  require("mini.icons").setup()
  require("mini.tabline").setup()
  require("mini.statusline").setup()
  -- require("mini.base16").setup()
  require("mini.align").setup()
  require("mini.clue").setup()

  MiniClue.setup({
    triggers = {
      -- Leader triggers
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },

      -- Built-in completion
      { mode = 'i', keys = '<C-x>' },

      -- `g` key
      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },

      -- Marks
      { mode = 'n', keys = "'" },
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },

      -- Registers
      {mode = 'n', keys = '"'},
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },

      -- Window commands
      { mode = 'n', keys = '<C-w>' },

      -- `z` key
      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },
    },

    clues = {
      -- Enhance this by adding descriptions for <Leader> mapping groups
      MiniClue.gen_clues.builtin_completion(),
      MiniClue.gen_clues.g(),
      MiniClue.gen_clues.marks(),
      MiniClue.gen_clues.registers(),
      MiniClue.gen_clues.windows(),
      MiniClue.gen_clues.z(),
      { mode = 'n', keys = '<Leader>c', desc = "Code" },
      { mode = 'n', keys = '<Leader>f', desc = "Files" },
      { mode = 'n', keys = '<Leader><Tab>', desc = 'Tabs'},
      { mode = 'n', keys = '<Leader>d', desc = 'Debug'},
      { mode = 'n', keys = '<Leader>g', desc = 'Git'},
      { mode = 'n', keys = '<Leader>t', desc = 'Toggle'}
    },

    window = {
      delay = 0,
      config = {
        width = 'auto',
      }
    }
  })
  require("mini.diff").setup()
  require("mini.extra").setup()
  require("mini.files").setup({
    mappings = {
      go_in_plus = '<CR>'
    },
    options = {
      use_as_default_explorer = false,
    }
  })
  require("mini.git").setup()
  local hipatterns = require("mini.hipatterns")
  hipatterns.setup({
    highlighters = {
      fixme = MiniExtra.gen_highlighter.words({ 'FIXME', 'fixme' }, 'MiniHipatternsFixme'),
      todo = MiniExtra.gen_highlighter.words({ 'TODO', 'todo' }, 'MiniHipatternsTodo'),
      note = MiniExtra.gen_highlighter.words({ 'NOTE', 'note' }, 'MiniHipatternsNote'),

      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
  require("mini.jump").setup()
  require("mini.jump2d").setup()
  require("mini.move").setup()
  require("mini.operators").setup()
  require("mini.sessions").setup()
  require("mini.test").setup()
  require("mini.trailspace").setup()
  require("mini.visits").setup()
  require("mini.bracketed").setup()
  require("mini.indentscope").setup()
  require("mini.splitjoin").setup()
  require("mini.ai").setup({
    custom_textobjects = {
      B = MiniExtra.gen_ai_spec.buffer(),
      D = MiniExtra.gen_ai_spec.diagnostic(),
      I = MiniExtra.gen_ai_spec.indent(),
      L = MiniExtra.gen_ai_spec.line(),
      N = MiniExtra.gen_ai_spec.number(),
    },
  })
  require("mini.comment").setup()
  require("mini.pick").setup()
  require("mini.surround").setup()
  require("mini.trailspace").setup()
  local minimap = require("mini.map")
  minimap.setup({
    integrations = {
      minimap.gen_integration.builtin_search(),
      minimap.gen_integration.diff(),
      minimap.gen_integration.diagnostic(),
      minimap.gen_integration.gitsigns(),
    }
  })
  minimap.open()

  add({
    source = "nvim-treesitter/nvim-treesitter",
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })

  require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vimdoc", "org", "markdown", "markdown_inline" },
    auto_install = true,
    highlight = {
      enable = true,
    },
    modules = {},
    sync_install = false,
    ignore_install = {"org"}
  })

  add({
    source = 'simnalamburt/vim-mundo',
    hooks = {
      post_checkout = function()
      end,
    }
  })

  vim.keymap.set('n', '\\u', ':MundoToggle<CR>', { desc = 'Toggle undo tree' })
  vim.keymap.set('n', '<Leader>tu', ':MundoToggle<CR>', { desc = 'Toggle undo tree' })

  add({
    source = 'NeogitOrg/neogit',
    depends = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-tree/nvim-web-devicons',
      "ibhagwan/fzf-lua",
    },
  })
  require('neogit').setup {
    integrations = {
      diffview = true,
      fzf_lua = true,
    }
  }

  vim.keymap.set({ 'n', 'x', 'o' }, '<Leader>gg', ':Neogit<CR>', { desc = 'Git status' })

  add({ source = 'purescript-contrib/purescript-vim', })

  add({ source = 'nvim-orgmode/orgmode', })

  local orgmode = require('orgmode')
  orgmode.setup({
    org_agenda_files = '~/Documents/notes',
    org_default_notes_file = '~/Documents/notes/notes.org',
    mappings = {
      org = {
        org_do_promote = false,
        org_do_demote = false,
      }
    }
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
      vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
        silent = true,
        buffer = true,
      })
    end,
  })

  add({ source = 'stevearc/oil.nvim', })

  require("oil").setup({
    watch_for_changes = true,
  })

  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

  add({
    source = 'xvzc/chezmoi.nvim',
    depends = {
      'nvim-lua/plenary.nvim',
    }
  })

  require("chezmoi").setup({})

  -- automatically apply changes on files under chezmoi source path
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
    callback = function()
      vim.schedule(require("chezmoi.commands.__edit").watch)
    end,
  })
end)

-- lsp
later(function()
  add({
    source = "neovim/nvim-lspconfig",
    depends = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "j-hui/fidget.nvim",
      "folke/lazydev.nvim"
    },
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local servers = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = {'vim'}
          },
          completion = {
            callSnippet = 'Replace',
          },
          -- diagnostics = { disable = { 'missing-fields' } },
        },
      },
    },
  }
  require('mason').setup()

  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, {
    'stylua', -- Used to format Lua code
  })

  require('mason-tool-installer').setup({
    ensure_installed = ensure_installed
  })
  require('mason-lspconfig').setup({
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        require('lspconfig')[server_name].setup(server)
      end
    }
  })
  require("fidget").setup({})
  require("lazydev").setup()

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-mappings-attach', { clear = true }),
    callback = function(event)
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = '' .. desc })
      end
      local mapl = function(keys, func, desc)
        map('<Leader>' .. keys, func, desc)
      end

      local lspick = MiniExtra.pickers.lsp
      local lspope = function(scope)
        return function() lspick({ scope = scope }) end
      end

      mapl('cd', lspope('definition'), 'Definition')
      mapl('cD', lspope('declaration'), 'Declaration')
      mapl('cs', lspope('document_symbol'), 'Symbol')
      mapl('ci', lspope('implementation'), 'Implementation')
      mapl('cR', lspope('references'), 'References')
      mapl('ct', lspope('type_definition'), 'Type definition')
      mapl('cS', lspope('workspace_symbol'), 'Workspace symbol')
    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('lsp-mappings-detach', { clear = true }),
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })

    end
  })

  vim.diagnostic.config({
    virtual_text = true,
    float = {
      source = 'if_many',
    },
  })
end)

-- debug adapter
later(
function()
  add({
    source = 'mfussenegger/nvim-dap',
    depends = {
      -- Creates a beautiful debugger UI
      'rcarriga/nvim-dap-ui',

      -- Required dependency for nvim-dap-ui
      'nvim-neotest/nvim-nio',

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- Add your own debuggers here
      'leoluz/nvim-dap-go',
    },
    hooks = {}
  })

  local dap = require 'dap'
  local dapui = require 'dapui'

  require('mason-nvim-dap').setup {
    automatic_installation = true,
    ensure_installed = {
      'node2',
    },
  }

  vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Start/Continue' })
  vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step Into' })
  vim.keymap.set('n', '<leader>dn', dap.step_over, { desc = 'Debug: Step Over' })
  vim.keymap.set('n', '<leader>do', dap.step_out, { desc = 'Debug: Step Out' })
  vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
  vim.keymap.set(
  'n',
  '<leader>dB',
  function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end,
  { desc = 'Debug: Set Breakpoint' }
  )
  vim.keymap.set('n', '<leader>dl', dapui.toggle, { desc = 'Debug: See last session result.' })

  dap.listeners.after.event_initialized['dapui_config'] = dapui.open
  dap.listeners.before.event_terminated['dapui_config'] = dapui.close
  dap.listeners.before.event_exited['dapui_config'] = dapui.close
end)

local nmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end
local xmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('x', '<Leader>' .. suffix, rhs, { desc = desc })
end

-- mappings
-- buffers
nmap_leader('bb', MiniPick.builtin.buffers, 'Find buffer')

-- tabs
nmap_leader('<Tab>n', '<CMD>tabnew<CR>', 'New tab')
nmap_leader('<Tab>d', '<CMD>tabclose<CR>', 'Close tab')
nmap_leader('<Tab>]', '<CMD>tabnext<CR>', 'Next tab')
nmap_leader('<Tab>[', '<CMD>tabprevious<CR>', 'Previous tab')

-- code mappings
nmap_leader('cf', vim.lsp.buf.format,     'Format')
nmap_leader('cr', vim.lsp.buf.rename,     'Rename')
nmap_leader('cR', vim.lsp.buf.references, 'References')
nmap_leader('cci', vim.lsp.buf.incoming_calls,     'Incoming calls')
nmap_leader('cco', vim.lsp.buf.outgoing_calls, 'Outgoing calls')
vim.keymap.set('n', 'ch', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
nmap_leader('cX', MiniExtra.pickers.diagnostic, 'Diagnostics')
nmap_leader('cx', vim.diagnostic.open_float, 'Diagnostics')
nmap_leader('ca', vim.lsp.buf.code_action, 'Actions')

-- file mappings
nmap_leader('ff', MiniPick.builtin.files, 'Fuzzy file finder')
nmap_leader(' ', MiniPick.builtin.files, 'Fuzzy file finder')
nmap_leader('/', MiniPick.builtin.grep_live, 'Live grep in all files')
nmap_leader('f/', MiniPick.builtin.grep_live, 'Live grep in all files')

-- debugger keymaps are set in plugin hooks

-- git mappings
nmap_leader('gb', MiniExtra.pickers.git_branches, 'Change git branch')

-- toggle mappings
nmap_leader('tm', MiniMap.toggle, 'Toggle minimap')
nmap_leader('tr', '<CMD>source $MYVIMRC<CR>', 'Reload config')
nmap_leader('tw', '<CMD>setlocal wrap! wrap?<CR>', 'Toggle word wrap')
nmap_leader('ts', '<CMD>setlocal spell! spell?<CR>', 'Toggle spell')
nmap_leader('tb', '<Cmd>lua vim.o.bg = vim.o.bg == "dark" and "light" or "dark"; print(vim.o.bg)<CR>', 'Toggle background')
nmap_leader('tl', '<CMD>setlocal list! list?<CR>', 'Toggle list')
nmap_leader('th', '<Cmd>let v:hlsearch = 1 - v:hlsearch | echo (v:hlsearch ? "  " : "no") . "hlsearch" | :lua MiniMap.refresh()<CR>', 'Toggle search highlight')
nmap_leader('td', '<Cmd>lua print(MiniBasics.toggle_diagnostic())<CR>', 'Toggle diagnostic')

-- other leader mappings
nmap_leader('ft', MiniFiles.open, 'Open file tree')
nmap_leader('?', MiniExtra.pickers.commands, 'Command me')
nmap_leader('*', function() MiniExtra.pickers.buf_lines({ scope = 'current' }) end, 'Find in buffer')

-- other mappings
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })

-- neovide settings
if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<C-R>+') -- Paste insert mode

  vim.g.neovide_refresh_rate = 120

  vim.o.guifont = 'SF Mono:h14'
end

-- Use spaces rather than tabs
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.exrc = true
