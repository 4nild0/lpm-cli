local socket = require("lpm_socket")

local M = {}

local function parse_url(url)
    local protocol, host, port, path_part = url:match("^(https?)://([^:/]+):?(%d*)(.*)$")
    
    if not protocol then
        return nil
    end
    
    port = port ~= "" and tonumber(port) or (protocol == "https" and 443 or 80)
    path_part = path_part ~= "" and path_part or "/"
    
    return {
        protocol = protocol,
        host = host,
        port = port,
        path = path_part
    }
end

local function build_request(method, url_parts, headers, body)
    local lines = {}
    table.insert(lines, string.format("%s %s HTTP/1.1", method, url_parts.path))
    table.insert(lines, string.format("Host: %s", url_parts.host))
    
    for key, value in pairs(headers or {}) do
        table.insert(lines, string.format("%s: %s", key, value))
    end
    
    if body then
        table.insert(lines, string.format("Content-Length: %d", #body))
    end
    
    table.insert(lines, "")
    table.insert(lines, "")
    
    local request = table.concat(lines, "\r\n")
    
    if body then
        request = request .. body
    end
    
    return request
end

local function parse_response(raw)
    local header_end = raw:find("\r\n\r\n")
    if not header_end then
        return nil
    end
    
    local header_part = raw:sub(1, header_end - 1)
    local body_part = raw:sub(header_end + 4)
    
    local status_line = header_part:match("^([^\r\n]+)")
    local status_code = status_line:match("HTTP/%d%.%d (%d+)")
    
    return {
        status = tonumber(status_code),
        body = body_part,
        raw = raw
    }
end

function M.request(method, url, headers, body)
    local url_parts = parse_url(url)
    
    if not url_parts then
        return nil, "Invalid URL"
    end
    
    local sock = socket.create()
    if not sock then
        return nil, "Failed to create socket"
    end
    
    local ok, err = socket.connect(sock, url_parts.host, url_parts.port)
    if not ok then
        socket.close(sock)
        return nil, err
    end
    
    local request = build_request(method, url_parts, headers, body)
    socket.send(sock, request)
    
    local response_data = ""
    while true do
        local chunk = socket.recv(sock, 4096)
        if not chunk or #chunk == 0 then
            break
        end
        response_data = response_data .. chunk
    end
    
    socket.close(sock)
    
    return parse_response(response_data)
end

function M.get(url, headers)
    return M.request("GET", url, headers)
end

function M.post(url, headers, body)
    return M.request("POST", url, headers, body)
end

return M
