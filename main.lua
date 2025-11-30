local script_path = debug.getinfo(1, "S").source:match("@?(.*/)")

local function scan_directory(path, result)
    result = result or {}
    local handle = io.popen("find '" .. path .. "' -type d 2>/dev/null")
    if not handle then return result end
    
    for dir in handle:lines() do
        table.insert(result, dir .. "/")
    end
    handle:close()
    return result
end

local function register_autoload(base_paths)
    local all_paths = {}
    
    for _, base in ipairs(base_paths) do
        local full_base = script_path .. base
        local dirs = scan_directory(full_base)
        for _, dir in ipairs(dirs) do
            table.insert(all_paths, dir)
        end
    end
    
    for _, path in ipairs(all_paths) do
        package.path = string.format("%s?.lua;%s?/init.lua;%s", path, path, package.path)
        package.cpath = string.format("%s?.so;%s", path, package.cpath)
    end
end

register_autoload({
    "deps/lpm-core/src/",
    "src/"
})

local EnvLoader = require("EnvLoader")
local cli_main  = require("cli_init")

local env_file = script_path .. ".env"
local env_data = EnvLoader.load(env_file)

if env_data then
    _G.ENV = env_data
else
    _G.ENV = {
        SERVER_URL = "http://localhost:8080"
    }
end

local args = {}
for i = 1, select('#', ...) do
    args[i] = select(i, ...)
end

cli_main.run(args)