local UserInputService = game:GetService("UserInputService")
local InputManager = {}

type KeybindTypes = { Began: boolean?, Ended: boolean?, Changed: boolean? }

local Keybindings: { [Enum.KeyCode]: { name: string, types: KeybindTypes, callback: ("Began" | "Ended" | "Changed") -> {} } } =
	{}

local function getKeyCodeFronName(name: string): Enum.KeyCode | nil
	for key, value in Keybindings do
		if value.name == name then
			return key
		end
	end

	print(Keybindings)
	return nil
end

InputManager.RegisterKeybinding = function(
	name: string,
	keyCode: Enum.KeyCode,
	types: KeybindTypes,
	callback: ("Began" | "Ended" | "Changed") -> {}
)
	Keybindings[keyCode] = { name = name, types = types, callback = callback }
	print(Keybindings)
end

InputManager.DeleteKeybinding = function(name: string, type: KeybindTypes)
	local keyCode = getKeyCodeFronName(name)
	if keyCode == nil then
		return
	end
	Keybindings[keyCode] = nil
end

InputManager.ModifyKeybinding = function(name: string, keyCode: Enum.KeyCode)
	print(Keybindings)

	local oldKeyCode = getKeyCodeFronName(name)
	if keyCode == nil or oldKeyCode == nil then
		return
	end
	print(oldKeyCode)
	print(Keybindings[oldKeyCode])
	Keybindings[keyCode] =
		{ name = name, types = Keybindings[oldKeyCode].types, callback = Keybindings[oldKeyCode].callback }
	Keybindings[oldKeyCode] = nil
end

local function handleInput(type: "Begin" | "Ended" | "Changed", key: InputObject, captured: boolean)
	if captured then
		return
	end

	local binding = Keybindings[key.KeyCode]
	if binding == nil then
		return
	end

	if
		(type == "Begin" and binding.types.Began)
		or (type == "Ended" and binding.types.Ended)
		or (type == "Changed" and binding.types.Changed)
	then
		binding.callback(type)
	end
end

UserInputService.InputBegan:Connect(function(key, captured)
	handleInput("Begin", key, captured)
end)
UserInputService.InputEnded:Connect(function(key, captured)
	handleInput("Ended", key, captured)
end)
UserInputService.InputChanged:Connect(function(key, captured)
	handleInput("Changed", key, captured)
end)

return InputManager
