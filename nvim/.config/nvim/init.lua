-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local function _read_system_settings(cmd, search)
  local handle = io.popen(cmd)

  if handle then
    local result = handle:read("*a")
    handle:close()

    if result:find(search) then
      return "dark"
    else
      return "light"
    end
  end
end

-- checks for system dark/light mode preference
local function get_system_theme()
  local theme
  if vim.fn.has("macunix") then
    theme = _read_system_settings("defaults read -g AppleInterfaceStyle 2>/dev/null", "Dark")
  elseif vim.fn.has("unix") then
    theme = _read_system_settings("gsettings get org.gnome.desktop.interface color-scheme", "prefer-dark")
  else
    theme = "dark"
  end

  return theme
end

vim.o.background = get_system_theme()
vim.cmd([[colorscheme tokyonight]])
