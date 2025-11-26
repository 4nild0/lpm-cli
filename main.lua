package.path = package.path .. ";./src/?.lua"

local project = require("src.project")
local archive = require("src.archive")

local cmd = arg[1]
local param = arg[2]

if cmd == "init" and param then
    project.init(param)
    print("Project " .. param .. " initialized")
elseif cmd == "pack" then
    local output = param or "package.zip"
    local ok, err = archive.pack(".", output)
    if ok then
        print("Packed to " .. output)
    else
        print("Error: " .. tostring(err))
    end
else
    print("Usage: lpm <command> [args]")
    print("Commands:")
    print("  init <name>   Initialize a new project")
    print("  pack [out]    Pack current project to zip")
end
