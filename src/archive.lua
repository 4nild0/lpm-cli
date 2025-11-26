local M = {}

function M.pack(dir, output)
    -- Uses system zip command
    -- In a real scenario, we might want a pure Lua solution or check for tar/zip availability
    local cmd = string.format("cd %s && zip -r ../%s . >/dev/null 2>&1", dir, output)
    local ok = os.execute(cmd)
    if ok == 0 or ok == true then
        return true
    end
    return false, "zip command failed"
end

return M
