repeat task.wait() until game:IsLoaded()

if game.PlaceId == 8737899170 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TrungB2/Skid/BestSkid/Event/script1d.lua"))()
elseif game.PlaceId == 16498369169 then -- and whatever parameter u want ig
    game.ReplicatedStorage.Network.World1Teleport:InvokeServer()
end
