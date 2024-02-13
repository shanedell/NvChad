---@type ChadrcConfig
local M = {}

M.ui = { theme = 'gatekeeper' }
M.plugins = "custom.plugins"

require("custom.configs.remap")

return M
