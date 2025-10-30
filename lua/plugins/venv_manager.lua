return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python", --optional
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	lazy = false,
	config = function()
		require("venv-selector").setup({
			settings = {
				search = {
					poetry_venvs = {
						command = "fd '^python$' /Users/katrin.grunert/poetry_venvs/virtualenvs",
					},
					venvs = {
						command = "fd '^python$' /Users/katrin.grunert/venvs",
					},
				},
			},
		})
	end,
	-- event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	keys = {
		-- Keymap to open VenvSelector to pick a venv.
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
	},
}
