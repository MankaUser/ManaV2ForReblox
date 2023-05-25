local function Create(Object, Properties)
	local New = Instance.new(Object)
	for i,v in pairs(Properties) do
		New[i] = v
	end
	return New
end

local function AddCorner(GuiObject,Roundness)
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(Roundness,0)
	Corner.Parent = GuiObject
end

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local RemoteFolder = game.ReplicatedStorage:WaitForChild("rbxts_include")["node_modules"]["@rbxts"]["net"]["out"]["_NetManaged"]

local Gui = Create("ScreenGui",{Name="CrokUI",ResetOnSpawn=false,Parent=Player.PlayerGui})
local MainFrame = Create("Frame",{Parent=Gui,Position=UDim2.new(0.1,0,0.3,0),Size=UDim2.new(0.2,0,0.5,0),BackgroundTransparency=0.5,BackgroundColor3=Color3.fromRGB(208,208,208),BorderSizePixel=0})

local TopBar = Create("Frame",{Parent=MainFrame,Position=UDim2.new(0,0,-0.01,0),Size=UDim2.new(1,0,0.08,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,119,65),BorderSizePixel=0})
local BarBottom = Create("Frame",{Parent=TopBar,Position=UDim2.new(0,0,0.5,0),Size=UDim2.new(1,0,0.5,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,119,65),BorderSizePixel=0})
local BarLineL = Create("Frame",{Parent=TopBar,Position=UDim2.new(0,0,0.4,0),Size=UDim2.new(0.18,0,0.3,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,140,120),BorderSizePixel=0})
local BarLineR = Create("Frame",{Parent=TopBar,Position=UDim2.new(0.82,0,0.4,0),Size=UDim2.new(0.18,0,0.3,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,140,120),BorderSizePixel=0})
local BarLineM = Create("Frame",{Parent=TopBar,Position=UDim2.new(0.2,0,0.4,0),Size=UDim2.new(0.6,0,0.3,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,140,120),BorderSizePixel=0})

local KillauraButton = Create("TextButton",{Parent=MainFrame,Position=UDim2.new(0.1,0,0.125,0),Size=UDim2.new(0.4,0,0.1,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,160,97),BorderSizePixel=0,Font=Enum.Font.TitilliumWeb,Text="Killaura (broken)",TextScaled=true,TextWrapped=true,TextStrokeColor3=Color3.fromRGB(124,58,0),TextColor3=Color3.new(1,1,1),TextStrokeTransparency=0})
local SpeedButton = Create("TextButton",{Parent=MainFrame,Position=UDim2.new(0.1,0,0.275,0),Size=UDim2.new(0.4,0,0.1,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,160,97),BorderSizePixel=0,Font=Enum.Font.TitilliumWeb,Text="Speed",TextScaled=true,TextWrapped=true,TextStrokeColor3=Color3.fromRGB(124,58,0),TextColor3=Color3.new(1,1,1),TextStrokeTransparency=0})
local NukebridgeButton = Create("TextButton",{Parent=MainFrame,Position=UDim2.new(0.1,0,0.425,0),Size=UDim2.new(0.4,0,0.1,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,160,97),BorderSizePixel=0,Font=Enum.Font.TitilliumWeb,Text="Nukebridge ( broken )",TextScaled=true,TextWrapped=true,TextStrokeColor3=Color3.fromRGB(124,58,0),TextColor3=Color3.new(1,1,1),TextStrokeTransparency=0})
local InstantPickButton = Create("TextButton",{Parent=MainFrame,Position=UDim2.new(0.55,0,0.275,0),Size=UDim2.new(0.4,0,0.1,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,160,97),BorderSizePixel=0,Font=Enum.Font.TitilliumWeb,Text="Instant Pickup",TextScaled=true,TextWrapped=true,TextStrokeColor3=Color3.fromRGB(124,58,0),TextColor3=Color3.new(1,1,1),TextStrokeTransparency=0})
local BuyWoolButton = Create("TextButton",{Parent=MainFrame,Position=UDim2.new(0.55,0,0.425,0),Size=UDim2.new(0.4,0,0.1,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,160,97),BorderSizePixel=0,Font=Enum.Font.TitilliumWeb,Text="Buy Wool ( working only when you are 1-5 blocks from shop )",TextScaled=true,TextWrapped=true,TextStrokeColor3=Color3.fromRGB(124,58,0),TextColor3=Color3.new(1,1,1),TextStrokeTransparency=0})

