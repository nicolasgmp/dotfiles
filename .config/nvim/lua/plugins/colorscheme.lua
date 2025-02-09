return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        italic_comments = true,
        hide_fillchars = true,
        borderless_pickers = true,
        terminal_colors = true,
        cache = false,
        saturation = 1,
        variant = "default",
        extensions = {
          noice = true,
          telescope = true,
        },
      })
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "dark",
        floats = "dark",
        transparent = false,
        terminal_colors = true,
        styles = {
          floats = "transparent",
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
}
