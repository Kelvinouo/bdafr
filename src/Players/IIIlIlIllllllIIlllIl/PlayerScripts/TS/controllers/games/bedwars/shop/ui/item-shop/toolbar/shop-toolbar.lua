-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("ShopToolbar");
function v3.init(p1)

end;
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
function v3.render(p2)
	local l__items__4 = l__ClientStore__1:getState().Inventory.observedInventory.inventory.items;
	local u4 = 0;
	local u5 = 0;
	local u6 = 0;
	local function v5(p3)
		if p3.itemType == l__ItemType__2.IRON then
			u4 = u4 + p3.amount;
			return;
		end;
		if p3.itemType == l__ItemType__2.DIAMOND then
			u5 = u5 + p3.amount;
			return;
		end;
		if p3.itemType == l__ItemType__2.EMERALD then
			u6 = u6 + p3.amount;
		end;
	end;
	for v6, v7 in ipairs(l__items__4) do
		v5(v7, v6 - 1, l__items__4);
	end;
	return v2.createElement("Frame", {
		Size = p2.props.Size, 
		BackgroundColor3 = l__ColorUtil__3.hexColor(3092550), 
		BorderSizePixel = 0
	}, { v2.createElement("TextLabel", {
			Text = "<b>Item Shop</b>", 
			Size = UDim2.fromScale(0.3, 0.5), 
			Position = UDim2.fromScale(0.03, 0.5), 
			AnchorPoint = Vector2.new(0, 0.5), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Font = "Roboto", 
			TextScaled = true, 
			RichText = true, 
			TextXAlignment = "Left", 
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}), v2.createElement("TextLabel", {
			Text = "<b>" .. tostring(u4) .. " Iron    <font color=\"#55FFFF\">" .. tostring(u5) .. " Diamond</font>    <font color=\"#55FF99\">" .. tostring(u6) .. " Emerald</font></b>", 
			Size = UDim2.fromScale(0.97, 0.4), 
			Position = UDim2.fromScale(0.95, 0.5), 
			AnchorPoint = Vector2.new(1, 0.5), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Font = "Roboto", 
			TextScaled = true, 
			RichText = true, 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			TextXAlignment = "Right"
		}) });
end;
return {
	ShopToolbar = v3
};