local ReachBox = Create("TextBox",{Parent=MainFrame,Position=UDim2.new(0.55,0,0.15,0),Size=UDim2.new(0.2,0,0.05,0),BackgroundTransparency=0,BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.fromRGB(255,174,119),BorderSizePixel=5,Font=Enum.Font.TitilliumWeb,Text="Range: 80",TextScaled=true,TextWrapped=true,TextStrokeColor3=Color3.new(1,1,1),TextColor3=Color3.new(0,0,0),PlaceholderText="Enter range"})

local Credits = Create("TextLabel",{Parent=MainFrame,Position=UDim2.new(0.2,0,0.75,0),Size=UDim2.new(0.6,0,0.05,0),BackgroundTransparency=1,Font=Enum.Font.TitilliumWeb,Text="Made by Crokuran",TextScaled=true,TextWrapped=true,TextStrokeColor3=Color3.fromRGB(124,58,0),TextColor3=Color3.new(1,1,1),TextStrokeTransparency=0,TextYAlignment=Enum.TextYAlignment.Top})
local KeybindNote = Create("TextLabel",{Parent=MainFrame,Position=UDim2.new(0.2,0,0.76,0),Size=UDim2.new(0.6,0,0.1,0),BackgroundTransparency=1,Font=Enum.Font.TitilliumWeb,Text="Fixed for 10% by Manka",TextScaled=true,TextWrapped=true,TextStrokeColor3=Color3.fromRGB(124,58,0),TextColor3=Color3.new(1,1,1),TextStrokeTransparency=0,TextYAlignment=Enum.TextYAlignment.Bottom})
local BlockNote = Create("TextLabel",{Parent=MainFrame,Position=UDim2.new(0,0,0.85,0),Size=UDim2.new(1,0,0.15,0),BackgroundTransparency=1,Font=Enum.Font.TitilliumWeb,Text="",TextScaled=true,TextWrapped=true,TextStrokeColor3=Color3.fromRGB(124,58,0),TextColor3=Color3.new(1,1,1),TextStrokeTransparency=0})

AddCorner(MainFrame, 0.05)
AddCorner(TopBar, 0.3)
AddCorner(KillauraButton, 0.1)
AddCorner(SpeedButton, 0.1)
AddCorner(NukebridgeButton, 0.1)
AddCorner(InstantPickButton, 0.1)
AddCorner(BuyWoolButton, 0.1)

local IsDark = _G.DarkMode
if IsDark then
	MainFrame.BackgroundColor3 = Color3.new(0,0,0)
	TopBar.BackgroundColor3 = Color3.new(0,0,0)
	BarBottom.BackgroundColor3 = Color3.new(0,0,0)
	BarLineL.BackgroundColor3 = Color3.fromRGB(56,56,56)
	BarLineR.BackgroundColor3 = Color3.fromRGB(56,56,56)
	BarLineM.BackgroundColor3 = Color3.fromRGB(56,56,56)
	KillauraButton.BackgroundColor3 = Color3.fromRGB(11,11,11)
	KillauraButton.TextColor3 = Color3.new(1,1,1)
	KillauraButton.TextStrokeTransparency = 1
	SpeedButton.BackgroundColor3 = Color3.fromRGB(11,11,11)
	SpeedButton.TextColor3 = Color3.new(1,1,1)
	SpeedButton.TextStrokeTransparency = 1
	NukebridgeButton.BackgroundColor3 = Color3.fromRGB(11,11,11)
	NukebridgeButton.TextColor3 = Color3.new(1,1,1)
	NukebridgeButton.TextStrokeTransparency = 1
	InstantPickButton.BackgroundColor3 = Color3.fromRGB(11,11,11)
	InstantPickButton.TextColor3 = Color3.new(1,1,1)
	InstantPickButton.TextStrokeTransparency = 1
	BuyWoolButton.BackgroundColor3 = Color3.fromRGB(11,11,11)
	BuyWoolButton.TextColor3 = Color3.new(1,1,1)
	BuyWoolButton.TextStrokeTransparency = 1
	ReachBox.BorderColor3 = Color3.fromRGB(22,22,22)
	Credits.TextStrokeColor3 = Color3.new(0,0,0)
	KeybindNote.TextStrokeColor3 = Color3.new(0,0,0)
	BlockNote.TextStrokeColor3 = Color3.new(0,0,0)
	
	local Rumia = Create("ImageLabel",{Parent=MainFrame,Position=UDim2.new(0,0,0,0),Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://6547394128",ImageTransparency=0.95,ScaleType=Enum.ScaleType.Crop})
end

local DragSpeed = .3

local FrameStart
local MouseStart
local HeldDown = false
TopBar.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1 then
		HeldDown = true
		FrameStart = MainFrame.Position
		MouseStart = Input.Position
		repeat
			MainFrame.Position = MainFrame.Position:Lerp(UDim2.new(FrameStart.X.Scale,FrameStart.X.Offset + (Mouse.X - MouseStart.X),FrameStart.Y.Scale,FrameStart.Y.Offset + (Mouse.Y - MouseStart.Y)), DragSpeed)
			game:GetService("RunService").RenderStepped:Wait()
		until not HeldDown
		local EndPos = {X = Mouse.X, Y = Mouse.Y}
		for i=1,50 do
			if not HeldDown then
				MainFrame.Position = MainFrame.Position:Lerp(UDim2.new(FrameStart.X.Scale,FrameStart.X.Offset + (EndPos.X - MouseStart.X),FrameStart.Y.Scale,FrameStart.Y.Offset + (EndPos.Y - MouseStart.Y)), DragSpeed)
			else
				break
			end
			game:GetService("RunService").RenderStepped:Wait()
		end
	end
end)

TopBar.InputEnded:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1 then
		HeldDown = false
	end
end)

