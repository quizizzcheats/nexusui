local ALLOWED_PLACE_IDS = {16732694052, 72907489978215}
local currentPlaceId = game.PlaceId

if not table.find(ALLOWED_PLACE_IDS, currentPlaceId) then
    game:GetService("Players").LocalPlayer:Kick("You are not playing this fisch map.\nAnti game by バンク Owner UI\nPless Join Map Fisch")
else
    local asciiArt = [[  
    ███╗   ██╗███████╗██╗  ██╗██╗   ██╗███████╗    ██╗  ██╗██╗   ██╗██████╗ 
    ████╗  ██║██╔════╝╚██╗██╔╝██║   ██║██╔════╝    ██║  ██║██║   ██║██╔══██╗
    ██╔██╗ ██║█████╗   ╚███╔╝ ██║   ██║███████╗    ███████║██║   ██║██████╔╝
    ██║╚██╗██║██╔══╝   ██╔██╗ ██║   ██║╚════██║    ██╔══██║██║   ██║██╔══██╗
    ██║ ╚████║███████╗██╔╝ ██╗╚██████╔╝███████║    ██║  ██║╚██████╔╝██████╔╝
    ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
    ]]
    print(asciiArt)
    print("Load Script Nexus Hub Kaitan Fisch")
end



local blur = Instance.new("BlurEffect", game.Lighting)
blur.Size = 0

local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
ScreenGui.Parent = game.CoreGui
ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0.5, -(303 / 2), 0.5, -(263 / 2))
ImageLabel.Rotation = 0
ImageLabel.Size = UDim2.new(0, 303, 0, 263)
ImageLabel.Image = "rbxassetid://104632303161808"
ImageLabel.ImageTransparency = 1

for i = 1, 50, 2 do
    blur.Size = i
    ImageLabel.ImageTransparency = ImageLabel.ImageTransparency - 0.1
    task.wait()
end
task.wait(0.1)

for i = 1, 50, 2 do
    blur.Size = 50 - i
    ImageLabel.ImageTransparency = ImageLabel.ImageTransparency + 0.1
    task.wait()
end

blur:Destroy()
ScreenGui:Destroy()

task.wait(.1)

local library = {}
local UIConfig = {Bind = Enum.KeyCode.RightControl}
local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
local length = 20
local randomString = ""

math.randomseed(os.time())

charTable = {}
for c in chars:gmatch "." do
    table.insert(charTable, c)
end

