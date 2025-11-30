local fs = require("fs")
local path = require("path")
local metadata = require("metadata")

local M = {}

function M.execute(args)
    local project_name = args[1] or "my-project"
    
    if fs.exists(project_name) then
        print("Error: Directory already exists: " .. project_name)
        return
    end
    
    fs.mkdir_p(project_name)
    fs.mkdir_p(path.join(project_name, "src"))
    fs.mkdir_p(path.join(project_name, "deps"))
    fs.mkdir_p(path.join(project_name, "bin"))
    fs.mkdir_p(path.join(project_name, "tests"))
    
    local toml_content = string.format([[name = "%s"
version = "0.1.0"
author = "Unknown"
description = "A Lua project"

[dependencies]
]], project_name)
    
    fs.write_file(path.join(project_name, "project.toml"), toml_content)
    
    local env_content = "DEBUG=true\n"
    fs.write_file(path.join(project_name, ".env"), env_content)
    
    local main_content = [[package.path = package.path .. ";./src/?.lua;./src/?/init.lua"

local app = require("init")
return app
]]
    fs.write_file(path.join(project_name, "main.lua"), main_content)
    
    local init_content = "local M = {}\nreturn M\n"
    fs.write_file(path.join(project_name, "src", "init.lua"), init_content)
    
    print("Initialized project: " .. project_name)
end

return M
