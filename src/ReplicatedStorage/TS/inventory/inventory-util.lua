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
	local function v6()
		return "empty";
	end;
	local v7 = table.create(#v5);
	for v8, v9 in ipairs(v5) do
		v7[v8] = v6(v9, v8 - 1, v5);
	end;
	v4.armor = v7;
	local v10 = l__EntityUtil__3:getEntity(p1);
	if not v10 then
		return v4;
	end;
	local v11 = v10:getInventoryFolder();
	if v11 then
		for v12, v13 in ipairs(v11:GetChildren()) do
			table.insert(v4.items, {
				tool = v13, 
				itemType = v13.Name, 
				amount = v13:GetAttribute("Amount"), 
				addedToBackpackTime = v13:GetAttribute("AddedToBackpackTime"), 
				itemSkin = v13:GetAttribute("ItemSkin")
			});
		end;
	end;
	local v14 = 0;
	local v15 = false;
	while true do
		if v15 then
			v14 = v14 + 1;
		else
			v15 = true;
		end;
		if not (v14 < #u1.keys(l__ArmorSlot__2)) then
			break;
		end;
		local v16 = v10:getInstance():FindFirstChild("ArmorInvItem_" .. tostring(v14));
		local v17 = v16;
		if v17 ~= nil then
			v17 = v17.Value;
		end;
		if v17 then
			local l__Value__18 = v16.Value;
			table.insert(v4.armor, {
				tool = l__Value__18, 
				itemType = l__Value__18.Name, 
				amount = l__Value__18:GetAttribute("Amount"), 
				addedToBackpackTime = l__Value__18:GetAttribute("AddedToBackpackTime"), 
				itemSkin = l__Value__18:GetAttribute("ItemSkin")
			});
		end;	
	end;
	local v19 = v10:getItemInHandClient();
	if v19 then
		v4.hand = {
			tool = v19, 
			itemType = v19.Name, 
			amount = v19:GetAttribute("Amount"), 
			addedToBackpackTime = v19:GetAttribute("AddedToBackpackTime"), 
			itemSkin = v19:GetAttribute("ItemSkin")
		};
		table.insert(v4.items, v4.hand);
	end;
	return v4;
end;
v2.getInventory = v3;
function v2.getToolFromInventory(p2, p3)
	local l__items__20 = v3(p2).items;
	local function v21(p4)
		return p4.itemType == p3;
	end;
	for v22, v23 in ipairs(l__items__20) do
		if v21(v23, v22 - 1, l__items__20) == true then
			return v23;
		end;
	end;
	return nil;
end;
function v2.hasEnough(p5, p6, p7)
	local l__items__24 = v2.getInventory(p5).items;
	local u4 = 0;
	local function v25(p8)
		if p8.itemType == p6 then
			u4 = u4 + p8.amount;
		end;
	end;
	for v26, v27 in ipairs(l__items__24) do
		v25(v27, v26 - 1, l__items__24);
	end;
	return p7 <= u4;
end;
return {
	InventoryUtil = v2
};
