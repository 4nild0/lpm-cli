local M = {}

local function scan_directory(path)
    local result = {}
    local handle = io.popen("find '" .. path .. "' -type d 2>/dev/null")
    if not handle then return result end
    
    for dir in handle:lines() do
        table.insert(result, dir .. "/")
    end
    handle:close()
    return result
end

function M.setup(base_path, directories)
    local all_paths = {}
    
    for _, dir in ipairs(directories) do
        local full_path = base_path .. dir
        local subdirs = scan_directory(full_path)
        for _, subdir in ipairs(subdirs) do
            table.insert(all_paths, subdir)
        end
    end
    
    for _, path in ipairs(all_paths) do
        package.path = string.format("%s?.lua;%s?/init.lua;%s", path, path, package.path)
        package.cpath = string.format("%s?.so;%s", path, package.cpath)
    end
end

return M