return {
  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    config = function()
      require("refactoring").setup({
        prompt_func_param_type = {
          go = true,
          ts = true,
        },
      })
    end,
  },
}
