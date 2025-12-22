-- Yukinord colorscheme for Neovim
-- Based on the VSCode theme inspired by Nord and Nord Deep

local M = {}

-- Default configuration
M.config = {
  style = "dark", -- Theme style: "dark" or "light"
  transparent = false, -- Enable transparent background
  transparent_sidebar = false, -- Enable transparent background for sidebars (NvimTree, etc.)
}

function M.setup(opts)
  opts = opts or {}
  M.config = vim.tbl_deep_extend("force", M.config, opts)
end

return M

