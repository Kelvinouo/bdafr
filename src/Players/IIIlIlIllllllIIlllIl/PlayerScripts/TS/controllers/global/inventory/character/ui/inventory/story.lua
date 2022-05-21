-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__CreateRoduxApp__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__InventoryApp__4 = v1.import(script, script.Parent, "inventory-app").InventoryApp;
local l__HotbarApp__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "hotbar", "ui", "hotbar-app").HotbarApp;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local function u7(p1, p2)
	if p2 == nil then
		p2 = 1;
	end;
	local v2 = u1("Accessory", {
		Name = p1, 
		Children = { u1("Part", {
				Name = "Handle", 
				Size = Vector3.new(0.8, 0.8, 0.8), 
				Material = Enum.Material.SmoothPlastic, 
				CFrame = CFrame.new(), 
				Children = { u1("Attachment", {
						Name = "RightGripAttachment", 
						CFrame = CFrame.new()
					}) }
			}) }
	});
	v2:SetAttribute("InvItem", true);
	v2:SetAttribute("Amount", p2);
	v2:SetAttribute("AddedToBackpackTime", l__Workspace__2:GetServerTimeNow());
	return v2;
end;
local l__ItemType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p3)
	local v3 = l__CreateRoduxApp__3("Inventory", l__InventoryApp__4, {}, {}, {
		Parent = p3
	});
	local v4 = l__CreateRoduxApp__3("Hotbar", l__HotbarApp__5, {}, {}, {
		Parent = p3
	});
	l__ClientStore__6:dispatch({
		type = "InventoryAddItem", 
		tool = u7(l__ItemType__8.STONE)
	});
	l__ClientStore__6:dispatch({
		type = "InventoryAddItem", 
		tool = u7(l__ItemType__8.STONE_BRICK, 5)
	});
	l__ClientStore__6:dispatch({
		type = "InventoryAddItem", 
		tool = u7(l__ItemType__8.WOOL_RED, 4)
	});
	l__ClientStore__6:dispatch({
		type = "InventoryAddItem", 
		tool = u7(l__ItemType__8.WOOL_WHITE, 20)
	});
	l__ClientStore__6:dispatch({
		type = "InventoryAddItem", 
		tool = u7(l__ItemType__8.WOOL_BLUE, 45)
	});
	return function()
		u9.unmount(v3);
		u9.unmount(v4);
	end;
end;
