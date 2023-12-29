_G.AutoChest = {
    ["Toggle"] = true,
    ["Team"] = "Marines",
    ["SaveItem"] = true, -- stop when u got something form the chest
    ["WhiteScreen"] = false,
    ["HopServerAfterXChest"] = 100, --math.huge is infinity
    ["HopIfThereIsNoChest"] = true,
}

--[Wait Game]
repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.Players.LocalPlayer.Character
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

if _G.AutoChest["WhiteScreen"] then
	game.RunService:Set3dRenderingEnabled(false)
else
	game.RunService:Set3dRenderingEnabled(true)
end

--[Variables]
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local tween = game:service"TweenService"
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local GuiService = game:GetService("GuiService")
local dem = 0
local chest = nil

--[Anti Dex]
local CoreGui = game:GetService("CoreGui").RobloxGui.Modules
do if game:GetService("CoreGui"):FindFirstChild("Window") then game:Shutdown() end end
spawn(function()
	game:GetService("RunService").RenderStepped:connect(function()
		game.CoreGui.ChildAdded:connect(function(p1)
			if p1.Name == "Window" or p1:FindFirstChild("PropertiesFrame") or p1:FindFirstChild("ExplorerPanel") or p1:FindFirstChild("SaveInstance") then
				game.Players.LocalPlayer:Kick("DatG Hub  Anti Dark Dex")
				wait(0.6)
				game:Shutdown()
			end
		end)
	end)
end)

--[Data Json]
_G.Setting_table = {}

_G.Check_Save_Setting = "CheckSaveSetting"

getgenv()['JsonEncode'] = function(msg)
	return game:GetService("HttpService"):JSONEncode(msg)
end
getgenv()['JsonDecode'] = function(msg)
	return game:GetService("HttpService"):JSONDecode(msg)
end
getgenv()['Check_Setting'] = function(Name)
	if not _G.Dis and not isfolder('CacHub ') then
		makefolder('CacHub ')
	end
	if not _G.Dis and not isfile('CacHub /'..Name..'.json') then
		writefile('CacHub Premium/'..Name..'.json',JsonEncode(_G.Setting_table))
	end
end
getgenv()['Get_Setting'] = function(Name)
	if not _G.Dis and isfolder('CacHub') and isfile('CacHub/'..Name..'.json') then
		_G.Setting_table = JsonDecode(readfile('CacHub/'..Name..'.json'))
		return _G.Setting_table
	elseif not _G.Dis then
		Check_Setting(Name)
	end
end
getgenv()['Update_Setting'] = function(Name)
	if not _G.Dis and isfolder('CacHub Premium') and isfile('CacHub Premium/'..Name..'.json') then
		writefile('CacHub Premium/'..Name..'.json',JsonEncode(_G.Setting_table))
	elseif not _G.Dis then
		Check_Setting(Name)
	end
end

Check_Setting(_G.Check_Save_Setting)
Get_Setting(_G.Check_Save_Setting)

getgenv()['MyName'] = game.Players.LocalPlayer.Name.."Chest"
print("Save Member")

Check_Setting(getgenv()['MyName'])
Get_Setting(getgenv()['MyName'])

--[Team]
repeat wait()
	if game.Players.LocalPlayer.Team == nil and game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Visible == true then
		pcall(function()
			if _G.AutoChest.Team == "Pirate" then
				for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
					for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton[v])) do
						v.Function()
					end
				end
			elseif _G.AutoChest.Team == "Marine" then
				for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
					for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[v])) do
						v.Function()
					end
				end
			else
				for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
					for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[v])) do
						v.Function()
					end
				end
			end
		end)
	end
until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()

--[Anti AFK]
game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

--[Fast Hop]
function Fast_Hop()
	pcall(function()
		for count = math.random(1, math.random(40, 75)), 100 do
			remote = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(count)
			for _i ,v in pairs(remote) do
				if tonumber(v['Count']) < 12 then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, _i)
				end
			end    
		end
	end)
end

