-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = true

--  Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.infercase = true -- infer cases in keyword completion

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 200

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

vim.o.cmdheight = 0 -- hide command line unless needed
-- vim.o.completeopt = { 'menu', 'menuone', 'noselect' } -- option for insert mode completion.
vim.o.fileencoding = 'utf - 8' -- file-content encoding for the buffer.
-- vim.o.fillchars = { eob = ' ' } -- Disable `~` on nonexistent lines.
vim.o.foldenable = true -- Enable fold for nvim-ufo.
vim.o.foldlevel = 99 -- start with higherst foldlevel for nvim-ufo
vim.o.foldlevelstart = 99 -- start with all code unfolded
vim.o.foldcolumn = 'auto'
vim.o.laststatus = 3
vim.o.linebreak = true -- wrap lines at 'breakat'
vim.o.smartindent = true -- smarter autoindentation
vim.o.termguicolors = true -- enable 24-bit RGB color in the TUI.
vim.o.undofile = true --enable persistent undo between session and reboots.
vim.o.shada = "!,'1000,<50,s10,h" -- remember the last 1000 opened files.
vim.o.history = 1000 -- remember these many commands in a histor table (per buffer)

-- replaced with oil.nvim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.big_file = { size = 1024 * 5000, lines = 50000 } -- For files bigger than this, disable 'treesitter' (+5Mb).
-- Theme
vim.g.default_colorscheme = 'tokyonight-night'
-- vim: ts=2 sts=2 sw=2 et
