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
      },
    },
  },
}
