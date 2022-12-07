vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.go",
	callback = function(_)
		vim.cmd([[
  let file = expand('%')
  silent execute "!gofmt -w " . file
  edit!
  ]])
	end,
	desc = "Format go code on save",
})
