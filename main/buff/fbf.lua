local THINGS = game:GetService("Workspace")["__THINGS"]
local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
pcall(function()
    for _, v in pairs(THINGS["__INSTANCE_CONTAINER"].Active.AdvancedFishing.Map:GetChildren()) do 
        v:Destroy()
    end
    local targetCFrame1 = CFrame.new(1450.4469, 62.8209801, -4451.35938, 0.0706113577, -0, -0.997503936, 0, 1, -0, 0.997503936, 0, 0.0706113577)
    local targetCFrame2 = CFrame.new(1450.18347, 62.8210258, -4455.08691, 0.0706113577, -0, -0.997503936, 0, 1, -0, 0.997503936, 0, 0.0706113577)
    local targetCFrame3 = CFrame.new(1451.85693, 62.820713, -4438.60547, 0.157342553, -0, -0.98754406, 0, 1, -0, 0.98754406, 0, 0.157342553)
    local targetCFrame4 = CFrame.new(1450.81909, 62.8208656, -4446.11084, 0.0706113577, -0, -0.997503936, 0, 1, -0, 0.997503936, 0, 0.0706113577)
    local targetCFrame5 = CFrame.new(1450.16333, 62.8211632, -4463.27051, -0.0165338516, 0, -0.999863327, 0, 1, 0, 0.999863327, 0, -0.0165338516)
    for _, v in pairs(THINGS["__INSTANCE_CONTAINER"].Active.AdvancedFishing.Model:GetDescendants()) do
        if v:IsA('Part') and v.CFrame ~= targetCFrame1 and v.CFrame ~= targetCFrame2 and v.CFrame ~= targetCFrame3 and v.CFrame ~= targetCFrame4 and v.CFrame ~= targetCFrame5 then
            v:Destroy()
        end
    end
    for _, v in pairs(game:GetService("Workspace"):FindFirstChild("__THINGS"):GetChildren()) do
        if table.find({"ShinyRelics", "Ornaments", "Instances", "Ski Chairs", "BalloonGifts", "Sounds"}, v.Name) then
            v:Destroy()
        end
    end
    for _, v in pairs(game:GetService("Workspace"):FindFirstChild("__THINGS").__INSTANCE_CONTAINER.Active.AdvancedFishing:GetChildren()) do
        if string.find(v.Name, "Model") or string.find(v.Name, "Water") or string.find(v.Name, "Debris") or string.find(v.Name, "Interactable") then
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
for _, v in pairs(THINGS:GetChildren()) do
    if v:IsA('Model') and v.Name ~= "HiddenPresents" and v.Name ~= "Pets" and v.Name ~= "Eggs" and v.Name ~= "CustomEggs" then
        v:Destroy()
    end
end
for _, v in pairs(playerGui._MISC:GetChildren()) do
    if v.Name == "Instancing" then
        v:Destroy()
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

for _, v in pairs(THINGS.Instances.AdvancedFishing.Teleports:GetChildren()) do
    if v.Name == "Leave" then
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

game:GetService("RunService"):Set3dRenderingEnabled(false)
loadstring(game:HttpGet("https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/ReduceLag/lowCPU.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/ReduceLag/lowmap.lua"))()
