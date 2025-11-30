local network = require("network")
local metadata = require("metadata")
local fs = require("fs")
local path = require("path")

local M = {}

function M.execute(args)
    local pkg = metadata.load(".")
    
    if not pkg then
        print("Error: Invalid or missing project.toml")
        return
    end
    
    local package_file = pkg.name .. "-" .. pkg.version .. ".zip"
    
    if not fs.exists(package_file) then
        print("Error: Package file not found. Run 'lpm pack' first")
        return
    end
    
    local server_url = _G.ENV.SERVER_URL or "http://localhost:8080"
    local url = string.format("%s/packages/%s/%s", server_url, pkg.name, pkg.version)
    
    print("Publishing: " .. pkg.name .. "@" .. pkg.version)
    
    local package_data = fs.read_file(package_file)
    
    local headers = {
        ["Content-Type"] = "application/zip"
    }
    
    local response, err = network.post(url, headers, package_data)
    
    if not response then
        print("Error: " .. (err or "Network error"))
        return
    end
    
    if response.status == 200 or response.status == 201 then
        print("Published successfully: " .. pkg.name .. "@" .. pkg.version)
        return
    end
    
    print("Error: Publish failed (HTTP " .. response.status .. ")")
end

return M
