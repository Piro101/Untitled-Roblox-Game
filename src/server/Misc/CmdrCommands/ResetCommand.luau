return {
	Name = "reset",
	Aliases = { "re" },
	Description = "Safely refreshes a player",
	Group = "Mod",
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "The target",
		},
	},
}
