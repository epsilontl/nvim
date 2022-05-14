local config = {}
local sessions_dir = vim.fn.stdpath("data") .. "/sessions/"

function config.nvim_treesitter()
    vim.api.nvim_command('set foldmethod=expr')
    vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

    require'nvim-treesitter.configs'.setup {
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"lua",
			"json",
			"yaml",
			"latex",
			"markdown",
			"make",
			"python",
			"rust",
			"html",
			"javascript",
			"typescript",
			"css",
		},
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
                goto_previous_start = {
                    ["[["] = "@function.outer",
                    ["[m"] = "@class.outer"
                },
            }
        },
    }
end

function config.matchup()
    vim.cmd [[let g:matchup_matchparen_offscreen = {'method': 'popup'}]]
end

return config
