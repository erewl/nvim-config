local wk = require("which-key")

wk.register({
	["<leader>fh"] = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
})

-- Godot debugger keymaps
local ok, godot = pcall(require, "godot")
if ok then
	local map = vim.keymap.set
	local opts = { silent = true }
  -- Run and debug commands
  map("n", "<leader>gr", godot.run, opts)       -- Run the project
  map("n", "<leader>gl", godot.run_last, opts)  -- Run the last scene/project
  map("n", "<leader>gd", godot.debug, opts)     -- Start debugger
  map("n", "<leader>gs", godot.stop, opts)      -- Stop the running instance
end
