if game.PlaceId == 6872274481 or game.PlaceId == 8560631822 or game.PlaceId == 8444591321 then 
loadstring(game:HttpGet("https://raw.githubusercontent.com/MankaUser/ManaV2ForReblox/main/Scripts/bedwars.lua"))()
 wait(0.5)
 print("[Mana]: Loaded!")
elseif game.PlaceId == 6872265039 then
warn("[Mana]: Lobby not supported yet")
else
warn("[Mana]: ManaV2 does not support game with ".. game.PlaceId.." ID")
end
