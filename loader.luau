local inv = "https://discord.gg/xbNs2EJKPc"
local key = "aperturetop"
local kf = "aperture_key.dat"

local function hasKey()
	if isfile and isfile(kf) then return readfile(kf):match("^%s*(.-)%s*$") == key end
	return false
end

local function saveKey()
	if writefile then writefile(kf, key) end
end

local plrs = game:GetService("Players")
local gui = game:GetService("StarterGui")
local lp = plrs.LocalPlayer

local function lfg(sfunc, tpi)
	local cpi = game.PlaceId
	if cpi ~= tpi then
		setclipboard(inv)
		gui:SetCore("SendNotification", {Title = "Wrong Game", Text = "Discord copied to clipboard! Please join it!", Duration = 8, Icon = "rbxassetid://6031097228"})
		lp:Kick("No script for this game. Ask us in the discord!")
		return
	end
	setclipboard(inv)
	gui:SetCore("SendNotification", {Title = "Success", Text = "Discord copied to clipboard! Please join it!", Duration = 6, Icon = "rbxassetid://6031097228"})
	if sfunc and typeof(sfunc) == "function" then pcall(sfunc) end
end

local function loadScript()
	lfg(loadstring(game:HttpGet("https://raw.githubusercontent.com/VoltSec3/aperture/refs/heads/main/dontringobf.lua")), 127017819698509)
end

if hasKey() then loadScript() return end

local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Parent = lp:WaitForChild("PlayerGui")

local f = Instance.new("Frame")
f.Name = "KeyFrame"
f.Size = UDim2.new(0, 380, 0, 240)
f.Position = UDim2.new(0.5, -190, 0.5, -120)
f.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
f.BackgroundTransparency = 0.8
f.BorderSizePixel = 0
f.Parent = sg

local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0, 8)
mc.Parent = f

local line = Instance.new("Frame")
line.Name = "Line"
line.Parent = f
line.BackgroundColor3 = Color3.fromRGB(241, 196, 15)
line.BorderSizePixel = 0
line.Position = UDim2.new(0, 0, 1, -4)
line.Size = UDim2.new(0, 0, 0, 4)

local icon = Instance.new("ImageLabel")
icon.Name = "Icon"
icon.Parent = f
icon.BackgroundTransparency = 1
icon.Position = UDim2.new(0.04, 0, 0.12, 0)
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Image = "rbxassetid://3944668821"
icon.ImageColor3 = Color3.fromRGB(241, 196, 15)
icon.ScaleType = Enum.ScaleType.Fit

local ic = Instance.new("UICorner")
ic.CornerRadius = UDim.new(0, 20)
ic.Parent = icon

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Parent = f
title.BackgroundTransparency = 1
title.Position = UDim2.new(0.22, 0, 0.12, 0)
title.Size = UDim2.new(0.7, 0, 0, 22)
title.Text = "Aperture Loader"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left

local desc = Instance.new("TextLabel")
desc.Name = "Description"
desc.Parent = f
desc.BackgroundTransparency = 1
desc.Position = UDim2.new(0.22, 0, 0.28, 0)
desc.Size = UDim2.new(0.7, 0, 0, 18)
desc.Text = "Enter key to continue"
desc.TextColor3 = Color3.fromRGB(199, 199, 199)
desc.TextScaled = true
desc.Font = Enum.Font.Gotham
desc.TextXAlignment = Enum.TextXAlignment.Left

local tb = Instance.new("TextBox")
tb.Size = UDim2.new(0.9, 0, 0, 26)
tb.Position = UDim2.new(0.05, 0, 0.42, 0)
tb.PlaceholderText = "Enter key here..."
tb.Text = ""
tb.BackgroundTransparency = 0.85
tb.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tb.TextColor3 = Color3.fromRGB(255, 255, 255)
tb.TextScaled = true
tb.Font = Enum.Font.Gotham
tb.TextXAlignment = Enum.TextXAlignment.Center
tb.Parent = f

local tbc = Instance.new("UICorner")
tbc.CornerRadius = UDim.new(0, 6)
tbc.Parent = tb

local sb = Instance.new("TextButton")
sb.Size = UDim2.new(0.9, 0, 0, 32)
sb.Position = UDim2.new(0.05, 0, 0.58, 0)
sb.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
sb.BackgroundTransparency = 0.4
sb.Text = "Submit"
sb.TextColor3 = Color3.fromRGB(255, 255, 255)
sb.TextScaled = true
sb.Font = Enum.Font.Gotham
sb.Parent = f

local sbc = Instance.new("UICorner")
sbc.CornerRadius = UDim.new(0, 4)
sbc.Parent = sb

local cb = Instance.new("TextButton")
cb.Size = UDim2.new(0.9, 0, 0, 32)
cb.Position = UDim2.new(0.05, 0, 0.73, 0)
cb.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
cb.BackgroundTransparency = 0.4
cb.Text = "Copy Discord Link"
cb.TextColor3 = Color3.fromRGB(255, 255, 255)
cb.TextScaled = true
cb.Font = Enum.Font.Gotham
cb.Parent = f

local cbc = Instance.new("UICorner")
cbc.CornerRadius = UDim.new(0, 4)
cbc.Parent = cb

sb.MouseButton1Click:Connect(function()
	if tb.Text == key then
		saveKey()
		sg:Destroy()
		gui:SetCore("SendNotification", {Title = "Success", Text = "Key accepted! Loading script...", Duration = 5})
		loadScript()
	else
		tb.Text = ""
		tb.PlaceholderText = "Invalid key, try again"
	end
end)

cb.MouseButton1Click:Connect(function()
	setclipboard(inv)
	gui:SetCore("SendNotification", {Title = "Copied", Text = "Discord link copied to clipboard!", Duration = 4})
end)
