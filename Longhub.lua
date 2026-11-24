
-- LONGHUB FLOATING MENU
-- Roblox Studio | LocalScript

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "LongHubMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Floating logo
local logo = Instance.new("TextButton")
logo.Name = "LongHubLogo"
logo.Size = UDim2.fromOffset(58, 58)
logo.Position = UDim2.new(0, 25, 0.4, 0)
logo.BackgroundColor3 = Color3.fromRGB(130, 65, 255)
logo.Text = "LH"
logo.TextColor3 = Color3.new(1, 1, 1)
logo.TextSize = 22
logo.Font = Enum.Font.GothamBlack
logo.Parent = gui

Instance.new("UICorner", logo).CornerRadius =
    UDim.new(1, 0)

local logoStroke = Instance.new("UIStroke")
logoStroke.Color = Color3.fromRGB(210, 170, 255)
logoStroke.Thickness = 2
logoStroke.Parent = logo

-- Main menu
local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(270, 190)
main.Position = UDim2.new(0.5, -135, 0.5, -95)
main.BackgroundColor3 = Color3.fromRGB(19, 17, 28)
main.Visible = false
main.Active = true
main.Draggable = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 14)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(145, 75, 255)
stroke.Thickness = 2
stroke.Parent = main

-- Header
local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, -45, 0, 48)
header.Position = UDim2.fromOffset(12, 0)
header.BackgroundTransparency = 1
header.Text = "✦ LONGHUB"
header.TextColor3 = Color3.fromRGB(190, 140, 255)
header.TextSize = 23
header.Font = Enum.Font.GothamBlack
header.TextXAlignment = Enum.TextXAlignment.Left
header.Parent = main

-- Close button
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -42, 0, 7)
close.BackgroundColor3 = Color3.fromRGB(75, 35, 100)
close.Text = "×"
close.TextColor3 = Color3.new(1, 1, 1)
close.TextSize = 23
close.Font = Enum.Font.GothamBold
close.Parent = main

Instance.new("UICorner", close).CornerRadius =
    UDim.new(0, 9)

-- Description
local desc = Instance.new("TextLabel")
desc.Size = UDim2.new(1, -20, 0, 35)
desc.Position = UDim2.fromOffset(10, 60)
desc.BackgroundTransparency = 1
desc.Text = "WELCOME TO LONGHUB"
desc.TextColor3 = Color3.fromRGB(160, 150, 180)
desc.TextSize = 12
desc.Font = Enum.Font.GothamBold
desc.Parent = main

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -20, 0, 35)
status.Position = UDim2.fromOffset(10, 110)
status.BackgroundColor3 = Color3.fromRGB(40, 30, 60)
status.Text = "LONGHUB • READY"
status.TextColor3 = Color3.fromRGB(180, 130, 255)
status.TextSize = 13
status.Font = Enum.Font.GothamBold
status.Parent = main

Instance.new("UICorner", status).CornerRadius =
    UDim.new(0, 8)

-- Open / close
logo.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

close.MouseButton1Click:Connect(function()
    main.Visible = false
end)

-- Drag floating logo
local dragging = false
local dragStart, startPos

logo.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = logo.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart
        logo.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

print("LONGHUB FLOATING MENU READY")
