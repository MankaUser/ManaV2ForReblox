repeat task.wait() until game:IsLoaded()

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/MankaUser/ManaV2ForReblox/main/UILibrary.lua"))()

local entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua", true))()


local whiteliststhing = {}

pcall(function()
    whitelist = loadstring(game:HttpGet("https://raw.githubusercontent.com/MankaUser/ManaV2ForReblox/main/whitelist.lua"))()
end)
do
    local oldcharacteradded = entity.characterAdded
    entity.characterAdded = function(plr, char, localcheck)
        return oldcharacteradded(plr, char, localcheck, function() end)
    end
    entity.fullEntityRefresh()
end

local spawn = function(func) 
    return coroutine.wrap(func)()
end

local getasset = getsynasset or getcustomasset

local ScreenGuitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if ScreenGuitwo:FindFirstChild("Background") then ScreenGuitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = ScreenGuitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

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

repeat task.wait() until (entity.isAlive)

local lplr = game:GetService("Players").LocalPlayer
local char = lplr.Character
local hrp = char.HumanoidRootPart
local hmd = char.Humanoid
local cam = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
local RemoteFolder = game.ReplicatedStorage:WaitForChild("rbxts_include")["node_modules"]["@rbxts"]["net"]["out"]["_NetManaged"]

local SwordCont = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.combat.sword["sword-controller"]).SwordController
local sprintthingy = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.sprint["sprint-controller"]).SprintController
local kbtable = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
local InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil
local itemtablefunc = require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta
local ClientHandler = Client
local itemtable = debug.getupvalue(itemtablefunc, 1)
local matchend = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.game.match["match-end-controller"]).MatchEndController
local matchstate = require(game:GetService("ReplicatedStorage").TS.match["match-state"]).MatchState
local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
local ballooncontroller = KnitClient.Controllers.BalloonController
local queuemeta = require(game:GetService("ReplicatedStorage").TS.game["queue-meta"]).QueueMeta
local clntstorehandlr = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
local matchState = clntstorehandlr:getState().Game.matchState
local itemmeta = require(game:GetService("ReplicatedStorage").TS.item["item-meta"])
local itemstuff = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local uis = game:GetService("UserInputService")

local realchar
local clone
local function clonemake()
    realchar = lplr.Character
    realchar.Archivable = true
    clone = realchar:Clone()
    clone.Parent = workspace
    lplr.Character = clone
end

local clonetwo
local function secondclonemake()
    clonetwo = realchar:Clone()
    clonetwo.Parent = workspace
end

spawn(function()
    while wait(1) do
        matchState = clntstorehandlr:getState().Game.matchState
    end
end)

local function getremote(tab)
    for i,v in pairs(tab) do
        if v == "Client" then
            return tab[i + 1]
        end
    end
    return ""
end

function hash(p1)
    local hashmod = require(game:GetService("ReplicatedStorage").TS["remote-hash"]["remote-hash-util"])
    local toret = hashmod.RemoteHashUtil:prepareHashVector3(p1)
    return toret
end

local attackentitycont = Client:Get(getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])))  

function getinv(plr)
    local plr = plr or lplr
    local thingy, thingytwo = pcall(function() return InventoryUtil.getInventory(plr) end)
    return (thingy and thingytwo or {
        items = {},
        armor = {},
        hand = nil
    })
end

function getsword()
    local sd
    local higherdamage
    local swordslots
    local swords = getinv().items
    for i, v in pairs(swords) do
        if v.itemType:lower():find("sword") or v.itemType:lower():find("blade") then
            if higherdamage == nil or itemstuff[v.itemType].sword.damage > higherdamage then
                sd = v
                higherdamage = itemstuff[v.itemType].sword.damage
                swordslots = i
            end
        end
    end
    return sd, swordslots
end

local function hvFunc(cock)
    return {hashedval = cock}
end

local killauraissoundenabled = {["Value"] = false}
local killaurasoundvalue = {["Value"] = 1}
local killauraisswingenabled = {["Value"] = false}
local DistVal = {["Value"] = 18}
local killaurafirstpersonanim = {["Value"] = true}
local killauraanimval = {["Value"] = "Cool"}

local function playsound(id, volume) 
    local sound = Instance.new("Sound")
    sound.Parent = workspace
    sound.SoundId = id
    sound.PlayOnRemove = true 
    if volume then 
        sound.Volume = volume
    end
    sound:Destroy()
end

local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local function playanimation(id) 
    if isAlive() then 
        local animation = Instance.new("Animation")
        animation.AnimationId = id
        local animatior = lplr.Character.Humanoid.Animator
        animatior:LoadAnimation(animation):Play()
    end
end

local funnyanim = {
    {CFrame = CFrame.new(0.5, -0.01, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56)), Time = 0.10},
    {CFrame = CFrame.new(0.5, -0.51, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56)), Time = 0.08},
    {CFrame = CFrame.new(0.5, -0.01, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56)), Time = 0.08}
}

local autoblockanim = {
    {CFrame = CFrame.new(-0.01, -0.01, -1.01) * CFrame.Angles(math.rad(-90), math.rad(90), math.rad(0)), Time = 0.08},
    {CFrame = CFrame.new(-0.01, -0.01, -1.01) * CFrame.Angles(math.rad(10), math.rad(70), math.rad(-90)), Time = 0.08},
}

local theotherfunnyanim = {
    {CFrame = CFrame.new(-1.8, 0.5, -1.01) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-90)), Time = 0.05},
    {CFrame = CFrame.new(-1.8, -0.21, -1.01) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-90)), Time = 0.05}
}

local kmsanim = {
    {CFrame = CFrame.new(-2.5, -4.5, -0.02) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-0)), Time = 0.1},
    {CFrame = CFrame.new(-2.5, -1, -0.02) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-0)), Time = 0.05}
}

local rgfejd = false

-- targetcheck, isplayertargetable, getallnearesthumanoidtoposition are from vape, i used those for the kill aura anims

local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isPlayerTargetable(plr, target)
    return plr ~= lplr and plr and isAlive(plr) and targetCheck(plr, target)
end

