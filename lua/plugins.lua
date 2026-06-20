local plugins = {
	-----------------------------------------------------------------------
	-- Visual
	-----------------------------------------------------------------------

	{ "kyazdani42/nvim-web-devicons" },
	{ "nvim-lualine/lualine.nvim", lazy = false },
	"pappasam/papercolor-theme-slim",
	{
		"catppuccin/nvim",
		config = function()
			require("plugins.catppuccin")
		end,
		lazy = false,
	},

	-----------------------------------------------------------------------
	-- Filetypes
	-----------------------------------------------------------------------

	{ "habamax/vim-asciidoctor", ft = { "asciidoc", "asciidoctor" } },
	{ "hashivim/vim-terraform", ft = "terraform" },
	{ "preservim/vim-markdown", ft = { "markdown" } },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "kyazdani42/nvim-web-devicons" },
		opts = {},
	},
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
	-- Project / Git
	-----------------------------------------------------------------------

	"tpope/vim-dispatch",
	"tpope/vim-fugitive",
	"tpope/vim-projectionist",
	{ "lewis6991/gitsigns.nvim", branch = "main" },
	{ "akinsho/git-conflict.nvim", branch = "main" },
	{ "sindrets/diffview.nvim" },

	-----------------------------------------------------------------------
	-- Utility
	-----------------------------------------------------------------------

	"vimwiki/vimwiki",
	"chentoast/marks.nvim",
	"chrisbra/unicode.vim",
	"honza/vim-snippets",
	"junegunn/vim-easy-align",
	"reedes/vim-pencil",
	{ "hedyhli/outline.nvim", cmd = { "Outline", "OutlineOpen" } },
	"kosayoda/nvim-lightbulb",
	"christoomey/vim-tmux-navigator",
	{ "nvim-tree/nvim-tree.lua" },

	"nvim-lua/plenary.nvim",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-textobjects",
	{ "nvim-treesitter/nvim-treesitter-context" },
	"neovim/nvim-lspconfig",

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},

	-- Completion
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = { "L3MON4D3/LuaSnip" },
	},

	-- Formatting
	{ "stevearc/conform.nvim" },

	-- Diagnostics
	{ "folke/trouble.nvim", version = "*" },

	-- Todo comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	"windwp/nvim-autopairs",

	{
		"robitx/gp.nvim",
		config = function()
			require("gp").setup({
				providers = {
					openai = {
						secret = vim.env.OPENAI_API_KEY,
					},
					copilot = {
						endpoint = "https://api.githubcopilot.com/chat/completions",
						secret = {
							"bash",
							"-c",
							"cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
						},
					},
				},
			})
		end,
	},

	-- which-key for keybinding hints
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.which-key")
		end,
	},

	-- telescope
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	{
		"vrih/quick-drafts",
		config = function()
			require("quick-drafts").setup({ root = "~/vimwiki/drafts/" })
		end,
	},
}

require("lazy").setup(plugins, opts)

require("plugins.conform")
require("plugins.luasnip")
require("plugins.blink")
require("plugins.git-conflict")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.nvim-lightbulb")
require("plugins.nvim-web-devicons")
require("plugins.projectionist")
require("plugins.outline")
require("plugins.telescope")
require("plugins.nvim-tree")
require("plugins.marks")
require("plugins.vimwiki")
require("plugins.trouble")
require("plugins.diffview")
require("plugins.treesitter-context")
require("plugins.todo-comments")
require("nvim-autopairs").setup({})
