
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__BillboardComponent__3 = v1.import(script, script.Parent, "billboard.component").BillboardComponent;
return function(p1)
	local u4 = u1.mount(u1.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromOffset(250, 50), 
		BackgroundTransparency = 1, 
		BackgroundColor3 = l__ColorUtil__2.hexColor(32633329)
	}, { u1.createElement(l__BillboardComponent__3, {
			ItemPadding = UDim.new(0, 5), 
			Texts = { {
					Text = "Bedwars (Squads)", 
					TextColor = l__ColorUtil__2.hexColor(16382311), 
					LabelSize = UDim2.fromScale(1, 0.6)
				}, {
					Text = "Teams of 4", 
					TextColor = l__ColorUtil__2.hexColor(10088686), 
					LabelSize = UDim2.fromScale(0.5, 0.35)
				} }
		}) }), p1);
	return function()
		return u1.unmount(u4);
	end;
end;

