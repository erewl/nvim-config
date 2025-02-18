vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	pattern = { "*" },
	command = "silent! wall",
	nested = true,
})
