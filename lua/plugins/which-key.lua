local wk = require("which-key")

wk.setup({
	delay = 500,
	icons = {
		mappings = false,
	},
})

wk.add({
	{ "<leader>f", desc = "Find files" },
	{ "<leader>a", desc = "Live grep" },
	{ "<leader>b", desc = "Buffers" },
	{ "<leader>q", desc = "Quickfix" },
	{ "<leader>n", desc = "File tree" },
	{ "<leader>e", desc = "Files (fzf)" },

	{ "<leader>g", group = "Git" },
	{ "<leader>gs", desc = "Git status" },
	{ "<leader>gb", desc = "Git branches" },
	{ "<leader>ga", desc = "Easy align" },
	{ "<leader>gd", desc = "Diffview open" },
	{ "<leader>gh", desc = "File history (diffview)" },

	{ "<leader>s", group = "Symbols/Search" },
	{ "<leader>so", desc = "Outline" },

	{ "<leader>c", group = "Code" },
	{ "<leader>ca", desc = "Code action" },

	{ "<leader>r", group = "Refactor" },
	{ "<leader>rn", desc = "Rename" },

	{ "<leader>w", group = "Workspace" },
	{ "<leader>wa", desc = "Add workspace folder" },
	{ "<leader>wr", desc = "Remove workspace folder" },
	{ "<leader>wl", desc = "List workspace folders" },

	{ "<leader>x", group = "Diagnostics" },
	{ "<leader>xx", desc = "Workspace diagnostics (trouble)" },
	{ "<leader>xb", desc = "Buffer diagnostics (trouble)" },
	{ "<leader>xq", desc = "Quickfix (trouble)" },
	{ "<leader>xt", desc = "Todo comments (trouble)" },

	{ "<leader>ai", desc = "AI chat (gp.nvim)" },
})