--[Rejoin When Got Kick]
spawn(function()
	while wait() do
		repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')
		local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')							
		po.ChildAdded:connect(function(a)
			if a.Name == 'ErrorPrompt' then
				repeat
					ts:Teleport(game.PlaceId)
					wait(2)
				until false
			end
		end)
	end
end)

--[Touch Interest]
local function frti(uwu)
	if type(firetouchinterest) == "function" then
		firetouchinterest(LocalPlayer.Character.Head, uwu, 0)
		firetouchinterest(LocalPlayer.Character.PrimaryPart, uwu, 0)
		firetouchinterest(LocalPlayer.Character.UpperTorso, uwu, 0)
		firetouchinterest(LocalPlayer.Character.LowerTorso, uwu, 0)
	end
end

--[Notification Modules]
Notification = require(game:GetService("ReplicatedStorage").Notification)
Notification.new("<Color=Blue>Wellcome To DatG Hub Premium...<Color=/>"):Display()
Notification.new("<Color=Blue>Made by: datgreal<Color=/>"):Display()

--[WhiteList]
local whitelisted = false
local curbeli = LocalPlayer.Data.Beli.Value
whitelisted = true

--[MakeDraggable]
local function MakeDraggable(topbarobject, object, object2)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
		local Tween = TweenService:Create(object2, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

repeat wait() until whitelisted

--[Load Data]
if _G.Setting_table.Beli == nil or not _G.Setting_table.Beli or _G.Setting_table.Beli == "" then 
	_G.Setting_table.Beli = game:GetService("Players").LocalPlayer.Data.Beli.Value
	Update_Setting(getgenv()['MyName'])
end

--[Gui]



local Autochest = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local page1 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TopFrame = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local page2 = Instance.new("Frame")
local Frame = Instance.new("Frame")
local Toggle = Instance.new("TextButton")
local Title = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local Title_2 = Instance.new("TextLabel")
local Des = Instance.new("TextLabel")
local Tap1 = Instance.new("Frame")
local TargetFrame = Instance.new("Frame")
local dis = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local Title_3 = Instance.new("TextLabel")
local Logo = Instance.new("ImageLabel")
local UICorner_5 = Instance.new("UICorner")
local Des_2 = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")
local MainFrame = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local Tab = Instance.new("Frame")
local Beli = Instance.new("TextLabel")
local UIListLayout_2 = Instance.new("UIListLayout")
local Time = Instance.new("TextLabel")
local UIStroke = Instance.new("UIStroke")
local Shadown = Instance.new("ImageLabel")

Autochest.Name = "DatG Hub"
Autochest.Parent = CoreGui
Autochest.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Autochest.DisplayOrder = 100
Autochest.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = Autochest
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BackgroundTransparency = 1.000
Main.ClipsDescendants = true
Main.Position = UDim2.new(0.499948114, 0, 0.499822885, 0)
Main.Size = UDim2.new(0, 325, 0, 383)
Main.ZIndex = 2

page1.Name = "page1"
page1.Parent = Main
page1.AnchorPoint = Vector2.new(0.5, 0.5)
page1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
page1.BorderSizePixel = 0
page1.ClipsDescendants = true
page1.Position = UDim2.new(0.502301335, 0, 0.498865604, 0)
page1.Size = UDim2.new(0, 325, 0, 383)

UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = page1

TopFrame.Name = "TopFrame"
TopFrame.Parent = page1
TopFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
TopFrame.ClipsDescendants = true
TopFrame.Position = UDim2.new(-0.00464186445, 0, -0.00207479694, 0)
TopFrame.Size = UDim2.new(1.00430739, 0, -0.0094733974, 50)

UICorner_2.CornerRadius = UDim.new(0, 6)
UICorner_2.Parent = TopFrame

page2.Name = "page2"
page2.Parent = page1
page2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
page2.BackgroundTransparency = 1.000
page2.ClipsDescendants = true
page2.Position = UDim2.new(-0.00464186445, 0, 0.11900007, 0)
page2.Size = UDim2.new(1.00464189, 0, -0.0328381881, 350)
page2.ZIndex = 2

Frame.Parent = page2
Frame.BackgroundColor3 = Color3.fromRGB(208, 208, 208)
Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.581914246, 0, 0.865965784, 0)
Frame.Size = UDim2.new(0, 127, 0, 38)
Frame.ZIndex = 3

