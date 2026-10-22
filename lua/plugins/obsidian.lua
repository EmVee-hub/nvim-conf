return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "kms",
        path = vim.fn.expand("~/proj/kms"),
      },
    },
    notes_subdir = "notes",
    new_notes_location = "notes_subdir",
    completion = {
      nvim_cmp = true,
    },
    picker = {
      name = "telescope.nvim",
    },
  },
}
