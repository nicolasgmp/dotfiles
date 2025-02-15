return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      require("refactoring").setup({
        prompt_func_return_type = {
          go = true,
          cpp = true,
          typescript = true,
        },
        {
          prompt_func_param_type = {
            go = true,
            cpp = true,
            typescript = true,
          },
        },
      })
    end,
  },
}
