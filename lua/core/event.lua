local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command("augroup END")
	end
end

function autocmd.load_autocmds()
	local definitions = {
		packer = {},
		bufs = {
			-- Reload vim config automatically
			{
				"BufWritePost",
				[[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]],
			},
			-- Reload Vim script automatically if setlocal autoread
			{
				"BufWritePost,FileWritePost",
				"*.vim",
				[[nested if &l:autoread > 0 | source <afile> | echo 'source ' . bufname('%') | endif]],
			},
			{ "BufWritePre", "/tmp/*", "setlocal noundofile" },
			{ "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
			{ "BufWritePre", "MERGE_MSG", "setlocal noundofile" },
			{ "BufWritePre", "*.tmp", "setlocal noundofile" },
			{ "BufWritePre", "*.bak", "setlocal noundofile" },
			-- auto change directory
			{ "BufEnter", "*", "silent! lcd %:p:h" },
			-- auto place to last edit
			{
				"BufReadPost",
				"*",
				[[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif]],
			},
			-- Auto toggle fcitx5
			-- {"InsertLeave", "* :silent", "!fcitx5-remote -c"},
			-- {"BufCreate", "*", ":silent !fcitx5-remote -c"},
			-- {"BufEnter", "*", ":silent !fcitx5-remote -c "},
			-- {"BufLeave", "*", ":silent !fcitx5-remote -c "}
		},
		wins = {
			-- Highlight current line only on focused window
			{
				"WinEnter,BufEnter,InsertLeave",
				"*",
				[[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]],
			},
			{
				"WinLeave,BufLeave,InsertEnter",
				"*",
				[[if &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal nocursorline | endif]],
			},
			-- Force write shada on leaving nvim
			{
				"VimLeave",
				"*",
				[[if has('nvim') | wshada! | else | wviminfo! | endif]],
			},
			-- Check if file changed when its window is focus, more eager than 'autoread'
			{ "FocusGained", "* checktime" },
			-- Equalize window dimensions when resizing vim window
			{ "VimResized", "*", [[tabdo wincmd =]] },
		},
		ft = {
			{ "FileType", "markdown", "inoremap <buffer> ,e <Esc>/<++><CR>:nohlsearch<CR>\"_c4l| inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>\"_c5l<CR>| inoremap <buffer> ,n ---<Enter><Enter>| inoremap <buffer> ,b **** <++><Esc>F*hi| inoremap <buffer> ,s ~~~~ <++><Esc>F~hi| inoremap <buffer> ,f ** <++><Esc>F*i| inoremap <buffer> ,d `` <++><Esc>F`i| inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA|inoremap <buffer> ,m - [ ]| inoremap <buffer> ,p ![](<++>) <++><Esc>F[a| inoremap <buffer> ,a [](<++>) <++><Esc>F[a| inoremap <buffer> ,1 #<Space><Enter><Enter><++><Esc>kkA| inoremap <buffer> ,2 ##<Space><Enter><Enter><++><Esc>kkA| inoremap <buffer> ,3 ###<Space><Enter><Enter><++><Esc>kkA| inoremap <buffer> ,4 ####<Space><Enter><Enter><++><Esc>kkA| inoremap <buffer> ,5 #####<Space><Enter><Enter><++><Esc>kkA" },
			{ "FileType", "make", "set noexpandtab shiftwidth=8 softtabstop=0" },
			-- Google tab style
			{ "FileType", "c,cpp", "set expandtab tabstop=4 shiftwidth=4" },
			{ "FileType", "dap-repl", "lua require('dap.ext.autocompl').attach()" },
			{
				"FileType",
				"*",
				[[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]],
			},
			{
				"FileType",
				"c",
				"nnoremap <leader>r :set splitbelow|sp|res -5|term gcc % -o %< && time ./%<<CR>i",
			},
			{
				"FileType",
				"cpp",
				"nnoremap <leader>r :set splitbelow|exec '!g++ -std=c++11 % -Wall -o %<'|sp|res -10|term ./%<<CR>i",
			},
			{
				"FileType",
				"python",
				"nnoremap <leader>r :set splitbelow|sp|res -5|term python3 %<CR>i",
			},
			{
				"FileType",
				"markdown",
				"nnoremap <leader>r :MarkdownPreviewToggle<CR>",
			},
		},
		yank = {
			{
				"TextYankPost",
				"*",
				[[silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300})]],
			},
		},
	}

	autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()
