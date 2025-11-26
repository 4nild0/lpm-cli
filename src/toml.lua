local M = {}

function M.encode(tbl)
    local result = {}
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            table.insert(result, "[" .. k .. "]")
            for sk, sv in pairs(v) do
                table.insert(result, sk .. ' = "' .. tostring(sv) .. '"')
            end
        else
            table.insert(result, k .. ' = "' .. tostring(v) .. '"')
        end
    end
    return table.concat(result, "\n")
end

function M.decode(str)
    local result = {}
    local current_section = result
    
    for line in str:gmatch("[^\r\n]+") do
        local section = line:match("^%[([^%]]+)%]$")
        if section then
            result[section] = {}
            current_section = result[section]
        else
            local key, value = line:match("^([^=]+)%s*=%s*\"([^\"]+)\"")
            if key then
                current_section[key:match("^%s*(.-)%s*$")] = value
            end
        end
    end
    return result
end

return M
