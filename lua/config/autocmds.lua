-- autosave files when switching windows
vim.api.nvim_create_autocmd({ "InsertLeave","FocusLost", "BufLeave" }, {
	pattern = { "*" },
	command = "silent! w",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "gdscript",
	callback = function()
		local port = tonumber(os.getenv("GDScript_Port")) or 6005
		local client = vim.lsp.start_client({
			name = "godot",
			cmd = vim.lsp.rpc.connect("127.0.0.1", port),
			root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
		})
		vim.lsp.buf_attach_client(0, client)
	end,
})
