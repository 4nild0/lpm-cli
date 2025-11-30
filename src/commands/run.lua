local fs = require("fs")

local M = {}

function M.execute(args)
    local main_file = "main.lua"
    
    if not fs.exists(main_file) then
        print("Error: main.lua not found in current directory")
        return
    end
    
    local extra_args = {}
    for i = 1, #args do
        table.insert(extra_args, args[i])
    end
    
    local cmd = "lua " .. main_file
    if #extra_args > 0 then
        cmd = cmd .. " " .. table.concat(extra_args, " ")
    end
    
    local success = os.execute(cmd)
    
    if not success then
        print("Error: Failed to execute main.lua")
    end
end

return M