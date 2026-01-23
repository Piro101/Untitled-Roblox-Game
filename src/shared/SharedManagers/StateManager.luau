local StateManager = {}

local Players = game:GetService("Players")

StateManager.SetState = function(
	target: number | Part,
	state: string,
	value: any?,
	time: number?,
	callback: ((Part) -> {})?
)
	local AttributeTarget = typeof(target) == "Instance" and target
		or (Players:GetPlayerByUserId(target).Character or Players:GetPlayerByUserId(target).CharacterAdded:Wait())
	state = "State" .. state

	if value == nil then
		AttributeTarget:SetAttribute(state, true)
	else
		AttributeTarget:SetAttribute(state, value)
	end
	if time then
		task.delay(time, function()
			AttributeTarget:SetAttribute(state, nil)

			if callback then
				callback(AttributeTarget)
			end
		end)
	end
end

StateManager.DeleteState = function(target: number | Part, state: string)
	local AttributeTarget = typeof(target) == "Instance" and target
		or (Players:GetPlayerByUserId(target).Character or Players:GetPlayerByUserId(target).CharacterAdded:Wait())
	state = "State" .. state
	AttributeTarget:SetAttribute(state, nil)
end

StateManager.GetState = function(target: number | Part, state: string, default: any?)
	local AttributeTarget = typeof(target) == "Instance" and target
		or (Players:GetPlayerByUserId(target).Character or Players:GetPlayerByUserId(target).CharacterAdded:Wait())
	state = "State" .. state

	return AttributeTarget:GetAttribute(state) or default
end

StateManager.GetStates = function(target: number | Part)
	local AttributeTarget = typeof(target) == "Instance" and target
		or (Players:GetPlayerByUserId(target).Character or Players:GetPlayerByUserId(target).CharacterAdded:Wait())

	local States = {}
	for key, value in AttributeTarget:GetAttributes() do
		if key:sub(1, 5) == "State" then
			States[key] = value
		end
	end

	return States
end

StateManager.ClearStates = function(target: number | Part)
	local AttributeTarget = typeof(target) == "Instance" and target
		or (Players:GetPlayerByUserId(target).Character or Players:GetPlayerByUserId(target).CharacterAdded:Wait())

	for key, _ in pairs(AttributeTarget:GetAttributes()) do
		if key:sub(1, 5) == "State" then
			AttributeTarget:SetAttribute(key, nil)
		end
	end
end

return StateManager