local function GetAllNearestHumanoidToPosition(distance, amount)
    local returnedplayer = {}
    local currentamount = 0
    if entity.isAlive then -- alive check
        for i, v in pairs(game.Players:GetChildren()) do -- loop through players
            if isPlayerTargetable((v), true, true, v.Character ~= nil) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then -- checks
                local mag = (lplr.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
                if mag <= distance then -- mag check
                    table.insert(returnedplayer, v)
                    currentamount = currentamount + 1
                end
            end
        end
        for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
            if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2.Name ~= "Duck" then -- no duck
                local mag = (lplr.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).magnitude
                if mag <= distance then -- magcheck
                    table.insert(returnedplayer, {Name = (v2 and v2.Name or "Monster"), UserId = 1443379645, Character = v2}) -- monsters are npcs so I have to create a fake player for target info
                    currentamount = currentamount + 1
                end
            end
        end
    end
    return returnedplayer -- table of attackable entities
end

local germanthingy = false
function funianimthing()
    
end

local isclone = false

local function getItem(itemName)
	for i5, v5 in pairs(getinv(lplr)["items"]) do
		if v5["itemType"] == itemName then
			return v5, i5
		end
	end
	return nil
end

local function getwool()
	for i5, v5 in pairs(getinv(lplr)["items"]) do
		if v5["itemType"]:match("wool") or v5["itemType"]:match("grass") then
			return v5["itemType"], v5["amount"]
		end
	end	
	return nil
end

local Flamework = require(game.ReplicatedStorage["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
repeat task.wait() until (Flamework.isInitialized)

local BlockController2 = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]).BlockPlacer
local blockcontroller = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine
local BlockEngine = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine
local blocktable = BlockController2.new(BlockEngine, getwool())
function placeblockthing(newpos, customblock)
    local placeblocktype = (customblock or getwool())
    blocktable.blockType = placeblocktype
    if blockcontroller:isAllowedPlacement(lplr, placeblocktype, Vector3.new(newpos.X / 3, newpos.Y / 3, newpos.Z / 3)) and getItem(placeblocktype) then
        return blocktable:placeBlock(Vector3.new(newpos.X / 3, newpos.Y / 3, newpos.Z / 3))
    end
end

lib:CreateWindow()

local Tabs = {
    ["Combat"] = lib:CreateTab("Combat",Color3.fromRGB(252, 60, 68)),
    ["Blatant"] = lib:CreateTab("Blatant",Color3.fromRGB(255, 148, 36)),
    ["Render"] = lib:CreateTab("Render",Color3.fromRGB(59, 170, 222)),
    ["Utility"] = lib:CreateTab("Utility",Color3.fromRGB(83, 214, 110)),
    ["Mana"] = lib:CreateTab("Broken / laggy features",Color3.fromRGB(64,124,252)),
    ["World"] = lib:CreateTab("World",Color3.fromRGB(52,28,228)),
    ["Legit"] = lib:CreateTab("LegitModules",Color3.fromRGB(196, 201, 95)) 
    }

-- COMBAT

do
    local oldbs
    local conectionkillaura
    local animspeed = {["Value"] = 0.3}
    local origC0 = game.ReplicatedStorage.Assets.Viewmodel.RightHand.RightWrist.C0
    local katog = Tabs["Mana"]:CreateToggle({
        ["Name"] = "KillAura",
        ["Keybind"] = nil,
        ["Callback"] = function(v)
            local kauraval = v
            repeat task.wait() until (matchState == 1)
            spawn(function()
                if (kauraval) then
                    repeat
                        task.wait()
                        if (not kauraval) then break end
                        if entity.isAlive then
                            pcall(function()
                                    for i,v in pairs(game.Players:GetChildren()) do
					if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
					    local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					    if mag <= DistVal["Value"] and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") then
						if v.Character.Humanoid.Health > 0 then
						    for k, b in pairs(whiteliststhing) do
							if v.UserId ~= tonumber(b) then
							    rgfejd = true
							    local GBW = getsword()
							    local selfPosition = lplr.Character.HumanoidRootPart.Position + (DistVal["Value"] > 14 and (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude > 14 and (CFrame.lookAt(lplr.Character.HumanoidRootPart.Position, v.Character.HumanoidRootPart.Position).lookVector * 4) or Vector3.new(0, 0, 0))
							    local Entity = v.Character
							    local target = v.Character:GetPrimaryPartCFrame().Position
							    attackentitycont:CallServer({
								["chargedAttack"] = {["chargeRatio"] = 1},
								["weapon"] = GBW ~= nil and GBW.tool,
								["entityInstance"] = Entity,
								["validate"] = {["targetPosition"] = {["value"] = target,
								    ["hash"] = hvFunc(target)},
								    ["raycast"] = {
									["cameraPosition"] = hvFunc(cam.CFrame.Position), 
									["cursorDirection"] = hvFunc(Ray.new(cam.CFrame.Position, v.Character:GetPrimaryPartCFrame().Position).Unit.Direction)
								    },
								    ["selfPosition"] = {["value"] = selfPosition,
									["hash"] = hvFunc(selfPosition)
								    }
								}
							    })
							    if killauraissoundenabled["Value"] then
								playsound("rbxassetid://6760544639", killaurasoundvalue["Value"])
							    end
							    if killauraisswingenabled["Value"] then         
								playanimation("rbxassetid://4947108314")
							    end
							    task.wait(3.4)
							end
						    end
						end
					    else
						rgfejd = false
					    end
					end
				    end 
                            end)
                        end
                    until (not kauraval)
                else
                    return
                end
            end)
            spawn(function()
                repeat
                    if (not kauraval) then return end
                    task.wait(animspeed["Value"])
                    local plrthinglopl = GetAllNearestHumanoidToPosition(DistVal["Value"], 1)
                    if plrthinglopl then
                        for i,v in pairs(plrthinglopl) do
                            if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
                                if v.Team ~= tostring(lplr.Team) then
                                    if killaurafirstpersonanim["Value"] then
                                        pcall(function()
                                            if killauraanimval["Value"] == "Cool" then
                                                if entity.isAlive and cam.Viewmodel.RightHand.RightWrist and origC0 then
                                                    for i, v in pairs(autoblockanim) do
                                                        coolanimlol = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(v.Time), {C0 = origC0 * v.CFrame})
                                                        coolanimlol:Play()
                                                        task.wait(v.Time - 0.01)
                                                    end
                                                end
                                            elseif killauraanimval["Value"] == "German" then
                                                if entity.isAlive and cam.Viewmodel.RightHand.RightWrist and origC0 then
                                                    for i, v in pairs(funnyanim) do
                                                        killauracurrentanim = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(v.Time), {C0 = origC0 * v.CFrame})
                                                        killauracurrentanim:Play()
                                                        task.wait(v.Time - 0.01)
                                                    end
                                                end
                                            elseif killauraanimval["Value"] == "Penis" then
                                                if entity.isAlive and cam.Viewmodel.RightHand.RightWrist and origC0 then
                                                    for i, v in pairs(theotherfunnyanim) do
                                                        killauracurrentanim = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(v.Time), {C0 = origC0 * v.CFrame})
                                                        killauracurrentanim:Play()
                                                        task.wait(v.Time - 0.01)
                                                    end
                                                end
                                            elseif killauraanimval["Value"] == "KillMyself" then
                                                if entity.isAlive and cam.Viewmodel.RightHand.RightWrist and origC0 then
                                                    for i, v in pairs(kmsanim) do
                                                        killauracurrentanim = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(v.Time), {C0 = origC0 * v.CFrame})
                                                        killauracurrentanim:Play()
                                                        task.wait(v.Time - 0.01)
                                                    end
                                                end
                                            end    
                                        end)
                                    end
                                end
                            end
                        end
                        if killauraanimval["Value"] == "Cool" then
                            if (not rgfejd) then
                                newthingy = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(0.1), {C0 = origC0})
                                newthingy:Play()
                            end
                        end
                        if killauraanimval["Value"] == "KillMyself" then
                            if (not rgfejd) then
                                sdfsdf = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(0.1), {C0 = origC0 * CFrame.new(-2.5, -4.5, -0.02) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-0))})
                                sdfsdf:Play()
                            end
                        end
                    end
                until (not kauraval)
            end)
        end
    })
    killauraissoundenabled = katog:CreateOptionTog({
        ["Name"] = "Swing Sound",
        ["Default"] = true,
        ["Func"] = function() end
    })
    killaurasoundvalue = katog:CreateSlider({
        ["Name"] = "Sound",
        ["Function"] = function() end,
        ["Min"] = 0,
        ["Max"] = 1,
        ["Default"] = 0.2,
        ["Round"] = 1
    })
    killauraisswingenabled = katog:CreateOptionTog({
        ["Name"] = "Swing Animation",
        ["Default"] = true,
        ["Func"] = function() end
    })
    DistVal = katog:CreateSlider({
        ["Name"] = "Distance",
        ["Function"] = function() end,
        ["Min"] = 1,
        ["Max"] = 20,
        ["Default"] = 20,
        ["Round"] = 1
    })
    killaurafirstpersonanim = katog:CreateOptionTog({
        ["Name"] = "Anims (1rs person)",
        ["Default"] = true,
        ["Func"] = function() end
    })
    killauraanimval = katog:CreateDropDown({
        ["Name"] = "AnimMode",
        ["Function"] = function(val)
            if val == "German" then
                zdsqzd = game:GetService("TweenService"):Create(cam:WaitForChild("Viewmodel").RightHand.RightWrist, TweenInfo.new(0.1), {C0 = origC0 * CFrame.new(0.5, -0.01, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56))})
                zdsqzd:Play()
            elseif val == "Penis" then
                cock = game:GetService("TweenService"):Create(cam:WaitForChild("Viewmodel").RightHand.RightWrist, TweenInfo.new(0.1), {C0 = origC0 * CFrame.new(-1.8, 0.5, -1.01) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-90))})
                cock:Play()
            elseif val == "KillMyself" then
                sdfsdf = game:GetService("TweenService"):Create(cam:WaitForChild("Viewmodel").RightHand.RightWrist, TweenInfo.new(0.1), {C0 = origC0 * CFrame.new(-2.5, -4.5, -0.02) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-0))})
                sdfsdf:Play()
            end
        end,
        ["List"] = {"Cool", "German", "Penis", "KillMyself"},
        ["Default"] = "Cool"
    })
    animspeed = katog:CreateSlider({
        ["Name"] = "AnimationSpeed",
        ["Function"] = function() end,
        ["Min"] = 0.1,
        ["Max"] = 0.5,
        ["Default"] = 0.3,
        ["Round"] = 1
    })
