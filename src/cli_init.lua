local command_line_interface = require("cli")

local init_cmd = require("commands.init")
local create_cmd = require("commands.create")
local build_cmd = require("commands.build")
local run_cmd = require("commands.run")
local validate_cmd = require("commands.validate")
local pack_cmd = require("commands.pack")
local install_cmd = require("commands.install")
local publish_cmd = require("commands.publish")

command_line_interface.register("init", init_cmd.execute)
command_line_interface.register("create", create_cmd.execute)
command_line_interface.register("build", build_cmd.execute)
command_line_interface.register("run", run_cmd.execute)
command_line_interface.register("validate", validate_cmd.execute)
command_line_interface.register("pack", pack_cmd.execute)
command_line_interface.register("install", install_cmd.execute)
command_line_interface.register("publish", publish_cmd.execute)

return command_line_interface
