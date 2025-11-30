local script_path = debug.getinfo(1, "S").source:match("@?(.*/)")
package.path = script_path .. "src/?.lua;" .. package.path

local autoload = require("autoload")

autoload.setup(script_path, {
    "deps/lpm-core/src/",
    "src/"
})

local EnvLoader = require("EnvLoader")
local cli_main  = require("cli_init")

local env_file = script_path .. ".env"
local env_data = EnvLoader.load(env_file)

if not env_data then
    _G.ENV = {
        SERVER_URL = "http://localhost:8080"
    }
end

if env_data then
    _G.ENV = env_data
end

local args = {}
for i = 1, select('#', ...) do
    args[i] = select(i, ...)
end

cli_main.run(args)