end


do
    local velohorizontal = {["Value"] = 0}
    local velovertical = {["Value"] = 0}
    local velocitytog = Tabs["Combat"]:CreateToggle({
        ["Name"] = "Velocity",
        ["Keybind"] = nil,
        ["Callback"] = function(v)
            getgenv().veloval = v
            spawn(function()
                if getgenv().veloval then
                    if not hmd then return end
                    if hmd then
                        kbtable["kbDirectionStrength"] = 0
                        kbtable["kbUpwardStrength"] = 0
                    end
                else
                    kbtable["kbDirectionStrength"] = 100
                    kbtable["kbUpwardStrength"] = 100
                    return
                end
            end)
        end
    })
    velohorizontal = velocitytog:CreateSlider({
        ["Name"] = "Horizontal",
        ["Function"] = function() 
            if hmd then
                kbtable["kbDirectionStrength"] = velohorizontal["Value"]
            end
        end,
        ["Min"] = 0,
        ["Max"] = 100,
        ["Default"] = 0,
        ["Round"] = 0
    })
    velovertical = velocitytog:CreateSlider({
        ["Name"] = "Vertical",
        ["Function"] = function() 
            if hmd then
                kbtable["kbUpwardStrength"] = velovertical["Value"]
            end
        end,
        ["Min"] = 0,
        ["Max"] = 100,
        ["Default"] = 0,
        ["Round"] = 0
    })
end

local itemtab = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local CombatConstant = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant

local function getEquipped()
    local typetext = ""
    local obj = (entity.isAlive and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value or nil)
    if obj then
        if obj.Name:find("sword") or obj.Name:find("blade") or obj.Name:find("baguette") or obj.Name:find("scythe") or obj.Name:find("dao") then
            typetext = "sword"
        end
        if obj.Name:find("wool") or itemtab[obj.Name]["block"] then
            typetext = "block"
        end
        if obj.Name:find("bow") then
            typetext = "bow"
        end
    end
    return {["Object"] = obj, ["Type"] = typetext}
