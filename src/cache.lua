local fs = require("fs")
local path = require("path")

local M = {}

local CACHE_DIR = "deps"

function M.get_cache_path(package_name, version)
    return path.join(CACHE_DIR, package_name .. "-" .. version)
end

function M.is_cached(package_name, version)
    local cache_path = M.get_cache_path(package_name, version)
    return fs.exists(cache_path)
end

function M.add_to_cache(package_name, version, package_path)
    local cache_path = M.get_cache_path(package_name, version)
    
    if fs.exists(cache_path) then
        fs.remove(cache_path)
    end
    
    fs.mkdir_p(CACHE_DIR)
    
    local cmd = string.format("unzip -q %s -d %s", package_path, cache_path)
    return os.execute(cmd)
end

function M.get_from_cache(package_name, version)
    local cache_path = M.get_cache_path(package_name, version)
    
    if not fs.exists(cache_path) then
        return nil
    end
    
    return cache_path
end

return M
