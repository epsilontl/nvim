local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd

-- default map
local def_map = {
    -- Vim map
    ["n|s"] = map_cmd('<nop>'):with_noremap(),
    ["n|S"] = map_cmd('<nop>'):with_noremap(),
    ["n|C"] = map_cmd('<nop>'):with_noremap(),
	["n|<leader>h"] = map_cmd('<C-w>h'):with_noremap(),
	["n|<leader>j"] = map_cmd('<C-w>j'):with_noremap(),
	["n|<leader>k"] = map_cmd('<C-w>k'):with_noremap(),
	["n|<leader>l"] = map_cmd('<C-w>l'):with_noremap(),
	["n|<leader><up>"] = map_cr('res -5'):with_noremap(),
	["n|<leader><down>"] = map_cr('res +5'):with_noremap(),
	["n|<leader><left>"] = map_cr('vertical resize-5'):with_noremap(),
	["n|<leader><right>"] = map_cr('vertical resize+5'):with_noremap(),
    ["n|<leader>o"] = map_cr("setlocal spell! spelllang=en_us"):with_noremap(),
    -- Insert
    ["i|<C-u>"] = map_cmd('<C-[>ua'):with_noremap(),
    ["i|<C-a>"] = map_cmd('<ESC>^i'):with_noremap(),
    -- command line
    ["c|<C-b>"] = map_cmd('<Left>'):with_noremap(),
    ["c|<C-f>"] = map_cmd('<Right>'):with_noremap(),
    ["c|<C-a>"] = map_cmd('<Home>'):with_noremap(),
    ["c|<C-e>"] = map_cmd('<End>'):with_noremap(),
    ["c|<C-d>"] = map_cmd('<Del>'):with_noremap(),
    ["c|<C-h>"] = map_cmd('<BS>'):with_noremap(),
    ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
}

bind.nvim_load_mapping(def_map)
