-- Script Hash: d9a4e0aded551b89c1ce537d272a205ede44538e8b8e74b36cb85ba4eb1701b1f7ce4f2b5e004f66b45902b40fb5270c
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
			local l__hotbar__9 = p2.props.Inventory.observedInventory.hotbar;
			local u13 = p2.props.Inventory.observedInventory.inventory.items[v7 + 1];
			local function v10(p3)
				return p3.item == u13;
			end;
			local v11 = nil;
			for v12, v13 in ipairs(l__hotbar__9) do
				if v10(v13, v12 - 1, l__hotbar__9) == true then
					v11 = v13;
					break;
				end;
			end;
			if v11 then
				u13 = nil;
			end;
		end;
		if nil then
			table.insert(v6, nil);
		end;	
	end;
	table.sort(v6, function(p4, p5)
		return p4.addedToBackpackTime < p5.addedToBackpackTime;
	end);
	local v14 = 0;
	local v15 = false;
	while true do
		if v15 then
			v14 = v14 + 1;
		else
			v15 = true;
		end;
		if not (v14 < 24) then
			break;
		end;
		local v16 = nil;
		if v14 < #v6 then
			v16 = v6[v14 + 1];
		end;
		local v17 = {};
		local v18 = {
			InvItem = v16, 
			AutoSelect = v14 == 0, 
			LayoutOrder = v14
		};
		v18.OnClick = v1.async(function()
			if v16 and v16.tool then
				local v19 = l__Players__3.LocalPlayer.Character;
				if v19 ~= nil then
					v19 = v19:FindFirstChild("ObservedChestFolder");
				end;
				local v20 = v1.await(v19);
				local v21 = v20;
				if v21 ~= nil then
					v21 = v21.Value;
				end;
				if v21 then
					return v1.await(l__default__4.Client:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(v20.Value, v16.tool));
				end;
			end;
		end);
		function v18.SendToHotbarSlot(p6)
			if v16 then
				l__ClientStore__5:dispatch({
					type = "InventoryAddToHotbar", 
					slot = p6, 
					item = v16
				});
			end;
		end;
		v18.TileBorderColor = l__ColorUtil__6.hexColor(5331056);
		v18.ItemClickLoadingProgress = true;
		v17[1] = v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.025), 
			PaddingBottom = UDim.new(0.025), 
			PaddingLeft = UDim.new(0.025), 
			PaddingRight = UDim.new(0.025)
		});
		v17[2] = v3.createElement(l__InventoryTile__2, v18);
		table.insert(v5, (v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = v14
		}, v17)));	
	end;
	local v22 = { v3.createElement(l__DarkBackground__7, {
			Transparent = false, 
			AppId = p2.props.AppId
		}) };
	local v23 = {};
	local v24 = {};
	if l__DeviceUtil__8.isSmallScreen() then
		local v25 = 0.45;
	else
		v25 = 0.5;
	end;
	if l__DeviceUtil__8.isSmallScreen() then
		local v26 = 0.5;
	else
		v26 = 0.4;
	end;
	v24.Size = UDim2.fromScale(v25, v26);
	if l__DeviceUtil__8.isSmallScreen() then
		local v27 = 0.68;
	else
		v27 = 0.72;
	end;
	v24.Position = UDim2.fromScale(0.5, v27);
	v24.AnchorPoint = Vector2.new(0.5, 1);
	v24.BorderSizePixel = 0;
	v24.BackgroundTransparency = 1;
	local v28 = { v3.createElement("UIAspectRatioConstraint", {
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
	local v29 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v30 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical"
		}), v3.createElement(l__InventoryHeader__10, {
			Title = "Inventory"
		}), v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(0, 0.01)
		}) };
	local v31 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v32 = {};
	local v33 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__ColorUtil__6.hexColor(1713718), 
		BorderSizePixel = 0
	};
	local v34 = { v3.createElement("UICorner", {
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
	local v35 = #v34;
	for v36, v37 in ipairs(v5) do
		v34[v35 + v36] = v37;
	end;
	v32[#v32 + 1] = v3.createElement("Frame", v33, v34);
	v30[#v30 + 1] = v3.createElement(l__EmptyButton__11, v31, v32);
	v28[#v28 + 1] = v3.createElement(l__Empty__1, v29, v30);
	v23[#v23 + 1] = v3.createElement("Frame", v24, v28);
	v22[#v22 + 1] = v3.createElement(l__SlideIn__12, {}, v23);
	return v3.createElement("ScreenGui", {
		DisplayOrder = 1
	}, v22);
end;
function v4.willUnmount(p7)
	task.spawn(function()
		l__default__4.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil);
	end);
end;
return {
	ChestInventoryApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p8, p9)
		local v38 = {
			Inventory = p8.Inventory
		};
		for v39, v40 in pairs(p9) do
			v38[v39] = v40;
		end;
		return v38;
	end)(v4)
};
