return {
	"ackeraa/todo.nvim",
  config = function()
    require("todo").setup({
      opts = {
        file_path = vim.fn.getcwd() .. "/todo.txt",
      },
    })
  end,
}

