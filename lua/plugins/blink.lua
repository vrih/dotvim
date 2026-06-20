require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<CR>"] = { "accept", "fallback" },
		["<C-e>"] = { "hide", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<Up>"] = { "select_prev", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<C-d>"] = { "scroll_documentation_up", "fallback" },
	},
	appearance = {
		use_nvim_web_devicons = true,
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	cmdline = {
		sources = { "cmdline", "path" },
	},
	snippets = { preset = "luasnip" },
	signature = { enabled = true },
})
