return {
  "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-jdtls",
    { "mason-org/mason.nvim", opts = {} },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = { "sonarlint-language-server", "jdtls" },
        run_on_start = true,
      },
    },
  },
  config = function()
    local analyzers = vim.fn.stdpath("data") .. "/mason/share/sonarlint-analyzers"

    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          "-stdio",
          "-analyzers",
          analyzers .. "/sonargo.jar",
          analyzers .. "/sonarpython.jar",
          analyzers .. "/sonarjava.jar",
        },
      },
      filetypes = { "go", "python", "java" },
    })
  end,
}
