return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    opts = {
      ensure_installed = {
        "cpp",
        "typescript",
        "java",
      },
      highlight = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true },
    },
  },
}
