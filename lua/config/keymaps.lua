-- local wk = require("which-key")
--
-- wk.register({
-- 	["<leader>fh"] = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
-- })

local builtin = require('telescope.builtin')

vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gR", builtin.lsp_references, { desc = "List references" })
vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Go to implementation" })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP Rename" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope live_grep<CR>", opts)
  -- -- Go to definition
  -- -- Go to implementation
  -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  -- Code actions
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {desc = "Code Action"})

-- Godot debugger keymaps
local ok, godot = pcall(require, "godot")
if ok then
	local map = vim.keymap.set
	local opts = { silent = true }
  -- Run and debug commands
  -- Not valid functions at the moment
  -- map("n", "<leader>gr", godot.run, opts)       -- Run the project
  -- map("n", "<leader>gl", godot.run_last, opts)  -- Run the last scene/project
  -- map("n", "<leader>gd", godot.debug, opts)     -- Start debugger
  -- map("n", "<leader>gs", godot.stop, opts)      -- Stop the running instance
end
