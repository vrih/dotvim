-- Set indentation options
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- Enable useful settings for Java coding
vim.o.textwidth = 120
vim.o.cursorline = true

-- Key mappings for compiling and running Java files
vim.keymap.set("n", "<leader>cj", ":!javac %<CR>", { buffer = true, silent = true })
vim.keymap.set("n", "<leader>rj", ":!java %:r<CR>", { buffer = true, silent = true })

-- Key mappings for running Gradle tasks
vim.keymap.set("n", "<leader>jgb", ":!gradle build<CR>", { buffer = true, silent = true })
vim.keymap.set("n", "<leader>jgt", ":!gradle test<CR>", { buffer = true, silent = true })
