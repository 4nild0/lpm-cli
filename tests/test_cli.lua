

package.path = package.path .. ";./src/?.lua;./deps/lpm-core/src/?.lua;./deps/lpm-core/src/init.lua"

local cli = require("cli")
local core = require("lpm-core")
local fs = core.fs
local path = core.path

local function assert_true(cond, msg)
    if not cond then error(msg or "Assertion failed") end
end

local function test_init()
    print("Testing init...")
    local test_name = "test_project_init"
    if fs.exists(test_name) then fs.remove(test_name) end
    
    cli.run({"init", test_name})
    
    assert_true(fs.exists(test_name), "Project dir not created")
    assert_true(fs.exists(path.join(test_name, "project.toml")), "project.toml not created")
    assert_true(fs.exists(path.join(test_name, "src")), "src dir not created")
    
    fs.remove(test_name)
end

local function test_install()
    print("Testing install...")
    local test_pkg = "test_pkg"
    local deps_dir = "deps"
    local pkg_dir = path.join(deps_dir, test_pkg)
    
    if fs.exists(pkg_dir) then fs.remove(pkg_dir) end
    
    cli.run({"install", test_pkg})
    
    assert_true(fs.exists(pkg_dir), "Package dir not created")
    assert_true(fs.exists(path.join(pkg_dir, "init.lua")), "init.lua not created")
    
    fs.remove(pkg_dir)
end


test_init()
test_install()

print("All tests passed!")
