local StateManager = require(game:GetService("ReplicatedStorage").SharedManagers.StateManager)

return function(ctx, target: Player?)
	target = (target or ctx.Executor) :: Player
	assert(target, "[Cmdr::Reset] Somehow? Neither a target was provided nor was their an executor.")

	local Character = target.Character
	if Character and Character:FindFirstChild("HumanoidRootPart") then
		local position = Character:FindFirstChild("HumanoidRootPart").CFrame

		StateManager.SetState(target.UserId, "Combat")
		target:LoadCharacterAsync()
		Character = target.Character or target.CharacterAdded:Wait()
		Character:FindFirstChild("HumanoidRootPart").CFrame = position

		return "Reset " .. target.Name .. " [" .. target.UserId .. "]"
	end

	print(Character:FindFirstChild("HumanoidRootPart"))
	return "Target player has no character."
end
