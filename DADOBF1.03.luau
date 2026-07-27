-- this is opensourced out of the kindness of my heart. dont go around pasting and skidding my shit. give me my credit.
return function(img)
    local notiflib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))()
    local notif = notiflib.Notify
    local dc = "https://discord.gg/U7Nt7Az53z"
    if setclipboard then
        setclipboard(dc)
        notif({
            Description = "Discord invite copied to clipboard",
            Title = "aperture",
            Duration = 5;
        })
    else
        notif({
            Description = "Discord: " .. dc,
            Title = "aperture",
            Duration = 5;
        })
    end
    local http = game:GetService("HttpService")
    local api = "https://boardapi-ashen.vercel.app/api/convert?url=" .. http:UrlEncode(img)
    local success, response = pcall(function()
        return game:HttpGet(api)
    end)
    if not success then
        warn("request failed:", response)
        return
    end
    local success2, data = pcall(function()
        return http:JSONDecode(response)
    end)
    if not success2 then
        warn("decode failed:", data)
        return
    end
    if data.error then
        warn("api error:", data.error)
        return
    end
    local frames = data.frames or data.framesd
    if typeof(frames) ~= "table" then
        warn("invalid frame data")
        return
    end
    local rf = game:GetService("ReplicatedStorage")
        :WaitForChild("MainGameEvents")
        :WaitForChild("UpdateBoard")
    for _, frame in ipairs(frames) do
        if typeof(frame) == "table"
            and frame.Width
            and frame.Height
            and frame.Pixels then
            rf:FireServer({
                Width = frame.Width,
                Height = frame.Height,
                Pixels = frame.Pixels
            })
            task.wait(frame.Delay or 0.1)
        end
    end
end