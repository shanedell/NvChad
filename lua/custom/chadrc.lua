---@type ChadrcConfig
local M = {}

M.ui = { theme = "nightowl" }
M.plugins = "custom.plugins"

require "custom.configs.remap"
require "custom.configs.filetypes"

return M
