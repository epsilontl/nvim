local lang = {}
local conf = require('modules.lang.config')

lang['kristijanhusak/orgmode.nvim'] = {
    opt = true,
    ft = "org",
    config = conf.lang_org
}
lang['iamcco/markdown-preview.nvim'] = {
    opt = true,
    ft = "markdown",
    run = 'cd app && yarn install',
    config = conf.markdown_view
}
lang['dhruvasagar/vim-table-mode'] = {
    opt = true,
    ft = {"markdown","text"}
}
return lang