end

do
    local ACC1
    local ACC2
    local testtogttt = {["Value"] = 2}
    local autoclickertog = Tabs["Combat"]:CreateToggle({
        ["Name"] = "AutoClicker",
        ["Keybind"] = nil,
        ["Callback"] = function(v)
            if v then
                local holding = false
                ACC1 = uis.InputBegan:connect(function(input, gameProcessed)
                    if gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
                        holding = true
                    end
                end)
                ACC2 = uis.InputEnded:connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        holding = false
                    end
                end)
                spawn(function()
                    repeat
                        task.wait(1/testtogttt["Value"])
                        if holding then
                            if holding == false then return end
                            if getEquipped()["Type"] == "sword" then 
                                if holding == false then return end
                                SwordCont:swingSwordAtMouse()
                            end
                        end
                    until (not v)
                end)
            else
                ACC1:Disconnect()
                ACC2:Disconnect()
                return
            end
        end
    })
    testtogttt = autoclickertog:CreateSlider({
        ["Name"] = "CPS",
        ["Function"] = function() end,
        ["Min"] = 1,
        ["Max"] = 20,
        ["Default"] = 20,
        ["Round"] = 0
    })
end

Tabs["Combat"]:CreateToggle({
    ["Name"] = "NoClickDelay",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        getgenv().funisus = v
        spawn(function()
            if getgenv().funisus and entity.isAlive then
                for i2,v2 in pairs(itemtable) do
                    if type(v2) == "table" and rawget(v2, "sword") then
                        v2.sword.attackSpeed = 0.000000001
                    end
                    SwordCont.isClickingTooFast = function() return false end
                end
            else
            end
        end)
    end
})

do
    local reachvalue = {["Value"] = 18}
    local reachtog = Tabs["Combat"]:CreateToggle({
        ["Name"] = "Reach",
        ["Keybind"] = nil,
        ["Callback"] = function(v)
            getgenv().reachval = v
            if getgenv().reachval then
                CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = reachvalue["Value"]
            else
                CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = 14.4
            end
        end
    })
    reachvalue = reachtog:CreateSlider({
        ["Name"] = "Reach",
        ["Function"] = function() 
            CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = reachvalue["Value"]
        end,
        ["Min"] = 1,
        ["Max"] = 18,
        ["Default"] = 18,
        ["Round"] = 1
    })
end

-- MOVEMENT

function tpreal(t)
    for i,v in pairs(realchar:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
            v.Transparency = t
        elseif v:IsA("Decal") then
            v.Transparency = t
        end
    end
end

local sprint = false
Tabs["Combat"]:CreateToggle({
    ["Name"] = "Sprint",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        sprint = v
        if sprint then
            spawn(function()
                repeat
                    wait()
                    if (not sprint) then return end
                    if sprintthingy.sprinting == false then
                        sprintthingy:startSprinting()
                    end
                until (not sprint)
            end)
        else
            sprintthingy:stopSprinting()
        end
    end
})

do
    local highjump
    local highjumpforce = {["Value"] = 20}
    highjump = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "HighJump",
        ["Keybind"] = nil,
        ["Callback"] = function(v)
            local highjumpval = v
            if highjumpval then
                lplr.Character.Humanoid:ChangeState("Jumping")
                task.wait()
                workspace.Gravity = 5
                spawn(function()
                    for i = 1, highjumpforce["Value"] do
                        wait()
                        if (not highjumpval) then return end
                        lplr.Character.Humanoid:ChangeState("Jumping")
                    end
                end)
                spawn(function()
                    for i = 1, highjumpforce["Value"] / 28 do
                        task.wait(0.1)
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                        task.wait(0.1)
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end)
                highjump:silentToggle()
            else
                workspace.Gravity = 196.19999694824
                return
            end
        end
    })
    highjumpforce = highjump:CreateSlider({
        ["Name"] = "Force",
        ["Function"] = function() end,
        ["Min"] = 0,
        ["Max"] = 50,
        ["Default"] = 25,
        ["Round"] = 0
    })
