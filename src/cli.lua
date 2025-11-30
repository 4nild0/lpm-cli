local M = {}

local commands = {}

function M.register(name, handler)
    commands[name] = handler
end

function M.run(args)
    if #args == 0 then
        print("Usage: lpm <command> [args]")
        print("Commands: init, create, build, run, validate, pack, install, publish")
        return
    end
    
    local command_name = args[1]
    local handler = commands[command_name]
    
    if not handler then
        print("Unknown command: " .. command_name)
        return
    end
    
    local command_args = {}
    for i = 2, #args do
        table.insert(command_args, args[i])
    end
    
    handler(command_args)
end

return M
