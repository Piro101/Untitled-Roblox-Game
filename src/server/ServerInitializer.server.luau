-- local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cmdr = require(game:GetService("ServerScriptService").ServerPackages.cmdr)

Cmdr:RegisterDefaultCommands()
Cmdr:RegisterCommandsIn(script.Parent.Misc.CmdrCommands)
