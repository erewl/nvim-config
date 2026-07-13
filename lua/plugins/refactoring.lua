return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
  enabled = false,
	lazy = false,
	config = function()
		require("refactoring").setup()
	end,
}
