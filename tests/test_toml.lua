local t = require("lpm-test.src.lpm_test")
local toml = require("src.toml")

local M = {}

function M.test_toml_encode()
    local data = {
        name = "test",
        version = "1.0.0",
        deps = {
            a = "1.0"
        }
    }
    
    local str = toml.encode(data)
    t.assert_true(str:find('name = "test"') ~= nil, "encode failed")
end

return M
