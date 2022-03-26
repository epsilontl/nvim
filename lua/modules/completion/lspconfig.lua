-- https://github.com/williamboman/nvim-lsp-installer
vim.cmd([[packadd nvim-lsp-installer]])
vim.cmd([[packadd lspsaga.nvim]])
vim.cmd([[packadd lsp_signature.nvim]])
vim.cmd([[packadd cmp-nvim-lsp]])
vim.cmd([[packadd aerial.nvim]])


local lsp_installer_servers = require("nvim-lsp-installer.servers")

-- use cmp_nvim_lsp instead of built-in omnifunc for a stronger completion experience
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- WARN: lsp install manually write lsp configuration files

-- name   : https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- config : https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- also note that the installed versions of nodejs and npm should be newer, too long versions will cause lsp to not work properly

local servers = {
    sumneko_lua = require("modules.completion.lsp.sumneko_lua"),
    pyright = require("modules.completion.lsp.pyright"),
    -- tsserver = require("modules.completion.lsp.tsserver"),
    -- html = require("modules.completion.lsp.html"),
    -- cssls = require("modules.completion.lsp.cssls"),
    -- gopls = require("modules.completion.lsp.gopls"),
    -- jsonls = require("modules.completion.lsp.jsonls"),
    -- zeta_note = require("modules.completion.lsp.zeta_note"),
    -- vuels = require("modules.completion.lsp.vuels")
}

local function disgnostic_settings()
    -- diagnostic style customization
    vim.diagnostic.config(
        {
            virtual_text = {
                prefix = "●",
                source = "always"
            },
            float = {
                source = "always"
            },
            update_in_insert = false
        }
    )
end

local function attach(client)
    require("aerial").on_attach(client)
    disgnostic_settings()
end

-- automatically install or start LanguageServers
for server_name, server_options in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    -- determine if the service is available
    if server_available then
        -- determine whether the service is ready, if it is ready, start the service
        server:on_ready(
            function()
                -- keybind
                server_options.on_attach = attach
                -- options config
                server_options.flags = {
                    debounce_text_changes = 150
                }
                -- instead of built-in omnifunc
                server_options.capabilities = capabilities
                server:setup(server_options)
            end
        )
    end
end
