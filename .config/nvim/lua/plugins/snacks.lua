return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      hidden = true,
      ignored = true,
      exclude = { ".git", "node_modules", ".cache", ".idea" },
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          exclude = { ".git", "node_modules", ".cache", ".idea" },
          layout = { layout = { position = "right" } },
        },
      },
    },
  },
}
