local config = {}
local sessions_dir = vim.fn.stdpath("data") .. "/sessions/"

function config.vim_cursorwod()
    vim.api.nvim_command('augroup user_plugin_cursorword')
    vim.api.nvim_command('autocmd!')
    vim.api.nvim_command(
        'autocmd FileType NvimTree,lspsagafinder,dashboard let b:cursorword = 0')
    vim.api.nvim_command(
        'autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif')
    vim.api.nvim_command('autocmd InsertEnter * let b:cursorword = 0')
    vim.api.nvim_command('autocmd InsertLeave * let b:cursorword = 1')
    vim.api.nvim_command('augroup END')
end

function config.nvim_treesitter()
    vim.api.nvim_command('set foldmethod=expr')
    vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

    require'nvim-treesitter.configs'.setup {
        ensure_installed = 'maintained',
        highlight = {enable = true, disable = {'vim'}},
        context_commentstring = {enable = true, enable_autocmd = false},
        matchup = {enable = true},
        context = {enable = true, throttle = true}
    }
end

function config.nvim_textobjects()
    require'nvim-treesitter.configs'.setup {
        textobjects = {
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]]"] = "@function.outer",
                    ["]m"] = "@class.outer"
                },
                goto_next_end = {
                    ["qwe"] = "@function.outer",
                    ["qwe"] = "@class.outer"
                },
                goto_previous_start = {
                    ["[["] = "@function.outer",
                    ["[m"] = "@class.outer"
                },
                goto_previous_end = {
                    ["[]"] = "@function.outer",
                    ["[M"] = "@class.outer"
                }
            }
        },
    }
end

function config.matchup()
    vim.cmd [[let g:matchup_matchparen_offscreen = {'method': 'popup'}]]
end

return config
