local editor = {}
local conf = require('modules.editor.config')

editor["RRethy/vim-illuminate"] = {
	event = "BufRead",
	config = function()
		vim.g.Illuminate_highlightUnderCursor = 0
		vim.g.Illuminate_ftblacklist = {
			"help",
			"packer",
			"NvimTree",
			"Outline",
		}
	end,
}
editor['terrortylor/nvim-comment'] = {
    opt = false,
    config = function() require('nvim_comment').setup({
        hook = function()
            require("ts_context_commentstring.internal").update_commentstring()
        end,
    }) end
}
editor["romainl/vim-cool"] = {
	opt = true,
	event = { "CursorMoved", "InsertEnter" },
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
