local M = {}

--- <CMD>command<CR> shorthand
--- @param command string
--- @return string
M.cmd = function (command)
    return "<CMD>" .. command .. "<CR>"
end

return M
