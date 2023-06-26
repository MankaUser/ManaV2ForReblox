CoreGui = game:GetService("CoreGui")
if game.PlaceId == 6872274481 or game.PlaceId == 8560631822 or game.PlaceId == 8444591321 then 
loadstring(game:HttpGet("https://raw.githubusercontent.com/MankaUser/ManaV2ForReblox/main/Scripts/bedwars.lua"))()
 wait(0.5)
 print("[Mana]: Loaded!")
elseif game.PlaceId == 6872265039 then
print("[Mana]: Lobby not supported yet")
else
print("[Mana]: ManaV2 supports only bedwars matches for now")
end
