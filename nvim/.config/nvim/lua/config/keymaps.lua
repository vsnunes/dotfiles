-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local copilot_enabled = false

local function toggle_copilot()
  if copilot_enabled then
    vim.cmd("Copilot disable")
    print("Copilot Disabled")
    copilot_enabled = false
  else
    vim.cmd("Copilot enable")
    print("Copilot Enabled")
    copilot_enabled = true
  end
end

vim.keymap.set("n", "<leader>ct", toggle_copilot, { desc = "Toggle Copilot" })
