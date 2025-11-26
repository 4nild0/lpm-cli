local M = {}

function M.exists(path)
    local f = io.open(path, "r")
    if f then
        f:close()
        return true
    end
    local ok, _, code = os.execute("test -d " .. path)
    return (ok and (code == 0 or code == true)) or false
end

function M.mkdir(path)
    os.execute("mkdir -p " .. path)
end

function M.read_file(path)
    local f = io.open(path, "r")
    if not f then return nil end
    local content = f:read("*a")
    f:close()
    return content
end

function M.write_file(path, content)
    local f = io.open(path, "w")
    if not f then return false end
    f:write(content)
    f:close()
    return true
end

return M
