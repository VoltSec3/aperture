local inv = "https://discord.gg/xbNs2EJKPc"
local function lfg(sfunc, tpi)
    local plrs = game:GetService("Players")
    local gui = game:GetService("StarterGui")
    local lp = plrs.LocalPlayer
    local cpi = game.PlaceId

    if cpi ~= tpi then
        setclipboard(DiscordInvite)
        
        gui:SetCore("SendNotification", {
            Title = "Wrong Game",
            Text = "Discord copied to clipboard! Please join it!",
            Duration = 8,
            Icon = "rbxassetid://6031097228"
        })
        
        lp:Kick("No script for this game. Ask us in the discord!")
        return
    end

    setclipboard(inv)
    
    gui:SetCore("SendNotification", {
        Title = "Success",
        Text = "Discord copied to clipboard! Please join it!",
        Duration = 6,
        Icon = "rbxassetid://6031097228"
    })
    
    if sfunc and typeof(sfunc) == "function" then
        local success, err = pcall(sfunc)
        if not success then
            warn("Error: " .. tostring(err))
        end
    end
end

-- scripts

lfg( -- dont ring the bell
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VoltSec3/aperture/refs/heads/main/dontringobf.lua")),
    127017819698509
)
