local config = {}

function config.telescope()
    local home = os.getenv("HOME")

    if not packer_plugins['plenary.nvim'].loaded then
        vim.cmd [[packadd plenary.nvim]]
    end

    if not packer_plugins['popup.nvim'].loaded then
        vim.cmd [[packadd popup.nvim]]
    end

    if not packer_plugins['telescope-fzy-native.nvim'].loaded then
        vim.cmd [[packadd telescope-fzy-native.nvim]]
    end

    if not packer_plugins['telescope-project.nvim'].loaded then
        vim.cmd [[packadd telescope-project.nvim]]
    end


    require('telescope').setup {
        defaults = {
            prompt_prefix = '🔭 ',
            selection_caret = " ",
            layout_config = {
                horizontal = {prompt_position = "bottom", results_width = 0.6},
                vertical = {mirror = false}
            },
            file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
            grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep
                .new,
            qflist_previewer = require'telescope.previewers'.vim_buffer_qflist
                .new,
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = {"absolute"},
            winblend = 0,
            border = {},
            borderchars = {
                "─", "│", "─", "│", "╭", "╮", "╯", "╰"
            },
            color_devicons = true,
            use_less = true,
            set_env = {["COLORTERM"] = "truecolor"},
            mappings = {
                i = {
                    ["<C-j>"] = require('telescope.actions').move_selection_next,
                    ["<C-k>"] = require('telescope.actions').move_selection_previous,
                    ["<C-l>"] = require('telescope.actions').select_default,
					["<C-p>"] = require('telescope.actions').preview_scrolling_up,
					["<C-n>"] = require('telescope.actions').preview_scrolling_down,
                },
                n = {
                    ["l"] =require('telescope.actions').select_default
                }
            }
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true
            },
        }
    }
    require('telescope').load_extension('fzy_native')
    require('telescope').load_extension('project')
end


function config.sniprun()
    require'sniprun'.setup({
        selected_interpreters = {}, -- " use those instead of the default for the current filetype
        repl_enable = {}, -- " enable REPL-like behavior for the given interpreters
        repl_disable = {}, -- " disable REPL-like behavior for the given interpreters

        interpreter_options = {
            -- C_original = {
            --     compiler = "clang"
            -- },
            -- Cpp_original = {
            --     compiler = "clang --debug"
            -- }
        }, -- " intepreter-specific options, consult docs / :SnipInfo <name>

        -- " you can combo different display modes as desired
        display = {
            "Classic", -- "display results in the command-line  area
            "TempFloatingWindow",      -- "display results in a floating window
        },

        -- " miscellaneous compatibility/adjustement settings
        inline_messages = 0, -- " inline_message (0/1) is a one-line way to display messages
        -- " to workaround sniprun not being able to display anything

        borders = 'shadow' -- " display borders around floating windows
        -- " possible values are 'none', 'single', 'double', or 'shadow'
    })
end

function config.wilder()
    vim.cmd [[
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('use_python_remote_plugin', 0)

call wilder#set_option('pipeline', [wilder#branch(wilder#cmdline_pipeline({'use_python': 0,'fuzzy': 1, 'fuzzy_filter': wilder#lua_fzy_filter()}),wilder#vim_search_pipeline(), [wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({'draw': [{_, x -> ' ' . x}]})])])

call wilder#set_option('renderer', wilder#renderer_mux({':': wilder#popupmenu_renderer({'highlighter': wilder#lua_fzy_highlighter(), 'left': [wilder#popupmenu_devicons()], 'right': [' ', wilder#popupmenu_scrollbar()]}), '/': wilder#wildmenu_renderer({'highlighter': wilder#lua_fzy_highlighter()})}))
]]

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
