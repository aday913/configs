return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua",
				"vim",
				"javascript",
				"html",
				"css",
				"csv",
				"dockerfile",
				"bash",
				"c_sharp",
				"go",
				"markdown",
				"python",
				"rust",
				"yaml",
				"typescript",
			},
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
