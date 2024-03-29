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
			local v10, v11, v12 = ipairs(p2.props.Inventory.observedInventory.hotbar);
			while true do
				v10(v11, v12);
				if not v10 then
					break;
				end;
				v12 = v10;
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
	local v13 = 0;
	local v14 = false;
	while true do
		if v14 then
			v13 = v13 + 1;
		else
			v14 = true;
		end;
		if not (v13 < 24) then
			break;
		end;
		local v15 = nil;
		if v13 < #v6 then
			v15 = v6[v13 + 1];
		end;
		local v16 = {};
		local v17 = {
			InvItem = v15, 
			AutoSelect = v13 == 0, 
			LayoutOrder = v13
		};
		v17.OnClick = v1.async(function()
			if v15 and v15.tool then
				local v18 = l__Players__3.LocalPlayer.Character;
				if v18 ~= nil then
					v18 = v18:FindFirstChild("ObservedChestFolder");
				end;
				local v19 = v1.await(v18);
				local v20 = v19;
				if v20 ~= nil then
					v20 = v20.Value;
				end;
				if v20 then
					return v1.await(l__default__4.Client:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(v19.Value, v15.tool));
				end;
			end;
		end);
		function v17.SendToHotbarSlot(p5)
			if v15 then
				l__ClientStore__5:dispatch({
					type = "InventoryAddToHotbar", 
					slot = p5, 
					item = v15
				});
			end;
		end;
		v17.TileBorderColor = l__ColorUtil__6.hexColor(5331056);
		v17.ItemClickLoadingProgress = true;
		v16[1] = v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.025), 
			PaddingBottom = UDim.new(0.025), 
			PaddingLeft = UDim.new(0.025), 
			PaddingRight = UDim.new(0.025)
		});
		v16[2] = v3.createElement(l__InventoryTile__2, v17);
		table.insert(v5, (v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = v13
		}, v16)));	
	end;
	local v21 = { v3.createElement(l__DarkBackground__7, {
			Transparent = false, 
			AppId = p2.props.AppId
		}) };
	local v22 = {};
	local v23 = {};
	if l__DeviceUtil__8.isSmallScreen() then
		local v24 = 0.45;
	else
		v24 = 0.5;
	end;
	if l__DeviceUtil__8.isSmallScreen() then
		local v25 = 0.5;
	else
		v25 = 0.4;
	end;
	v23.Size = UDim2.fromScale(v24, v25);
	if l__DeviceUtil__8.isSmallScreen() then
		local v26 = 0.68;
	else
		v26 = 0.72;
	end;
	v23.Position = UDim2.fromScale(0.5, v26);
	v23.AnchorPoint = Vector2.new(0.5, 1);
	v23.BorderSizePixel = 0;
	v23.BackgroundTransparency = 1;
	local v27 = { v3.createElement("UIAspectRatioConstraint", {
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
	local v28 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v29 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical"
		}), v3.createElement(l__InventoryHeader__10, {
			Title = "Inventory"
		}), v3.createElement(l__Empty__1, {
			Size = UDim2.fromScale(0, 0.01)
		}) };
	local v30 = {
		Size = UDim2.fromScale(1, 1)
	};
	local v31 = {};
	local v32 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__ColorUtil__6.hexColor(1713718), 
		BorderSizePixel = 0
	};
	local v33 = { v3.createElement("UICorner", {
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
	local v34 = #v33;
	local v35, v36, v37 = ipairs(v5);
	while true do
		v35(v36, v37);
		if not v35 then
			break;
		end;
		v37 = v35;
		v33[v34 + v35] = v36;	
	end;
	v31[#v31 + 1] = v3.createElement("Frame", v32, v33);
	v29[#v29 + 1] = v3.createElement(l__EmptyButton__11, v30, v31);
	v27[#v27 + 1] = v3.createElement(l__Empty__1, v28, v29);
	v22[#v22 + 1] = v3.createElement("Frame", v23, v27);
	v21[#v21 + 1] = v3.createElement(l__SlideIn__12, {}, v22);
	return v3.createElement("ScreenGui", {
		DisplayOrder = 1
	}, v21);
end;
function v4.willUnmount(p6)
	task.spawn(function()
		l__default__4.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil);
	end);
end;
return {
	ChestInventoryApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p7, p8)
		local v38 = {
			Inventory = p7.Inventory
		};
		for v39, v40 in pairs(p8) do
			v38[v39] = v40;
		end;
		return v38;
	end)(v4)
};
