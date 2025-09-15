return {
	{ -- Collection of various small independent plugins/modules
		'echasnovski/mini.nvim',
		config = function()
			-- This is a great add-on plugin to neovim/vim as it provides better text objects.
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require('mini.ai').setup {
				n_lines = 500,
				opts = {
					custom_textobjects = {
						s = { '%[%[().-()%]%]' },
						-- F = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
					},
				},
			}

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  sd [S]urround [R]eplace [)] [']
			require('mini.surround').setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require 'mini.statusline'
			-- set use_icons to true if you have a Nerd Font
			statusline.setup { use_icons = vim.g.have_nerd_font }

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return '%2l:%-2v'
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
			require('mini.animate').setup()
			require('mini.basics').setup()
			require('mini.bracketed').setup()
			require('mini.comment').setup()
			require('mini.cursorword').setup()
			require('mini.extra').setup()
			require('mini.files').setup()
			require('mini.hipatterns').setup()
			require('mini.misc').setup()
			require('mini.operators').setup()
			require('mini.sessions').setup()
			require('mini.visits').setup()
			require('mini.colors').setup()
		end,
	},
}
