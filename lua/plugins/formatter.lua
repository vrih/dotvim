require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},
		["yaml.docker-compose"] = {
			require("formatter.filetypes.yaml").prettier,
		},
		markdown = {
			require("formatter.filetypes.markdown").prettier,
		},
		scss = {
			require("formatter.filetypes.css").prettier,
		},
		terraform = {
			function()
				return {
					exe = "terraform",
					args = {
						"fmt",
						"-no-color",
						"-",
					},
					stdin = true,
				}
			end,
		},
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
