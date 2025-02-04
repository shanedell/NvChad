local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "rust-analyzer",
        "pyright",
        "zls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "custom.configs.lspconfig"
    end,
  },
}

return plugins
