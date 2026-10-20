return {
  "mfussenegger/nvim-jdtls",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local root_markers = {
      "gradlew",
      "mvnw",
      "pom.xml",
      "build.gradle",
      "build.gradle.kts",
      "settings.gradle",
      "settings.gradle.kts",
      ".git",
    }

    local function start_jdtls(bufnr)
      local root_dir = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
      local workspace_dir = vim.fn.stdpath("cache")
        .. "/jdtls/"
        .. vim.fn.sha256(root_dir)

      vim.fn.mkdir(workspace_dir, "p")
      require("jdtls").start_or_attach({
        cmd = { "jdtls", "-data", workspace_dir },
        root_dir = root_dir,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function(args)
        start_jdtls(args.buf)
      end,
    })

    if vim.bo.filetype == "java" then
      start_jdtls(0)
    end
  end,
}
