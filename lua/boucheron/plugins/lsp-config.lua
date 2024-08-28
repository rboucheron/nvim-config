return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    }, 
    {
        "williamboman/mason-lspconfig.nvim", 
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "tsserver" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        end
    },
}
