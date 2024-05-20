local plugins = {
	-----------------------------------------------------------------------
	-- Visual
	-----------------------------------------------------------------------

	{ "kyazdani42/nvim-web-devicons" },
	{ "nvim-lualine/lualine.nvim", lazy = false },
	"pappasam/papercolor-theme-slim",
	{ "catppuccin/nvim", lazy = false },

	-----------------------------------------------------------------------
	-- Filetypes
	-----------------------------------------------------------------------

	{
		"fatih/vim-go",
		ft = "go",
	},
	{ "habamax/vim-asciidoctor", ft = { "asciidoc", "asciidoctor" } },
	{ "hashivim/vim-terraform", ft = "terraform" },
	{ "juliosueiras/vim-terraform-completion", ft = "terraform" },
	{ "preservim/vim-markdown", ft = { "markdown" } },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"aklt/plantuml-syntax",

	-----------------------------------------------------------------------
	-- Project
	-----------------------------------------------------------------------

	"tpope/vim-dispatch",
	"tpope/vim-fugitive",
	"tpope/vim-projectionist",
	{ "lewis6991/gitsigns.nvim", branch = "main" },
	{ "akinsho/git-conflict.nvim", branch = "main" },

	-----------------------------------------------------------------------
	-- Utility
	-----------------------------------------------------------------------

	"chentoast/marks.nvim",
	"MarcWeber/vim-addon-mw-utils",
	"SirVer/ultisnips",
	"chrisbra/unicode.vim",
	"editorconfig/editorconfig-vim",
	"godlygeek/tabular",
	"honza/vim-snippets",
	"junegunn/vim-easy-align",
	"majutsushi/tagbar",
	"reedes/vim-pencil",
	"preservim/nerdcommenter",
	"tomtom/tlib_vim",
	"mhartington/formatter.nvim",
	"simrat39/symbols-outline.nvim",
	"kosayoda/nvim-lightbulb",
	"christoomey/vim-tmux-navigator",
	"eiginn/netrw",
	{ "nvim-tree/nvim-tree.lua", cmd = { "NvimTreeToggle" } },

	-- Add ale for hadolint
	"dense-analysis/ale",
	"nvim-lua/plenary.nvim",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"neovim/nvim-lspconfig",

	-- Add COC for home-assistant plugin
	{ "neoclide/coc.nvim", branch = "release" },

	-- Cmp
	{ "hrsh7th/cmp-nvim-lsp", branch = "main" },
	{ "ray-x/cmp-treesitter" },
	{ "hrsh7th/cmp-buffer", branch = "main" },
	{ "hrsh7th/cmp-path", branch = "main" },
	{ "hrsh7th/cmp-cmdline", branch = "main" },
	{ "hrsh7th/nvim-cmp", branch = "main" },
	"onsails/lspkind.nvim",
	"quangnguyen30192/cmp-nvim-ultisnips",

	"windwp/nvim-autopairs",

	-- dependencies
	"nvim-lua/popup.nvim",
	-- telescope
	"nvim-telescope/telescope.nvim",
}

require("lazy").setup(plugins, opts)

require("plugins.formatter")
require("plugins.git-conflict")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.nvim-lightbulb")
require("plugins.nvim-web-devicons")
require("plugins.projectionist")
require("plugins.symbols-outline")
require("plugins.syntastic")
require("plugins.telescope")
require("plugins.nvim-tree")
require("plugins.nvim-cmp")
require("plugins.marks")
require("nvim-autopairs").setup({})
