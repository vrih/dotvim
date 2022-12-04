local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.config/nvim/plugged")

-----------------------------------------------------------------------
-- Visual
-----------------------------------------------------------------------

Plug("kyazdani42/nvim-web-devicons")
Plug("nvim-lualine/lualine.nvim")
Plug("pappasam/papercolor-theme-slim")

-----------------------------------------------------------------------
-- Filetypes
-----------------------------------------------------------------------

Plug("habamax/vim-asciidoctor")
Plug("hashivim/vim-terraform")
Plug("juliosueiras/vim-terraform-completion")
Plug("plasticboy/vim-markdown")
Plug("posva/vim-vue")
Plug("tpope/vim-rake")
Plug("vimwiki/vimwiki")
Plug("iamcco/markdown-preview.nvim", { ["do"] = vim.fn["mkdp#util#install()"], ["for"] = { "markdown", "vim-plug" } })
Plug("aklt/plantuml-syntax")

-----------------------------------------------------------------------
-- Project
-----------------------------------------------------------------------

Plug("tpope/vim-dispatch")
Plug("tpope/vim-fugitive")
Plug("tpope/vim-projectionist")
Plug("lewis6991/gitsigns.nvim", { branch = "main" })

-----------------------------------------------------------------------
-- Utility
-----------------------------------------------------------------------

Plug("MarcWeber/vim-addon-mw-utils")
Plug("SirVer/ultisnips")
Plug("chrisbra/unicode.vim")
Plug("editorconfig/editorconfig-vim")
Plug("godlygeek/tabular")
Plug("honza/vim-snippets")
Plug("junegunn/vim-easy-align")
Plug("majutsushi/tagbar")
Plug("reedes/vim-pencil")
Plug("scrooloose/nerdcommenter")
Plug("tomtom/tlib_vim")
Plug("vim-syntastic/syntastic")
Plug("mhartington/formatter.nvim")

-- Add ale for hadolint
Plug("dense-analysis/ale")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = vim.fn["TSUpdate"] })
Plug("neovim/nvim-lspconfig")
Plug("hrsh7th/cmp-nvim-lsp", { branch = "main" })
Plug("hrsh7th/cmp-buffer", { branch = "main" })
Plug("hrsh7th/cmp-path", { branch = "main" })
Plug("hrsh7th/cmp-cmdline", { branch = "main" })
Plug("hrsh7th/nvim-cmp", { branch = "main" })
Plug("quangnguyen30192/cmp-nvim-ultisnips")

-- dependencies
Plug("nvim-lua/popup.nvim")
-- telescope
Plug("nvim-telescope/telescope.nvim")
vim.call("plug#end")

-----------------------------------------------------------------------
-- Lualine config
-----------------------------------------------------------------------
require("lualine").setup({
	options = {
		global_status = true,
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

-----------------------------------------------------------------------
-- Projectionist config
-----------------------------------------------------------------------

vim.g.projectionist_heuristics = {
	["*.go"] = {
		["*.go"] = {
			alternate = "{}_test.go",
			type = "source",
		},
		["*_test.go"] = {
			alternate = "{}.go",
			type = "test",
		},
	},
	["pyproject.toml"] = {
		["*.py"] = { alternate = "tests/test_{}.py" },
	},
	["vue.config.js"] = {
		["src/*.vue"] = { alternate = "tests/unit/{}.spec.js" },
		["src/*.js"] = { alternate = "tests/unit/{}.spec.js" },
		["tests/unit/*.spec.js"] = { dispatch = "yarn test:unit {file}" },
	},
}

-----------------------------------------------------------------------
-- Gitsigns config
-----------------------------------------------------------------------
require("gitsigns").setup({
	on_attach = function(bufnr)
		local function map(mode, lhs, rhs, opts)
			opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
		end

		-- Navigation
		map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
		map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

		-- Actions
		map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
		map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
		map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
		map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
		map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
		map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
		map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
		map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
		map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
		map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
		map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
		map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
		map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

		-- Text object
		map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
		map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

-----------------------------------------------------------------------
-- Syntastic config
-----------------------------------------------------------------------

vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 0

vim.g.syntastic_lua_checkers = { "luacheck" }
vim.g.syntastic_yaml_checkers = { "yamllint" }

-----------------------------------------------------------------------
-- Webdev Icons config
-----------------------------------------------------------------------
require("nvim-web-devicons").setup({
	-- your personnal icons can go here (to override)
	-- DevIcon will be appended to `name`
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			name = "Zsh",
		},
	},
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true,
})

-----------------------------------------------------------------------
-- Formatter config
-----------------------------------------------------------------------

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
