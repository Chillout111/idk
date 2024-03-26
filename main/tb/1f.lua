repeat
    task.wait()
until game:IsLoaded()

if not game.PlaceId == 8737899170 then game.ReplicatedStorage.Network.World1Teleport:InvokeServer() end

loadstring(game:HttpGet('https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/Misc/antistaff.lua'))()

local player = game.Players.LocalPlayer
local RepStor = game:GetService("ReplicatedStorage")
local Network = RepStor:WaitForChild("Network")
local saveModule = require(RepStor.Library.Client.Save).Get()
local Library = require(game.ReplicatedStorage:WaitForChild('Library'))
local Level = require(game.ReplicatedStorage.Library.Client.MasteryCmds)
local fish = require(game.ReplicatedStorage.Library.Directory.Mastery)
local iHHLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/Lib/TrungBLib.lua')))()
local Window = iHHLib:MakeWindow({Name = "[iHH] 🐾 Fish 🐾", HidePremium = false, IntroEnabled = false, Saveconfig = true, configFolder = "iHHCheat"})

game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Idle Tracking"].Enabled = false
game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Server Closing"].Enabled = false

------------- Info tab

local rodNames = {
    Fishing = {
        ["Pro Fishing Rod"] = {100000},
        ["Super Fishing Rod"] = {25000},
        ["Advanced Fishing Rod"] = {2500},
        ["Sturdy Fishing Rod"] = {100},
    },
    AdvancedFishing = {
        ["Amethyst Fishing Rod"] = {2250000},
        ["Sapphire Fishing Rod"] = {425000},
        ["Emerald Fishing Rod"] = {150000},
        ["Platinum Fishing Rod"] = {40000},
    },
}
------------- Fast tele setup to fishing
local FastFish = Window:MakeTab(
    {
        Name = "Fast Fishing",
        Icon = "rbxassetid://7733916988",
        PremiumOnly = false
    })
FastFish:AddParagraph("Thông báo nhỏ","Chill chill !!!")
FastFish:AddSection({Name = "Support DeepPool Fishing (Map 92, Map 27 also)"})
local fasfish = FastFish:AddToggle({
        Name = "Auto tele, Fishing, Deep pool!",
        Default = config.Fishing.Enabled,
        Save = true,
        Flag = "FastFishing",
        Callback = function(v)
            getgenv().config.Fishing.Enabled = v
            spawn(fastTeleFishArea)
        end
    })
local present = FastFish:AddToggle(
    {
        Name = "Auto Hidden Present",
        Default = config.Presents,
        Save = true,
        Flag = "HiddenPresents",
        Callback = function(v)
            getgenv().config.Presents = v
            spawn(autoHiddenPresent)
        end
    })
------------- Mail tab
local Mail = Window:MakeTab({Name = "Mail",Icon = "rbxassetid://7733992732",PremiumOnly = false})
Mail:AddSection({Name = "Auto Claim Mail"})
local claimMail = Mail:AddToggle(
    {
        Name = "Auto Claim Mail",
        Default = config.AutoMail.autoClaimMail,
        Callback = function(v)
            getgenv().config.AutoMail.autoClaimMail = v
            spawn(autoClaimMail)
        end
    })

Mail:AddSection({Name = "Auto Send Mail"})
local sendMail = Mail:AddToggle(
    {
        Name = "Auto Send Mail",
        Default = config.AutoMail.Enabled,
        Save = true,
        Flag = "Auto Send Mail",
        Callback = function(v)
            getgenv().config.AutoMail.Enabled = v
            spawn(autoSendMail)
        end
    })
Mail:AddSection({Name = "Select items to send"})
local magicShards = Mail:AddToggle(
    {
        Name = "Magic Shards",
        Default = config.AutoMail.sendShards,
        Save = true,
        Flag = "SendShards",
        Callback = function(v)
            getgenv().config.AutoMail.sendShards = v
        end
    })
local hugePoseidon = Mail:AddToggle(
    {
        Name = "Send Huge",
        Default = config.AutoMail.sendHuge,
        Save = true,
        Flag = "SendHuge",
        Callback = function(v)
            getgenv().config.AutoMail.sendHuge = v
        end
    })
local someShit = Mail:AddToggle(
    {
        Name = "Send Shit",
        Default = config.AutoMail.sendShit,
        Save = true,
        Flag = "SendShit",
        Callback = function(v)
            getgenv().config.AutoMail.sendShit = v
        end
    })
------------- Mics
local Mics = Window:MakeTab({Name = "Mics",Icon = "rbxassetid://7734053495",PremiumOnly = false})
Mics:AddSection({Name = "Setup your game with Low CPU and auto antiAFK"})
Mics:AddButton(
    {
        Name = "ReduceCPU",
        Callback = function()
			spawn(lowCPU)
        end
    })
