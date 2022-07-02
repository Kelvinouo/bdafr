-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("ChestInventoryAppBase");
function v4.init(p1)

end;
local l__Empty__1 = v2.Empty;
local l__InventoryTile__2 = v1.import(script, script.Parent.Parent.Parent, "ui", "inventory-tile").InventoryTile;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__ColorUtil__6 = v2.ColorUtil;
local l__DarkBackground__7 = v2.DarkBackground;
local l__DeviceUtil__8 = v2.DeviceUtil;
local l__InventoryChest__9 = v1.import(script, script.Parent, "inventory-chest").InventoryChest;
local l__InventoryHeader__10 = v1.import(script, script.Parent.Parent.Parent, "ui", "inventory-header").InventoryHeader;
local l__EmptyButton__11 = v2.EmptyButton;
local l__SlideIn__12 = v2.SlideIn;
function v4.render(p2)
	local v5 = {};
	local v6 = {};
	local v7 = 0;
	local v8 = false;
	while true do
		if v8 then
			v7 = v7 + 1;
		else
			v8 = true;
		end;
		if not (v7 < 32) then
			break;
		end;
		if v7 < #p2.props.Inventory.observedInventory.inventory.items then
			local u13 = p2.props.Inventory.observedInventory.inventory.items[v7 + 1];
			local v9 = nil;
			for v10, v11 in ipairs(p2.props.Inventory.observedInventory.hotbar) do
				if v11.item == u13 == true then
					v9 = v11;
					break;
				end;
			end;
			if v9 then
				u13 = nil;
			end;
		end;
		if nil then
			table.insert(v6, nil);
		end;	
	end;
	table.sort(v6, function(p3, p4)
		return p3.addedToBackpackTime < p4.addedToBackpackTime;
	end);
	local v12 = 0;
	local v13 = false;
	while true do
		if v13 then
			v12 = v12 + 1;
		else
			v13 = true;
		end;
		if not (v12 < 24) then
			break;
		end;
		local v14 = nil;
		if v12 < #v6 then
			v14 = v6[v12 + 1];
		end;
		local v15 = {};
		local v16 = {
			InvItem = v14, 
			AutoSelect = v12 == 0, 
			LayoutOrder = v12
		};
		v16.OnClick = v1.async(function()
			if v14 and v14.tool then
				local v17 = l__Players__3.LocalPlayer.Character;
				if v17 ~= nil then
					v17 = v17:FindFirstChild("ObservedChestFolder");
				end;
				local v18 = v1.await(v17);
				local v19 = v18;
				if v19 ~= nil then
					v19 = v19.Value;
				end;
				if v19 then
					return v1.await(l__default__4.Client:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(v18.Value, v14.tool));
				end;
			end;
		end);
		function v16.SendToHotbarSlot(p5)
			if v14 then
				l__ClientStore__5:dispatch({
					type = "InventoryAddToHotbar", 
					slot = p5, 
					item = v14
				});
			end;
		end;
		v16.TileBorderColor = l__ColorUtil__6.hexColor(5331056);
		v16.ItemClickLoadingProgress = true;
		v15[1] = v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.025), 
			PaddingBottom = UDim.new(0.025), 
			PaddingLeft = UDim.new(0.025), 
			PaddingRight = UDim.new(0.025)
		});
		v15[2] = v3.createElement(l__InventoryTile__2, v16);
		table.insert(v5, (v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = v12
		}, v15)));	
	end;
	local v20 = { v3.createElement(l__DarkBackground__7, {
			Transparent = false, 
			AppId = p2.props.AppId
		}) };
	local v21 = {};
	local v22 = {};
	if l__DeviceUtil__8.isSmallScreen() then
		local v23 = 0.45;
	else
		v23 = 0.5;
	end;
	if l__DeviceUtil__8.isSmallScreen() then
		local v24 = 0.5;
	else
		v24 = 0.4;
	end;
	v22.Size = UDim2.fromScale(v23, v24);
	if l__DeviceUtil__8.isSmallScreen() then
		local v25 = 0.68;
	else
		v25 = 0.72;
	end;
	v22.Position = UDim2.fromScale(0.5, v25);
	v22.AnchorPoint = Vector2.new(0.5, 1);
	v22.BorderSizePixel = 0;
	v22.BackgroundTransparency = 1;
	local v26 = { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1.5
		}), v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center"
		}), v3.createElement(l__InventoryChest__9, {
			ObservedChest = p2.props.Inventory.observedInventory.observedChest
		}), v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(0.08, 0)
		}) };
	local v27 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v28 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical"
		}), v3.createElement(l__InventoryHeader__10, {
			Title = "Inventory"
		}), v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(0, 0.01)
		}) };
	local v29 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v30 = {};
	local v31 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__ColorUtil__6.hexColor(1713718), 
		BorderSizePixel = 0
	};
	local v32 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0, 6)
		}), v3.createElement("UIPadding", {
			PaddingLeft = UDim.new(0.02, 0), 
			PaddingRight = UDim.new(0.02, 0), 
			PaddingTop = UDim.new(0.03, 0), 
			PaddingBottom = UDim.new(0.03, 0)
		}), v3.createElement("UIGridLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center", 
			CellSize = UDim2.fromScale(0.14666666666666667, 0.23), 
			CellPadding = UDim2.fromScale(0.02, 0.02), 
			SortOrder = "LayoutOrder"
		}) };
	local v33 = #v32;
	for v34, v35 in ipairs(v5) do
		v32[v33 + v34] = v35;
	end;
	v30[#v30 + 1] = v3.createElement("Frame", v31, v32);
	v28[#v28 + 1] = v3.createElement(l__EmptyButton__11, v29, v30);
	v26[#v26 + 1] = v3.createElement(l__Empty__1, v27, v28);
	v21[#v21 + 1] = v3.createElement("Frame", v22, v26);
	v20[#v20 + 1] = v3.createElement(l__SlideIn__12, {}, v21);
	return v3.createElement("ScreenGui", {
		DisplayOrder = 1
	}, v20);
end;
function v4.willUnmount(p6)
	task.spawn(function()
		l__default__4.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil);
	end);
end;
return {
	ChestInventoryApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p7, p8)
		local v36 = {
			Inventory = p7.Inventory
		};
		for v37, v38 in pairs(p8) do
			v36[v37] = v38;
		end;
		return v36;
	end)(v4)
};
