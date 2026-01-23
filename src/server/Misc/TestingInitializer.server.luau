local Workspace = game:GetService("Workspace")
local ReplicatedService = game:GetService("ReplicatedStorage")

local StateManager = require(ReplicatedService.SharedManagers.StateManager)

StateManager.SetState(Workspace.Parry, "Parrying")
StateManager.SetState(Workspace.Block, "Blocking")
