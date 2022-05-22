-- Script Hash: 3757432660e3703a4e5b5ffca41f45d409462ad9fcef90154832f09e166eae28cc4c925e22bc7f85648a49548d41f762
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("HotbarPartyMember");
function v3.init(p1)

end;
local l__Flamework__1 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__PlayerRender__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).PlayerRender;
function v3.render(p2)
	return v2.createElement("ImageButton", {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0, 
		AutoButtonColor = false, 
		ImageTransparency = 1, 
		LayoutOrder = p2.props.LayoutOrder, 
		[v2.Event.MouseButton1Click] = function()
			l__Flamework__1.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__2.PARTY, {});
		end
	}, { v2.createElement(l__PlayerRender__3, {
			Player = p2.props.Member, 
			Size = UDim2.fromScale(1, 1), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}, { v2.createElement("UICorner", {
				CornerRadius = UDim.new(1, 0)
			}) }) });
end;
return {
	HotbarPartyMember = v3
};
