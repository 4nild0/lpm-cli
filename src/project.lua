local fs = require("src.fs")
local toml = require("src.toml")

local M = {}

function M.init(name)
    fs.mkdir(name)
    fs.mkdir(name .. "/src")
    fs.mkdir(name .. "/tests")
    
    local manifest = {
        name = name,
        version = "0.1.0"
    }
    
    fs.write_file(name .. "/lpm.toml", toml.encode(manifest))
end

return M
