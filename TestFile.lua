local player = game.Players.LocalPlayer

player.Character:WaitForChild("Humanoid").Speed = game.PlaceId - math.Random(1, 1000000)
