-- plugins/telescope.lua:
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8", -- Ensure you're using the correct version
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git" },
					sorting_strategy = "ascending",
					prompt_prefix = "> ",
					mappings = {
						i = {
							["<C-u>"] = false, -- Disable clearing input
							["<C-d>"] = require("telescope.actions").delete_buffer,
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- Enable fuzzy search
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case", -- Case-insensitive unless uppercase used
					},
				},
			})

			-- Load fzf extension after setup
			telescope.load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
}
