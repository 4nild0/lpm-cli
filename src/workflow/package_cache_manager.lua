local package_cache_manager = {}
local filesystem_operations = require("filesystem.filesystem_operations")
local path_resolver = require("filesystem.path_resolver")

local CACHE_DIR = "deps"

function package_cache_manager.get_cache_path(package_name, version)
    return path_resolver.join(CACHE_DIR, package_name .. "-" .. version)
end

function package_cache_manager.is_cached(package_name, version)
    local cache_path = package_cache_manager.get_cache_path(package_name, version)
    return filesystem_operations.exists(cache_path)
end

function package_cache_manager.add_to_cache(package_name, version, package_path)
    local cache_path = package_cache_manager.get_cache_path(package_name, version)
    
    if filesystem_operations.exists(cache_path) then
        filesystem_operations.remove(cache_path)
    end
    
    filesystem_operations.mkdir_p(CACHE_DIR)
    
    local cmd = string.format("unzip -q %s -d %s", package_path, cache_path)
    return os.execute(cmd)
end

function package_cache_manager.get_from_cache(package_name, version)
    local cache_path = package_cache_manager.get_cache_path(package_name, version)
    
    if not filesystem_operations.exists(cache_path) then
        return nil
    end
    
    return cache_path
end

return package_cache_manager

