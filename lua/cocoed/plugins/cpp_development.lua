return {
  { 'Civitasv/cmake-tools.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = {} },
  {
    'p00f/clangd_extensions.nvim',
    version = '*',
    dependencies = {
      -- @TODO: should nvimlspconfig/ mason etc.. be added as dependencies here?
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
}
