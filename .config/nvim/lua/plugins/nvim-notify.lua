return {
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        timeout = 2000,
        max_height = 10,
        stages = "fade_in_slide_out",
        render = "compact",
        top_down = true,
      })
    end,
  },
}