end
--[[
do
    local longjumpval = false
    local gravityval = {["Value"] = 0}
    local longjumpdelay = {["Value"] = 0.1}
    local LJSpeed = {["Value"] = 100}
    local oldthing
    local lognjump = Tabs["Blatant"]:CreateToggle({
        ["Name"] = "LongJump",
        ["Keybind"] = nil,
        ["Callback"] = function(v)
            longjumpval = v
            if longjumpval then
                oldthing = oldthing or speedvalue["Value"]
                workspace.Gravity = gravityval["Value"]
                repeat
                    if (not longjumpval) then break end
                    speedvalue["Value"] = LJSpeed["Value"]
                    task.wait(longjumpdelay["Value"])
                    speedvalue["Value"] = oldthing
                    task.wait(0.12)
                until (not longjumpval)
            else
                workspace.Gravity = 196.19999694824
                speedvalue["Value"] = oldthing
                return
            end
        end
    })
    gravityval = lognjump:CreateSlider({
        ["Name"] = "Gravity",
        ["Function"] = function() end,
        ["Min"] = 0,
        ["Max"] = 10,
        ["Default"] = 0,
        ["Round"] = 0
    })
    longjumpdelay = lognjump:CreateSlider({
        ["Name"] = "Delay",
        ["Function"] = function() end,
        ["Min"] = 0,
        ["Max"] = 1,
        ["Default"] = 0.1,
        ["Round"] = 1
    })
    LJSpeed = lognjump:CreateSlider({
        ["Name"] = "Speed",
        ["Function"] = function() end,
        ["Min"] = 45,
        ["Max"] = 120,
        ["Default"] = 70,
        ["Round"] = 0
    })
end
--]]

    local customlongjumpval = false
    Tabs["Blatant"]:CreateToggle({
        ["Name"] = "LongJump",
        ["Keybind"] = nil,
        ["Callback"] = function(v)
            customlongjumpval = v
            if customlongjumpval then
                spawn(function()
                    repeat
                        if (not customlongjumpval) then return end
                        task.wait()
                        if lplr.Character.Humanoid.Jump == true then
                            if (not customlongjumpval) then return end
                            lplr.Character.Humanoid.WalkSpeed = 15
                            Workspace.Gravity = 23
                            lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,-0.2,-2.1) 
                            wait(0.1)
                            lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,-0.5,-2.1) 
                            wait(0.1)
                            lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0.2 ,0) 
                            wait(0.1)
                        end
                    until (not customlongjumpval)                
                end)
                spawn(function()
                    repeat
                        if (not customlongjumpval) then return end
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                        wait()
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
                        wait()
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                        wait()
                    until (not customlongjumpval)
                end)
            else
                workspace.Gravity = 196.19999694824
                return
            end
        end
    })



    local cloneval = false
    local funiclonegodmodedisab
    funiclonegodmodedisab = Tabs["Utility"]:CreateToggle({
        ["Name"] = "CloneGodmodeFullDisabler",
        ["Keybind"] = nil,
        ["Callback"] = function(v)
            cloneval = v
            if cloneval then
                spawn(function()
                    isclone = true
                    clonemake()
                    speedd = 200
                    connectionnnn = game:GetService("RunService").Heartbeat:connect(function()
                        local velo = clone.Humanoid.MoveDirection * speedd
                        clone.HumanoidRootPart.Velocity = Vector3.new(velo.x, lplr.Character.HumanoidRootPart.Velocity.y, velo.z)
                    end)
                end)
                repeat task.wait() until (matchState == 2)
                funiclonegodmodedisab:Toggle()
            else
                clone:remove()
                lplr.Character = realchar
                realchar.Humanoid:ChangeState("Dead")
                isclone = false
                connectionnnn:Disconnect()
                return
            end
        end
    })



    



    local flyenabled
    Tabs["Blatant"]:CreateToggle({
        ["Name"] = "Fly",
        ["Keybind"] = nil,
        ["Callback"] = function(v)
            flyenabled = v
            if flyenabled then
                spawn(function()
                    repeat
                        task.wait()
                        if clone then
                            task.wait()
                            workspace.Gravity = 1
                            local SpaceHeld = uis:IsKeyDown(Enum.KeyCode.Space)
                            local ShiftHeld = uis:IsKeyDown(Enum.KeyCode.LeftShift)
                            if SpaceHeld then
                                clone.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
                                task.wait()
                            end
                            if ShiftHeld then
                                clone.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame * CFrame.new(0, -15, 0)
                                task.wait()
                            end
                        else
                            task.wait()
                            workspace.Gravity = 1
                            local SpaceHeld = uis:IsKeyDown(Enum.KeyCode.Space)
                            local ShiftHeld = uis:IsKeyDown(Enum.KeyCode.LeftShift)
                            if SpaceHeld then
                                hrp.CFrame = hrp.CFrame * CFrame.new(0, 15, 0)
                                task.wait()
                            end
                            if ShiftHeld then
                                hrp.CFrame = hrp.CFrame * CFrame.new(0, -15, 0)
                                task.wait()
                            end
                        end
                    until (not flyenabled)
                end)
            else
                conectthingylol:Disconnect()
            end
        end
    })



local colorbox
local function makeRainbowText(text)
    spawn(function()
        colorbox = Color3.fromRGB(170,0,170)
        local x = 0
        while wait() do
            colorbox = Color3.fromHSV(x,1,1)
            x = x + 4.5/255
            if x >= 1 then
                x = 0
            end
        end
    end)
    spawn(function()
        repeat
            wait()
            text.TextColor3 = colorbox
        until true == false
    end)
end

local function makeRainbowFrame(frame)
    spawn(function()
        repeat
            wait()
            frame.BackgroundColor3 = colorbox
        until true == false
    end)
end

local ESPFolder
Tabs["Render"]:CreateToggle({
    ["Name"] = "ESP",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        local thing
        local espval = v
        if espval then
            spawn(function()
                ESPFolder = Instance.new("Folder")
                ESPFolder.Name = "ESPFolder"
                ESPFolder.Parent = ScreenGuitwo
                repeat
                    task.wait()
                    if (not espval) then break end
                    for i,plr in pairs(game.Players:GetChildren()) do
                        if ESPFolder:FindFirstChild(plr.Name) then
                            thing = ESPFolder[plr.Name]
                            thing.Visible = false
                        else
                            thing = Instance.new("ImageLabel")
                            thing.BackgroundTransparency = 1
                            thing.BorderSizePixel = 0
                            thing.Image = getcustomassetthingylol("rektsky/assets/esppic.png")
                            thing.Visible = false
                            thing.Name = plr.Name
                            thing.Parent = ESPFolder
                            thing.Size = UDim2.new(0, 256, 0, 256)
                        end
                        
                        if isAlive(plr) and plr ~= lplr and plr.Team ~= tostring(lplr.Team) then
                            local rootPos, rootVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                            local rootSize = (plr.Character.HumanoidRootPart.Size.X * 1200) * (cam.ViewportSize.X / 1920)
                            local headPos, headVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position + Vector3.new(0, 1 + (plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and 2 or plr.Character.Humanoid.HipHeight), 0))
                            local legPos, legVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position - Vector3.new(0, 1 + (plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and 2 or plr.Character.Humanoid.HipHeight), 0))
                            rootPos = rootPos
                            if rootVis then
                                thing.Visible = rootVis
                                thing.Size = UDim2.new(0, rootSize / rootPos.Z, 0, headPos.Y - legPos.Y)
                                thing.Position = UDim2.new(0, rootPos.X - thing.Size.X.Offset / 2, 0, (rootPos.Y - thing.Size.Y.Offset / 2) - 36)
                            end
                        end
                    end
                until (not espval)
            end)
            game.Players.PlayerRemoving:connect(function(plr)
                if ESPFolder:FindFirstChild(plr.Name) then
                    ESPFolder[plr.Name]:Remove()
                end
            end)
        else
            ESPFolder:remove()
            return
        end
    end
})


