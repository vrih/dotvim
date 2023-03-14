-- Simplify movement shortcuts
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "\\", ",")

--vim.keymap.set('i', '<EXPR><TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"')

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<Leader>e", ":Files<cr>", { silent = true })
vim.keymap.set("n", "<Leader>f", "<cmd>Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<Leader>q", "<cmd>Telescope quickfix<CR>", { silent = true })
vim.keymap.set("n", "<Leader>a", "<cmd>Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<Leader>b", "<cmd>Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gb", "<cmd>Telescope git_branches<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gs", "<cmd>Telescope git_status<CR>", { silent = true })

vim.keymap.set("n", "<Leader>n", ":NERDTreeToggle<CR>>", { silent = true })
vim.keymap.set("n", "<Leader>t", ":Tagbar<CR>", { silent = true })
