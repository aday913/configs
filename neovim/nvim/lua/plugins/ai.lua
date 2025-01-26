return {
	{
		"dpayne/CodeGPT.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("codegpt.config")
			vim.keymap.set("n", "<leader>ai", ":Chat <cr>")
			vim.g["codegpt_commands_defaults"] = {
				["completion"] = {
					model = "gpt-4-turbo-preview",
				},
				["code_edit"] = {
					model = "gpt-4-turbo-preview",
				},
			}
		end,
	},
}
