local THINGS = game:GetService("Workspace")["__THINGS"]
local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
if game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("AdvancedFishing") then
    pcall(function()
        for _, v in pairs(THINGS["__INSTANCE_CONTAINER"].Active.AdvancedFishing.Map:GetChildren()) do 
            v:Destroy()
        end
        for _, v in pairs(game:GetService("Workspace"):FindFirstChild("__THINGS").__INSTANCE_CONTAINER.Active.AdvancedFishing:GetChildren()) do
            if string.find(v.Name, "Model") or string.find(v.Name, "Water") or string.find(v.Name, "Debris") then
                v:Destroy()
            end
            for _, v in pairs(game:GetService("Workspace"):FindFirstChild("__THINGS"):GetChildren()) do
                if table.find({"ShinyRelics", "Ornaments", "Ski Chairs", "BalloonGifts", "Sounds"}, v.Name) then
                    v:Destroy()
                end
            end
            for _, v in pairs(THINGS["__INSTANCE_CONTAINER"].Active.AdvancedFishing.Interactable.Merchant:GetChildren()) do
                v:Destroy()
            end
            if v.Name == "Map" then
                for _, v in pairs(v:GetChildren()) do
                    if v.Name ~= "Union" then
                        v:Destroy()
                    end
                end
            end
        end
    end)
    for _, v in pairs(game:GetService("Workspace"):FindFirstChild("__THINGS"):GetChildren()) do
        if table.find({"ShinyRelics", "Ornaments", "Ski Chairs", "BalloonGifts", "Sounds"}, v.Name) then
            v:Destroy()
        end
    end
    local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
    for _, v in pairs(playerGui:GetChildren()) do
        if v.Name ~= "_INSTANCES" then
            v.Enabled = false
        end
        for _, instan in pairs(v:GetDescendants()) do
            if instan.Name == "Instancing" then
                instan.Enabled = false
            end
        end
        for _, info in pairs(playerGui._INSTANCES.FishingGame.Info:GetChildren()) do
            if info.Name == "Top" then
                info.UIStroke:Destroy()
            end
            if info.Name == "Middle" then
                info.UIStroke:Destroy()
            end
            if info.Name == "Bottom" then
                info.UIStroke:Destroy()
            end
        end
    end
    
    for _, v in pairs(THINGS["__INSTANCE_CONTAINER"].Active.AdvancedFishing:GetChildren()) do
        if v.Name == "Water" then
            v:Destroy()
        end
        
        for _, v in pairs(THINGS["__INSTANCE_CONTAINER"].Active.AdvancedFishing.Interactable.Merchant:GetChildren()) do
            v:Destroy()
        end
    end
    
    for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:IsA("Model") and v.Name ~= game.Players.LocalPlayer.Name then
            v:Destroy()
        end
    end
    for _, v in pairs(game:GetService("GuiService"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("Stats"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("CorePackages"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("MaterialService"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("StarterGui"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("Lighting"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("Chat").ClientChatModules:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("InsertService"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("Players"):GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            v:Destroy()
        end
    end
    for _, v in pairs(game:GetService("ReplicatedFirst"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("ControllerService"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("TextChatService").BIGTextChatCommands:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("TextChatService").TextChannels:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("TextChatService").TextChatCommands:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("StarterPlayer").StarterPlayerScripts:GetDescendants()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("StarterPlayer").StarterCharacterScripts:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("ReplicatedStorage")["__INSTANCE_STORAGE"]:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("ReplicatedStorage").Network:GetDescendants()) do
        if v.Name ~= "Orbs: Create" and v.Name ~= "Idle Tracker: Stop Timer" and v.Name ~= "Idle Tracker: Update Timer" and v.Name ~= "Orbs: Collect" and v.Name ~= "Lootbags_Claim" and v.Name ~= "Orbs_Claim" and v.Name ~= "Items: Update" and v.Name ~= "Orbs: ClaimMultiple" and v.Name ~= "Hidden Presents: Found" and v.Name ~= "Mailbox: Send" and v.Name ~= "Mailbox: Claim All" and v.Name ~= "Instancing_InvokeCustomFromClient" and v.Name ~= "Instancing_FireCustomFromClient" and v.Name ~= "Instancing_FireCustomFromServer" and v.Name ~= "Click" then
            v:Destroy()
        end
    end
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/ReduceLag/lowCPU.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/ReduceLag/lowmap.lua"))()
    task.wait()
    game:GetService("RunService"):Set3dRenderingEnabled(false)
elseif game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("Fishing") then
    pcall(function()
        for _, v in pairs(THINGS["__INSTANCE_CONTAINER"].Active.AdvancedFishing.Map:GetChildren()) do 
            v:Destroy()
        end
        for _, v in pairs(game:GetService("Workspace"):FindFirstChild("__THINGS").__INSTANCE_CONTAINER.Active.Fishing:GetChildren()) do
            if string.find(v.Name, "Model") or string.find(v.Name, "Water") or string.find(v.Name, "Debris") or string.find(v.Name, "Interactable") then
                v:Destroy()
            end
            for _, v in pairs(game:GetService("Workspace"):FindFirstChild("__THINGS"):GetChildren()) do
                if table.find({"ShinyRelics", "Ornaments", "Ski Chairs", "BalloonGifts", "Sounds"}, v.Name) then
                    v:Destroy()
                end
            end
            if v.Name == "Map" then
                for _, v in pairs(v:GetChildren()) do
                    if v.Name ~= "Union" then
                        v:Destroy()
                    end
                end
            end
        end
    end)
    local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
    for _, v in pairs(playerGui:GetChildren()) do
        if v.Name ~= "_INSTANCES" then
            v.Enabled = false
        end
        for _, instan in pairs(v:GetDescendants()) do
            if instan.Name == "Instancing" then
                instan.Enabled = false
            end
        end
    end
    for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:IsA("Model") and v.Name ~= game.Players.LocalPlayer.Name then
            v:Destroy()
        end
    end
    for _, v in pairs(game:GetService("GuiService"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("Stats"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("CorePackages"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("MaterialService"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("StarterGui"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("Lighting"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("Chat").ClientChatModules:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("InsertService"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("Players"):GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            v:Destroy()
        end
    end
    for _, v in pairs(game:GetService("ReplicatedFirst"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("ControllerService"):GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("TextChatService").BIGTextChatCommands:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("TextChatService").TextChannels:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("TextChatService").TextChatCommands:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("StarterPlayer").StarterPlayerScripts:GetDescendants()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("StarterPlayer").StarterCharacterScripts:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("ReplicatedStorage")["__INSTANCE_STORAGE"]:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(game:GetService("ReplicatedStorage").Network:GetDescendants()) do
        if v.Name ~= "Orbs: Create" and v.Name ~= "Idle Tracker: Stop Timer" and v.Name ~= "Idle Tracker: Update Timer" and v.Name ~= "Orbs: Collect" and v.Name ~= "Lootbags_Claim" and v.Name ~= "Orbs_Claim" and v.Name ~= "Items: Update" and v.Name ~= "Orbs: ClaimMultiple" and v.Name ~= "Hidden Presents: Found" and v.Name ~= "Mailbox: Send" and v.Name ~= "Mailbox: Claim All" and v.Name ~= "Instancing_InvokeCustomFromClient" and v.Name ~= "Instancing_FireCustomFromClient" and v.Name ~= "Instancing_FireCustomFromServer" and v.Name ~= "Click" then
            v:Destroy()
        end
    end
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/ReduceLag/lowCPU.lua"))()
end
