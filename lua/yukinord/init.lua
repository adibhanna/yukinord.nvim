-- Yukinord colorscheme for Neovim
-- Based on the VSCode theme inspired by Nord and Nord Deep

local M = {}

-- Default configuration
local defaults = {
  style = "dark", -- Theme style: "dark" or "light"
  transparent = false, -- Enable transparent background
  transparent_sidebar = false, -- Enable transparent background for sidebars (NvimTree, etc.)
}

-- Initialize config from vim.g or defaults
M.config = vim.g.yukinord_config or vim.deepcopy(defaults)

function M.setup(opts)
  opts = opts or {}
  M.config = vim.tbl_deep_extend("force", defaults, opts)
  -- Store in vim.g so it persists across module reloads
  vim.g.yukinord_config = M.config
end

return M

