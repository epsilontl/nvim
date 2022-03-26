local completion = {}
local conf = require('modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
    opt = true,
    event = 'BufReadPre',
    config = conf.nvim_lsp
}
completion['williamboman/nvim-lsp-installer'] = {opt = true, after = 'nvim-lspconfig'}
completion["tami5/lspsaga.nvim"] = {
	opt = true,
	after = "nvim-lspconfig",
	config = conf.lspsaga
}
completion["ray-x/lsp_signature.nvim"] = { opt = true, after = "nvim-lspconfig"}
completion["j-hui/fidget.nvim"] = {
	opt = false,
	config = conf.fidget
}
completion["mfussenegger/nvim-lint"] = { opt = true,
	after = "lspsaga.nvim",
	config = conf.nvim_lint
}
completion["hrsh7th/nvim-cmp"] = {
	config = conf.cmp,
	event = "InsertEnter",
	requires = {
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
		{ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
		{ "andersevenrud/cmp-tmux", after = "cmp-nvim-lua" },
		{ "hrsh7th/cmp-path", after = "cmp-tmux" },
		{ "f3fora/cmp-spell", after = "cmp-path" },
		{ "hrsh7th/cmp-buffer", after = "cmp-spell" },
	},
}
completion["L3MON4D3/LuaSnip"] = {
	opt = true,
	after = "nvim-cmp",
	config = conf.luasnip,
	requires = "rafamadriz/friendly-snippets",
}
completion["windwp/nvim-autopairs"] = {
	after = "nvim-cmp",
	config = conf.autopairs,
}
return completion
