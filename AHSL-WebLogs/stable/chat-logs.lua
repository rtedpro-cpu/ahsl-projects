-- CONFIG
local Webhook = ""

-- VARIABLES
global ChatLogs = {}
global ConnectedPlayers = {}
local apiUrl = "https://api-thumbnail.rted.online/username/"

function SendToDiscord(player, message)
    local avatarApiUrl = apiUrl .. player.Name
    local avatar = http.Get(avatarApiUrl)

    local payload = {
        content = message,
        username = player.Name,
        avatar_url = avatar
    }

    Http.Post(
        Webhook,
        Http.JSONEncode(payload),
        Enum.HttpContentType.ApplicationJson,
        false,
        {["X-AHSL"] = "ok"}
    )
end

function ConnectChatLogger(Player)
    if ConnectedPlayers[Player] then return end
    ConnectedPlayers[Player] = true

    Player.Chatted:Connect(function(Message)
        local line = Player.Name..": "..Message
        table.insert(ChatLogs, line)
        print("Chat: "..line)
        SendToDiscord(Player, Message)
    end)
end

for _, plr in game.Players:GetPlayers() do
    ConnectChatLogger(plr)
end

game.Players.PlayerAdded:Connect(function(plr)
    ConnectChatLogger(plr)
end)

game.Players.PlayerRemoving:Connect(function(plr)
    ConnectedPlayers[plr] = nil
end)
