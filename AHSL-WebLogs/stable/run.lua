-- CONFIG
local joinleavelogs = "https://raw.githubusercontent.com/rtedpro-cpu/ahsl-projects/refs/heads/main/AHSL-WebLogs/stable/join-leave-logs.lua"
local chatlogs = "https://raw.githubusercontent.com/rtedpro-cpu/ahsl-projects/refs/heads/main/AHSL-WebLogs/stable/chat-logs.lua"
global WebhookUrl = "DISCORD_WEBHOOK_URL_HERE"
global Webhook = "DISCORD_WEBHOOK_URL_HERE"

loadstring(http.Get(joinleavelogs))
loadstring(http.Get(chatlogs))
