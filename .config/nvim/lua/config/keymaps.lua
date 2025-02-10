-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local discipline = require("nicolas.discipline")
discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("v", "<C-c>", ":w !clip.exe<CR>", opts)
keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<leader>tn", ":Neotest run<CR>", opts)
keymap.set("n", "<leader>te", ":Neotest stop<CR>", opts)
keymap.set("n", "<leader>ts", ":Neotest summary<CR>", opts)
