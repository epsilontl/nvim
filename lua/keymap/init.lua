local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require('keymap.config')

local plug_map = {
    -- nvim-tree
    ["n|<leader>1"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
    ["n|<leader>2"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent(),
    -- Bufferline
    ["n|<C-q>"] = map_cr("BufferLinePickClose"):with_noremap():with_silent(),
    ["n|<A-1>"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent(),
    ["n|<A-2>"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent(),
    ["n|<A-3>"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent(),
    ["n|<A-4>"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent(),
    ["n|<A-5>"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent(),
    ["n|<A-6>"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent(),
    ["n|<A-7>"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent(),
    ["n|<A-8>"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent(),
    ["n|<A-9>"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent(),
    -- Packer
    ["n|<leader>ps"] = map_cr("PackerSync"):with_silent():with_noremap()
        :with_nowait(),
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent()
        :with_nowait(),
    ["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent()
        :with_nowait(),
    ["n|g["] = map_cr('Lspsaga diagnostic_jump_next'):with_noremap()
        :with_silent(),
    ["n|g]"] = map_cr('Lspsaga diagnostic_jump_prev'):with_noremap()
        :with_silent(),
    ["n|gd"] = map_cmd('<cmd>Telescope lsp_definitions theme=dropdown<CR>'):with_noremap()
        :with_silent(),
    ["n|gr"] = map_cmd('<cmd>Telescope lsp_references theme=dropdown<CR>'):with_noremap()
        :with_silent(),
    ["n|go"] = map_cmd('<cmd>Telescope diagnostics theme=dropdown<CR>'):with_noremap()
        :with_silent(),
    ["n|sa"] = map_cmd('<cmd>Telescope lsp_code_actions theme=dropdown<CR>'):with_noremap()
        :with_silent(),
    ["n|sn"] = map_cmd('<cmd>Lspsaga rename<CR>'):with_noremap()
        :with_silent(),
    ["n|gh"] = map_cmd('<cmd>Lspsaga hover_doc<CR>'):with_noremap():with_silent(),
    ["n|<C-p>"] = map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"):with_noremap():with_silent(),
    ["n|<C-n>"] = map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"):with_noremap():with_silent(),
    ["n|<leader>a"] = map_cu('Lspsaga open_floaterm'):with_noremap():with_silent(),
    ["t|gq"] = map_cu([[<C-\><C-n>:Lspsaga close_floaterm<CR>]]):with_noremap()
		:with_silent(),
    ["n|<leader>z"] = map_cu('set splitbelow|sp|res -5|term'):with_noremap():with_silent(),
    ["n|<C-g>"] = map_cu("Lspsaga open_floaterm lazygit"):with_noremap()
        :with_silent(),
    -- Plugin Telescope
    ["n|Cp"] = map_cu('Telescope project'):with_noremap():with_silent(),
    ["n|Ch"] = map_cu('Telescope help_tags'):with_noremap():with_silent(),
    ["n|Co"] = map_cu('Telescope oldfiles'):with_noremap()
        :with_silent(),
    ["n|Cf"] = map_cu('Telescope find_files'):with_noremap():with_silent(),
    ["n|Cw"] = map_cu('Telescope live_grep'):with_noremap():with_silent(),
    ["n|Cg"] = map_cu('Telescope git_files'):with_noremap()
        :with_silent(),
    -- Plugin vim-eft
    ["n|f"] = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["n|F"] = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["n|t"] = map_cmd("v:lua.enhance_ft_move('t')"):with_expr(),
    ["n|T"] = map_cmd("v:lua.enhance_ft_move('T')"):with_expr(),
    ["n|;"] = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    -- Plugin vim-table-mode
    ["n|<leader>tm"] = map_cr('TableModeToggle'):with_noremap():with_silent(),
    -- Plugin SnipRun
    ["v|r"] = map_cr('SnipRun'):with_noremap():with_silent(),
};

bind.nvim_load_mapping(plug_map)
