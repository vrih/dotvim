local cmp = require("cmp")
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
		end, { "i", "s", "c" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			cmp_ultisnips_mappings.jump_backwards(fallback)
		end, { "i", "s", "c" }),
		["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
		["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
		["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
		["<CR>"] = cmp.mapping({
			i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
			c = function(fallback)
				if cmp.get_selected_entry() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
				else
					fallback()
				end
			end,
		}),
	},
	sources = cmp.config.sources({
		{ name = "ultisnips" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})

local lspkind = require("lspkind")
cmp.setup({
	formatting = {
		format = lspkind.cmp_format(),
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
