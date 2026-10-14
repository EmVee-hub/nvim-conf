return {
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    -- Advertise nvim-cmp completion capabilities to every server
    vim.lsp.config('*', {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })

    vim.lsp.enable({ 'yamlls', 'helm_ls', 'gopls', 'pyright' })
  end,
}
