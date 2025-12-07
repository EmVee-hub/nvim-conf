return{
"nvim-treesitter/nvim-treesitter", 
branch = "main",
build = ":TSUpdate",
config = function()
require'nvim-treesitter'.setup {
	ensure_installed = {"yaml", "lua", "go"},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	}
}
end

}

