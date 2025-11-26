local t = require("lpm-test.src.lpm_test")
local archive = require("src.archive")
local fs = require("src.fs")

local M = {}

function M.test_pack()
    os.execute("mkdir -p test_pkg/src")
    fs.write_file("test_pkg/project.toml", 'name="test"')
    
    local ok, err = archive.pack("test_pkg", "test.zip")
    t.assert_true(ok, "pack failed: " .. tostring(err))
    
    t.assert_true(fs.exists("test.zip"), "zip missing")
    
    os.execute("rm -rf test_pkg test.zip")
end

return M
