local config = {}
local exec = vim.api.nvim_command

function config.lang_org()
    require('orgmode').setup({
        org_agenda_files = {'~/Sync/org/*'},
        org_default_notes_file = '~/Sync/org/refile.org'
    })
end

function config.markdown_view()
    vim.g.mkdp_browser = 'google-chrome-stable'
end

return config
