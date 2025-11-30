local network = require("network")
local cache = require("cache")
local fs = require("fs")

local M = {}

function M.execute(args)
    local package_spec = args[1]
    
    if not package_spec then
        print("Error: Package name required")
        print("Usage: lpm install <package>[@version]")
        return
    end
    
    local package_name, version = package_spec:match("^([^@]+)@?(.*)$")
    version = version ~= "" and version or "latest"
    
    if cache.is_cached(package_name, version) then
        print("Package already installed: " .. package_name .. "@" .. version)
        return
    end
    
    local server_url = _G.ENV.SERVER_URL or "http://localhost:8080"
    local url = string.format("%s/packages/%s/%s", server_url, package_name, version)
    
    print("Downloading: " .. package_name .. "@" .. version)
    
    local response, err = network.get(url)
    
    if not response then
        print("Error: " .. (err or "Network error"))
        return
    end
    
    if response.status ~= 200 then
        print("Error: Package not found (HTTP " .. response.status .. ")")
        return
    end
    
    local temp_file = "/tmp/" .. package_name .. "-" .. version .. ".zip"
    fs.write_file(temp_file, response.body)
    
    cache.add_to_cache(package_name, version, temp_file)
    fs.remove(temp_file)
    
    print("Installed: " .. package_name .. "@" .. version)
end

return M
