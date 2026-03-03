local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.docker_compose_language_service.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "docker-compose.yml",
    "docker-compose.yaml",
    "compose.yml",
    "compose.yaml",
    "yaml.docker-compose",
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.templ.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "templ" },
}

-- Customized setup of gopls lsp server
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        fillstruct = true,
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = { "/Users/sdell/.rustup/toolchains/stable-aarch64-apple-darwin/bin/rust-analyzer" },
  settings = {
    rust_analyzer = {
      import = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      format = {
        enable = true,
      },
    },
  },
}

lspconfig.zls.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  on_attach = on_attach,
  capabilities = capabilities,

  -- omit the following line if `zls` is in your PATH
  cmd = { "/Users/sdell/dev/github/zls/zig-out/bin/zls" },

  filetypes = { "zig" },
  -- There are two ways to set config options:
  --   - edit your `zls.json` that applies to any editor that uses ZLS
  --   - set in-editor config options with the `settings` field below.
  --
  -- Further information on how to configure ZLS:
  -- https://zigtools.org/zls/configure/
  settings = {
    zls = {
      -- Whether to enable build-on-save diagnostics
      --
      -- Further information about build-on save:
      -- https://zigtools.org/zls/guides/build-on-save/
      -- enable_build_on_save = true,

      -- omit the following line if `zig` is in your PATH
      -- zig_exe_path = '/Users/sdell/dev/github/zls/zls-out/bin/zls'
    },
  },
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html" },
}
