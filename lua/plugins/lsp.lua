local cmd = require("helpers.misc").cmd

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

return {
	{
		"williamboman/mason.nvim",
		opts = {
			auto_focus = true,
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- Lua
				"lua-language-server",
				"stylua",

				-- Toml
				"taplo",

				-- Yaml
				"yaml-language-server",

				-- Docker
				"dockerfile-language-server",
				"docker-compose-language-service",
				"hadolint",

				-- Markdown
				"marksman",

				-- SQL
				"sqls",

				-- Misc/Multi
				"prettierd",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt", lsp_format = "fallback" },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
		keys = {
			{
				"<Leader>lf",
				cmd "Format",
				desc = "Format buffer",
			},
		},
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		keys = {
			{
				"<Leader>lrb",
				cmd "debuggables",
				desc = "Open debuggables",
			},
			{
				"<Leader>lrR",
				cmd "RustLsp runnables",
				desc = "Open runnables",
			},
			{
				"<Leader>lrD",
				cmd "RustLsp openDocs",
				desc = "Open docs.rs for selected item",
			},
			{
				"<Leader>lru",
				cmd "RustLsp moveItem up",
				desc = "Move item up",
			},
			{
				"<Leader>lrd",
				cmd "RustLsp moveItem down",
				desc = "Move item down",
			},
			{
				"<Leader>lrj",
				cmd "RustLsp joinLines",
				desc = "Join lines",
			},
			{
				"<Leader>lra",
				cmd "RustLsp codeAction",
				desc = "Perform code action on selected item",
			},
			{
				"<Leader>lre",
				cmd "RustLsp explainError",
				desc = "Explain errors",
			},
			{
				"<Leader>lrC",
				cmd "RustLsp openCargo",
				desc = "Open Cargo.toml",
			},
			{
				"<Leader>lrr",
				cmd "RustLsp ssr",
				desc = "Structural find and replace",
			},
			{
				"<Leader>lrt",
				cmd "RustLsp syntaxTree",
				desc = "View syntax tree",
			},
			{
				"<Leader>lrc",
				cmd "RustLsp flyCheck",
				desc = "Run cargo check",
			},
		},
	},
	{
		"saecki/crates.nvim",
		event = "BufRead Cargo.toml",
		tag = "stable",
		opts = {
			completion = {
				cmp = {
					enabled = true,
				},
			},
		},
		keys = {
			{
				"<Leader>lcv",
				cmd "Crates show_versions_popup",
				desc = "Show avalible versions",
			},
			{
				"<Leader>lcf",
				cmd "Crates show_features_popup",
				desc = "Show avalible features",
			},
			{
				"<Leader>lcu",
				cmd "Crates update_crates",
				desc = "Update selected crate",
			},
			{
				"<Leader>lcU",
				cmd "Crates update_all_crates",
				desc = "Update all crates",
			},
			{
				"<Leader>lch",
				cmd "Crates open_homepage",
				desc = "Open homepage for selected crate",
			},
			{
				"<Leader>lcd",
				cmd "Crates open_documentation",
				desc = "Open documentation for selected crate",
			},
			{
				"<Leader>lcc",
				cmd "Crates open_cratesio",
				desc = "Open crates.io for selected crate",
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	{
		"nanotee/sqls.nvim",
	},
}
