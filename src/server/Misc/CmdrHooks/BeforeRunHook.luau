return function(registry)
	registry:RegisterHook("BeforeRun", function(context): string | nil
		if context.Group == "DefaultAdmin" and context.Executor.UserId ~= game.CreatorId then
			return "You don't have permission to run this command"
		end
		return nil
	end)
end
