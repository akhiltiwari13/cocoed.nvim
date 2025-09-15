return {
  { 'Civitasv/cmake-tools.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = {} },
  {
    'p00f/clangd_extensions.nvim',
    version = '*',
    ft = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    dependencies = {
      'neovim/nvim-lspconfig',
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
    },
    opts = {
      ast = {
        -- [[ These require codicons (https://github.com/microsoft/vscode-codicons)
        role_icons = {
          type = '',
          declaration = '',
          expression = '',
          specifier = '',
          statement = '',
          ['template argument'] = '',
        },

        kind_icons = {
          Compound = '',
          Recovery = '',
          TranslationUnit = '',
          PackExpansion = '',
          TemplateTypeParm = '',
          TemplateTemplateParm = '',
          TemplateParamObject = '',
        },
        -- }, ]]

        highlights = {
          detail = 'Comment',
        },
      },
      memory_usage = {
        border = 'none',
      },
      symbol_info = {
        border = 'none',
      },
    },
  },
  {
    {
      'L3MON4D3/LuaSnip',
      config = function()
        local ls = require 'luasnip'
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node

        ls.add_snippets('cpp', {
          s('class', {
            t 'class ',
            i(1, 'ClassName'),
            t ' {',
            t { '', 'public:' },
            t { '', '    ' },
            i(2, 'ClassName'),
            t '();',
            t { '', '    ~' },
            i(3, 'ClassName'),
            t '();',
            t { '', '', 'private:' },
            t { '', '    ' },
            i(0),
            t { '', '};' },
          }),
          s('main', {
            t '#include <iostream>',
            t { '', '', 'int main() {' },
            t { '', '    ' },
            i(0),
            t { '', '    return 0;' },
            t { '', '}' },
          }),
        })
      end,
    },
  },
}