for i = 1, length do
    randomString = randomString .. charTable[math.random(1, #charTable)]
end

for i, v in pairs(game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):GetChildren()) do
    if v.ClassName == "ScreenGui" then
        for i1, v1 in pairs(v:GetChildren()) do
            if v1.Name == "Main" then
                do
                    local ui = v
                    if ui then
                        ui:Destroy()
                    end
                end
            end
        end
    end
end

function CircleClick(Button, X, Y)
    coroutine.resume(
        coroutine.create(
            function()
                local Circle = Instance.new("ImageLabel")
                Circle.Parent = Button
                Circle.Name = "Circle"
                Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Circle.BackgroundTransparency = 1.000
                Circle.ZIndex = 10
                Circle.Image = "rbxassetid://266543268"
                Circle.ImageColor3 = Color3.fromRGB(255, 255, 255)
                Circle.ImageTransparency = 0.7
                local NewX = X - Circle.AbsolutePosition.X
                local NewY = Y - Circle.AbsolutePosition.Y
                Circle.Position = UDim2.new(0, NewX, 0, NewY)

                local Time = 0.1
                Circle:TweenSizeAndPosition(
                    UDim2.new(0, 30.25, 0, 30.25),
                    UDim2.new(0, NewX - 15, 0, NewY - 10),
                    "Out",
                    "Quad",
                    Time,
                    false,
                    nil
                )
                for i = 1, 10 do
                    Circle.ImageTransparency = Circle.ImageTransparency + 0.01
                    task.wait(.1)
                end
                Circle:Destroy()
            end
        )
    )
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Players = game:GetService("Players")
local ThumbnailType = Enum.ThumbnailType.AvatarBust
local ThumbnailSize = Enum.ThumbnailSize.Size420x420

function dragify(Frame, object)
    dragToggle = nil
    dragSpeed = .25
    dragInput = nil
    dragStart = nil
    dragPos = nil

    function updateInput(input)
        Delta = input.Position - dragStart
        Position =
            UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(object, TweenInfo.new(dragSpeed), {Position = Position}):Play()
    end

    Frame.InputBegan:Connect(
        function(input)
            if
                (input.UserInputType == Enum.UserInputType.MouseButton1 or
                    input.UserInputType == Enum.UserInputType.Touch)
             then
                dragToggle = true
                dragStart = input.Position
                startPos = object.Position
                input.Changed:Connect(
                    function()
                        if (input.UserInputState == Enum.UserInputState.End) then
                            dragToggle = false
                        end
                    end
                )
            end
        end
    )

    Frame.InputChanged:Connect(
        function(input)
            if
                (input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch)
             then
                dragInput = input
            end
        end
    )

    game:GetService("UserInputService").InputChanged:Connect(
        function(input)
            if (input == dragInput and dragToggle) then
                updateInput(input)
            end
        end
    )
end

local UI = Instance.new("ScreenGui")
UI.Name = randomString
UI.Parent = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules")
UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if syn then
   syn.protect_gui(UI)
end

function library:Destroy()
    library:Destroy()
end

function library:UI()
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Top = Instance.new("Frame")
    local TabHolder = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local TabContainer = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local Logo = Instance.new("ImageLabel")
    local Title = Instance.new("TextLabel")
    local Desc = Instance.new("TextLabel")
    
    Main.Name = "Main"
    Main.Parent = UI
    Main.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 600, 0, 400)
    Main.ClipsDescendants = true
    Main.AnchorPoint = Vector2.new(0.5, 0.5)

    Logo.Name = "Logo"
    Logo.Parent = Main
    Logo.Active = true
    Logo.AnchorPoint = Vector2.new(0.5, 0.5)
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.Position = UDim2.new(0, 35, 0, 35)
    Logo.Size = UDim2.new(0, 50, 0, 50)
    Logo.Image = "rbxassetid://104632303161808"

    Title.Name = "Title"
    Title.Parent = Main
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0.0882352963, 20, 0, 10)
    Title.Size = UDim2.new(0, 483, 0, 31)
    Title.Font = Enum.Font.GothamMedium
    Title.Text = "Nexus Hub Auto Kaitun Fisch Script"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 15.000
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Desc.Name = "Desc"
    Desc.Parent = Main
    Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Desc.BackgroundTransparency = 1.000
    Desc.Position = UDim2.new(0.0882352963, 20, 0, 25)
    Desc.Size = UDim2.new(0, 483, 0, 31)
    Desc.Font = Enum.Font.GothamMedium
    Desc.Text = "ᴜɪ ʙʏ バンク"
    Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
    Desc.TextSize = 12.000
    Desc.TextWrapped = true
    Desc.TextTransparency = .5
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    
    local UiToggle_UiStroke1 = Instance.new("UIStroke")
    UiToggle_UiStroke1.Color = Color3.fromRGB(25,25,25)
    UiToggle_UiStroke1.Thickness = 2
    UiToggle_UiStroke1.Name = "UiToggle_UiStroke1"
    UiToggle_UiStroke1.Parent = Main
            
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = Main
        
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Top.BackgroundTransparency = 1.000
    Top.Position = UDim2.new(0.021956088, 0, 0.0133333337, 65)
    Top.Size = UDim2.new(0, 570, 0, 39)

    TabHolder.Name = "TabHolder"
    TabHolder.Parent = Top
    TabHolder.BackgroundColor3 = Color3.fromRGB(25,25,25)
    TabHolder.Position = UDim2.new(-0.010309278, 6, -0.0123075824, 0)
    TabHolder.Size = UDim2.new(0, 575, 0, 38)

    UICorner_2.Parent = TabHolder

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = TabHolder
    TabContainer.Active = true
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.Size = UDim2.new(0, 575, 0, 38)
    TabContainer.CanvasSize = UDim2.new(2, 0, 0, 0)
    TabContainer.ScrollBarThickness = 0
    TabContainer.VerticalScrollBarInset = Enum.ScrollBarInset.Always

    UIListLayout.Parent = TabContainer
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 30)
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
        function()
            TabContainer.CanvasSize = UDim2.new(0, UIListLayout.AbsoluteContentSize.X, 0, 0)
        end
    )
    UIPadding.Parent = TabContainer
    UIPadding.PaddingLeft = UDim.new(0, 3)
    UIPadding.PaddingTop = UDim.new(0, 3)

    local Bottom = Instance.new("Frame")
    Bottom.Name = "Bottom"
    Bottom.Parent = Main
    Bottom.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Bottom.BackgroundTransparency = 1.000
    Bottom.Position = UDim2.new(0.0119760484, 7, 0.0916666687, 80)
    Bottom.Size = UDim2.new(0, 580, 0, 280)
    
    local uitoggled = false
    UserInputService.InputBegan:Connect(
        function(io, p)
            if io.KeyCode == UIConfig.Bind then
                if uitoggled == false then
                    Main:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1, true)
                    uitoggled = true
                    task.wait(.5)
                    UI.Enabled = false
                else
                    Main:TweenSize(
                        UDim2.new(0, 600, 0, 400),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quart,
                        1,
                        true
                    )
                    UI.Enabled = true
                    uitoggled = false
                end
            end
        end
    )

    dragify(Top, Main)
    local tabs = {}
    local S = false
    function tabs:Tab(Name, icon)
        local FrameTab = Instance.new("Frame")
        local Tab = Instance.new("TextButton")
        local UICorner_3 = Instance.new("UICorner")
        local UICorner_Tab = Instance.new("UICorner")
        local ImageLabel = Instance.new("ImageLabel")
        local TextLabel = Instance.new("TextLabel")
        
        FrameTab.Name = "FrameTab"
        FrameTab.Parent = Tab
        FrameTab.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
        FrameTab.Size = UDim2.new(0, 140, 0, 30)
        UICorner_Tab.CornerRadius = UDim.new(0, 3)
        UICorner_Tab.Parent = FrameTab
        
        Tab.Name = "Tab"
        Tab.Parent = TabContainer
        Tab.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
        Tab.Size = UDim2.new(0, 114, 0, 30)
        Tab.BackgroundTransparency = 1
        Tab.Text = ""
        UICorner_3.CornerRadius = UDim.new(0, 3)
        UICorner_3.Parent = Tab

        ImageLabel.Parent = Tab
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.Position = UDim2.new(0, 7, 0.1, 0)
        ImageLabel.Size = UDim2.new(0, 20, 0, 20)
        ImageLabel.Image = "http://www.roblox.com/asset/?id=" .. icon
        ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.ImageTransparency = 0.2
        ImageLabel.BackgroundTransparency = 1

        TextLabel.Parent = Tab
        TextLabel.Text = Name.." "

        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.Position = UDim2.new(0.25, 0, 0.01, 0)
        TextLabel.Size = UDim2.new(0, 87, 0, 27)
        TextLabel.Font = Enum.Font.GothamBold
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 12.300
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.TextTransparency = 0.200

        if TextLabel.Name == Name.." " then
            Tab.Size = UDim2.new(0, 70 + TextLabel.TextBounds.X, 0, 25)
        end
        
        local Page = Instance.new("ScrollingFrame")
        local Left = Instance.new("ScrollingFrame")
        local Right = Instance.new("ScrollingFrame")
        local UIListLayout_5 = Instance.new("UIListLayout")
        local UIPadding_5 = Instance.new("UIPadding")

        Page.Name = "Page"
        Page.Parent = Bottom
        Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Page.BackgroundTransparency = 1.000
        Page.Size = UDim2.new(0, 580, 0, 525) -- ปรับความกว้างให้เต็ม Bottom
        Page.ScrollBarThickness = 0
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.Visible = false

        Left.Name = "Left"
        Left.Parent = Page
        Left.Active = true
        Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Left.BackgroundTransparency = 1.000
        Left.Size = UDim2.new(0, 280, 0, 525) -- ปรับความกว้างให้สมส่วน
        Left.ScrollBarThickness = 0
        Left.CanvasSize = UDim2.new(0, 0, 0, 0)

        Right.Name = "Right"
        Right.Parent = Page
        Right.Active = true
        Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Right.BackgroundTransparency = 1.000
        Right.Size = UDim2.new(0, 280, 0, 525) -- ปรับความกว้างให้สมส่วน
        Right.ScrollBarThickness = 0
        Right.CanvasSize = UDim2.new(0, 0, 0, 0)

        local LeftList = Instance.new("UIListLayout")
        local RightList = Instance.new("UIListLayout")

        LeftList.Parent = Left
        LeftList.SortOrder = Enum.SortOrder.LayoutOrder
        LeftList.Padding = UDim.new(0, 8)

        RightList.Parent = Right
        RightList.SortOrder = Enum.SortOrder.LayoutOrder
        RightList.Padding = UDim.new(1, 1)

        UIListLayout_5.Parent = Page
        UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_5.Padding = UDim.new(0, 20) -- ปรับระยะห่างระหว่าง Left และ Right

        UIPadding_5.Parent = Page

        LeftList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                Left.CanvasSize = UDim2.new(0, 280, 0, LeftList.AbsoluteContentSize.Y) -- ปรับให้สอดคล้องกับความกว้างใหม่
            end
        )
        RightList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                Right.CanvasSize = UDim2.new(0, 280, 0, RightList.AbsoluteContentSize.Y) -- ปรับให้สอดคล้องกับความกว้างใหม่
            end
        )
        if S == false then
            S = true
            Page.Visible = true
            TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            TextLabel.TextTransparency = 0
            ImageLabel.ImageColor3 = Color3.fromRGB(255, 0, 0)
        end

        Tab.MouseButton1Click:Connect(function()
            for _, x in next, TabContainer:GetChildren() do
                if x.Name == "Tab" then
                    -- Reset tab appearance
                    TweenService:Create(
                        x.TextLabel,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)}
                    ):Play()
                    TweenService:Create(
                        x.ImageLabel,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {ImageColor3 = Color3.fromRGB(255, 255, 255)}
                    ):Play()
                    TweenService:Create(
                        x.ImageLabel,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {ImageTransparency = 0.2}
                    ):Play()
                    TweenService:Create(
                        x.TextLabel,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.2}
                    ):Play()
                end
            end
        
            -- Highlight selected tab
            TweenService:Create(
                TextLabel,
                TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 0, 0)}
            ):Play()
            TweenService:Create(
                ImageLabel,
                TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {ImageColor3 = Color3.fromRGB(255, 0, 0)}
            ):Play()
            TweenService:Create(
                ImageLabel,
                TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {ImageTransparency = 0}
            ):Play()
            TweenService:Create(
                TextLabel,
                TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextTransparency = 0}
            ):Play()
        
            -- Animate page transition
            for _, page in next, Bottom:GetChildren() do
                if page:IsA("ScrollingFrame") and page ~= Page then
                    if page.Visible then
                        -- Slide out current page to the left
                        TweenService:Create(
                            page,
                            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Position = UDim2.new(-1, 0, 0, 0)}
                        ):Play()
                        task.spawn(function()
                            task.wait(0.3)
                            page.Visible = false
                            page.Position = UDim2.new(1, 0, 0, 0) -- Reset to right for next use
                        end)
                    end
                end
            end
        
            -- Slide in new page from the right
            Page.Visible = true
            Page.Position = UDim2.new(1, 0, 0, 0) -- Start from right
            TweenService:Create(
                Page,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Position = UDim2.new(0, 0, 0, 0)}
            ):Play()
        end)
        local function GetSide(Longest)
            if Longest then
                if LeftList.AbsoluteContentSize.Y > RightList.AbsoluteContentSize.Y then
                    return Left
                else
                    return Right
                end
            else
                if LeftList.AbsoluteContentSize.Y > RightList.AbsoluteContentSize.Y then
                    return Right
                else
                    return Left
                end
            end
        end

        LeftList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                if GetSide(true).Name == Left.Name then
                    Left.CanvasSize = UDim2.new(0, 280, 0, LeftList.AbsoluteContentSize.Y)
                else
                    Right.CanvasSize = UDim2.new(0, 280, 0, RightList.AbsoluteContentSize.Y)
                end
            end
        )
        RightList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                if GetSide(true).Name == Left.Name then
                    Left.CanvasSize = UDim2.new(0, 280, 0, LeftList.AbsoluteContentSize.Y)
                else
                    Right.CanvasSize = UDim2.new(0, 280, 0, RightList.AbsoluteContentSize.Y)
                end
            end
        )

        local sections = {}
        function sections:Section(Name, side)
            local Side2 = nil
            if side then
                Side2 = side:lower() or "left"
            else
                Side2 = GetSide(false)
            end
        
            local Section = Instance.new("Frame")
            local UICorner_5 = Instance.new("UICorner")
            local Top_2 = Instance.new("Frame")
            local Line = Instance.new("Frame")
            local Sectionname = Instance.new("TextLabel")
            local SectionContainer = Instance.new("ScrollingFrame")
            local UIListLayout_2 = Instance.new("UIListLayout")
            local UIPadding_2 = Instance.new("UIPadding")
        
            Section.Name = "Section"
            Section.Parent = Side2 == "left" and Left or Right or GetSide(false)
            Section.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Section.ClipsDescendants = true
            Section.Size = UDim2.new(0, 280, 0, 0) -- ปรับความกว้างให้สมส่วนกับ Left และ Right
        
            UICorner_5.CornerRadius = UDim.new(0, 5)
            UICorner_5.Parent = Section
        
            Top_2.Name = "Top"
            Top_2.Parent = Section
            Top_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Top_2.BackgroundTransparency = 1.000
            Top_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
            Top_2.Size = UDim2.new(0, 280, 0, 31) -- ปรับให้สอดคล้องกับ Section
        
            Line.Name = "Line"
            Line.Parent = Top_2
            Line.BackgroundColor3 = Color3.fromRGB(194, 0, 0)
            Line.BorderSizePixel = 0
            Line.Size = UDim2.new(0, 280, 0, 1) -- ปรับให้สอดคล้องกับ Top_2
        
            Sectionname.Name = "Sectionname"
            Sectionname.Parent = Top_2
            Sectionname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sectionname.BackgroundTransparency = 1.000
            Sectionname.Position = UDim2.new(0.0591227226, 0, 0.0222222228, 0)
            Sectionname.Size = UDim2.new(0, 224, 0, 24)
            Sectionname.Font = Enum.Font.GothamBold
            Sectionname.Text = Name
            Sectionname.TextColor3 = Color3.fromRGB(255, 255, 255)
            Sectionname.TextSize = 14.000
            Sectionname.TextTransparency = 0.300
            Sectionname.TextXAlignment = Enum.TextXAlignment.Left
        
            SectionContainer.Name = "SectionContainer"
            SectionContainer.Parent = Top_2
            SectionContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionContainer.BackgroundTransparency = 1.000
            SectionContainer.BorderSizePixel = 0
            SectionContainer.Position = UDim2.new(0, 0, 1, 0)
            SectionContainer.Size = UDim2.new(0, 280, 0, 200) -- ปรับให้สอดคล้องกับ Section
            SectionContainer.ScrollBarThickness = 4
            SectionContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
        
            UIListLayout_2.Parent = SectionContainer
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0, 2)
        
            UIPadding_2.Parent = SectionContainer
            UIPadding_2.PaddingLeft = UDim.new(0, 5)
        
            UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                function()
                    SectionContainer.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_2.AbsoluteContentSize.Y)
                    local contentHeight = UIListLayout_2.AbsoluteContentSize.Y
                    local maxHeight = 200
                    local newHeight = math.min(contentHeight, maxHeight) + 31
                    Section.Size = UDim2.new(0, 280, 0, newHeight) -- ปรับให้สอดคล้อง
                end
            )
        
            local functionitem = {}
        
            function functionitem:Label(text)
                local textas = {}
                local Label = Instance.new("Frame")
                local Text = Instance.new("TextLabel")
                Label.Name = "Label"
                Label.Parent = SectionContainer
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(1, 0, 0, 30)
        
                Text.Name = "Text"
                Text.Parent = Label
                Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text.BackgroundTransparency = 1.000
                Text.Position = UDim2.new(0.01, 0, 0, 0)
                Text.Size = UDim2.new(1, 0, 1, 0)
                Text.ZIndex = 16
                Text.Font = Enum.Font.GothamBold
                Text.Text = text
                Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text.TextSize = 12.000
                Text.TextXAlignment = Enum.TextXAlignment.Left
                function textas:Change(newtext)
                    Text.Text = newtext
                end
                return textas
            end

        
            function functionitem:LabelColor(text, color)
                local textas = {}
                local Label = Instance.new("Frame")
                local Text = Instance.new("TextLabel")
                local UIStroke = Instance.new("UIStroke")
                
                Label.Name = "Label"
                Label.Parent = SectionContainer
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(1, 0, 0, 30)
        
                Text.Name = "Text"
                Text.Parent = Label
                Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text.BackgroundTransparency = 1.000
                Text.Position = UDim2.new(0.01, 0, 0, 0)
                Text.Size = UDim2.new(1, 0, 1, 0)
                Text.ZIndex = 16
                Text.Font = Enum.Font.GothamBold
                Text.Text = text
                Text.TextColor3 = Color3.fromRGB(color)
                Text.TextSize = 12.000
                Text.TextXAlignment = Enum.TextXAlignment.Left
                Text.TextYAlignment = Enum.TextYAlignment.Center

                function textas:Change(newtext, newColor)
                    Text.Text = newtext
                    if newColor then
                        Text.TextColor3 = Color3.fromRGB(newColor)
                    else
                        Text.TextColor3 = Color3.fromRGB(0, 255, 0)
                    end
                end
                return textas
            end
            
            function functionitem:Slider(Name, min, max, default, callback)
                local sliderfunc = {}
                local min = min or 0.1
                local max = max or 10
                local default = default or max / 2
                local callback = callback or function() end
                if default > max then
                    default = max
                elseif default < min then
                    default = min
                end
            
                local MainSlider = Instance.new("Frame")
                local UICorner_12 = Instance.new("UICorner")
                local Text_4 = Instance.new("TextLabel")
                local SliderValueFrame = Instance.new("Frame")
                local SliderValueFrame1 = Instance.new("Frame")
                local SliderValueFrame2 = Instance.new("TextButton")
                local UICorner_1s2 = Instance.new("UICorner")
            
                MainSlider.Name = "MainSlider"
                MainSlider.Parent = SectionContainer
                MainSlider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                MainSlider.BackgroundTransparency = 0.700
                MainSlider.BorderSizePixel = 0
                MainSlider.ClipsDescendants = true
                MainSlider.Size = UDim2.new(1, -10, 0, 50) -- ลดความกว้างลง 10 หน่วย (Padding ซ้าย 5 + ขวา 5)
                MainSlider.Position = UDim2.new(0, 5, 0, 0) -- ชดเชย Padding ซ้าย 5 หน่วย
                MainSlider.ZIndex = 16
            
                UICorner_12.CornerRadius = UDim.new(0, 4)
                UICorner_12.Parent = MainSlider
            
                Text_4.Name = "Text"
                Text_4.Parent = MainSlider
                Text_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text_4.BackgroundTransparency = 1.000
                Text_4.Position = UDim2.new(0, 5, 0, 10) -- ปรับให้ห่างจากขอบซ้าย 5 หน่วย
                Text_4.Size = UDim2.new(1, -10, 0, 12) -- ปรับความกว้างให้สอดคล้องกับ MainSlider
                Text_4.ZIndex = 16
                Text_4.Font = Enum.Font.GothamBold
                Text_4.Text = Name .. " : " .. string.format("%.1f", default)
                Text_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text_4.TextSize = 12.000
                Text_4.TextXAlignment = Enum.TextXAlignment.Left
            
                SliderValueFrame.Name = "SliderValueFrame"
                SliderValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderValueFrame.Size = UDim2.new(1, -20, 0, 4) -- ปรับความกว้างให้ชิดขอบ (ลด 20 หน่วยเพื่อให้มีระยะห่างจากขอบทั้งสองฝั่ง)
                SliderValueFrame.Position = UDim2.new(0.5, 0, 0.77, 0)
                SliderValueFrame.BorderSizePixel = 0
                SliderValueFrame.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
                SliderValueFrame.Parent = MainSlider
            
                SliderValueFrame1.Name = "SliderValueFrame"
                SliderValueFrame1.Size = UDim2.new(0.5, 0, 0, 4)
                SliderValueFrame1.BorderSizePixel = 0
                SliderValueFrame1.BackgroundColor3 = Color3.fromRGB(255, 21, 21)
                SliderValueFrame1.Parent = SliderValueFrame
            
                SliderValueFrame2.Name = "SliderValueFrame"
                SliderValueFrame2.Size = UDim2.new(0, 15, 0, 15)
                SliderValueFrame2.Position = UDim2.new(0.5, 0, 0, 0)
                SliderValueFrame2.BorderSizePixel = 0
                SliderValueFrame2.BackgroundColor3 = Color3.fromRGB(255, 21, 21)
                SliderValueFrame2.Parent = SliderValueFrame
                SliderValueFrame2.Text = ""
                UICorner_1s2.CornerRadius = UDim.new(0, 90)
                UICorner_1s2.Parent = SliderValueFrame2
            
                local Value = default
                local dragging = false
            
                local function move(input)
                    local pos = UDim2.new(
                        math.clamp(
                            (input.Position.X - SliderValueFrame.AbsolutePosition.X) / SliderValueFrame.AbsoluteSize.X,
                            0,
                            1
                        ),
                        0,
                        0,
                        -6
                    )
                    local pos1 = UDim2.new(
                        math.clamp(
                            (input.Position.X - SliderValueFrame.AbsolutePosition.X) / SliderValueFrame.AbsoluteSize.X,
                            0,
                            1
                        ),
                        0,
                        0,
                        4
                    )
                    SliderValueFrame1.Size = pos1
                    SliderValueFrame2.Position = pos
            
                    local value = tonumber(string.format("%.1f", (pos.X.Scale * (max - min) + min)))
                    Value = value
                    Text_4.Text = Name .. " : " .. string.format("%.1f", Value)
                    callback(Value)
                end
            
                SliderValueFrame2.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                    end
                end)
            
                SliderValueFrame2.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)
            
                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        move(input)
                    end
                end)
            
                if default then
                    local pos = UDim2.new(math.clamp((default - min) / (max - min), 0, 1), -6, -1.5, 0)
                    SliderValueFrame2.Position = pos
                    SliderValueFrame1.Size = UDim2.new((default - min) / (max - min), 0, 0, 4)
                    Text_4.Text = Name .. " : " .. string.format("%.1f", default)
                    callback(default)
                end
            
                function sliderfunc:Update(value)
                    local pos = UDim2.new(math.clamp((value - min) / (max - min), 0, 1), -6, -1.5, 0)
                    SliderValueFrame2.Position = pos
                    SliderValueFrame1.Size = UDim2.new((value - min) / (max - min), 0, 0, 4)
                    Text_4.Text = Name .. " : " .. string.format("%.1f", value)
                    callback(value)
                end
            
                return sliderfunc
            end

            function functionitem:PlayerProfile()
                local profile = {}
                local ProfileFrame = Instance.new("Frame")
                local AvatarImage = Instance.new("ImageLabel")
                local UICorner_Avatar = Instance.new("UICorner")
                local UsernameLabel = Instance.new("TextLabel")
                local MoneyLabel = Instance.new("TextLabel")
                local LevelLabel = Instance.new("TextLabel")

                ProfileFrame.Name = "ProfileFrame"
                ProfileFrame.Parent = SectionContainer
                ProfileFrame.BackgroundTransparency = 1.000
                ProfileFrame.Size = UDim2.new(1, 0, 0, 120)

                AvatarImage.Name = "AvatarImage"
                AvatarImage.Parent = ProfileFrame
                AvatarImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                AvatarImage.BackgroundTransparency = 1.000
                AvatarImage.Position = UDim2.new(0, 10, 0, 10)
                AvatarImage.Size = UDim2.new(0, 80, 0, 80)
                AvatarImage.ZIndex = 16
                local success, thumbnail = pcall(function()
                    return Players:GetUserThumbnailAsync(LocalPlayer.UserId, ThumbnailType, ThumbnailSize)
                end)
                AvatarImage.Image = success and thumbnail or "rbxassetid://0"
                UICorner_Avatar.CornerRadius = UDim.new(0, 10)
                UICorner_Avatar.Parent = AvatarImage

                UsernameLabel.Name = "UsernameLabel"
                UsernameLabel.Parent = ProfileFrame
                UsernameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                UsernameLabel.BackgroundTransparency = 1.000
                UsernameLabel.Position = UDim2.new(0, 100, 0, 10)
                UsernameLabel.Size = UDim2.new(0, 170, 0, 20)
                UsernameLabel.ZIndex = 16
                UsernameLabel.Font = Enum.Font.GothamBold
                UsernameLabel.Text = "Username: " .. (LocalPlayer.Name or "N/A")
                UsernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                UsernameLabel.TextSize = 12.000
                UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left

                MoneyLabel.Name = "MoneyLabel"
                MoneyLabel.Parent = ProfileFrame
                MoneyLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                MoneyLabel.BackgroundTransparency = 1.000
                MoneyLabel.Position = UDim2.new(0, 100, 0, 35)
                MoneyLabel.Size = UDim2.new(0, 170, 0, 20)
                MoneyLabel.ZIndex = 16
                MoneyLabel.Font = Enum.Font.GothamBold
                local moneyValue = "N/A"
                local successMoney, moneyStat = pcall(function()
                    return game:GetService("Players").LocalPlayer:FindFirstChild("leaderstats") and game:GetService("Players").LocalPlayer.leaderstats["C$"]
                end)
                if successMoney and moneyStat then
                    moneyValue = tostring(moneyStat.Value)
                    moneyStat:GetPropertyChangedSignal("Value"):Connect(function()
                        MoneyLabel.Text = "Money: " .. tostring(moneyStat.Value)
                    end)
                end
                MoneyLabel.Text = "Money: " .. moneyValue
                MoneyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                MoneyLabel.TextSize = 12.000
                MoneyLabel.TextXAlignment = Enum.TextXAlignment.Left

                LevelLabel.Name = "LevelLabel"
                LevelLabel.Parent = ProfileFrame
                LevelLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

                LevelLabel.BackgroundTransparency = 1.000
                LevelLabel.Position = UDim2.new(0, 100, 0, 60)
                LevelLabel.Size = UDim2.new(0, 170, 0, 20)
                LevelLabel.ZIndex = 16
                LevelLabel.Font = Enum.Font.GothamBold
                local levelValue = "N/A"
                local successLevel, levelStat = pcall(function()
                    return game:GetService("Players").LocalPlayer:FindFirstChild("leaderstats") and game:GetService("Players").LocalPlayer.leaderstats.Level
                end)
                if successLevel and levelStat then
                    levelValue = tostring(levelStat.Value)
                    levelStat:GetPropertyChangedSignal("Value"):Connect(function()
                        LevelLabel.Text = "Level: " .. tostring(levelStat.Value)
                    end)
                end
                LevelLabel.Text = "Level: " .. levelValue
                LevelLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                LevelLabel.TextSize = 12.000
                LevelLabel.TextXAlignment = Enum.TextXAlignment.Left

                function profile:Update()
                    UsernameLabel.Text = "Username: " .. (LocalPlayer.Name or "N/A")
                    local success, thumbnail = pcall(function()
                        return Players:GetUserThumbnailAsync(LocalPlayer.UserId, ThumbnailType, ThumbnailSize)
                    end)
                    AvatarImage.Image = success and thumbnail or "rbxassetid://0"
                    local successMoney, moneyStat = pcall(function()
                        return game:GetService("Players").LocalPlayer:FindFirstChild("leaderstats") and game:GetService("Players").LocalPlayer.leaderstats["C$"]
                    end)
                    if successMoney and moneyStat then
                        MoneyLabel.Text = "Money: " .. tostring(moneyStat.Value)
                    end
                    local successLevel, levelStat = pcall(function()
                        return game:GetService("Players").LocalPlayer:FindFirstChild("leaderstats") and game:GetService("Players").LocalPlayer.leaderstats.Level
                    end)
                    if successLevel and levelStat then
                        LevelLabel.Text = "Level: " .. tostring(levelStat.Value)
                    end
                end

                return profile
            end

            function functionitem:GameProfile()
                local profile = {}
                local ProfileFrame = Instance.new("Frame")
                local MapNameLabel = Instance.new("TextLabel")
                local JobIdLabel = Instance.new("TextLabel")
                local PlayerCountLabel = Instance.new("TextLabel")
                local CopyJobIdButton = Instance.new("TextButton")
            
                ProfileFrame.Name = "GameProfileFrame"
                ProfileFrame.Parent = SectionContainer
                ProfileFrame.BackgroundTransparency = 1.000
                ProfileFrame.Size = UDim2.new(1, 0, 0, 140)
            
                MapNameLabel.Name = "MapNameLabel"
                MapNameLabel.Parent = ProfileFrame
                MapNameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                MapNameLabel.BackgroundTransparency = 1.000
                MapNameLabel.Position = UDim2.new(0, 10, 0, 10)
                MapNameLabel.Size = UDim2.new(0, 260, 0, 20)
                MapNameLabel.ZIndex = 16
                MapNameLabel.Font = Enum.Font.GothamBold
                local success, productInfo = pcall(function()
                    return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
                end)
                MapNameLabel.Text = "Map: " .. (success and productInfo and productInfo.Name or "N/A")
                MapNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                MapNameLabel.TextSize = 12.000
                MapNameLabel.TextXAlignment = Enum.TextXAlignment.Left
            
                JobIdLabel.Name = "JobIdLabel"
                JobIdLabel.Parent = ProfileFrame
                JobIdLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                JobIdLabel.BackgroundTransparency = 1.000
                JobIdLabel.Position = UDim2.new(0, 10, 0, 35)
                JobIdLabel.Size = UDim2.new(0, 260, 0, 20)
                JobIdLabel.ZIndex = 16
                JobIdLabel.Font = Enum.Font.GothamBold
                JobIdLabel.Text = "JobId: " .. (game.JobId ~= "" and game.JobId or "N/A")
                JobIdLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                JobIdLabel.TextSize = 12.000
                JobIdLabel.TextXAlignment = Enum.TextXAlignment.Left
            
                PlayerCountLabel.Name = "PlayerCountLabel"
                PlayerCountLabel.Parent = ProfileFrame
                PlayerCountLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                PlayerCountLabel.BackgroundTransparency = 1.000
                PlayerCountLabel.Position = UDim2.new(0, 10, 0, 60)
                PlayerCountLabel.Size = UDim2.new(0, 260, 0, 20)
                PlayerCountLabel.ZIndex = 16
                PlayerCountLabel.Font = Enum.Font.GothamBold
                PlayerCountLabel.Text = "Players: " .. #game:GetService("Players"):GetPlayers()
                PlayerCountLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                PlayerCountLabel.TextSize = 12.000
                PlayerCountLabel.TextXAlignment = Enum.TextXAlignment.Left
            
                CopyJobIdButton.Name = "CopyJobIdButton"
                CopyJobIdButton.Parent = ProfileFrame
                CopyJobIdButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CopyJobIdButton.BackgroundTransparency = 0.800
                CopyJobIdButton.Position = UDim2.new(0, 10, 0, 85)
                CopyJobIdButton.Size = UDim2.new(0, 100, 0, 20)
                CopyJobIdButton.ZIndex = 16
                CopyJobIdButton.Font = Enum.Font.GothamBold
                CopyJobIdButton.Text = "Copy JobId"
                CopyJobIdButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                CopyJobIdButton.TextSize = 12.000
                CopyJobIdButton.MouseButton1Click:Connect(function()
                    local UserInputService = game:GetService("UserInputService")
                    local mousePos = UserInputService:GetMouseLocation()
                    local guiInset = game:GetService("GuiService"):GetGuiInset()
                    mousePos = mousePos - guiInset
            
                    local absolutePos = CopyJobIdButton.AbsolutePosition
                    local absoluteSize = CopyJobIdButton.AbsoluteSize
                    local relativeX = (mousePos.X - absolutePos.X) / absoluteSize.X
                    local relativeY = (mousePos.Y - absolutePos.Y) / absoluteSize.Y
            
                    local Explosion = Instance.new("Frame")
                    local ExplosionUICorner = Instance.new("UICorner")
            
                    Explosion.Name = "ExplosionEffect"
                    Explosion.Parent = CopyJobIdButton
                    Explosion.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Explosion.Position = UDim2.new(relativeX, 0, relativeY, 0)
                    Explosion.Size = UDim2.new(0, 10, 0, 10)
                    Explosion.AnchorPoint = Vector2.new(0.5, 0.5)
                    Explosion.ZIndex = 17
                    Explosion.BackgroundTransparency = 0
            
                    ExplosionUICorner.CornerRadius = UDim.new(1, 0)
                    ExplosionUICorner.Parent = Explosion
            
                    local TweenService = game:GetService("TweenService")
                    local tweenInfo = TweenInfo.new(
                        0.3,
                        Enum.EasingStyle.Quad,
                        Enum.EasingDirection.Out
                    )
            
                    local tween = TweenService:Create(
                        Explosion,
                        tweenInfo,
                        {
                            Size = UDim2.new(0, 50, 0, 50),
                            BackgroundTransparency = 1
                        }
                    )
            
                    tween:Play()
            
                    tween.Completed:Connect(function()
                        Explosion:Destroy()
                    end)
            
                    -- Original clipboard copying logic
                    if game.JobId ~= "" then
                        local success, err = pcall(function()
                            setclipboard(game.JobId)
                        end)
                        if success then
                            CopyJobIdButton.Text = "Copied ✅"
                            wait(1)
                            CopyJobIdButton.Text = "Copy JobId"
                        else
                            CopyJobIdButton.Text = "Failed to copy ❌"
                            wait(1)
                            CopyJobIdButton.Text = "Copy JobId"
                        end
                    end
                end)
            
                game:GetService("Players").PlayerAdded:Connect(function()
                    PlayerCountLabel.Text = "Players: " .. #game:GetService("Players"):GetPlayers()
                end)
            
                game:GetService("Players").PlayerRemoving:Connect(function()
                    PlayerCountLabel.Text = "Players: " .. #game:GetService("Players"):GetPlayers()
                end)
            
                function profile:Update()
                    local success, productInfo = pcall(function()
                        return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
                    end)
                    MapNameLabel.Text = "Map: " .. (success and productInfo and productInfo.Name or "N/A")
                    JobIdLabel.Text = "JobId: " .. (game.JobId ~= "" and game.JobId or "N/A")
                    PlayerCountLabel.Text = "Players: " .. #game:GetService("Players"):GetPlayers()
                end
            
                return profile
            end
            return functionitem
        end
        return sections
    end
    return tabs, Main
end
return library
