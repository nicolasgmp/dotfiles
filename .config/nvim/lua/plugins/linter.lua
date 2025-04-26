return {
  {
    event = "VeryLazy",
    "mfussenegger/nvim-lint",
    optional = true,
    dependencies = "williamboman/mason.nvim",
    opts = {
      linters_by_ft = { kotlin = { "ktlint" } },
    },
  },
}