Mics:AddButton(
    {
        Name = "Rejoin Server",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
        end
    })
iHHLib:Init()
-- Check if gems <= 20k then open a gift
function checkGems()
    local Network = game.ReplicatedStorage.Network
    local Items = {"Gift Bag"}
    local gem = 20000
    function autoOpen(name)
        Network.GiftBag_Open:InvokeServer(name)
    end
    local GetSave = function()
        return require(game.ReplicatedStorage.Library.Client.Save).Get()
    end

    for i, v in pairs(GetSave().Inventory.Currency) do
        if v.id == "Diamonds" then
            if type(v._am) == "number" and type(gem) == "number" then
                if v._am <= gem then
                    while wait() do
                        for i,gift in pairs(Items) do
                            autoOpen(gift)
                        end
                        break
                    end
                end
            end
        end
    end
end
-- Low CPU
function lowCPU()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/ReduceLag/lowCPU.lua"))()
end
function ultrafpsboost()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Chillout111/idk/main/main/buff/fbf.lua"))()
end
-- Auto Buy Rod
function getActive() return workspace.__THINGS.__INSTANCE_CONTAINER.Active:GetChildren()[1] end

function checkForRod(rodName)
    for uid,value in pairs(saveModule.Inventory.Misc)  do
        for _,v in pairs(value) do
            if v == rodName  then
                return true 
            end
        end
    end
    return false
end

function buyRod(rodName) return Network:WaitForChild("FishingMerchant_PurchaseRod"):InvokeServer(rodName) end
function AutoBuyRod()
    local Area = tostring(getActive())
    local areaRodNames = rodNames[Area]
    local desiredRod = ""
    if Area == "Fishing" and not checkForRod("Wooden Fishing Rod") then
        Network.Instancing_FireCustomFromClient:FireServer("Fishing", "ClaimRod") 
        desiredRod = "Pro Fishing Rod"
    elseif Area == "AdvancedFishing" and not checkForRod("Amethyst Fishing Rod") then
        desiredRod = "Amethyst Fishing Rod"
    end

    while getgenv().config.Fishing.AutoBuyRod do task.wait(10)
        if areaRodNames and not checkForRod(desiredRod) then
            for rodName, price in pairs(areaRodNames) do
                if not checkForRod(rodName) and Library.CurrencyCmds.Get("Fishing") > price[1] then
                    buyRod(rodName)
                    warn("bought "..rodName, price[1])
                end
            end
        end
    end
end

-- Fast tele fishing
function fastTeleFishArea()
    if getgenv().config.Fishing.Enabled and getgenv().config.Fishing.PlaceToFish == "AdvancedFishing" then
        if not game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("AdvancedFishing") then
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").__THINGS.Instances.AdvancedFishing.Teleports.Enter.CFrame
        end
    elseif getgenv().config.Fishing.Enabled and getgenv().config.Fishing.PlaceToFish == "NormalFishing" then
        if not game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("Fishing") then
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").__THINGS.Instances.Fishing.Teleports.Enter.CFrame
        end
    end
	wait(2)
    if getgenv().config.Fishing.Enabled and getgenv().config.Fishing.PlaceToFish == "AdvancedFishing" then
        spawn(moveToFishingDerec)
        spawn(ultrafpsboost)
    elseif getgenv().config.Fishing.Enabled and getgenv().config.Fishing.PlaceToFish == "NormalFishing" then
        spawn(moveToFishingDerec)
        spawn(lowCPU)
    end
end
-- Auto Present
function autoHiddenPresent()
	while task.wait() and getgenv().config.Presents do
		local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
        local result = save.Get()
		local present = result.HiddenPresents
		for i, v in pairs(present) do
			local args = {
				[1] = v.ID
			}
			game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Hidden Presents: Found"):InvokeServer(unpack(args))
			wait(1.5)
		end
	end
end
-- Anti AFk
function antiAFK()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    while task.wait() do
        VirtualInputManager:SendKeyEvent(true, "Space", false, game)
        task.wait(.2)
        VirtualInputManager:SendKeyEvent(false, "Space", false, game)
        task.wait(300)
    end
end
-- Auto Claim Mail
function autoClaimMail()
	while task.wait(10) and config.AutoMail.autoClaimMail do
		game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Claim All"):InvokeServer()
	end
