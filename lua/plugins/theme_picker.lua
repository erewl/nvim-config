return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				"tokyonight-day",
				"tokyonight-moon",
				"tokyonight",
				"kanagawa-wave",
				"kanagawa-lotus",
				"kanagawa",
				"catppuccin",
				"catppuccin-latte",
				"catppuccin-frappe",
				"catppuccin-macchiato",
				"catppuccin-mocha",
			}, -- Your list of installed colorschemes.
			livePreview = true, -- Apply theme while picking. Default to true.
		})
	end,
}
