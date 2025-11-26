-- Add deps to path
package.path = package.path .. ";deps/?.lua"

local runner = require("lpm-test.src.runner")

local files = {
    "tests/test_archive.lua",
    "tests/test_fs.lua",
    "tests/test_project.lua",
    "tests/test_toml.lua"
}

local success = runner.run(files)

if not success then
    os.exit(1)
end
