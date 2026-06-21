-- Use Lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- extend keyboard map options

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("plugins")
require("autocommands")
require("mappings")

if vim.fn.has("termguicolors") == 1 then
	vim.o.termguicolors = true
end

-- theme
vim.o.background = "dark"
vim.cmd("highlight ColorColumn ctermbg=233 guibg=grey")

-- basic options
vim.o.autoindent = true
vim.o.backspace = "indent,eol,start"
vim.o.completeopt = "noinsert,noselect,menuone"
vim.o.colorcolumn = "90"
vim.o.encoding = "utf-8"
vim.o.expandtab = true
vim.g.nobackup = true
vim.g.noshowmode = true
vim.g.nowritebackup = true
vim.g.nowrap = true
vim.o.laststatus = 3
-- Set format options
-- w = trailing white space indicated paragraph continues into next line
-- c = autowrap comments
-- q = allow formatting of comments with gq
vim.o.formatoptions = "qnj1"

-- foldine
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "syntax"

-- search
vim.o.ignorecase = true -- Ignore case starting search
vim.o.smartcase = true -- Be case sensitive if upper case letters are used
vim.o.incsearch = true -- Incremental Search

-- visual
vim.o.number = true -- show line numbers
vim.o.relativenumber = true
vim.o.signcolumn = "yes" -- Always show sign column
vim.o.smartindent = true
vim.o.title = true
vim.o.textwidth = 79
vim.o.undofile = true
vim.o.updatetime = 300
vim.o.visualbell = true
vim.o.wildmenu = true
vim.o.wildmode = "longest,list,full"

vim.cmd("syntax on")

-- Abbreviations
vim.cmd([[
iabbrev mon Monday
iabbrev tue Tuesday
iabbrev wed Wednesday
iabbrev thu Thursday
iabbrev fri Friday
iabbrev sat Saturday
iabbrev sun Sunday
]])

-- TextEdit might fail if hidden is not set.
vim.o.clipboard = "unnamedplus"
vim.o.hidden = true -- TextEdit might fail if hidden is not set
vim.o.cmdheight = 2 -- Give more space for displaying messages.
--vim.o.shortmess = vim.o.shortmess + 'c' -- Don't pass messages to |ins-completion-menu|.

require("nvim-treesitter").setup()

-- Setup capabilities for blink.cmp
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = bufnr, silent = true }

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

		if client and client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end
	end,
})

-- Configure LSP servers using vim.lsp.config (Neovim 0.11+)
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Define server configurations
vim.lsp.config("ansiblels", { capabilities = capabilities })
vim.lsp.config("vimls", { capabilities = capabilities })
vim.lsp.config("bashls", { capabilities = capabilities })
vim.lsp.config("terraformls", { capabilities = capabilities })
vim.lsp.config("gopls", { capabilities = capabilities })
vim.lsp.config("pyright", { capabilities = capabilities })

vim.lsp.config("yamlls", {
	capabilities = capabilities,
	settings = {
		yaml = {
			schemaDownload = { enable = true },
			schemas = {},
		},
	},
})

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})

-- Enable all configured servers
vim.lsp.enable("ansiblels")
vim.lsp.enable("vimls")
vim.lsp.enable("bashls")
vim.lsp.enable("terraformls")
vim.lsp.enable("gopls")
vim.lsp.enable("pyright")
vim.lsp.enable("yamlls")
vim.lsp.enable("lua_ls")

-- Configure diagnostics display
vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	signs = true,
	update_in_insert = false,
})

--vim.filetype.add({
--pattern = {
--[".*"] = {
--priority = -math.huge,
--function(path, bufnr)
--local content = vim.filetype.getline(1)
--if vim.filetype.matchregex(content, [[^#!/usr/bin/env bash]]) then
--return "bash"
--end
--end,
--},
--},
--})
