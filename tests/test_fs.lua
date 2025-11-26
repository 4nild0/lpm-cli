local t = require("lpm-test.src.lpm_test")
local fs = require("src.fs")

local M = {}

function M.test_fs_ops()
    t.assert_true(fs.exists ~= nil, "fs.exists missing")
    t.assert_true(fs.mkdir ~= nil, "fs.mkdir missing")
    
    os.execute("rm -rf test_dir")
    
    t.assert_false(fs.exists("test_dir"), "test_dir should not exist")
    
    fs.mkdir("test_dir")
    t.assert_true(fs.exists("test_dir"), "test_dir should exist")
    
    os.execute("rm -rf test_dir")
end

return M
