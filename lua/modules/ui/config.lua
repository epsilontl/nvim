local config = {}

function config.edge()
    vim.cmd [[set background=dark]]
    vim.g.edge_style = "aura"
    vim.g.edge_enable_italic = 1
    vim.g.edge_disable_italic_comment = 1
    vim.g.edge_show_eob = 1
    vim.g.edge_better_performance = 1
end

function config.lualine()
    local function lsp()
        local icon = [[  LSP: ]]
        local msg = 'No Active LSP'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then return icon .. msg end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return icon .. client.name
            end
        end
        return icon .. msg
    end

    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'onedark',
            disabled_filetypes = {}
        },

        sections = {
            lualine_a = {'mode'},
            lualine_b = {{'branch'}, {'diff'}},
            lualine_c = {'filename'},
            lualine_x = {
                {
                    'diagnostics',
                    sources = {'nvim_lsp'},
                    color_error = "#BF616A",
                    color_warn = "#EBCB8B",
                    color_info = "#81A1AC",
                    color_hint = "#88C0D0",
                    symbols = {error = ' ', warn = ' ', info = ' '}
                }, {lsp}, {'encoding'}, {'fileformat'}
            },
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {}
    }
end


function config.nvim_bufferline()
    require('bufferline').setup {
        options = {
            number = "both",
            numbers = function(opts)

                return string.format('%s·%s', opts.raise(opts.ordinal),
                                     opts.lower(opts.id))
            end,
            modified_icon = '●',
            buffer_close_icon = '',
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 14,
            max_prefix_length = 13,
            tab_size = 20,
            show_buffer_close_icons = true,
            show_buffer_icons = true,
            show_tab_indicators = true,
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            separator_style = "slant",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    padding = 1
                }
            }
        }
    }
end

function config.gitsigns()
    if not packer_plugins['plenary.nvim'].loaded then
        vim.cmd [[packadd plenary.nvim]]
    end
    require('gitsigns').setup {
        signs = {
            add = {hl = 'GitGutterAdd', text = '▋'},
            change = {hl = 'GitGutterChange', text = '▋'},
            delete = {hl = 'GitGutterDelete', text = '▋'},
            topdelete = {hl = 'GitGutterDeleteChange', text = '▔'},
            changedelete = {hl = 'GitGutterChange', text = '▎'}
        },
        keymaps = {
            -- Default keymap options
            noremap = true,
            buffer = true,

            ['n ]g'] = {
                expr = true,
                "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"
            },
            ['n [g'] = {
                expr = true,
                "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"
            },

            ['n K'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        },
        watch_gitdir = {interval = 1000, follow_files = true},
        current_line_blame = true,
        current_line_blame_opts = {delay = 1000, virtual_text_pos = 'eol'},
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        word_diff = false,
        diff_opts = {internal = true}
    }
end

function config.nvim_hlslens()
	local kopts = {noremap = true, silent = true}

	vim.api.nvim_set_keymap('n', 'n',
		[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
		kopts)
	vim.api.nvim_set_keymap('n', 'N',
		[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
		kopts)
	vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
	vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
	vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
	vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

	vim.api.nvim_set_keymap('n', '<Leader>3', ':noh<CR>', kopts)
end

function config.indent_blankline()
    -- vim.cmd [[highlight IndentTwo guifg=#D08770 guibg=NONE gui=nocombine]]
    -- vim.cmd [[highlight IndentThree guifg=#EBCB8B guibg=NONE gui=nocombine]]
    -- vim.cmd [[highlight IndentFour guifg=#A3BE8C guibg=NONE gui=nocombine]]
    -- vim.cmd [[highlight IndentFive guifg=#5E81AC guibg=NONE gui=nocombine]]
    -- vim.cmd [[highlight IndentSix guifg=#88C0D0 guibg=NONE gui=nocombine]]
    -- vim.cmd [[highlight IndentSeven guifg=#B48EAD guibg=NONE gui=nocombine]]
    -- vim.g.indent_blankline_char_highlight_list = {
    --     "IndentTwo", "IndentThree", "IndentFour", "IndentFive", "IndentSix",
    --     "IndentSeven"
    -- }
    require("indent_blankline").setup {
        char = "│",
        show_first_indent_level = true,
        filetype_exclude = {
            "startify", "dashboard", "dotooagenda", "log", "fugitive",
            "gitcommit", "packer", "vimwiki", "markdown", "json", "txt",
            "vista", "help", "todoist", "NvimTree", "peekaboo", "git",
            "TelescopePrompt", "undotree", "flutterToolsOutline", "" -- for all buffers without a file type
        },
        buftype_exclude = {"terminal", "nofile"},
        show_trailing_blankline_indent = false,
        show_current_context = true,
        context_patterns = {
            "class", "function", "method", "block", "list_literal", "selector",
            "^if", "^table", "if_statement", "while", "for", "type", "var",
            "import"
        }
    }
    -- because lazy load indent-blankline so need readd this autocmd
    vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
end

function config.nvim_tree()
	vim.g.nvim_tree_icons = {
		default = " ",
		symlink = " ",
		git = {
			unstaged = "",
			staged = "✓",
			unmerged = "",
			renamed = "➜",
			untracked = "",
			deleted = "",
			ignored = ""
		},
		folder = {
			-- arrow_open = "╰─▸",
			-- arrow_closed = "├─▸",
			arrow_open = "",
			arrow_closed = "",
			default = "",
			open = "",
			empty = "",
			empty_open = "",
			symlink = "",
			symlink_open = ""
		}
	}
	vim.g.nvim_tree_add_trailing = 0

	require('nvim-tree').setup ({
        -- 自动关闭
        auto_close = true,
        -- 视图
        view = {
            -- 宽度
            width = 30,
            -- 高度
            height = 30,
            -- 隐藏顶部的根目录显示
            hide_root_folder = false,
            -- 自动调整大小
            auto_resize = true
        },
        diagnostics = {
            -- 是否启用文件诊断信息
            enable = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = ""
            }
        },
        git = {
            -- 是否启用 git 信息
            enable = true,
            ignore = true,
            timeout = 500
        },
	-- 默认图标，可自行修改
	-- 默认按键
	-- o     ：打开目录或文件
	-- a     ：新增目录或文件
	-- r     ：重命名目录或文件
	-- x     ：剪切目录或文件
	-- c     ：复制目录或文件
	-- d     ：删除目录或文件
	-- y     ：复制目录或文件名称
	-- Y     ：复制目录或文件相对路径
	-- gy    ：复制目录或文件绝对路径
	-- p     ：粘贴目录或文件
	-- s     ：使用系统默认程序打开目录或文件
	-- <Tab> ：将文件添加到缓冲区，但不移动光标
	-- <C-v> ：垂直分屏打开文件
	-- <C-x> ：水平分屏打开文件
	-- <C-]> ：进入光标下的目录
	-- <C-r> ：重命名目录或文件，删除已有目录名称
	-- -     ：返回上层目录
	-- I     ：切换隐藏文件/目录的可见性
	-- H     ：切换点文件的可见性
	-- R     ：刷新资源管理器
	-- 另外，文件资源管理器操作和操作文档方式一致，可按 / ? 进行搜索
	})
end

return config
