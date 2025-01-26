return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"marksman",
					"pyright",
					"rust_analyzer",
					"yamlls",
					-- "tsserver",
					-- "volar",
					"eslint",
					"bashls",
					"dockerls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local utils = require("lspconfig/util")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = {
					"go",
					"gomod",
					"gowork",
					"gotmpl",
				},
				root_dir = utils.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})

			-- This is specifically to get vue to work:
            -- Note that you need to install vue-language-server, vue-typescript-plugin, typescript, 
            --   and vue-language-services globally to get it to work and it would help to not install these through
            --   mason but instead through npm
			local typescript_plugin_path = "/$USER/.nvm/versions/node/v20.11.0/lib/@vue/typescript-plugin"
			lspconfig.tsserver.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = typescript_plugin_path,
							languages = { "vue", "javascript", "typescript" },
						},
					},
				},
				filetypes = { "vue", "typescript", "javascript", "javascriptreact", "typescriptreact" },
				capabilities = capabilities,
			})
			lspconfig.volar.setup({
				init_options = {
					typescript = {
						tsdk = "/$USER/.nvm/versions/node/v20.11.0/lib/node_modules/typescript/lib",
					},
				},
				capabilities = capabilities,
			})

			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.dockerls.setup({ capabilities = capabilities })
			vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