local Character = Player.Character
local KillauraActive = false
local SpeedActive = false
local NukebridgeActive = false
local InstantPickActive = false
local Range = 80

KillauraButton.MouseButton1Click:Connect(function()
	if KillauraActive then
		KillauraActive = false
		KillauraButton.Text = "Not working sorry"
	else
		KillauraActive = true
		KillauraButton.Text = "Not working sorry"
		
		
	end
end)

local Con
SpeedButton.MouseButton1Click:Connect(function()
	if SpeedActive then
		SpeedActive = false
		SpeedButton.Text = "Speed"
	else
		SpeedActive = true
		SpeedButton.Text = "Speed (Toggled)"
		repeat
			wait()
			if Character and Character.Humanoid.Health>0 then
				Character.Humanoid.WalkSpeed = 23
			end
		until not SpeedActive
		Character.Humanoid.WalkSpeed = 16
	end
end)

NukebridgeButton.MouseButton1Click:Connect(function()
	if NukebridgeActive then
		NukebridgeActive = false
		NukebridgeButton.Text = "Nukebridge ( broken)"
		print("Nothing happens lol")
	else
		NukebridgeActive = true
		NukebridgeButton.Text = "Nukebridge (Toggled and borken)"
		print("Nukebridge is broken lol")
	end
end)

InstantPickButton.MouseButton1Click:Connect(function()
	if InstantPickActive then
		InstantPickActive = false
		InstantPickButton.Text = "Instant Pickup"
	else
		InstantPickActive = true
		InstantPickButton.Text = "Instant Pickup (Toggled)"
		repeat
			wait()
			for i,v in pairs(workspace.ItemDrops:GetChildren()) do
				if Character and Character.Humanoid.Health>0 and (v.Position-Character.HumanoidRootPart.Position).magnitude<=10 then
					local x,y,z = math.ceil(v.Position.X/3),math.ceil(v.Position.Y/3),math.ceil(v.Position.Z/3)
					coroutine.wrap(function()
						RemoteFolder.PickupItemDrop:InvokeServer({itemDrop=v})
					end)()
				end
			end
		until not InstantPickActive
	end
end)

BuyWoolButton.MouseButton1Click:Connect(function()
	if Character and Character.Humanoid.Health>0 then
	RemoteFolder.BedwarsPurchaseItem:InvokeServer({shopItem={price=8,currency="iron",itemType="wool_white",amount=16}})
	end
end)

ReachBox.FocusLost:Connect(function(entered)
	if entered then
		if tonumber(ReachBox.Text) then
			Range = math.clamp(tonumber(ReachBox.Text),1,100)
			ReachBox.Text = "Range: ".. Range
		end
	end
end)

Player.CharacterAdded:Connect(function()
	Character = Player.Character
	Character.Humanoid.Died:Connect(function()
		Character = nil
	end)
end)

Character.Humanoid.Died:Connect(function()
	Character = nil
end)
