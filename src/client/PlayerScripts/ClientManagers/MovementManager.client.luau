local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local InputManager = require(script.Parent.InputManager)
local StateManager = require(ReplicatedStorage.SharedManagers.StateManager)

local LocalPlayer = Players.LocalPlayer

local function RunHandler(type: "Began" | "Ended" | "Changed")
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local isRunning = StateManager.GetState(LocalPlayer.UserId, "Running", false)
	local WalkSpeed = StateManager.GetState(LocalPlayer.UserId, "WalkSpeed", 16)
	local RunSpeed = StateManager.GetState(LocalPlayer.UserId, "RunSpeed", 22)

	if isRunning then
		Character.Humanoid.WalkSpeed = WalkSpeed
		Character.Animate.walk.WalkAnim.AnimationId = "rbxassetid://96397642127365" --112876478166596" --95704587526270" -- Walk Attempt 6
	else
		Character.Humanoid.WalkSpeed = RunSpeed
		Character.Animate.walk.WalkAnim.AnimationId = "rbxassetid://83834999525441" -- Run attempt 1
	end

	StateManager.SetState(LocalPlayer.UserId, "Running", not isRunning)
	print("Set WalkSpeed to ", Character.Humanoid.WalkSpeed)
end

InputManager.RegisterKeybinding("Run", Enum.KeyCode.LeftShift, { Began = true }, RunHandler)