end
-- Auto Fishing
function moveToFishingDerec()
    if getgenv().config.Fishing.Enabled 
        if getgenv().config.Fishing.PlaceToFish == "AdvancedFishing" then
            spawn(autoFishAdvanced)
            local LocalPlayer = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            LocalPlayer.Anchored = true
            LocalPlayer.CFrame = CFrame.new(1451.040771484375, 66.06719207763672, -4451.8642578125)
            wait(2)
            LocalPlayer.CFrame = LocalPlayer.CFrame + Vector3.new(Random.new():NextInteger(-10, 10), -30, Random.new():NextInteger(-10, 10))
    
            local platform = Instance.new("Part")
            platform.Parent = game:GetService("Workspace")
            platform.Anchored = true
            platform.CFrame = LocalPlayer.CFrame + Vector3.new(0, -5, 0)
            platform.Size = Vector3.new(5, 1, 5)
            platform.Transparency = 1
    
            LocalPlayer.Anchored = false
        elseif getgenv().config.Fishing.PlaceToFish == "NormalFishing" then
            LocalPlayer.Anchored = true
            LocalPlayer.CFrame = CFrame.new(1115.8133544921875, 80.2374267578125, -3461.373291015625 + Random.new():NextInteger(-10, 50))
            wait(1)
            LocalPlayer.Anchored = false
            spawn(autoFishNormal)
        end
    end
end

function autoFishAdvanced()
    local FishingRank = Level.GetLevel(fish.Fishing)

    while getgenv().config.Fishing.Enabled and getgenv().config.Fishing.PlaceToFish == "AdvancedFishing" do
        
        local deepPool
        for _, instance in pairs(game:GetService("Workspace"):FindFirstChild("__THINGS").__INSTANCE_CONTAINER.Active.AdvancedFishing:FindFirstChild("Interactable"):GetChildren()) do
            if instance.Name == "DeepPool" then
                deepPool = instance
                break
            end
        end
        local castVector
        if  deepPool and FishingRank >= 30 then
            castVector = Vector3.new(deepPool.Position.X + Random.new():NextNumber(-4.75, 4.75), deepPool.Position.Y, deepPool.Position.Z + Random.new():NextNumber(-4.75, 4.75))
        else
            castVector = Vector3.new(1465.877685546875 + Random.new():NextInteger(-20, 50), 61.62495040893555, -4455.58447265625 + Random.new():NextInteger(-20, 50))
        end
        Network.Instancing_FireCustomFromClient:FireServer("AdvancedFishing", "RequestCast", castVector)
        task.wait(2.5)
        Network.Instancing_FireCustomFromClient:FireServer("AdvancedFishing", "RequestReel")
        repeat
            task.wait()

            local hasFishingLine = false
            for _, descendant in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if descendant.Name == "FishingLine" then
                    hasFishingLine = true
                    break
                end
            end
            
            Network.Instancing_FireCustomFromClient:FireServer("AdvancedFishing", "RequestReel")
            if not hasFishingLine then
                break
            end

            Network.Instancing_InvokeCustomFromClient:InvokeServer("AdvancedFishing", "Clicked")
        until not hasFishingLine
        task.wait()
    end
end
function autoFishNormal()

    if not game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("Fishing") then
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").__THINGS.Instances.Fishing.Teleports.Enter.CFrame
        task.wait(1)
    end

    while task.wait() and getgenv().config.Fishing.Enabled and getgenv().config.Fishing.PlaceToFish == "NormalFishing" do
        local x = math.random(1, 50)
        local z = math.random(1, 20)

        local argsCast = {
            [1] = "Fishing",
            [2] = "RequestCast",
            [3] = Vector3.new(1149.94775390625, 75.91414642333984, -3460.374755859375) + Vector3.new(x, 0, z)
        }

        game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(argsCast))
        task.wait(2.5)

        local argsReel = {
            [1] = "Fishing",
            [2] = "RequestReel"
        }
        game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(argsReel))

        repeat
            task.wait()

            local hasFishingLine = false
            for _, descendant in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if descendant.Name == "FishingLine" then
                    hasFishingLine = true
                    break
                end
            end
            
            game:GetService("ReplicatedStorage").Network.Instancing_FireCustomFromClient:FireServer(unpack(argsReel))
            if not hasFishingLine then
                break
            end

            local argsClicked = {
                [1] = "Fishing",
                [2] = "Clicked"
            }

            game:GetService("ReplicatedStorage").Network.Instancing_InvokeCustomFromClient:InvokeServer(unpack(argsClicked))
        until not hasFishingLine
        task.wait()
    end
