local CommandLineInterface = {}

local registered_commands = {}

function CommandLineInterface.register(command_name, command_handler)
    registered_commands[command_name] = command_handler
end

local function extract_command_arguments(args)
    local command_arguments = {}
    for index = 2, #args do
        table.insert(command_arguments, args[index])
    end
    return command_arguments
end

local function print_usage_information()
    print("Usage: lpm <command> [args]")
    print("Commands: init, create, build, run, validate, pack, install, publish")
end

local function print_unknown_command_error(command_name)
    print("Unknown command: " .. command_name)
end

function CommandLineInterface.run(args)
    if #args == 0 then
        print_usage_information()
        return
    end
    
    local command_name = args[1]
    local command_handler = registered_commands[command_name]
    
    if not command_handler then
        print_unknown_command_error(command_name)
        return
    end
    
    local command_arguments = extract_command_arguments(args)
    command_handler(command_arguments)
end

return CommandLineInterface
