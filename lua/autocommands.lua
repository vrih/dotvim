
-- highlight trailing whitespace
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function(args)
    vim.cmd([[highlight ExtraWhitespace guibg=#ff0000]])
  end,
  desc = "Highlight trailing whitespace"
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function(args)
    vim.cmd([[match ExtraWhitespace /\s\+$/]])
  end,
  desc = "Match trailing whitspace"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "md",
  callback = function(args)
    vim.cmd('set filetype=markdown')
  end,
  desc = "Set markdown filetype for all md",
})

vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
  pattern = "/tmp/*.md",
  callback = function(args)
    vim.cmd('setlocal ft=markdown.glab')
  end,
  desc = "Use gitlab mode for handling git commit messages",
})

-- Without this Dockerfiles with a suffix don't match
vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
  pattern = "Dockerfile*",
  callback = function(args)
    vim.cmd('setlocal ft=dockerfile')
  end,
  desc = "Interpret all dockerfiles correctly"
})

-- Remove double blank lines
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    vim.cmd([[
    :silent %s/\($\n\)\{3,\}/\r\r/e
    :silent %s/\($\n\)\{2,\}\%$/\r/e
    ]])
  end,
  desc = "Remove double blank lines"
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*.md",
  callback = function(args)
    vim.cmd('silent write')
  end,
  desc = "Automatically save markdown on leaving insert"
})
