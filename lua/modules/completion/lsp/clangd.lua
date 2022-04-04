return {
	cmd = {"clangd"},
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = function()
		return vim.fn.getcwd()
	end
}
