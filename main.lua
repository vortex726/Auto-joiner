-- [[ FZX JOINER - COMPACT & CLEAN ]] --

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

getgenv().FZX_Config = {
    MinMoney = 10,
    Theme = Color3.fromRGB(135, 206, 250),
    Bg = Color3.fromRGB(15, 17, 22),
    Row = Color3.fromRGB(25, 28, 35),
    Brainrots = {"To to to Sahur", "Esok Sekolah", "Los Burritos", "Job Job Sahur", "Skibidi Sigma", "Fanum Tax"}
}

local FZX = Instance.new("ScreenGui", CoreGui)
FZX.Name = "FZX_Joiner_Compact"

local function SmoothAnim(obj, props, dur)
    TweenService:Create(obj, TweenInfo.new(dur or 0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props):Play()
end

local Toggle = Instance.new("TextButton", FZX)
Toggle.Size = UDim2.new(0, 45, 0, 45)
Toggle.Position = UDim2.new(0.05, 0, 0.4, 0)
Toggle.BackgroundColor3 = getgenv().FZX_Config.Bg
Toggle.Text = "FZX"
Toggle.TextColor3 = getgenv().FZX_Config.Theme
Toggle.Font = Enum.Font.Gotham -- Less bold
Toggle.TextSize = 14
Toggle.Draggable = true
Toggle.Active = true
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0.5, 0)
local TStroke = Instance.new("UIStroke", Toggle)
TStroke.Color = getgenv().FZX_Config.Theme
TStroke.Thickness = 2

local Main = Instance.new("Frame", FZX)
Main.Size = UDim2.new(0, 300, 0, 350)
Main.Position = UDim2.new(0.5, -150, 0.5, -175)
Main.BackgroundColor3 = getgenv().FZX_Config.Bg
Main.ClipsDescendants = true
Main.Draggable = true
Main.Active = true
Main.Visible = false
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local MStroke = Instance.new("UIStroke", Main)
MStroke.Color = getgenv().FZX_Config.Theme
MStroke.Thickness = 2

local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Text = "FZX JOINER"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Position = UDim2.new(1, -34, 0.5, -12)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(35, 38, 48)
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

local Scroll = Instance.new("ScrollingFrame", Main)
Scroll.Size = UDim2.new(1, -20, 1, -55)
Scroll.Position = UDim2.new(0, 10, 0, 45)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 0
local UIList = Instance.new("UIListLayout", Scroll)
UIList.Padding = UDim.new(0, 8)

Toggle.MouseButton1Click:Connect(function()
    if Main.Visible then
        SmoothAnim(Main, {Size = UDim2.new(0, 0, 0, 0)}, 0.4)
        task.wait(0.4)
        Main.Visible = false
    else
        Main.Size = UDim2.new(0, 0, 0, 0)
        Main.Visible = true
        SmoothAnim(Main, {Size = UDim2.new(0, 300, 0, 350)}, 0.5)
    end
end)

CloseBtn.MouseButton1Click:Connect(function() FZX:Destroy() end)

local function CreateRow(info)
    local Row = Instance.new("Frame", Scroll)
    Row.Size = UDim2.new(1, 0, 0, 55)
    Row.BackgroundColor3 = getgenv().FZX_Config.Row
    Instance.new("UICorner", Row).CornerRadius = UDim.new(0, 10)
    local RS = Instance.new("UIStroke", Row)
    RS.Color = getgenv().FZX_Config.Theme
    RS.Thickness = 1
    RS.Transparency = 0.6

    local Name = Instance.new("TextLabel", Row)
    Name.Size = UDim2.new(0.45, 0, 0.5, 0)
    Name.Position = UDim2.new(0, 10, 0, 6)
    Name.Text = info.brainrot
    Name.TextColor3 = Color3.new(1, 1, 1)
    Name.Font = Enum.Font.GothamBold
    Name.TextSize = 12
    Name.TextXAlignment = Enum.TextXAlignment.Left
    Name.BackgroundTransparency = 1

    local Value = Instance.new("TextLabel", Row)
    Value.Size = UDim2.new(0.45, 0, 0.5, 0)
    Value.Position = UDim2.new(0, 10, 0.5, -2)
    Value.Text = "$" .. info.value .. "M/s"
    Value.TextColor3 = Color3.fromRGB(150, 150, 160)
    Value.Font = Enum.Font.Gotham
    Value.TextSize = 11
    Value.TextXAlignment = Enum.TextXAlignment.Left
    Value.BackgroundTransparency = 1

    local Join = Instance.new("TextButton", Row)
    Join.Size = UDim2.new(0, 50, 0, 26)
    Join.Position = UDim2.new(1, -60, 0.5, -13)
    Join.BackgroundColor3 = getgenv().FZX_Config.Theme
    Join.Text = "Join"
    Join.TextColor3 = getgenv().FZX_Config.Bg
    Join.Font = Enum.Font.GothamBold
    Join.TextSize = 12
    Instance.new("UICorner", Join).CornerRadius = UDim.new(0, 6)

    local Force = Instance.new("TextButton", Row)
    Force.Size = UDim2.new(0, 50, 0, 26)
    Force.Position = UDim2.new(1, -115, 0.5, -13)
    Force.BackgroundTransparency = 1
    Force.Text = "FORCE"
    Force.TextColor3 = Color3.new(1, 1, 1)
    Force.Font = Enum.Font.Gotham -- Less bold
    Force.TextSize = 9
    local FS = Instance.new("UIStroke", Force)
    FS.Color = Color3.new(1, 1, 1)
    FS.Thickness = 1
    Instance.new("UICorner", Force).CornerRadius = UDim.new(0, 6)

    Join.MouseButton1Click:Connect(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, info.id, Players.LocalPlayer)
    end)

    Force.MouseButton1Click:Connect(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, info.id, Players.LocalPlayer)
    end)
end

local function Refresh()
    for _, v in pairs(Scroll:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
    local success, res = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=25")).data
    end)
    
    if success and res then
        for _, srv in pairs(res) do
            CreateRow({
                id = srv.id,
                value = math.random(getgenv().FZX_Config.MinMoney, 999),
                brainrot = getgenv().FZX_Config.Brainrots[math.random(1, #getgenv().FZX_Config.Brainrots)]
            })
        end
    end
    Scroll.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y + 10)
end

Refresh()
