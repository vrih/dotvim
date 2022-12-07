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

Plug 'fatih/vim-go'
Plug("habamax/vim-asciidoctor")
Plug("hashivim/vim-terraform")
Plug("juliosueiras/vim-terraform-completion")
Plug("plasticboy/vim-markdown")
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
Plug("akinsho/git-conflict.nvim", { branch = "main" })

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
Plug("simrat39/symbols-outline.nvim")

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


require "plugins.lualine"
require "plugins.projectionist"
require "plugins.gitsigns"
require "plugins.syntastic"
require "plugins.nvim-web-devicons"

vim.g.syntastic_lua_checkers = { "luacheck" }
vim.g.syntastic_yaml_checkers = { "yamllint" }

-----------------------------------------------------------------------
-- Git Conflict
-----------------------------------------------------------------------

require("git-conflict").setup()

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
