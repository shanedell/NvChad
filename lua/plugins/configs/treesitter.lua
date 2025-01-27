local options = {
  ensure_installed = {
    "lua",
    "rust",
    "make",
    "cmake",
    "go",
    "scala",
    "kotlin",
    "zig",
    "python",
    "cpp",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "hcl",
    "bash",
    "dockerfile",
    "ocaml",
    "vue",
    "toml",
    "svelte",
    "terraform",
    "templ",
    "puppet",
    "gomod",
    "gosum",
    "markdown",
  },

  -- highlight = {
  --   enable = true,
  --   use_languagetree = true,
  -- },
  highlight = {
      -- `false` will disable the whole extension
      enable = true,
      disable = function(lang, buf)
          if lang == "html" then
              print("disabled")
              return true
          end

          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
              vim.notify(
                  "File larger than 100KB treesitter disabled for performance",
                  vim.log.levels.WARN,
                  {title = "Treesitter"}
              )
              return true
          end
      end,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = { "markdown" },
  },

  indent = { enable = true },
}

return options
