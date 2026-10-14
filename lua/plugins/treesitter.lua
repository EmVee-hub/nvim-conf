return {
	"nvim-treesitter/nvim-treesitter",
	-- legacy branch; `main` is an incompatible rewrite with a different API
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "yaml", "lua", "go" },
		sync_install = true,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
	},
}
