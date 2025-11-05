-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local minimap = require("mini.map")

vim.keymap.set("n", "<Leader>mc", minimap.close, { desc = "Minimap: Close" })
vim.keymap.set("n", "<Leader>mf", minimap.toggle_focus, { desc = "Minimap: Toggle Focus" })
vim.keymap.set("n", "<Leader>mo", minimap.open, { desc = "Minimap: Open" })
vim.keymap.set("n", "<Leader>mr", minimap.refresh, { desc = "Minimap: Refresh" })
vim.keymap.set("n", "<Leader>ms", minimap.toggle_side, { desc = "Minimap: Toggle Side" })
vim.keymap.set("n", "<Leader>mt", minimap.toggle, { desc = "Minimap: Toggle" })
