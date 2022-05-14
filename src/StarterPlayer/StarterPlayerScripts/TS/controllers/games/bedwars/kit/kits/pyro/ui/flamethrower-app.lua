-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("FlamethrowerUpgradeAppBase");
function v4.init(p1)

end;
local l__InventoryUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__DarkBackground__4 = v2.DarkBackground;
local l__SlideIn__5 = v2.SlideIn;
local l__DeviceUtil__6 = v2.DeviceUtil;
local l__FlamethrowerComponent__7 = v1.import(script, script.Parent, "flamethrower-component").FlamethrowerComponent;
function v4.render(p2)
	local v5 = l__InventoryUtil__1.getToolFromInventory(l__Players__2.LocalPlayer, l__ItemType__3.FLAMETHROWER);
	if v5 ~= nil then
		v5 = v5.tool;
	end;
	local v6 = {};
	local v7 = {};
	local v8 = {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5)
	};
	if l__DeviceUtil__6.isSmallScreen() then
		local v9 = UDim2.fromScale(0.9, 0.9);
	else
		v9 = UDim2.fromScale(0.7, 0.7);
	end;
	v8.Size = v9;
	v8.BackgroundTransparency = 1;
	v8.AutoButtonColor = false;
	v8.Active = true;
	v8.Modal = true;
	v7[1] = v3.createElement("ImageButton", v8, { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1.7735849056603774
		}), v3.createElement(l__FlamethrowerComponent__7, {
			tool = v5
		}) });
	v6[1] = v3.createElement(l__DarkBackground__4, {
		AppId = p2.props.AppId
	});
	v6[2] = v3.createElement(l__SlideIn__5, {}, v7);
	return v3.createElement("ScreenGui", {
		DisplayOrder = 20
	}, v6);
end;
return {
	FlamethrowerUpgradeApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p3, p4)
		return p4;
	end)(v4)
};
