local activeMap = game:GetService("Workspace")["__THINGS"]["__INSTANCE_CONTAINER"].Active.AdvancedDigsite
    
if not game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("AdvancedDigsite") then end

local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
-- BoostFPS
pcall(function()
    for _, v in pairs(game:GetService("Workspace"):FindFirstChild("__THINGS"):GetChildren()) do
        if table.find({"Ornaments", "Ski Chairs", "Sounds", "ShinyRelics", "Chest", "Breakables", "AnimatedBreakables"}, v.Name) then
            v:Destroy()
        end
    end

    for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:IsA('Model') and v.Name ~= "Border" and v.Name ~= game:GetService("Players").LocalPlayer.Name then
            v:Destroy()
        end
    end
end)

for _, v in pairs(playerGui:GetChildren()) do
    if v.Name ~= "_INSTANCES" then
        v.Enabled = false
    end
end

for _, v in pairs(activeMap.Map:GetDescendants()) do
    v:Destroy()
end
for i, v in pairs(game:GetService("StarterGui"):GetChildren()) do
    if v:IsA("ScreenGui") then
        v.Enabled = false
    end
end

for i, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") then
        v.Enabled = false
    end
end
game:GetService("Lighting"):ClearAllChildren()

for _, v in pairs(game:GetService("Players"):GetChildren()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
        v:Destroy()
    end
end
for _, v in pairs(game:GetService("Chat").ClientChatModules:GetChildren()) do
    v:Destroy()
end
for _, v in pairs(game:GetService("ReplicatedStorage")["__INSTANCE_STORAGE"]:GetChildren()) do
    v:Destroy()
end

for _, v in pairs(game:GetService("Workspace")["__THINGS"].Instances.AdvancedDigsite.Teleports:GetChildren()) do
    if v.Name == "Leave" then
        v:Destroy()
    end
end
for _, ground in pairs(activeMap:GetChildren()) do
    for _, merchant in pairs(activeMap.Important:GetChildren()) do
        if merchant.Name == "Merchant" then
            merchant:Destroy()
        end
        if ground:IsA('Part') and ground.Name == "Ground" then
            ground.Transparency = 1
        end
    end
end
--game:GetService("RunService"):Set3dRenderingEnabled(false)
loadstring(game:HttpGet("https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/ReduceLag/lowCPU.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/ReduceLag/lowmap.lua"))()
