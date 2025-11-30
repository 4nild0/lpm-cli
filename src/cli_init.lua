local cli = require("cli")

local init_cmd = require("commands.init")
local create_cmd = require("commands.create")
local build_cmd = require("commands.build")
local validate_cmd = require("commands.validate")
local pack_cmd = require("commands.pack")
local install_cmd = require("commands.install")
local publish_cmd = require("commands.publish")

cli.register("init", init_cmd.execute)
cli.register("create", create_cmd.execute)
cli.register("build", build_cmd.execute)
cli.register("validate", validate_cmd.execute)
cli.register("pack", pack_cmd.execute)
cli.register("install", install_cmd.execute)
cli.register("publish", publish_cmd.execute)

return cli
