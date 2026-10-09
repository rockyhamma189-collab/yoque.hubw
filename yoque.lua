local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("DanielHubGui") then
    CoreGui.DanielHubGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DanielHubGui"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleOpenBtn"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
ToggleButton.Size = UDim2.new(0, 45, 0, 45)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "DH"
ToggleButton.TextColor3 = Color3.fromRGB(0, 162, 255)
ToggleButton.TextSize = 16

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(0, 162, 255)
ToggleStroke.Thickness = 2
ToggleStroke.Parent = ToggleButton

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -160)
MainFrame.Size = UDim2.new(0, 480, 0, 320)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(40, 40, 55)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
TopBar.Size = UDim2.new(1, 0, 0, 38)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 8)
TopCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TopBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0, 250, 1, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "DANIEL HUB | Steal Edition"
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -38, 0, 0)
CloseBtn.Size = UDim2.new(0, 38, 1, 0)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(220, 80, 80)
CloseBtn.TextSize = 14

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = TopBar
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Position = UDim2.new(1, -76, 0, 0)
MinimizeBtn.Size = UDim2.new(0, 38, 1, 0)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
MinimizeBtn.TextSize = 14

local isVisible = true
MinimizeBtn.MouseButton1Click:Connect(function()
    isVisible = not isVisible
    for _, child in pairs(MainFrame:GetChildren()) do
        if child ~= TopBar and child ~= MainCorner and child ~= MainStroke then
            child.Visible = isVisible
        end
    end
end)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

local Sidebar = Instance.new("Frame")
Sidebar.Parent = MainFrame
Sidebar.BackgroundTransparency = 1
Sidebar.Position = UDim2.new(0, 12, 0, 48)
Sidebar.Size = UDim2.new(0, 125, 1, -58)

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Parent = Sidebar
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 5)

local PagesContainer = Instance.new("Folder")
PagesContainer.Name = "PagesContainer"
PagesContainer.Parent = MainFrame

local function CreatePage()
    local Page = Instance.new("ScrollingFrame")
    Page.Parent = PagesContainer
    Page.BackgroundTransparency = 1
    Page.Position = UDim2.new(0, 145, 0, 48)
    Page.Size = UDim2.new(1, -155, 1, -58)
    Page.CanvasSize = UDim2.new(0, 0, 2, 0)
    Page.ScrollBarThickness = 2
    Page.ScrollBarImageColor3 = Color3.fromRGB(0, 162, 255)
    Page.Visible = false
    
    local Layout = Instance.new("UIListLayout")
    Layout.Parent = Page
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0, 8)
    return Page
end

local PageMain = CreatePage()
local PagePlayer = CreatePage()
PageMain.Visible = true

local function CreateTabButton(name, targetPage)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = Sidebar
    TabBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    TabBtn.Size = UDim2.new(1, 0, 0, 30)
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.Text = "  " .. name
    TabBtn.TextColor3 = Color3.fromRGB(160, 160, 180)
    TabBtn.TextSize = 12
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = TabBtn
    
    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(PagesContainer:GetChildren()) do
            p.Visible = false
        end
        targetPage.Visible = true
    end)
end

CreateTabButton("Principal", PageMain)
CreateTabButton("Jugador", PagePlayer)

local function CreateToggle(parentPage, text, callback)
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Parent = parentPage
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 35)
    ToggleBtn.Size = UDim2.new(1, 0, 0, 32)
    ToggleBtn.Font = Enum.Font.GothamMedium
    ToggleBtn.Text = "  " .. text .. ": [ OFF ]"
    ToggleBtn.TextColor3 = Color3.fromRGB(170, 170, 170)
    ToggleBtn.TextSize = 12
    ToggleBtn.TextXAlignment = Enum.TextXAlignment.Left
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = ToggleBtn
    
    local active = false
    ToggleBtn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            ToggleBtn.Text = "  " .. text .. ": [ ON ]"
            ToggleBtn.TextColor3 = Color3.fromRGB(80, 255, 120)
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 38, 30)
        else
            ToggleBtn.Text = "  " .. text .. ": [ OFF ]"
            ToggleBtn.TextColor3 = Color3.fromRGB(170, 170, 170)
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 35)
        end
        callback(active)
    end)
end

CreateToggle(PageMain, "Auto Collect / Steal", function(state)
    task.spawn(function()
        while state and ScreenGui.Parent do
            pcall(function()
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") and state then
                        fireproximityprompt(obj)
                    end
                end
            end)
            task.wait(0.4)
        end
    end)
end)

CreateToggle(PageMain, "Auto Farm Event", function(state)
    task.spawn(function()
        while state and ScreenGui.Parent do
            task.wait(1)
        end
    end)
end)

CreateToggle(PagePlayer, "Super Speed (32)", function(state)
    RunService.RenderStepped:Connect(function()
        if state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 32
        elseif not state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end)
