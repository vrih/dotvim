function detect_bash()
	if vim.cmd("vim.getline(1)") == "!/usr/bin/env bash" then
		vim.local_opt.filetype = "bash"
	end
end

vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*",
	callback = detect_bash,
	desc = "Detect bash from first line",
})
