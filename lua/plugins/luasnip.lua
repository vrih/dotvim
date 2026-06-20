local luasnip = require("luasnip")

luasnip.setup({
	history = true,
	delete_check_events = "TextChanged",
})

-- Load honza/vim-snippets (snipmate format)
require("luasnip.loaders.from_snipmate").lazy_load()
