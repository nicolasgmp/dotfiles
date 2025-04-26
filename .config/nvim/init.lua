-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
-- require("neo-tree").setup({
--   window = {
--     position = "right",
--   },
-- })
