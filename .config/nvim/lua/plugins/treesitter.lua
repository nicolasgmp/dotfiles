return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "cpp",
        "fish",
        "gitignore",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "python",
        "typescript",
        "ninja",
        "rst",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
