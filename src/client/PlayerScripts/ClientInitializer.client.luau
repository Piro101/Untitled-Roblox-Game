local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Cmdr = require(ReplicatedStorage:WaitForChild("CmdrClient") :: any)

local StateManager = require(ReplicatedStorage.SharedManagers.StateManager)

local LocalPlayer = Players.LocalPlayer

script.Parent:WaitForChild("PlayerModule").CameraModule.MouseLockController:WaitForChild("BoundKeys").Value =
	"LeftAlt,RightAlt"

StateManager.SetState(LocalPlayer.UserId, "WalkSpeed", 12)
StateManager.SetState(LocalPlayer.UserId, "RunSpeed", 25)

Cmdr:SetActivationKeys({ Enum.KeyCode.F2 })
Cmdr:SetPlaceName("Paradox")
Cmdr:SetActivationUnlocksMouse(true)
