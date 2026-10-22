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
    open_notes_in = "hsplit",
    note_id_func = function(title)
      local slug = (title or ""):lower():gsub("[^%w]+", "-"):gsub("^%-", ""):gsub("%-$", "")
      if slug == "" then
        slug = "untitled-" .. os.date("%Y%m%d-%H%M%S")
      end

      local notes_dir = vim.fn.expand("~/proj/kms/notes")
      local id = slug
      local suffix = 2
      while vim.uv.fs_stat(notes_dir .. "/" .. id .. ".md") do
        id = slug .. "-" .. suffix
        suffix = suffix + 1
      end

      return id
    end,
    completion = {
      nvim_cmp = true,
    },
    picker = {
      name = "telescope.nvim",
    },
  },
}
