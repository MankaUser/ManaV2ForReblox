local function CreateObject(Object, Properties)
	local New = Instance.new(Object)
	for i,v in pairs(Properties) do
		New[i] = v
	end
	return New
end

local function CreateUICorner(GuiObject,Roundness)
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(Roundness,0)
	Corner.Parent = GuiObject
end

local function CreateUIListLayout(GuiObject, Padding)
	local New = Instance.new("UIListLayout")
	New.Padding = UDim.new(0,Padding)
	New.HorizontalAlignment = Enum.HorizontalAlignment.Center
	New.Parent = GuiObject
end

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local Input = game:GetService("UserInputService")
local RemoteFolder = game.ReplicatedStorage:WaitForChild("rbxts_include")["node_modules"]["@rbxts"]["net"]["out"]["_NetManaged"]

local Gui = CreateObject("ScreenGui",{Name="ManaUI",ResetOnSpawn=false,Parent=Player.PlayerGui})
local MainFrame = CreateObject("Frame",{Parent=Gui,Position=UDim2.new(0.1,0,0.3,0),Size=UDim2.new(0.2,0,0.5,0),BackgroundTransparency=0.5,BackgroundColor3=Color3.fromRGB(208,208,208),BorderSizePixel=0})

local UIList = CreateUIListLayout(MainFrame, 5)
local TopBar = CreateObject("Frame",{Parent=MainFrame,Position=UDim2.new(0,0,-0.01,0),Size=UDim2.new(1,0,0.08,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,119,65),BorderSizePixel=0})
local BarBottom = CreateObject("Frame",{Parent=TopBar,Position=UDim2.new(0,0,0.5,0),Size=UDim2.new(1,0,0.5,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,119,65),BorderSizePixel=0})
local BarLineM = CreateObject("Frame",{Parent=TopBar,Position=UDim2.new(0.2,0,0.4,0),Size=UDim2.new(0.6,0,0.3,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,140,120),BorderSizePixel=0})
--local txt = CreateObject("TextLabel",{Parent=BarLineM,Position=UDim2.new(0.2,0,0.4,0),Size=UDim2.new(0.6,0,0.3,0),BackgroundTransparency=1,BorderSizePixel=0,Text="Mana", Font=Enum.Font.GothamMedium,TextSize = 20})

local SpeedButton = CreateObject("TextButton",{Parent=MainFrame,Position=UDim2.new(0.1,0,0.275,0),Size=UDim2.new(0.4,0,0.1,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,160,97),BorderSizePixel=0,Font=Enum.Font.TitilliumWeb,Text="Speed",TextScaled=true,TextWrapped=true,TextStrokeColor3=Color3.fromRGB(124,58,0),TextColor3=Color3.new(1,1,1),TextStrokeTransparency=0})
local InstantPickButton = CreateObject("TextButton",{Parent=MainFrame,Position=UDim2.new(0.55,0,0.275,0),Size=UDim2.new(0.4,0,0.1,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,160,97),BorderSizePixel=0,Font=Enum.Font.TitilliumWeb,Text="Instant Pickup",TextScaled=true,TextWrapped=true,TextStrokeColor3=Color3.fromRGB(124,58,0),TextColor3=Color3.new(1,1,1),TextStrokeTransparency=0})
local BuyWoolButton = CreateObject("TextButton",{Parent=MainFrame,Position=UDim2.new(0.55,0,0.425,0),Size=UDim2.new(0.4,0,0.1,0),BackgroundTransparency=0,BackgroundColor3=Color3.fromRGB(255,160,97),BorderSizePixel=0,Font=Enum.Font.TitilliumWeb,Text="Buy Wool ( Limited range )",TextScaled=true,TextWrapped=true,TextStrokeColor3=Color3.fromRGB(124,58,0),TextColor3=Color3.new(1,1,1),TextStrokeTransparency=0})


CreateUICorner(MainFrame, 0.05)
CreateUICorner(TopBar, 0.3)
CreateUICorner(SpeedButton, 0.1)
CreateUICorner(InstantPickButton, 0.1)
CreateUICorner(BuyWoolButton, 0.1)

local IsDark = _G.DarkMode
if IsDark then
	MainFrame.BackgroundColor3 = Color3.new(0,0,0)
	TopBar.BackgroundColor3 = Color3.new(0,0,0)
	BarBottom.BackgroundColor3 = Color3.new(0,0,0)
	BarLineM.BackgroundColor3 = Color3.fromRGB(56,56,56)
	SpeedButton.BackgroundColor3 = Color3.fromRGB(11,11,11)
	SpeedButton.TextColor3 = Color3.new(1,1,1)
	SpeedButton.TextStrokeTransparency = 1
	InstantPickButton.BackgroundColor3 = Color3.fromRGB(11,11,11)
	InstantPickButton.TextColor3 = Color3.new(1,1,1)
	InstantPickButton.TextStrokeTransparency = 1
	BuyWoolButton.BackgroundColor3 = Color3.fromRGB(11,11,11)
	BuyWoolButton.TextColor3 = Color3.new(1,1,1)
	BuyWoolButton.TextStrokeTransparency = 1
	Credits.TextStrokeColor3 = Color3.new(0,0,0)
	KeybindNote.TextStrokeColor3 = Color3.new(0,0,0)

	local Rumia = CreateObject("ImageLabel",{Parent=MainFrame,Position=UDim2.new(0,0,0,0),Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://6547394128",ImageTransparency=0.95,ScaleType=Enum.ScaleType.Crop})
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


Player.CharacterAdded:Connect(function()
	Character = Player.Character
	Character.Humanoid.Died:Connect(function()
		Character = nil
	end)
end)

Character.Humanoid.Died:Connect(function()
	Character = nil
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
