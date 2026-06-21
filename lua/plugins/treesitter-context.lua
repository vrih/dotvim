require("treesitter-context").setup({
	enable = true,
	max_lines = 3,
	disable = function(lang)
		return lang == "markdown"
	end,
})
