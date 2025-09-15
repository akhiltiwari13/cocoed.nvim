-- Enhanced Python development configuration
return {
  -- Better virtual environment management
  -- { 'AckslD/swenv.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = {} },
  {
    'AckslD/swenv.nvim',
    ft = 'python',
    config = function()
      require('swenv').setup {
        get_venvs = function(venvs_path)
          return require('swenv.api').get_venvs(venvs_path)
        end,
        venvs_path = vim.fn.expand '~/venvs',
        post_set_venv = function()
          vim.cmd 'LspRestart'
        end,
      }

      vim.keymap.set('n', '<leader>pv', '<cmd>lua require("swenv.api").pick_venv()<CR>', { desc = '[P]ython [V]env' })
    end,
  },

  { 'Silletr/LazyDeveloperHelper', config = function() end },
  -- Enhanced Python REPL
  {
    'Vigemus/iron.nvim',
    ft = 'python',
    config = function()
      local iron = require 'iron.core'
      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            python = {
              command = { 'ipython' },
              format = require('iron.fts.common').bracketed_paste,
            },
          },
          repl_open_cmd = require('iron.view').bottom(40),
        },
        keymaps = {
          send_motion = '<space>ps',
          visual_send = '<space>ps',
          send_file = '<space>pf',
          send_line = '<space>pl',
          send_mark = '<space>pm',
          toggle_repl = '<space>pt',
          interrupt = '<space>pi',
        },
      }
    end,
  },

  -- Python testing support
  {
    'nvim-neotest/neotest',
    ft = 'python',
    dependencies = {
      'nvim-neotest/neotest-python',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            dap = { justMyCode = false },
            args = { '--log-level', 'DEBUG' },
            runner = 'pytest',
            python = '.venv/bin/python',
          },
        },
      }

      -- Test keymaps
      vim.keymap.set('n', '<leader>tn', '<cmd>lua require("neotest").run.run()<CR>', { desc = '[T]est [N]earest' })
      vim.keymap.set('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { desc = '[T]est [F]ile' })
      vim.keymap.set('n', '<leader>to', '<cmd>lua require("neotest").output.open()<CR>', { desc = '[T]est [O]utput' })
    end,
  },

  -- Enhanced Python formatting and linting
  {
    'nvimtools/none-ls.nvim',
    ft = 'python',
    config = function()
      local null_ls = require 'null-ls'
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup {
        sources = {
          -- Use ruff for both linting and formatting (faster than black + isort)
          formatting.ruff.with {
            extra_args = { '--fix', '--extend-select', 'I' },
          },
          diagnostics.ruff,
          -- Type checking with mypy
          diagnostics.mypy.with {
            extra_args = { '--python-executable', vim.fn.exepath 'python' },
          },
        },
      }
    end,
  },
}
