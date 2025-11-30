local fs = require("fs")
local path = require("path")

local M = {}

function M.execute(args)
    local module_name = args[1]
    
    if not module_name then
        print("Error: Module name required")
        print("Usage: lpm create <module_name>")
        return
    end
    
    local module_path = path.join("src", module_name .. ".lua")
    
    if fs.exists(module_path) then
        print("Error: Module already exists: " .. module_path)
        return
    end
    
    local content = string.format("local %s = {}\n\nreturn %s\n", module_name, module_name)
    fs.write_file(module_path, content)
    
    print("Created module: " .. module_path)
end

return M
