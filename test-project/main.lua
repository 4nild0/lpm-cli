package.path = package.path .. ";./src/?.lua;./src/?/init.lua"

local app = require("init")
return app
