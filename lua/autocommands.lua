
-- highlight trailing whitespace
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function(_)
    vim.cmd([[highlight ExtraWhitespace guibg=#ff0000]])
  end,
  desc = "Highlight trailing whitespace"
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function(_)
    vim.cmd([[match ExtraWhitespace /\s\+$/]])
  end,
  desc = "Match trailing whitspace"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "md",
  callback = function(_)
    vim.cmd('set filetype=markdown')
  end,
  desc = "Set markdown filetype for all md",
})

vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
  pattern = "/tmp/*.md",
  callback = function(_)
    vim.cmd('setlocal ft=markdown.glab')
  end,
  desc = "Use gitlab mode for handling git commit messages",
})

-- Without this Dockerfiles with a suffix don't match
vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
  pattern = "Dockerfile*",
  callback = function(_)
    vim.cmd('setlocal ft=dockerfile')
  end,
  desc = "Interpret all dockerfiles correctly"
})

-- Remove double blank lines
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.tf",
  callback = function(_)
    vim.cmd([[
    :silent %s/\($\n\)\{3,\}/\r\r/e
    :silent %s/\($\n\)\{2,\}\%$/\r/e
    ]])
  end,
  desc = "Remove double blank lines"
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*.md",
  callback = function(_)
    vim.cmd('silent write')
  end,
  desc = "Automatically save markdown on leaving insert"
})

local cfg = vim.fn.stdpath('config')
local Flush = function()
    local s = vim.api.nvim_buf_get_name(0)
    if string.match(s, '^' .. cfg .. '*') == nil then
        return
    end
    s = string.sub(s, 6 + string.len(cfg), -5)
    local val = string.gsub(s, '%/', '.')
    package.loaded[val] = nil
end 
-- Reload vim config on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.lua",
  callback = function(_)
    Flush()
  end,
  desc = "Reload vim config on save"
})
