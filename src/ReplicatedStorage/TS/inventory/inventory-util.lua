-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ArmorSlot__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local function v3(p1)
	local v4 = {
		hand = nil, 
		items = {}
	};
	local v5 = u1.values(l__ArmorSlot__2);
	local v6 = table.create(#v5);
	for v7, v8 in ipairs(v5) do
		v6[v7] = "empty";
	end;
	v4.armor = v6;
	local v9 = l__EntityUtil__3:getEntity(p1);
	if not v9 then
		return v4;
	end;
	local v10 = v9:getInventoryFolder();
	if v10 then
		for v11, v12 in ipairs(v10:GetChildren()) do
			table.insert(v4.items, {
				tool = v12, 
				itemType = v12.Name, 
				amount = v12:GetAttribute("Amount"), 
				addedToBackpackTime = v12:GetAttribute("AddedToBackpackTime"), 
				itemSkin = v12:GetAttribute("ItemSkin")
			});
		end;
	end;
	local v13 = 0;
	local v14 = false;
	while true do
		if v14 then
			v13 = v13 + 1;
		else
			v14 = true;
		end;
		if not (v13 < #u1.keys(l__ArmorSlot__2)) then
			break;
		end;
		local v15 = v9:getInstance():FindFirstChild("ArmorInvItem_" .. tostring(v13));
		local v16 = v15;
		if v16 ~= nil then
			v16 = v16.Value;
		end;
		if v16 then
			local l__Value__17 = v15.Value;
			table.insert(v4.armor, {
				tool = l__Value__17, 
				itemType = l__Value__17.Name, 
				amount = l__Value__17:GetAttribute("Amount"), 
				addedToBackpackTime = l__Value__17:GetAttribute("AddedToBackpackTime"), 
				itemSkin = l__Value__17:GetAttribute("ItemSkin")
			});
		end;	
	end;
	local v18 = v9:getItemInHandClient();
	if v18 then
		v4.hand = {
			tool = v18, 
			itemType = v18.Name, 
			amount = v18:GetAttribute("Amount"), 
			addedToBackpackTime = v18:GetAttribute("AddedToBackpackTime"), 
			itemSkin = v18:GetAttribute("ItemSkin")
		};
		table.insert(v4.items, v4.hand);
	end;
	return v4;
end;
v2.getInventory = v3;
function v2.getToolFromInventory(p2, p3)
	for v19, v20 in ipairs(v3(p2).items) do
		if v20.itemType == p3 == true then
			return v20;
		end;
	end;
	return nil;
end;
function v2.hasEnough(p4, p5, p6)
	if p6 < 0 then
		return false;
	end;
	if p6 ~= p6 then
		return false;
	end;
	if type(p6) ~= "number" then
		return false;
	end;
	local u4 = 0;
	for v21, v22 in ipairs(v2.getInventory(p4).items) do
		if v22.itemType == p5 then
			u4 = u4 + v22.amount;
		end;
	end;
	return p6 <= u4;
end;
function v2.getAmount(p7, p8)
	local u5 = 0;
	for v23, v24 in ipairs(v2.getInventory(p7).items) do
		if v24.itemType == p8 then
			u5 = u5 + v24.amount;
		end;
	end;
	return 0;
end;
return {
	InventoryUtil = v2
};
