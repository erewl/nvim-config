-- Your hover popup function from before
local function open_hover_in_floating_buffer()
	local params = vim.lsp.util.make_position_params()
	vim.lsp.buf_request(0, "textDocument/hover", params, function(_, result, _, _)
		if not (result and result.contents) then
			vim.notify("No hover info available", vim.log.levels.INFO)
			return
		end

		local lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
		lines = vim.lsp.util.trim_empty_lines(lines)
		if vim.tbl_isempty(lines) then
			return
		end

		local buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
		vim.bo[buf].filetype = "markdown"
		vim.bo[buf].buftype = "nofile"
		vim.bo[buf].bufhidden = "wipe"
		vim.bo[buf].swapfile = false

		local width = math.floor(vim.o.columns * 0.6)
		local height = math.floor(vim.o.lines * 0.5)
		local row = math.floor((vim.o.lines - height) / 2)
		local col = math.floor((vim.o.columns - width) / 2)

		vim.api.nvim_open_win(buf, true, {
			relative = "editor",
			width = width,
			height = height,
			row = row,
			col = col,
			style = "minimal",
			border = "rounded",
		})

		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
	end)
end

return {
	"lommix/godot.nvim",
	config = function()
		local port = tonumber(os.getenv("GDScript_Port")) or 6005
		local cmd = vim.lsp.rpc.connect("127.0.0.1", port)

		vim.lsp.start({
			name = "Godot",
			cmd = cmd,
			root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
			filetypes = { "gdscript" }, -- Important!
			on_attach = function(client, bufnr)
				-- print("Godot LSP attached ✔️")
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			end,
		})

		-- go to definitions of Godot specific objects an classes
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "gdscript",
			callback = function()
				vim.keymap.set(
					"n",
					"gh",
					vim.lsp.buf.hover,
					{ buffer = true, desc = "Smart go-to-definition or hover" }
				)
			end,
		})

		vim.keymap.set("n", "gH", function()
			local word = vim.fn.expand("<cword>")
			if not word or word == "" then
				vim.notify("No symbol under cursor", vim.log.levels.WARN)
				return
			end

			-- Build Godot Docs URL
			local url = "https://docs.godotengine.org/en/stable/classes/class_" .. word:lower() .. ".html"

			-- Try opening the URL in your browser
			local opener
			if vim.fn.has("mac") == 1 then
				opener = "open"
			elseif vim.fn.has("unix") == 1 then
				opener = "xdg-open"
			elseif vim.fn.has("win32") == 1 then
				opener = "start"
			else
				vim.notify("Unsupported OS for browser launch", vim.log.levels.ERROR)
				return
			end

			vim.fn.jobstart({ opener, url }, { detach = true })
		end, { desc = "Open Godot class docs in browser" })

		local ok, godot = pcall(require, "godot")
		if not ok then
			return
		end

		local config = {
			-- Optional custom config
			-- bin = "godot",
			-- gui = {
			--   console_config = {},
			-- },
		}

		godot.setup(config)
	end,
}
