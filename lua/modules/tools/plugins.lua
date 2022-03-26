local tools = {}
local conf = require('modules.tools.config')

tools["RishabhRD/popfix"] = { opt = false }
tools["nvim-lua/plenary.nvim"] = { opt = false }
tools['nvim-telescope/telescope.nvim'] = {
    opt = true,
    cmd = 'Telescope',
    config = conf.telescope,
    requires = {
        {'nvim-lua/popup.nvim', opt = true},
        {'nvim-lua/plenary.nvim', opt = true}
    }
}
tools['kyazdani42/nvim-tree.lua'] = {
	opt = false,
	requires = {
		'kyazdani42/nvim-web-devicons'
	},
	config = conf.nvim_tree
}
tools['nvim-telescope/telescope-fzy-native.nvim'] = {
    opt = true,
    after = 'telescope.nvim'
}

tools['nvim-telescope/telescope-project.nvim'] = {
    opt = true,
    after = 'telescope.nvim'
}
tools['michaelb/sniprun'] = {
    opt = true,
    run = 'bash ./install.sh',
    cmd = {"SnipRun", "'<,'>SnipRun"},
    config = conf.sniprun
}
tools['gelguy/wilder.nvim'] = {
    event = "CmdlineEnter",
    config = conf.wilder,
    requires = {{'romgrk/fzy-lua-native', after = 'wilder.nvim'}}
}

return tools
