local vim = vim

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.enhance_ft_move = function(key)
    if not packer_plugins['vim-eft'].loaded then vim.cmd [[packadd vim-eft]] end
    local map = {
        f = '<Plug>(eft-f)',
        F = '<Plug>(eft-F)',
        t = '<Plug>(eft-t)',
        T = '<Plug>(eft-T)',
        [';'] = '<Plug>(eft-repeat)'
    }
    return t(map[key])
end
