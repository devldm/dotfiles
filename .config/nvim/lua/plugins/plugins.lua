return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.filetypes = { "c", "cpp", "objc", "objcpp", "cc" }
          table.insert(opts.cmd, "--fallback-style=google")
        end,
      },
      servers = {
        pyright = {
          mason = false,
          autostart = false,
        },
        kotlin_language_server = {
          cmd_env = {
            JAVA_HOME = vim.fn.trim(vim.fn.system("mise where java@21")),
          },
        },
      },
    },
  },
}
