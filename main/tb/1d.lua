iiloadstring(game:HttpGet('https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/Misc/antistaff.lua'))()

-- Auto Craft
function autoCraft()
    while wait() and getgenv().config.Digsite.AutoCraft do
        game:GetService("ReplicatedStorage").Network.MagicMachine_Activate:InvokeServer(getgenv().config.Digsite.pickToCraft)
    end
end
-- Auto  Collect
function autoCollectBag()
    
    while wait(0.1) do
        for _, lootbag in pairs(game:GetService("Workspace").__THINGS:FindFirstChild("Lootbags"):GetChildren()) do
            if lootbag then
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Lootbags_Claim"):FireServer(unpack( { [1] = { [1] = lootbag.Name, }, } ))
                lootbag:Destroy()
                task.wait()
            end
        end
        
        game:GetService("Workspace").__THINGS:FindFirstChild("Lootbags").ChildAdded:Connect(function(lootbag)
            task.wait()
            if lootbag then
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Lootbags_Claim"):FireServer(unpack( { [1] = { [1] = lootbag.Name, }, } ))
                lootbag:Destroy()
            end
        end)
        
        game:GetService("Workspace").__THINGS:FindFirstChild("Orbs").ChildAdded:Connect(function(orb)
            task.wait()
            if orb then
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):FindFirstChild("Orbs: Collect"):FireServer(unpack( { [1] = { [1] = tonumber(orb.Name), }, } ))
                orb:Destroy()
            end
        end)
    end
end
-- Auto Present
function autoHiddenPresent()
    while wait() and getgenv().config.Presents do
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
    while wait(10) and getgenv().config.AutoMail.autoClaimMail do
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Claim All"):InvokeServer()
    end
