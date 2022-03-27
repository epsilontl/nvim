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
tools['iamcco/markdown-preview.nvim'] = {
    opt = true,
    ft = "markdown",
    run = 'cd app && yarn install',
    config = conf.markdown_view
}
tools['dhruvasagar/vim-table-mode'] = {
    opt = true,
    ft = {"markdown","text"}
}

return tools
