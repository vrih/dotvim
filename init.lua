-- Use Lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
require("vimwiki")

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

-- Snippet shortcuts
vim.g["deoplete#enable_at_startup"] = 1
vim.g["deoplete#enable_smart_case"] = 1
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"

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

vim.g.pymode_rope_lookup_project = 0
vim.g.pymode_rope = 0

-- TextEdit might fail if hidden is not set.
vim.o.hidden = true -- TextEdit might fail if hidden is not set
vim.o.cmdheight = 2 -- Give more space for displaying messages.
--vim.o.shortmess = vim.o.shortmess + 'c' -- Don't pass messages to |ins-completion-menu|.

local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.get()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	end
end

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
})

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['pyright'].setup {
--   capabilities = capabilities
-- }
local servers = { "ansiblels", "vimls", "bashls", "terraformls", "gopls", "pyright" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilties = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

local lspconfig = require("lspconfig")
lspconfig.yamlls.setup({
	on_attach = on_attach,
	settings = {
		yaml = {
			schemaDownload = {
				enable = true,
			},
			schemas = {},
		},
	},
})

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
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
