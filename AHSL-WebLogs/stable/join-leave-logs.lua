-- CONFIG
-- global WebhookUrl = ""

-- VARIABLES
local apiUrl = "https://api-thumbnail.rted.online/username/"

local function Send(user, msg, avatar)
    http.Post(WebhookUrl, http.JSONEncode({
        username = user,
        content = msg,
        avatar_url = avatar
    }))
end

global KnownPlayers = {}

for i, plr in GetAllPlayers() do
    local name = Get(plr, "Name")
    KnownPlayers[name] = true
end

while true do
    local current = {}
    for i, plr in GetAllPlayers() do
        local name = Get(plr, "Name")
        current[name] = true

        if not KnownPlayers[name] then
            Print("DEBUG >> JOINED", name)

            local tempurl0 = apiUrl .. name
            local avatar = http.Get(tempurl0)

            Send(name, name .. " has joined", avatar)
        end
    end

    for name, _ in KnownPlayers do
        if not current[name] then
            Print("DEBUG >> LEFT", name)

            local tempurl0 = apiUrl .. name
            local avatar = http.Get(tempurl0)

            Send(name, name .. " has left", avatar)
        end
    end

    KnownPlayers = current
    Wait(1)
end
