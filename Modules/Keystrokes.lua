local Keystrokes = {}
local keys = {}
local keystrokesframe
local keyconnection1
local keyconnection2
local inputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local function createKeystroke(keybutton, pos, pos2)
	local key = Instance.new("Frame")
	key.Size = keybutton == Enum.KeyCode.Space and UDim2.new(0, 110, 0, 24) or UDim2.new(0, 34, 0, 36)
	key.BackgroundColor3 = Color3.new()
	key.BackgroundTransparency = 0.5
	key.Position = pos
	key.Name = keybutton.Name
	key.Parent = keystrokesframe
	local keytext = Instance.new("TextLabel")
	keytext.BackgroundTransparency = 1
	keytext.Size = UDim2.new(1, 0, 1, 0)
	keytext.Font = Enum.Font.Gotham
	keytext.Text = keybutton == Enum.KeyCode.Space and "______" or keybutton.Name
	keytext.TextXAlignment = Enum.TextXAlignment.Left
	keytext.TextYAlignment = Enum.TextYAlignment.Top
	keytext.Position = pos2
	keytext.TextSize = keybutton == Enum.KeyCode.Space and 18 or 15
	keytext.TextColor3 = Color3.new(1, 1, 1)
	keytext.Parent = key
	local keycorner = Instance.new("UICorner")
	keycorner.CornerRadius = UDim.new(0, 4)
	keycorner.Parent = key
	keys[keybutton] = {Key = key}
end

keyconnection1 = inputService.InputBegan:Connect(function(inputType)
	local key = keys[inputType.KeyCode]
	if key then 
		if key.Tween then key.Tween:Cancel() end
		if key.Tween2 then key.Tween2:Cancel() end
		key.Tween = tweenService:Create(key.Key, TweenInfo.new(0.1), {BackgroundColor3 = Color3.new(0.568627, 0.564706, 0.529412), BackgroundTransparency = 0.2})
		key.Tween:Play()
		key.Tween2 = tweenService:Create(key.Key.TextLabel, TweenInfo.new(0.1), {TextColor3 = Color3.new()})
		key.Tween2:Play()
	end
end)
keyconnection2 = inputService.InputEnded:Connect(function(inputType)
	local key = keys[inputType.KeyCode]
	if key then 
		if key.Tween then key.Tween:Cancel() end
		if key.Tween2 then key.Tween2:Cancel() end
		key.Tween = tweenService:Create(key.Key, TweenInfo.new(0.1), {BackgroundColor3 = Color3.new(), BackgroundTransparency = 0.6})
		key.Tween:Play()
		key.Tween2 = tweenService:Create(key.Key.TextLabel, TweenInfo.new(0.1), {TextColor3 = Color3.new(1, 1, 1)})
		key.Tween2:Play()
	end
end)
