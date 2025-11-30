local fs = require("fs")
local path = require("path")
local metadata = require("metadata")

local M = {}

local function create_archive(source_dir, output_file)
    local cmd = string.format("cd %s && zip -r %s . -x '*.git*' -x 'deps/*'", source_dir, output_file)
    return os.execute(cmd)
end

function M.execute(args)
    local pkg = metadata.load(".")
    
    if not pkg then
        print("Error: Invalid or missing project.toml")
        return
    end
    
    local output_name = pkg.name .. "-" .. pkg.version .. ".zip"
    local output_path = path.join(".", output_name)
    
    if fs.exists(output_path) then
        fs.remove(output_path)
    end
    
    local success = create_archive(".", output_path)
    
    if success then
        print("Package created: " .. output_path)
    end
    
    if not success then
        print("Error: Failed to create package")
    end
end

return M
