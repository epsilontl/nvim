local config = {}

function config.nvim_lsp() require('modules.completion.lspconfig') end

function config.cmp()
	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

	local cmp = require('cmp')
	cmp.setup {
		formatting = {
			format = function(entry, vim_item)
				local lspkind_icons = {
					Text = "",
					Method = "",
					Function = "",
					Constructor = "",
					Field = "ﰠ",
					Variable = "",
					Class = "ﴯ",
					Interface = "",
					Module = "",
					Property = "ﰠ",
					Unit = "塞",
					Value = "",
					Enum = "",
					Keyword = "",
					Snippet = "",
					Color = "",
					File = "",
					Reference = "",
					Folder = "",
					EnumMember = "",
					Constant = "",
					Struct = "פּ",
					Event = "",
					Operator = "",
					TypeParameter = ""
				}
				-- load lspkind icons
				vim_item.kind = string.format("%s %s",
				lspkind_icons[vim_item.kind],
				vim_item.kind)

				vim_item.menu = ({
					-- cmp_tabnine = "[TN]",
					orgmode = "[ORG]",
					nvim_lsp = "[LSP]",
					nvim_lua = "[Lua]",
					buffer = "[BUF]",
					path = "[PATH]",
					tmux = "[TMUX]",
					luasnip = "[SNIP]",
					spell = "[SPELL]"
				})[entry.source.name]

				return vim_item
			end
		},
		-- You can set mappings if you want
		mapping = {
			['<C-k>'] = cmp.mapping.select_prev_item(),
			['<C-j>'] = cmp.mapping.select_next_item(),
			["<C-Space>"] = cmp.mapping.complete(),
			["<Tab>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			['<C-e>'] = cmp.mapping.close(),
			["<C-h>"] = function(fallback)
				if require("luasnip").jumpable(-1) then
					vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
				else
					fallback()
				end
			end,
			["<C-l>"] = function(fallback)
				if require("luasnip").expand_or_jumpable() then
					vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
				else
					fallback()
				end
			end
		},

		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end
		},

		-- You should specify your *installed* sources.
		sources = {
			{name = 'nvim_lsp'}, {name = 'nvim_lua'}, {name = 'luasnip'},
			{name = 'buffer'}, {name = 'path'}, {name = 'spell'},
			{name = 'tmux'}, {name = 'orgmode'}
			-- {name = 'cmp_tabnine'},
		}
	}
end

function config.lspsaga()
	require("lspsaga").setup(
	{
		-- 提示边框样式：round、single、double
		border_style = "round",
		error_sign = " ",
		warn_sign = " ",
		hint_sign = " ",
		infor_sign = " ",
		diagnostic_header_icon = " ",
		-- 正在写入的行提示
		code_action_icon = " ",
		code_action_prompt = {
			-- 显示写入行提示
			-- 如果为 true ，则写代码时会在左侧行号栏中显示你所定义的图标
			enable = false,
			sign = true,
			sign_priority = 40,
			virtual_text = true
		},
		-- 快捷键配置
		code_action_keys = {
			quit = "<Esc>",
			exec = "<CR>"
		},
		rename_action_keys = {
			quit = "<Esc>",
			exec = "<CR>"
		}
	}
	)
end

function config.fidget()
	require("fidget").setup({
		window = {
			-- 窗口全透明，不建议修改这个选项
			-- 否则主题透明时将会出现一大片黑块
			blend = 0,
		}
	})
end

function config.lightbulb()
	vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
	require'nvim-lightbulb'.setup {
		-- LSP client names to ignore
		-- Example: {"sumneko_lua", "null-ls"}
		ignore = {},
		sign = {
			enabled = true,
			-- Priority of the gutter sign
			priority = 10,
		},
		float = {
			enabled = false,
			-- Text to show in the popup float
			text = "💡",
			-- Available keys for window options:
			-- - height     of floating window
			-- - width      of floating window
			-- - wrap_at    character to wrap at for computing height
			-- - max_width  maximal width of floating window
			-- - max_height maximal height of floating window
			-- - pad_left   number of columns to pad contents at left
			-- - pad_right  number of columns to pad contents at right
			-- - pad_top    number of lines to pad contents at top
			-- - pad_bottom number of lines to pad contents at bottom
			-- - offset_x   x-axis offset of the floating window
			-- - offset_y   y-axis offset of the floating window
			-- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
			-- - winblend   transparency of the window (0-100)
			win_opts = {},
		},
		virtual_text = {
			enabled = false,
			-- Text to show at virtual text
			text = "💡",
			-- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
			hl_mode = "replace",
		},
		status_text = {
			enabled = false,
			-- Text to provide when code actions are available
			text = "💡",
			-- Text to provide when no actions are available
			text_unavailable = ""
		}
}
end

function config.nvim_lint()
	require("lint").linters_by_ft = {
		python = {"pylint"}
		-- javascript = {"eslint"},
		-- typescript = {"eslint"},
		-- go = {"golangcilint"}
	}
	require("lint.linters.pylint").args = {
		"-f",
		"json",
		"--rcfile=~/.config/nvim/lint/pylint.conf"
	}
	-- 何时触发检测：
	-- BufEnter    ： 载入 Buf 后
	-- BufWritePost： 写入文件后
	-- 由于搭配了 AutoSave，所以其他的事件就不用加了
	vim.cmd([[
	au BufEnter * lua require('lint').try_lint()
	au BufWritePost * lua require('lint').try_lint()
	]])
end

function config.luasnip()
	require('luasnip').config.set_config {
		history = true,
		updateevents = "TextChanged,TextChangedI"
	}
	--require("luasnip/loaders/from_vscode").load()
	require("luasnip/loaders/from_vscode").load({paths = {"~/.config/nvim/md-snippets"}})
end

function config.signature()
	require("lsp_signature").setup(
	{
		bind = true,
		-- 边框样式
		handler_opts = {
			-- double、rounded、single、shadow、none
			border = "rounded"
		},
		-- 自动触发
		floating_window = false,
		-- 绑定按键
		toggle_key = "<C-j>",
		-- 虚拟提示关闭
		hint_enable = false,
		-- 正在输入的参数将如何突出显示
		hi_parameter = "LspSignatureActiveParameter"
	}
	)
end

function config.autopairs()
	require("nvim-autopairs").setup({})
end

function config.aerial()
	require("aerial").setup(
	{
		min_width = 30,
		-- backends = {"lsp", "treesitter", "markdown"}
		backends = {"treesitter", "markdown"},
		-- false 是显示所有的图标
		filter_kind = false,
		-- 将从 lspkind 和 nvim-web-devicons 中获得图标
		nerd_font = "auto",
		-- 何时更新
		update_events = "TextChanged,InsertLeave",
	}
	)
end
return config
