local fs = require("fs")
local metadata = require("metadata")

local M = {}

function M.execute(args)
    local pkg = metadata.load(".")
    
    if not pkg then
        print("Error: Invalid or missing project.toml")
        return
    end
    
    if not fs.exists("src") then
        print("Error: Missing src directory")
        return
    end
    
    print("Project validation passed")
    print("Name: " .. pkg.name)
    print("Version: " .. pkg.version)
end

return M