local ScreenGuie
Tabs["Legit"]:CreateToggle({
    ["Name"] = "KeyStrokes",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        local keystrokesval = v
        if keystrokesval then
		guiScreen = Instance.new("ScreenGui")
		guiScreen.Parent = game.Players.LocalPlayer.PlayerGui
		keystrokesframe = Instance.new("Frame")
		keystrokesframe.Size = UDim2.new(0, 110,0, 106)
		keystrokesframe.BackgroundTransparency = 1
		keystrokesframe.Parent = guiScreen
		keystrokesframe.Active = true
		keystrokesframe.Draggable = true
		local TextLabel = Instance.new("TextLabel")
		local UICorner = Instance.new("UICorner")
		createKeystroke(Enum.KeyCode.W, UDim2.new(0, 38, 0, 0), UDim2.new(0, 6, 0, 5))
		createKeystroke(Enum.KeyCode.S, UDim2.new(0, 38, 0, 42), UDim2.new(0, 8, 0, 5))
		createKeystroke(Enum.KeyCode.A, UDim2.new(0, 0, 0, 42), UDim2.new(0, 7, 0, 5))
		createKeystroke(Enum.KeyCode.D, UDim2.new(0, 76, 0, 42), UDim2.new(0, 8, 0, 5))
		createKeystroke(Enum.KeyCode.Space, UDim2.new(0, 0, 0, 83), UDim2.new(0, 25, 0, -10))
		
		TextLabel.Parent = keystrokesframe
		TextLabel.BackgroundColor3 = Color3.fromRGB(90, 255, 109)
		TextLabel.BackgroundTransparency = 0.500
		TextLabel.Size = UDim2.new(0, 34, 0, 36)
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.Text = ""
		TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.TextSize = 14.000
		
		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = TextLabel

        else
            guiScreen.Enabled = false
        end
    end
})

local chinahattrail
local chinahatenabled = false
Tabs["Render"]:CreateToggle({
    ["Name"] = "ChinaHat",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        chinahatenabled = v
        if chinahatenabled then
			spawn(function()
                repeat
                    task.wait(0.3)
                    if (not chinahatenabled) then return end
                    if entity.isAlive then
                        if chinahattrail == nil or chinahattrail.Parent == nil then
                            chinahattrail = Instance.new("Part")
                            chinahattrail.CFrame = lplr.Character.Head.CFrame * CFrame.new(0, 1.1, 0)
                            chinahattrail.Size = Vector3.new(3, 0.7, 3)
                            chinahattrail.Name = "ChinaHat"
                            chinahattrail.Material = Enum.Material.Neon
                            chinahattrail.CanCollide = false
                            chinahattrail.Transparency = 0.3
                            local chinahatmesh = Instance.new("SpecialMesh")
                            chinahatmesh.Parent = chinahattrail
                            chinahatmesh.MeshType = "FileMesh"
                            chinahatmesh.MeshId = "http://www.roblox.com/asset/?id=1778999"
                            chinahatmesh.Scale = Vector3.new(3, 0.6, 3)
                            local chinahatweld = Instance.new("WeldConstraint")
                            chinahatweld.Name = "WeldConstraint"
                            chinahatweld.Parent = chinahattrail
                            chinahatweld.Part0 = lplr.Character.Head
                            chinahatweld.Part1 = chinahattrail
                            chinahattrail.Parent = workspace.Camera
                        else
                            chinahattrail.Parent = workspace.Camera
                            chinahattrail.CFrame = lplr.Character.Head.CFrame * CFrame.new(0, 1.1, 0)
                            chinahattrail.LocalTransparencyModifier = ((cam.CFrame.Position - cam.Focus.Position).Magnitude <= 0.6 and 1 or 0)
                            if chinahattrail:FindFirstChild("WeldConstraint") then
                                chinahattrail.WeldConstraint.Part0 = lplr.Character.Head
                            end
                        end
                    else
                        if chinahattrail then 
                            chinahattrail:remove()
                            chinahattrail = nil
                        end
                    end
                until (not chinahatenabled)
            end)
        else
            if chinahattrail then
                chinahattrail:Remove()
                chinahattrail = nil
            end
        end
    end
})

-- EXPLOITS

function yesoksussybed()
    if lplr.leaderstats.Bed.Value ~= "✅" then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Who ever broke my bed, i have your location", 'All')
    end
end



local shopthingyshopshop = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2)
local oldnexttier
local oldtiered
local bypassstpidshoptiers = false
Tabs["Mana"]:CreateToggle({
    ["Name"] = "BypassShopTiers",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if (bypassstpidshoptiers) then
            for i,v in pairs(shopthingyshopshop) do
                oldtiered = oldtiered or v.tiered
                oldnexttier = oldnexttier or v.nextTier
            end
            for i,v in pairs(shopthingyshopshop) do
                v.tiered = nil
                v.nextTier = nil
            end
        else
            for i,v in pairs(shopthingyshopshop) do
                v.tiered = oldtiered
                v.nextTier = oldnexttier
            end
        end
    end
})




function getmapname()
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name == "Map" then
            if v:FindFirstChild("Worlds") then
                for g, c in pairs(v.Worlds:GetChildren()) do
                    if c.Name ~= "Void_World" then
                        return c.Name
                    end
		        end
		    end
		end
	end
end

local lcmapname = getmapname()

Tabs["Blatant"]:CreateToggle({
    ["Name"] = "NoFall",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if entity.isAlive then
            spawn(function()
                repeat
                    if v == false then return end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.GroundHit:FireServer(workspace.Map.Worlds[lcmapname].Blocks,1645488277.345853)
                until v == false
            end)
        end
    end
})

local antivoidpart
Tabs["World"]:CreateToggle({
    ["Name"] = "AntiVoid",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v then
            local antivoidpart = Instance.new("Part", Workspace)
            antivoidpart.Name = "AntiVoid"
            antivoidpart.Size = Vector3.new(2100, 0.5, 2000)
            antivoidpart.Position = Vector3.new(160.5, 25, 247.5)
            antivoidpart.Transparency = 0.4
            antivoidpart.Anchored = true
            antivoidpart.Touched:connect(function(dumbcocks)
                if dumbcocks.Parent:WaitForChild("Humanoid") and dumbcocks.Parent.Name == lplr.Name then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    wait(0.2)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    wait(0.2)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                end
            end)
        else
            game.Workspace.AntiVoid:remove()
        end
    end
})

function stealcheststrollage()
    for i,v in pairs(game.Workspace.Map.Worlds[lcmapname]:GetChildren()) do
        if v.Name == "chest" then
            if v:FindFirstChild("ChestFolderValue") then
                local mag = (hrp.Position - v.Position).Magnitude
                if mag <= 45 then
                    for k,b in pairs(v.ChestFolderValue.Value:GetChildren()) do
                        if b.Name ~= "ChestOwner" then
                            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged["Inventory:ChestGetItem"]:InvokeServer(v.ChestFolderValue.Value,b)
                        end
                    end
                end
            end
        end
    end
