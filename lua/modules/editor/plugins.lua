local editor = {}
local conf = require('modules.editor.config')

editor['itchyny/vim-cursorword'] = {
    opt = true,
    event = {'BufReadPre', 'BufNewFile'},
    config = conf.vim_cursorwod
}
editor['terrortylor/nvim-comment'] = {
    opt = false,
    config = function() require('nvim_comment').setup({
        hook = function()
            require("ts_context_commentstring.internal").update_commentstring()
        end,
    }) end
}
editor['nvim-treesitter/nvim-treesitter'] = {
    opt = true,
    run = ':TSUpdate',
    event = 'BufRead',
    config = conf.nvim_treesitter
}
editor['nvim-treesitter/nvim-treesitter-textobjects'] = {
    opt = true,
    after = 'nvim-treesitter',
    config = conf.nvim_textobjects
}
editor['romgrk/nvim-treesitter-context'] = {
    opt = true,
    after = 'nvim-treesitter'
}
editor['JoosepAlviste/nvim-ts-context-commentstring'] = {
    opt = true,
    after = 'nvim-treesitter'
}
editor['andymass/vim-matchup'] = {
    opt = true,
    after = 'nvim-treesitter',
    config = conf.matchup
}
editor['hrsh7th/vim-eft'] = {opt = true}

return editor
