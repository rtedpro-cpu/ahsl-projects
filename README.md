# AHSL Projects

Projects for AHSL (Admin House Scripting Language) made by rtedpro-cpu



# AHSL-WebLogs

Discord Webhook based logger on AHSL.

Needs the AHSL HTTP Requests gamepass.

```ahsl
-- CONFIG
local joinleavelogs = "https://raw.githubusercontent.com/rtedpro-cpu/ahsl-projects/refs/heads/main/AHSL-WebLogs/stable/join-leave-logs.lua"
local chatlogs = "https://raw.githubusercontent.com/rtedpro-cpu/ahsl-projects/refs/heads/main/AHSL-WebLogs/stable/chat-logs.lua"
-- CHANGE FOR LOGGING
global WebhookUrl = "DISCORD_WEBHOOK_URL_HERE"
global Webhook = "DISCORD_WEBHOOK_URL_HERE"

loadstring(http.Get(joinleavelogs))
loadstring(http.Get(chatlogs))
```