Toggle.Name = "Toggle"
Toggle.Parent = Frame
Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BackgroundTransparency = 1.000
Toggle.Position = UDim2.new(0.000581771601, 0, -0.0105767502, 0)
Toggle.Size = UDim2.new(1.00471342, 0, 1.01828694, 0)
Toggle.ZIndex = 0
Toggle.Font = Enum.Font.GothamMedium
Toggle.Text = ""
Toggle.TextColor3 = Color3.fromRGB(0, 179, 255)
Toggle.TextSize = 14.000
Toggle.TextTransparency = 1.000
Toggle.TextWrapped = true

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.000187949525, 0, -0.00558792939, 0)
Title.Size = UDim2.new(0.223738045, 100, 1.01920676, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "[ STOP ]"
Title.TextColor3 = Color3.fromRGB(54, 54, 54)
Title.TextSize = 20.000

UICorner_3.CornerRadius = UDim.new(0, 2)
UICorner_3.Parent = Frame

Title_2.Name = "Title"
Title_2.Parent = page1
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.Position = UDim2.new(0, 4, 0, 6)
Title_2.Size = UDim2.new(0.00386690581, 100, 0.0493665859, 0)
Title_2.Font = Enum.Font.GothamBold
Title_2.Text = "DatG_COMMUNITY"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 16.000
Title_2.TextXAlignment = Enum.TextXAlignment.Left
Title_2.TextYAlignment = Enum.TextYAlignment.Top

Des.Name = "Des"
Des.Parent = page1
Des.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Des.BackgroundTransparency = 1.000
Des.BorderColor3 = Color3.fromRGB(27, 42, 53)
Des.Position = UDim2.new(0, 4, 0, 25)
Des.Size = UDim2.new(0.00386690581, 100, 0.0493666045, 0)
Des.Font = Enum.Font.GothamBold
Des.Text = "Auto Chest"
Des.TextColor3 = Color3.fromRGB(131, 131, 131)
Des.TextSize = 14.000
Des.TextXAlignment = Enum.TextXAlignment.Left
Des.TextYAlignment = Enum.TextYAlignment.Top

Tap1.Name = "Tap1"
Tap1.Parent = page1
Tap1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tap1.BackgroundTransparency = 1.000
Tap1.ClipsDescendants = true
Tap1.Position = UDim2.new(-0.00464167679, 0, 0.137276828, 0)
Tap1.Size = UDim2.new(1.00464189, 0, -0.0511149503, 350)
Tap1.ZIndex = 2

TargetFrame.Name = "TargetFrame"
TargetFrame.Parent = Tap1
TargetFrame.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
TargetFrame.BackgroundTransparency = 0.300
TargetFrame.ClipsDescendants = true
TargetFrame.Position = UDim2.new(0.0291218814, 0, 0.0194188561, 0)
TargetFrame.Size = UDim2.new(0.942980647, 0, -0.672385752, 350)

UICorner_4.CornerRadius = UDim.new(0, 6)
UICorner_4.Parent = TargetFrame

Title_3.Name = "Title"
Title_3.Parent = TargetFrame
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.Position = UDim2.new(0.0209916122, 0, -0.00558768259, 0)
Title_3.Size = UDim2.new(0.182352588, 100, 0.264753103, 0)
Title_3.Font = Enum.Font.GothamBold
Title_3.Text = "[ PLAYER INFO ]"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 15.000
Title_3.TextXAlignment = Enum.TextXAlignment.Left

Logo.Name = "Logo"
Logo.Parent = TargetFrame
Logo.AnchorPoint = Vector2.new(0.5, 0.5)
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.Position = UDim2.new(0.829661906, 0, 0.560915351, 0)
Logo.Size = UDim2.new(0, 91, 0, 91)
Logo.ZIndex = 2
Logo.Image = "rbxthumb://type=AvatarHeadShot&id="..LocalPlayer.UserId.."&w=150&h=150"

UICorner_5.CornerRadius = UDim.new(0, 3192)
UICorner_5.Parent = Logo

Des_2.Name = "Des"
Des_2.Parent = TargetFrame
Des_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Des_2.BackgroundTransparency = 1.000
Des_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Des_2.Position = UDim2.new(0, 6, 0, 33)
Des_2.Size = UDim2.new(0.337605327, 100, 0.48970589, 0)
Des_2.Font = Enum.Font.GothamBold
Des_2.Text = "Player Name : "..LocalPlayer.Name.." \nUserId : "..LocalPlayer.UserId
Des_2.TextColor3 = Color3.fromRGB(131, 131, 131)
Des_2.TextSize = 14.000
Des_2.TextXAlignment = Enum.TextXAlignment.Left
Des_2.TextYAlignment = Enum.TextYAlignment.Top

UIListLayout.Parent = Tap1
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

MainFrame.Name = "MainFrame"
MainFrame.Parent = Tap1
MainFrame.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
MainFrame.BackgroundTransparency = 0.300
MainFrame.ClipsDescendants = true
MainFrame.Position = UDim2.new(0.080575496, 0, 0.405021191, 0)
MainFrame.Size = UDim2.new(0.942980647, 0, -0.672385752, 350)

UICorner_6.CornerRadius = UDim.new(0, 6)
UICorner_6.Parent = MainFrame

Tab.Name = "Tab"
Tab.Parent = MainFrame
Tab.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
Tab.BackgroundTransparency = 1.000
Tab.ClipsDescendants = true
Tab.Position = UDim2.new(0.0209916122, 0, 0.0194190163, 0)
Tab.Size = UDim2.new(0.979008496, 0, -1.75746691, 350)

dis.Name = "dis"
dis.Parent = Tab
dis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dis.BackgroundTransparency = 1.000
dis.Size = UDim2.new(0.520070314, 100, 0.264753103, 0)
dis.Font = Enum.Font.GothamBold
dis.Text = "[ https://discord.gg/6B6CUbUtPP ]"
dis.TextColor3 = Color3.fromRGB(255, 255, 255)
dis.TextSize = 16.000
dis.TextXAlignment = Enum.TextXAlignment.Left

Beli.Name = "Beli"
Beli.Parent = Tab
Beli.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Beli.BackgroundTransparency = 1.000
Beli.BorderColor3 = Color3.fromRGB(27, 42, 53)
Beli.Position = UDim2.new(0, 0, 0, 33)
Beli.Size = UDim2.new(0.337605327, 100, 0.298235923, 0)
Beli.Font = Enum.Font.GothamBold
Beli.Text = "Beli :"
Beli.TextColor3 = Color3.fromRGB(131, 131, 131)
Beli.TextSize = 15.000
Beli.TextXAlignment = Enum.TextXAlignment.Left
Beli.TextYAlignment = Enum.TextYAlignment.Top

UIListLayout_2.Parent = Tab
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

Time.Name = "Time"
Time.Parent = Tab
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 1.000
Time.BorderColor3 = Color3.fromRGB(27, 42, 53)
Time.Position = UDim2.new(0, 0, 0, 33)
Time.Size = UDim2.new(0.338, 100, 0.298000008, 0)
Time.Font = Enum.Font.GothamBold
Time.Text = "Earned :"
Time.TextColor3 = Color3.fromRGB(131, 131, 131)
Time.TextSize = 15.000
Time.TextXAlignment = Enum.TextXAlignment.Left
Time.TextYAlignment = Enum.TextYAlignment.Top

UIStroke.Parent = Autochest

Shadown.Name = "Shadown"
Shadown.Parent = Autochest
Shadown.AnchorPoint = Vector2.new(0.5, 0.5)
Shadown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shadown.BackgroundTransparency = 1.000
Shadown.Position = UDim2.new(0.49912709, 0, 0.500231326, 0)
Shadown.Size = UDim2.new(0, 419, 0, 473)
Shadown.ZIndex = 0
Shadown.Image = "rbxassetid://8992584561"
Shadown.ImageColor3 = Color3.fromRGB(30, 30, 30)
Shadown.ScaleType = Enum.ScaleType.Slice
Shadown.SliceCenter = Rect.new(73, 73, 73, 73)
Shadown.SliceScale = 0.980

spawn(function()
	while wait(0.001) do 
		pcall(function()
			Beli.Text = "Beli : \n"..string.format("%0.0f", game:GetService("Players").LocalPlayer.Data.Beli.Value):gsub('(%d)(%d%d%d)$', '%1,%2')
			Time.Text = "Earn : \n"..string.format("%0.0f", game:GetService("Players").LocalPlayer.Data.Beli.Value - _G.Setting_table.Beli):gsub('(%d)(%d%d%d)$', '%1,%2')
		end)
	end
end)


MakeDraggable(TopFrame,Main,Shadown)

Toggle.MouseButton1Click:Connect(function()
	if _G.AutoChest["Toggle"] then
		_G.AutoChest["Toggle"] = false
		if _G.AutoChest["WhiteScreen"] then
			game.RunService:Set3dRenderingEnabled(true)
		end
		Title.Text = "[ START ]"
	else
		_G.AutoChest["Toggle"] = true
		if _G.AutoChest["WhiteScreen"] then
			game.RunService:Set3dRenderingEnabled(false)
		end
		Title.Text = "[ STOP ]"
	end
end)

spawn(function()
	for i,v in pairs(game:GetDescendants()) do
		if v.Name == "Script" then
			v:Destroy()
		end
	end

	for i,v in pairs(LocalPlayer.Character:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = true
			v.CanTouch = true
			v.CanQuery = true
		end
	end
end)


local Noclip = Instance.new("BodyVelocity", LocalPlayer.Character.PrimaryPart)
Noclip.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
Noclip.Velocity = Vector3.new(0,0,0)


task.spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		if _G.AutoChest["Toggle"] then
			local hasChar = game.Players.LocalPlayer:FindFirstChild("Character")
			if not game.Players.LocalPlayer.Character then

			else
				local hasCrewTag = game.Players.LocalPlayer.Character:FindFirstChild("CrewBBG",true)
				if hasCrewTag then hasCrewTag:Destroy() end
				local hasHumanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
				if hasHumanoid then
					local Chest = game.Workspace:FindFirstChild("Chest4") or game.Workspace:FindFirstChild("Chest3") or game.Workspace:FindFirstChild("Chest2") or game.Workspace:FindFirstChild("Chest1") or game.Workspace:FindFirstChild("Chest")
					if _G.AutoChest["SaveItem"] then
						if not LocalPlayer.Backpack:FindFirstChild("Fist Of Darkness") or not LocalPlayer.Character:FindFirstChild("God Chalice") then
							if Chest then
								if Noclip == nil then
									Noclip = Instance.new("BodyVelocity", LocalPlayer.Character.PrimaryPart)
									Noclip.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									Noclip.Velocity = Vector3.new(0,0,0)
								end
								spawn(function()
									for i,v in pairs(LocalPlayer.Character:GetDescendants()) do
										if v:IsA("BasePart") then
											v.CanCollide = true
											v.CanTouch = true
											v.CanQuery = true
										end
									end
								end)
								game.Players.LocalPlayer.Character:PivotTo(Chest:GetPivot())
								firesignal(Chest.Touched,game.Players.LocalPlayer.Character.HumanoidRootPart)
								frti(Chest)
							else
								Fast_Hop()
							end
						end
					else
						if Chest then
							if Noclip == nil then
								Noclip = Instance.new("BodyVelocity", LocalPlayer.Character.PrimaryPart)
								Noclip.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								Noclip.Velocity = Vector3.new(0,0,0)
							end
							spawn(function()
								for i,v in pairs(LocalPlayer.Character:GetDescendants()) do
									if v:IsA("BasePart") then
										v.CanCollide = true
										v.CanTouch = true
										v.CanQuery = true
									end
								end
							end)
							game.Players.LocalPlayer.Character:PivotTo(Chest:GetPivot())
							firesignal(Chest.Touched,game.Players.LocalPlayer.Character.HumanoidRootPart)
							frti(Chest)
						else
							Fast_Hop()
						end
					end
				end 
			end
		end
		task.wait()
	end)
end)



