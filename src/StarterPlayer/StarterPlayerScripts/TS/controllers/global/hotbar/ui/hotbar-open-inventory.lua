
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("HotbarOpenInventory");
function v4.init(p1)

end;
local l__UserInputService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).UserInputService;
local l__ColorUtil__2 = v2.ColorUtil;
local l__BedwarsAppIds__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ImageId__7 = v2.ImageId;
local l__Empty__8 = v2.Empty;
function v4.render(p2)
	local v5 = "E";
	if l__UserInputService__1.GamepadEnabled and not l__UserInputService__1.KeyboardEnabled then
		v5 = "Y";
	end;
	local v6 = {};
	v6[#v6 + 1] = v3.createElement("ImageButton", {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY", 
		BackgroundColor3 = l__ColorUtil__2.hexColor(1909806), 
		BackgroundTransparency = 0.4, 
		BorderMode = "Inset", 
		BorderSizePixel = 1, 
		BorderColor3 = l__ColorUtil__2.hexColor(7503788), 
		LayoutOrder = p2.props.LayoutOrder, 
		Image = nil, 
		Selectable = table.find(p2.props.store.AppInfo.openApps, l__BedwarsAppIds__3.INVENTORY) ~= nil, 
		[v3.Event.MouseButton1Click] = function()
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__3.INVENTORY, {});
		end, 
		[v3.Event.MouseEnter] = function(p3)
			l__SoundManager__5:playSound(l__GameSound__6.UI_HOVER);
		end
	}, { v3.createElement("Frame", {
			Size = UDim2.fromScale(0.88, 0.88), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BorderSizePixel = 0, 
			BackgroundColor3 = l__ColorUtil__2.hexColor(5331056), 
			BackgroundTransparency = 1
		}, { v3.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.7, 0.7), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Image = l__ImageId__7.ELLIPSIS
			}) }), l__UserInputService__1.KeyboardEnabled and true and v3.createElement("TextLabel", {
			Text = "<b>" .. v5 .. "</b>", 
			Size = UDim2.fromScale(0.23, 0.23), 
			Position = UDim2.fromScale(0, 0), 
			BackgroundColor3 = l__ColorUtil__2.hexColor(7503788), 
			BorderSizePixel = 0, 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			Font = "Roboto", 
			TextScaled = true, 
			RichText = true
		}, { v3.createElement("UICorner", {
				CornerRadius = UDim.new(0.1, 0)
			}), v3.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0)
			}) }) });
	return v3.createElement(l__Empty__8, {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY"
	}, v6);
end;
return {
	HotbarOpenInventory = v4
};

