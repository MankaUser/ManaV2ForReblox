CoreGui = game:GetService("CoreGui")
if game.PlaceId == 6872274481 or game.PlaceId == 8560631822 or game.PlaceId == 8444591321 then 
 loadstring(game:HttpGet("https://raw.githubusercontent.com/MankaUser/ManaV2ForReblox/main/Scripts/bedwars.lua"))()
elseif game.PlaceId == 6872265039 then
CoreGui:SetCore("SendNotification", {
	Title = "Mana";
	Text = "Lobby not supported yet";
	Duration = 10;
})
 end
