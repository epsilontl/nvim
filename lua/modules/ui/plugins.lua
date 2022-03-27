local ui = {}
local conf = require('modules.ui.config')

ui['sainnhe/edge'] = {opt = false, config = conf.edge}
ui['hoob3rt/lualine.nvim'] = {
    opt = false,
    config = conf.lualine
}
ui['lewis6991/gitsigns.nvim'] = {
    opt = true,
    event = {'BufRead', 'BufNewFile'},
    config = conf.gitsigns,
    requires = {'nvim-lua/plenary.nvim', opt = true}
}
ui['kevinhwang91/nvim-hlslens'] = {
	opt = true,
	event = 'BufRead',
	config = conf.nvim_hlslens
}
ui['lukas-reineke/indent-blankline.nvim'] = {
    opt = true,
    event = 'BufRead',
    config = conf.indent_blankline
}
ui['akinsho/nvim-bufferline.lua'] = { 
	opt = true,
    event = 'BufRead',
    config = conf.nvim_bufferline
}
ui['kyazdani42/nvim-tree.lua'] = {
	opt = false,
	requires = {
		'kyazdani42/nvim-web-devicons'
	},
	config = conf.nvim_tree
}

return ui
