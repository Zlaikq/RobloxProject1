--First Script
local mainGame = game.Workspace:WaitForChild("MainGame")

local gates = mainGame:WaitForChild("Gates")

local buttons = mainGame:WaitForChild("Buttons")

local function activateButton(button, touched)
    touched.Value = true

    local gate = gates:FindFirstChild(button.Name)

    if gate then
        gate.Transparency = 0.5
        gate.CanCollide = false
    end
    local duration = button:FindFirstChild("Duration")

    local timer = duration.Value

    while timer > 0 do
        print(timer)
        wait(1)
        timer = timer - 1
    end
    gate.Transparency = 0
    gate.CanCollide = true
    touched.Value = false
end

for _, button in pairs(buttons:GetChildren()) do
    button.Touched:Connect(function(otherPart)
        local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
        local touched = button:FindFirstChild("Touched")
        if humanoid and touched and touched.Value == false then
            activateButton(button, touched)
        end
    end)
end

        

--Second Script
game.Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local coins = Instance.new("IntValue")
    coins.Name = "Coins"
    coins.Value = 0
    coins.Parent = leaderstats
end)

local mainGame = game.Workspace:WaitForChild("MainGame")
local coins = mainGame:WaitForChild("Coins")

for _, coin in pairs(coins:GetChildren()) do
    coin.Touched:Connect(function(otherPart)
        local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
        local player = game.Players:GetPlayerFromCharacter(otherPart.Parent)
        local touched = coin:FindFirstChild("Touched")

        if humanoid and player and touched and touched.Value == false then
            touched.Value = true

            local randomAmount = math.random(1, 5)
            
            player.leaderstats.Coins.Value += 1
            coin.transparency = 0.75
        end
    end)
end
    