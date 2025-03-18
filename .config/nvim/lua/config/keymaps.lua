-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("v", "<C-c>", ":w !clip.exe<CR>", opts)
keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<F6>", "<cmd>CompilerOpen<cr>", opts)
keymap.set("n", "<S-F6>", "<cmd>CompilerStop<cr>" .. "<cmd>CompilerRedo<cr>", opts)
vim.api.nvim_set_keymap("n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
