require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports" },
		python = { "black" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		yaml = { "prettier" },
		["yaml.docker-compose"] = { "prettier" },
		markdown = { "prettier" },
		scss = { "prettier" },
		css = { "prettier" },
		terraform = { "terraform_fmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
