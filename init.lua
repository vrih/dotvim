local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug('iamcco/markdown-preview.nvim', { ['do'] = vim.fn['mkdp#util#install'], ['for'] = {'markdown', 'vim-plug' }})
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'godlygeek/tabular'
Plug 'vim-syntastic/syntastic'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/vim-easy-align'
Plug 'pappasam/papercolor-theme-slim'
Plug 'SirVer/ultisnips'
Plug 'habamax/vim-asciidoctor'
Plug 'honza/vim-snippets'
Plug 'chrisbra/unicode.vim'

-- Add ale for hadolint
Plug 'dense-analysis/ale'

Plug 'nvim-lua/plenary.nvim'
Plug('lewis6991/gitsigns.nvim', { branch = 'main' })

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn['TSUpdate']})
Plug 'neovim/nvim-lspconfig'
Plug('hrsh7th/cmp-nvim-lsp', { branch = 'main' })
Plug('hrsh7th/cmp-buffer', { branch = 'main' })
Plug('hrsh7th/cmp-path', { branch = 'main' })
Plug('hrsh7th/cmp-cmdline', { branch = 'main' })
Plug('hrsh7th/nvim-cmp', { branch = 'main' })
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

-- dependencies
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
-- telescope
Plug 'nvim-telescope/telescope.nvim'
vim.call('plug#end')

if vim.fn.has('termguicolors') == 1 then
  vim.o.termguicolors = true
end

-- highlight trailing whitespace
vim.cmd([[
        autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
        au InsertLeave * match ExtraWhitespace /\s\+$/
]])
-- Simplify movement shortcuts
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- theme
vim.o.background = 'dark'
vim.cmd('colorscheme PaperColorSlim')
vim.cmd('highlight ColorColumn ctermbg=233 guibg=grey')

-- basic options
vim.o.autoindent = true
vim.o.backspace = 'indent,eol,start'
vim.o.completeopt = 'menuone,noselect'
vim.o.encoding = 'utf-8'
vim.o.expandtab = true
vim.g.nobackup = true
vim.g.noshowmode = true
vim.g.nowritebackup = true
vim.g.nowrap = true

-- Set format options
-- w = trailing white space indicated paragraph continues into next line
-- c = autowrap comments
-- q = allow formatting of comments with gq
vim.o.formatoptions = 'qnj1'

-- foldine
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = 'syntax'

-- search
vim.o.ignorecase = true -- Ignore case starting search
vim.o.smartcase = true -- Be case sensitive if upper case letters are used
vim.o.incsearch =  true -- Incremental Search

-- visual
vim.o.number = true -- show line numbers
vim.o.relativenumber = true
vim.o.signcolumn = 'yes' -- Always show sign column
vim.o.smartindent = true
vim.o.laststatus = 2 -- Always show status bar
vim.o.title = true
vim.o.tw = 79
vim.o.updatetime = 300
vim.o.visualbell = true
vim.o.wildmenu = true
vim.o.wildmode = 'longest,list,full'

vim.cmd('syntax on')

vim.g.mapleader = ","  -- extend keyboard map options
vim.api.nvim_set_keymap('n', '\\', ',', { noremap = true })
-- Snippet shortcuts
vim.g['deoplete#enable_at_startup'] = 1
vim.g['deoplete#enable_smart_case'] = 1
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
vim.api.nvim_set_keymap('i', '<EXPR><TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', { noremap = true })

vim.cmd([[
  autocmd FileType md set filetype=markdown
  autocmd FileType rb set filetype=ruby
  autocmd BufRead,BufNewFile /tmp/*.md setlocal ft=markdown.glab
  ]])

vim.cmd([[
highlight User1 guifg=#eea040 guibg=#222222
highlight User2 guifg=#dd3333 guibg=#222222
highlight User3 guifg=#ff66ff guibg=#222222
highlight User4 guifg=#a0ee40 guibg=#222222
highlight User5 guifg=#eeee40 guibg=#222222
]])

vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

-- Better navigating through omnicomplete option list
-- See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
--[[
function OmniPopup(action)
        if vim.fn.pumvisible() == 1 then
                if vim.fn.a.action == 'j' then
                        return "\<C-N>"
                elseif vim.fn.a:action == 'k' then
                        return "\<C-P>"
                end
        end
        return vim.fn.a:action
end
]]--
--[[
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Tab Completion
" Super Tab
" http://www.vim.org/scripts/script.php?script_id=1643
"let g:SuperTabMappingForward = "<nul>"
"let g:SuperTabMappingLiteral = "<Tab>"
"let g:SuperTabDefaultCompletionType = "context"
]]--

-- Pencil
vim.cmd([[
augroup pencil
  autocmd!
  "autocmd FileType markdown,md call pencil#init()
"  autocmd FileType text         call pencil#init()
augroup END
]])

vim.cmd([[
augroup docker
        autocmd!
        autocmd BufRead,BufNewFile Dockerfile* setlocal ft=dockerfile
augroup END
]])

vim.g.projectionist_heuristics = {
        ['*.go'] = {
                ['*.go'] = {
                        alternate = '{}_test.go',
                        type = 'source'
                },
                ['*_test.go'] = {
                        alternate = '{}.go',
                        type = 'test'
                },
        },
        ['pyproject.toml'] = {
                ['src/*.py'] = { alternate = 'tests/test_{}.py' }
        },
        ['vue.config.js'] = {
                ['src/*.vue'] = { alternate = 'tests/unit/{}.spec.js' },
                ['src/*.js'] =  { alternate = 'tests/unit/{}.spec.js' },
                ["tests/unit/*.spec.js"] = { dispatch = 'yarn test:unit {file}' }
        }
}

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

--[[
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]]

-- TextEdit might fail if hidden is not set.
vim.o.hidden = true -- TextEdit might fail if hidden is not set
vim.o.cmdheight = 2 -- Give more space for displaying messages.
--vim.o.shortmess = vim.o.shortmess + 'c' -- Don't pass messages to |ins-completion-menu|.

vim.cmd([[
augroup blanks
       autocmd!
       autocmd BufWritePre * call FixBlankLines()
augroup END
]])

vim.api.nvim_set_keymap('n', '<Leader>e', ':Files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', '<cmd>Telescope quickfix<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>a', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<CR>>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':Tagbar<CR>', { noremap = true, silent = true })

-- Ultisnips keybindings
vim.g.UltiSnipsExpandTrigger = '<C-l>'
vim.g.UltiSnipsJumpForwardTrigger = '<C-b>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-z>'

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
end

require'nvim-treesitter.configs'.setup {
  highlight = {
      enable = true
  },
}

local cmp = require 'cmp'

cmp.setup({
  snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
  mapping = {
	  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
	  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
	  ['<C-e>'] = cmp.mapping(cmp.mapping.close()),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'})
	  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    { name = 'buffer' },
    { name = 'path' },
  })
})

	    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['pyright'].setup {
  --   capabilities = capabilities
  -- }
local servers = {'ansiblels', 'dockerls', 'pyright', 'pylsp', 'terraformls', 'vimls', 'bashls', 'yamlls'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilties = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

local lspconfig = require('lspconfig')
lspconfig.yamlls.setup({
on_attach = on_attach,
settings = {
        yaml = {
                schemaDownload = {
                enable = true
                },
                schemas = {
                        }
        }
}}
)

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "🔎 ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
    update_in_insert = false,
  }
)

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

require('gitsigns').setup{
on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
  }

vim.cmd('autocmd InsertLeave *.md silent write')

  require 'vimwiki'