end
-- Auto Send Mail
function autoSendMail()
    
    local saveModule = require(game:GetService("ReplicatedStorage").Library.Client.Save)
    local result = saveModule.Get()
    local ms = result.Inventory.Misc
    while task.wait(getgenv().config.AutoMail.delayAutoSendMail) and getgenv().config.AutoMail.Enabled do
        for i, v in pairs(ms) do
            if v.id == "Magic Shard" and getgenv().config.AutoMail.sendShards then
                if v._am >= getgenv().config.AutoMail.minShards then
                    game:GetService("ReplicatedStorage").Network:FindFirstChild("Mailbox: Send"):InvokeServer(unpack({getgenv().config.AutoMail.userToMail, "", "Misc", i, v._am}))
                    iHHLib:MakeNotification({
                        Name = "[iHH] Mail Send!",
                        Content = "Sended "..v._am.." shards",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                end
            end
            if v.id == "Charm Stone" and getgenv().config.AutoMail.sendShit then
                if v._am >= 10 then
                    game:GetService("ReplicatedStorage").Network:FindFirstChild("Mailbox: Send"):InvokeServer(unpack({getgenv().config.AutoMail.userToMail, "", "Misc", i, v._am}))
                    iHHLib:MakeNotification({
                        Name = "[iHH] Mail Send!",
                        Content = "Sended "..v._am.." Charm Stone",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                end
            end
            if v.id == "Gift Bag" and getgenv().config.AutoMail.sendShit then
                if v._am >= 500 then
                    game:GetService("ReplicatedStorage").Network:FindFirstChild("Mailbox: Send"):InvokeServer(unpack({getgenv().config.AutoMail.userToMail, "", "Misc", i, v._am}))
                    iHHLib:MakeNotification({
                        Name = "[iHH] Mail Send!",
                        Content = "Sended "..v._am.." Gift Bag",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                end
            end
            if v.id == "Large Gift Bag" and getgenv().config.AutoMail.sendShit then
                if v._am >= 250 then
                    game:GetService("ReplicatedStorage").Network:FindFirstChild("Mailbox: Send"):InvokeServer(unpack({getgenv().config.AutoMail.userToMail, "", "Misc", i, v._am}))
                    iHHLib:MakeNotification({
                        Name = "[iHH] Mail Send!",
                        Content = "Sended "..v._am.." Large Gift Bag",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                end
            end
            if v.id == "Mini Lucky Block" and getgenv().config.AutoMail.sendShit then
                if v._am >= 15 then
                    game:GetService("ReplicatedStorage").Network:FindFirstChild("Mailbox: Send"):InvokeServer(unpack({getgenv().config.AutoMail.userToMail, "", "Misc", i, v._am}))
                    iHHLib:MakeNotification({
                        Name = "[iHH] Mail Send!",
                        Content = "Sended "..v._am.." Lucky Block",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                end
            end
            if v.id == "Mini Pinata" and getgenv().config.AutoMail.sendShit then
                if v._am >= 10 then
                    game:GetService("ReplicatedStorage").Network:FindFirstChild("Mailbox: Send"):InvokeServer(unpack({getgenv().config.AutoMail.userToMail, "", "Misc", i, v._am}))
                    iHHLib:MakeNotification({
                        Name = "[iHH] Mail Send!",
                        Content = "Sended "..v._am.." Pinata",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                end
            end
        end

        task.wait(0.2)

        local pet = result.Inventory.Pet
        for i, v in pairs(pet) do
            if getgenv().config.AutoMail.sendHuge then
                if v.id == "Huge Poseidon Corgi" or v.id == "Huge Whale Shark" then
                    game:GetService("ReplicatedStorage").Network:FindFirstChild("Mailbox: Send"):InvokeServer(unpack({getgenv().config.AutoMail.userToMail, "", "Pet", i, 1}))
                    iHHLib:MakeNotification({
                        Name = "[iHH] Mail Send!",
                        Content = "Sended "..v.id.." !",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                end
            end
        end
        task.wait(0.2)

        local GetSave = function()
            return require(game.ReplicatedStorage.Library.Client.Save).Get()
        end
        for i, v in pairs(GetSave().Inventory.Currency) do
            if v.id == "Diamonds" then
                if v._am >= getgenv().config.AutoMail.gemAmount then
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack({getgenv().config.AutoMail.userToMail, "", "Currency", i, v._am -30000})) -- 30k = 10k mail + 20k keep
                    iHHLib:MakeNotification({
                        Name = "[iHH] Mail Send!",
                        Content = "Sended "..v._am.." gems",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                end
            end
            task.wait(0.2)
        end
    end
end
function atoggle()
    --Auto Fish
    fasfish:Set(config.Fishing.Enabled)
    present:Set(config.Presents)
    --Auto Mail
    sendMail:Set(config.AutoMail.Enabled)
    hugePoseidon:Set(config.AutoMail.sendHuge)
    magicShards:Set(config.AutoMail.sendShards)
    someShit:Set(config.AutoMail.sendShit)
    claimMail:Set(config.AutoMail.autoClaimMail)
end
spawn(atoggle)
spawn(checkGems)
spawn(AutoBuyRod)
spawn(antiAFK)
