return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',          -- Snippet engine
    'saadparwaiz1/cmp_luasnip',  -- Snippet completions
  },
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }),
    })

    -- Ensure gopls works with nvim-cmp
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('lspconfig').gopls.setup({
      capabilities = capabilities,
    })
  end
}

