-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Credit Label
local CreditLabel = Instance.new("TextLabel")
CreditLabel.Size = UDim2.new(1, 0, 0, 20)
CreditLabel.Position = UDim2.new(0, 0, 0, 0)
CreditLabel.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
CreditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditLabel.Text = "Made by @elnanocruz2"
CreditLabel.Font = Enum.Font.SourceSansBold
CreditLabel.TextSize = 14
CreditLabel.Parent = MainFrame

-- Scrollable Frame
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, 0, 1, -60)
ScrollFrame.Position = UDim2.new(0, 0, 0, 40)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
ScrollFrame.ScrollBarThickness = 5
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollFrame
UIListLayout.Padding = UDim.new(0, 5)

-- Drag Bar
local DragBar = Instance.new("TextLabel")
DragBar.Size = UDim2.new(1, 0, 0, 30)
DragBar.Position = UDim2.new(0, 0, 0, 20)
DragBar.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
DragBar.TextColor3 = Color3.fromRGB(255, 255, 255)
DragBar.Text = "Drag Me"
DragBar.Parent = MainFrame

-- Hide/Show Button
local HideButton = Instance.new("TextButton")
HideButton.Size = UDim2.new(0, 100, 0, 30)
HideButton.Position = UDim2.new(0.5, -50, 1, 10)
HideButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
HideButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HideButton.Text = "Hide GUI"
HideButton.Parent = ScreenGui

local guiVisible = true
HideButton.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    MainFrame.Visible = guiVisible
    HideButton.Text = guiVisible and "Hide GUI" or "Show GUI"
end)

-- Restart Style Function
local function restartSpin(styleName)
    _G.IsSpinning = false
    wait(0.1)
    _G.WantedStyles = {styleName}
    _G.IsSpinning = true
    
    print("Switched to Style:", styleName)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AntIsAStar/Haikyuu-Legends/refs/heads/main/Auto-Spin"))()
end

-- Styles List
local styles = {
    "Sanu", "Oigawa", "Bokuto", "Uchishima",
    "Yabu", "Kuzee", "Azamena", "Kosumi", "Kagayomo",
    "Iwaezeni", "Yomomute", "Sagafura",
    "Haibo", "Tsuzichiwa", "Hinoto", "Tonoko", "Yamegushi",
    "Ojiri", "Saguwuru", "Kito", "Nichinoya"
}

-- Create Buttons for Each Style
for _, style in ipairs(styles) do
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 30)
    Button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Text = style
    Button.Parent = ScrollFrame
    
    Button.MouseButton1Click:Connect(function()
        restartSpin(style)
    end)
end
