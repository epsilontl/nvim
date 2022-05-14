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
			{name = 'tmux'}, {name = 'orgmode'},{ name = "latex_symbols" },
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


function config.luasnip()
	require('luasnip').config.set_config {
		history = true,
		updateevents = "TextChanged,TextChangedI"
	}
	--require("luasnip/loaders/from_vscode").load()
	require("luasnip/loaders/from_vscode").load({paths = {"~/.config/nvim/md-snippets"}})
end


function config.autopairs()
	require("nvim-autopairs").setup({})
end

return config
