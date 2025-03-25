return {
  {
    "nvim-tree/nvim-web-devicons",
    enabled = false,
  },

  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = false,
    priority = 1000,
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
    config = function()
      require("mini.icons").setup()
    end,
  },

  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.pairs").setup()
      require("mini.hipatterns").setup()
    end,
  },
}
