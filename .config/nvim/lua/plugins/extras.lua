return {
  {
    "michaelb/sniprun",
    build = "sh install.sh",
    opts = {
      display = { "NvimNotify" },
      selected_interpreters = { "TSNode", "Cpp" },
      repl_enable = { "Cpp", "TSNode" },
      interpreter_options = {
        Cpp = {
          compiler = "g++",
          compiler_flags = "-std=c++17 -Wall",
        },
        TSNode = {
          command = "npx ts-node",
        },
      },
    },
    keys = {
      { "<leader>rr", "<cmd>SnipRun<CR>", desc = "Run Code" },
      { "<leader>rl", "<cmd>SnipReset<CR>", desc = "Reset SnipRun" },
    },
  },
}