end
-- Auto Send Mail
function autoSendMail()
    local saveModule = require(game:GetService("ReplicatedStorage").Library.Client.Save)
    local result = saveModule.Get()
    while task.wait(getgenv().config.AutoMail.delayAutoSendMail) and getgenv().config.AutoMail.Enabled do
        local ms = result.Inventory.Misc
        for i, v in pairs(ms) do
            if v.id == "Bucket O' Magic" and getgenv().config.AutoMail.sendBucket then
                if v._am >= 50 then
                    local bucket = {
                        [1] = getgenv().config.AutoMail.userToMail,
                        [2] = "",
                        [3] = "Misc",
                        [4] = i,
                        [5] = v._am
                    }
                    game:GetService("ReplicatedStorage").Network:FindFirstChild("Mailbox: Send"):InvokeServer(unpack(bucket))
                    iHHLib:MakeNotification({
                        Name = "[iHH] Mail Send!",
                        Content = "Sended "..v._am.." Bucket O' Magic",
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
                if v.id == "Huge Fossil Dragon" then
                    local huge = {
                        [1] = getgenv().config.AutoMail.userToMail,
                        [2] = "",
                        [3] = "Pet",
                        [4] = i,
                        [5] = 1
                    }
                    game:GetService("ReplicatedStorage").Network:FindFirstChild("Mailbox: Send"):InvokeServer(unpack(huge))
                    iHHLib:MakeNotification({
                        Name = "[iHH] Mail Send!",
                        Content = "Huge Sended!",
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
                    local diamonds = {
                        [1] = getgenv().config.AutoMail.userToMail,
                        [2] = "",
                        [3] = "Currency",
                        [4] = i,
                        [5] = v._am - 30000
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(unpack(diamonds)) -- 30k = 10k mail + 20k keep
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
-- Auto Dig
function chestESP()
    if not game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("AdvancedDigsite") then    
    else
        chestsn = {"Animated",}
        local function contains(table, val)
            for i=1,#table do
                if table[i] == val then return true end
            end
            return false
        end
        while task.wait(0.1) and getgenv().config.Digsite.TpToChest do
            for __,v in pairs(game.Workspace["__THINGS"].__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important.ActiveChests:GetChildren()) do
                if v:FindFirstChild("ESP") then v:FindFirstChild("ESP"):Destroy() end
                if contains(chestsn, v.Name) then
                    if v.Name == "Animated" then
                        tcolor = Color3.fromRGB(222, 184, 135)
                    end
            
                    local a = Instance.new("BillboardGui",v)
                    a.Name = "ESP"
                    a.Size = UDim2.new(5,0, 5,0)
                    a.AlwaysOnTop = true
                    local b = Instance.new("Frame",a)
                    b.Size = UDim2.new(1,0, 1,0)
                    b.BackgroundTransparency = 0.50
                    b.BorderSizePixel = 0
                    b.BackgroundColor3 = tcolor
                    local c = Instance.new('TextLabel',b)
                    c.Size = UDim2.new(1,0,1,1)
                    c.BorderSizePixel = 0
                    c.TextSize = 17
                    c.Text = "Hi"
                    c.BackgroundTransparency = 1
                    c.TextColor3 = tcolor
                    c.TextStrokeColor3 = Color3.fromRGB(6, 6, 6)
                    c.TextStrokeTransparency = 0.7
                end
            end
        end
    end
end
local function findChest()
    local dist = 9999
    local chest = nil
    for _, v in pairs(game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important.ActiveChests:GetChildren()) do
        if v:IsA("Model") then
            local magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Top.Position).Magnitude
            if magnitude <= dist then
                dist = magnitude
                chest = v
            end
        end
    end
    return chest
end
local function findMagicBlock()
    local dist = 9999
    local magicBlock = nil
    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    for _, v in pairs(game.Workspace["__THINGS"].__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important.ActiveBlocks:GetChildren()) do
        for _, part in pairs(v:GetChildren()) do
            if part.Name == "sparkles" then
                if v:IsA("BasePart") then
                    local magnitude = (playerPosition - v.Position).Magnitude
                    if magnitude <= dist and playerPosition.Y > v.Position.Y then
                        dist = magnitude
                        magicBlock = v.CFrame -- Change here to store the CFrame of the magic block
                    end
                end
            end
        end
    end

    return magicBlock
end
local function findBlock()
    local dist = 9999
    local block = nil
    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    
    for _, v in pairs(game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active.AdvancedDigsite.Important.ActiveBlocks:GetChildren()) do
        if v.BrickColor == "Really black" then end
        if v:IsA("BasePart") then
            local magnitude = (playerPosition - v.Position).Magnitude
            if magnitude <= dist and playerPosition.Y > v.Position.Y then
                dist = magnitude
                block = v
            end
        end
    end
    
    return block
end
-- Staring digging
function startDigging()
    local foundSparkles = false
    local fpsboost = true
    while task.wait(0.2) and getgenv().config.Digsite.Enabled do
        if not game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("AdvancedDigsite") then
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").__THINGS.Instances.AdvancedDigsite.Teleports.Enter.CFrame
            local loaded = false
    
            task.spawn(function()
                task.wait(10)
                if not loaded and getgenv().config.Digsite.HopWhenNoChestLeft then
                    task.wait(5)
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/Misc/serverhop.lua"))()
                end
            end)
    
            local detectLoad = game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active.ChildAdded:Connect(function(child)
                if child.Name == "AdvancedDigsite" then
                    loaded = true
                end
            end)
    
            repeat
                task.wait()
            until loaded
            detectLoad:Disconnect()
            task.wait(1)
			
        end
	--[[
	    if fpsboost == getgenv().config.Digsite.DigsiteFPSBoost then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Chillout111/idk/main/main/buff/dbf.lua"))()
		fpsboost = false
	    end]]
        local block = findBlock()
        local chest = findChest()
        local magicBlockCFrame = findMagicBlock()

        if not chest then 
            if getgenv().config.Digsite.HopWhenNoChestLeft then
                if (os.clock() - os.clock() > 20) then -- Server hop if no chest is found for this many seconds
                    task.wait(5) -- Delay before server hops
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/Misc/serverhop.lua"))()
                end
            end
        else
        end

        if chest and getgenv().config.Digsite.TpToChest then
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = chest.Top.CFrame
            game:GetService("ReplicatedStorage").Network:WaitForChild("Instancing_FireCustomFromClient"):FireServer("AdvancedDigsite", "DigChest", chest:GetAttribute('Coord'))
            wait(0.2)
        elseif block and magicBlockCFrame ~= nil then
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = magicBlockCFrame
            game:GetService("ReplicatedStorage").Network:WaitForChild("Instancing_FireCustomFromClient"):FireServer("AdvancedDigsite", "DigBlock", block:GetAttribute('Coord'))
            foundSparkles = true
            task.wait(0.001)
        elseif block then
            if foundSparkles == true then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace")["__THINGS"]["__INSTANCE_CONTAINER"].Active.AdvancedDigsite.Important.TunnelTop.CFrame
                foundSparkles = false
                task.wait(1)
            else
                local tunnelTopCFrame = game:GetService("Workspace")["__THINGS"]["__INSTANCE_CONTAINER"].Active.AdvancedDigsite.Important.TunnelTop.CFrame
                local blockPosition = block.Position
                -- Check if bedrock below the player then tp out
                if block.BrickColor == BrickColor.new("Really black") and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y + 1 > blockPosition.Y then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = tunnelTopCFrame
                else
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(block.Position + Vector3.new(0, 6, 0))
                    game:GetService("ReplicatedStorage").Network:WaitForChild("Instancing_FireCustomFromClient"):FireServer("AdvancedDigsite", "DigBlock", block:GetAttribute('Coord'))
                    task.wait(0.001)
                end
            end
        
        end
        task.wait(0.01)
    end
end
spawn(autoCraft)
spawn(autoCollectBag)
spawn(autoClaimMail)
spawn(autoHiddenPresent)
spawn(autoSendMail)
spawn(autoHiddenPresent)
spawn(startDigging)
spawn(antiAFK)
