local wk = require("which-key")

wk.register({
	["<leader>fh"] = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
})

-- Godot debugger keymaps
local ok, godot = pcall(require, "godot")
if ok then
	local map = vim.keymap.set
	local opts = { silent = true }
	map("n", "<leader>dq", godot.debugger.quit, opts)
	map("n", "<leader>dr", godot.debugger.debug, opts)
	map("n", "<leader>dd", godot.debugger.debug_at_cursor, opts)
	map("n", "<leader>dq", godot.debugger.quit, opts)
	map("n", "<leader>dc", godot.debugger.continue, opts)
	map("n", "<leader>ds", godot.debugger.step, opts)
end
