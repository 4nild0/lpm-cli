local t = require("lpm-test.src.lpm_test")
local project = require("src.project")
local fs = require("src.fs")

local M = {}

function M.test_project_init()
    os.execute("rm -rf test_proj")
    
    project.init("test_proj")
    
    t.assert_true(fs.exists("test_proj"), "project dir missing")
    t.assert_true(fs.exists("test_proj/lpm.toml"), "manifest missing")
    t.assert_true(fs.exists("test_proj/src"), "src missing")
    
    os.execute("rm -rf test_proj")
end

return M
