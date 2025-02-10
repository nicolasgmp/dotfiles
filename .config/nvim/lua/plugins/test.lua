return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npx jest --",
          }),
        },
        output_panel = {
          open = "botright vnew",
        },
        summary = {
          enabled = true,
        },
      })
    end,
  },
  {
    "nvim-neotest/neotest-jest",
  },
}