end
--[[ 
Tabs["Utility"]:CreateToggle({
    ["Name"] = "ChestStealer",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if entity.isAlive then
            repeat
                stealcheststrollage()
                wait()
            until v == false
        end
    end
})
--]]



--[[
    local hackdetector = false
    Tabs["Rektsky"]:CreateToggle({
        ["Name"] = "HackerDetector",
        ["Keybind"] = nil,
        ["Callback"] = function(v)
            hackdetector = v
            if hackdetector then
                repeat task.wait() until (matchState == 2)
                spawn(function()
                    repeat
                        task.wait()
                        if (not hackdetector) then return end
                        for i, v in pairs(game.Players:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") then
                                local oldpos = v.Character.HumanoidRootPart.Position
                                task.wait(0.5)
                                local newpos = Vector3.new(v.Character.HumanoidRootPart.Position.X, 0, v.Character.HumanoidRootPart.Position.Z)
                                local realnewpos = math.floor((newpos - Vector3.new(oldpos.X, 0, oldpos.Z)).magnitude) * 2
                                if realnewpos > 32 then
                                    game:GetService("StarterGui"):SetCore("SendNotification", {
                                        Title = v.Name.." is cheating",
                                        Text = tostring(math.floor((newpos - Vector3.new(oldpos.X, 0, oldpos.Z)).magnitude)),
                                        Duration = 5,
                                    })
                                end
                            end
                        end
                    until (not hackdetector)
                end)
            end
        end
    })
]]

--[[
    do
        local rainbowenab = {["Value"] = false}
        local rainbowspeed = {["Value"] = 4.5}
        local clcickgui = Tabs["Rektsky"]:CreateToggle({
            ["Name"] = "ClickGui",
            ["Keybind"] = nil,
            ["Callback"] = function(v) end
        })
        clcickgui:CreateOptionTog({
            ["Name"] = "Rainbow",
            ["Func"] = function(val) 
                lib["Rainbow"] = val 
            end
        })
        clcickgui:CreateSlider({
            ["Name"] = "RainbowSpeed",
            ["Function"] = function() end,
            ["Min"] = 1,
            ["Max"] = 20,
            ["Default"] = 4.5,
            ["Round"] = 1
        })
    end
]]

--[[
Tabs["Rektsky"]:CreateToggle({
    ["Name"] = "FunnyArrayListTroll",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        amongus = v
        if amongus then
            local ScreenGuuii = Instance.new("ScreenGui")
            local uilistlayourthing = Instance.new("UIListLayout")
            local b = Instance.new("TextLabel")
            local c = Instance.new("TextLabel")
            local e = Instance.new("TextLabel")
            local f = Instance.new("TextLabel")
            local a = Instance.new("TextLabel")
            local d = Instance.new("TextLabel")
            ScreenGuuii.Parent = game.CoreGui
            uilistlayourthing.Parent = ScreenGuuii
            uilistlayourthing.HorizontalAlignment = Enum.HorizontalAlignment.Right
            uilistlayourthing.Padding = UDim.new(0, 9)
            b.Name = "b"
            b.Parent = ScreenGuuii
            b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            b.BackgroundTransparency = 1.000
            b.Position = UDim2.new(0.985937476, 0, 0.0282208584, 0)
            b.Size = UDim2.new(0, 27, 0, 14)
            b.Font = Enum.Font.SourceSansLight
            b.Text = "FatherDisabler"
            b.TextColor3 = Color3.fromRGB(255, 255, 255)
            b.TextSize = 28.000
            c.Name = "c"
            c.Parent = ScreenGui
            c.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            c.BackgroundTransparency = 1.000
            c.Position = UDim2.new(0.985937476, 0, 0.0282208584, 0)
            c.Size = UDim2.new(0, 27, 0, 14)
            c.Font = Enum.Font.SourceSansLight
            c.Text = "CockDisabler"
            c.TextColor3 = Color3.fromRGB(255, 255, 255)
            c.TextSize = 28.000
            e.Name = "e"
            e.Parent = ScreenGui
            e.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            e.BackgroundTransparency = 1.000
            e.Position = UDim2.new(0.985937476, 0, 0.0282208584, 0)
            e.Size = UDim2.new(0, 27, 0, 14)
            e.Font = Enum.Font.SourceSansLight
            e.Text = "NiggaKiller"
            e.TextColor3 = Color3.fromRGB(255, 255, 255)
            e.TextSize = 28.000
            f.Name = "f"
            f.Parent = ScreenGui
            f.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            f.BackgroundTransparency = 1.000
            f.Position = UDim2.new(0.985937476, 0, 0.0282208584, 0)
            f.Size = UDim2.new(0, 27, 0, 14)
            f.Font = Enum.Font.SourceSansLight
            f.Text = "ChildESP"
            f.TextColor3 = Color3.fromRGB(255, 255, 255)
            f.TextSize = 28.000
            a.Name = "a"
            a.Parent = ScreenGui
            a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            a.BackgroundTransparency = 1.000
            a.Position = UDim2.new(0.985937476, 0, 0.0282208584, 0)
            a.Size = UDim2.new(0, 27, 0, 14)
            a.Font = Enum.Font.SourceSansLight
            a.Text = "NoCumSlowDown"
            a.TextColor3 = Color3.fromRGB(255, 255, 255)
            a.TextSize = 28.000
            d.Name = "d"
            d.Parent = ScreenGui
            d.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            d.BackgroundTransparency = 1.000
            d.Position = UDim2.new(0.985937476, 0, 0.0282208584, 0)
            d.Size = UDim2.new(0, 27, 0, 14)
            d.Font = Enum.Font.SourceSansLight
            d.Text = "AutoGroom"
            d.TextColor3 = Color3.fromRGB(255, 255, 255)
            d.TextSize = 28.000
            makeRainbowText(a, true)
            makeRainbowText(b, true)
            makeRainbowText(c, true)
            makeRainbowText(d, true)
            makeRainbowText(e, true)
            makeRainbowText(f, true)
        else
            ScreenGuuii:Destroy()
        end
    end
})
--]]

-- WORLD

local oldpos = Vector3.new(0, 0, 0)
local function getScaffold(vec, diagonaltoggle)
    local realvec = Vector3.new(math.floor((vec.X / 3) + 0.5) * 3, math.floor((vec.Y / 3) + 0.5) * 3, math.floor((vec.Z / 3) + 0.5) * 3) 
    local newpos = (oldpos - realvec)
    local returedpos = realvec
    if entity.isAlive then
        local angle = math.deg(math.atan2(-lplr.Character.Humanoid.MoveDirection.X, -lplr.Character.Humanoid.MoveDirection.Z))
        local goingdiagonal = (angle >= 130 and angle <= 150) or (angle <= -35 and angle >= -50) or (angle >= 35 and angle <= 50) or (angle <= -130 and angle >= -150)
        if goingdiagonal and ((newpos.X == 0 and newpos.Z ~= 0) or (newpos.X ~= 0 and newpos.Z == 0)) and diagonaltoggle then
            return oldpos
        end
    end
    return realvec
end

local yes
local yestwo
local sussyfunnything
local sussything = false
Tabs["World"]:CreateToggle({
    ["Name"] = "Scaffold",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        sussythingy = v
        if (sussythingy) and entity.isAlive then
            spawn(function()
                yestwo = RunService.Heartbeat:Connect(function(step)
                    if (not sussythingy) then return end
                    local y = lplr.Character.HumanoidRootPart.Position.y
                    local x = lplr.Character.HumanoidRootPart.Position.x
                    local z = lplr.Character.HumanoidRootPart.Position.z
                    local blockpos = getScaffold((lplr.Character.Head.Position) + Vector3.new(1, -math.floor(lplr.Character.Humanoid.HipHeight * 3), 0) + lplr.Character.Humanoid.MoveDirection)
                    placeblockthing(blockpos, getwool())
                end)
            end)
        else
            yestwo:Disconnect()
        end
    end
})

function animfunc(id)
    local Animator = hmd:WaitForChild("Animator")
    local Animation = Instance.new("Animation", char)
    Animation.AnimationId = "rbxassetid://"..id
    Animation.Parent = char

    local PlayAnim = Animator:LoadAnimation(Animation)
    PlayAnim:Play()
end

function getblockfrommap(name)
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v:FindFirstChild(name) then
            return v
        end
    end
end

function getbedsxd()
    local beds = {}
    local blocks = game:GetService("Workspace").Map.Worlds[lcmapname].Blocks
    for _,Block in pairs(blocks:GetChildren()) do
        if Block.Name == "bed" and Block.Covers.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
            table.insert(beds,Block)
        end
    end
    return beds
end

function getbedsblocks()
    local blockstb = {}
    local blocks = game:GetService("Workspace").Map.Worlds[lcmapname].Blocks
    for i,v in pairs(blocks:GetChildren()) do
        if v:IsA("Part") then
            table.insert(blockstb,v)
        end
    end
    return blockstb
end

function blocks(bed)
    local aboveblocks = 0
    local Blocks = getbedsblocks()
    for _,Block in pairs(Blocks) do
        if Block.Position.X == bed.X and Block.Position.Z == bed.Z and Block.Name ~= "bed" and (Block.Position.Y - bed.Y) <= 9 and Block.Position.Y > bed.Y then
            aboveblocks = aboveblocks + 1
        end
    end
    return aboveblocks
end

function nuker()
    local beds = getbedsxd()
    for _,bed in pairs(beds) do
        local bedmagnitude = (bed.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
        if bedmagnitude < 27 then
            local upnum = blocks(bed.Position)
            local x = math.round(bed.Position.X/3)
            local y = math.round(bed.Position.Y/3) + upnum
            local z = math.round(bed.Position.Z/3)
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.DamageBlock:InvokeServer({
                ["blockRef"] = {
                    ["blockPosition"] = Vector3.new(x,y,z)
                },
                ["hitPosition"] = Vector3.new(x,y,z),
                ["hitNormal"] = Vector3.new(x,y,z),
            })
        end
    end
end

local GravityValueBeb = {["Value"] = 18}
local gravBeb = Tabs["World"]:CreateToggle({
    ["Name"] = "Gravity",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v == true then
            workspace.Gravity = GravityValueBeb["Value"]
        else
            workspace.Gravity = 196.19999694824
        end
    end
})
GravityValueBeb = gravBeb:CreateSlider({
        ["Name"] = "Gravity",
        ["Function"] = function()
        workspace.Gravity = GravityValueBeb["Value"]
        end,
        ["Min"] = 1,
        ["Max"] = 1000,
        ["Default"] = 196,
        ["Round"] = 1
    })


Tabs["Utility"]:CreateToggle({
    ["Name"] = "InstantPickup",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v == true then
            wait()
			for i,v in pairs(workspace.ItemDrops:GetChildren()) do
				if Character and Character.Humanoid.Health>0 and (v.Position-Character.HumanoidRootPart.Position).magnitude<=10 then
					local x,y,z = math.ceil(v.Position.X/3),math.ceil(v.Position.Y/3),math.ceil(v.Position.Z/3)
					coroutine.wrap(function()
						RemoteFolder.PickupItemDrop:InvokeServer({itemDrop=v})
					end)()
				end
			end
        else
            
        end
    end
})

TimeOfDay = Tabs["Render"]:CreateToggle({
    ["Name"] = "TimeOfDay",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v == true then
             game.Lighting.TimeOfDay = "00:00:00"
        else
             game.Lighting.TimeOfDay = "13:00:00"
        end
    end
})

time = TimeOfDay:CreateDropDown({
        ["Name"] = "Time",
        ["Function"] = function(val)
            if val == "Night" then
                game.Lighting.TimeOfDay = "00:00:00"
            elseif val == "Day" then
                game.Lighting.TimeOfDay = "13:00:00"
            end
        end,
        ["List"] = {"Day", "Night"},
        ["Default"] = "Day"
    })

if game.Players.LocalPlayer == 8907869 then
a = game:GetService("CoreGui"):FindFirstChild("ScreenGui"):FindFirstChild("PrivateFeatures")
b = game:GetService("CoreGui"):FindFirstChild("ScreenGui"):FindFirstChild("Mana")

if a then
a:Destroy()
end

if b then
b:Destroy()
end
end
