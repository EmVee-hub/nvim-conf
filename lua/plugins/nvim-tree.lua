return{
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
config = function()
	local nvimtree = require("nvim-tree")
-- empty setup using defaults
require("nvim-tree").setup()
end
}
