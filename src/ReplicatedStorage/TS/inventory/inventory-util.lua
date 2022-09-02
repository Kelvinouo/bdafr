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
	local v7, v8, v9 = ipairs(v5);
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		v6[v7] = "empty";	
	end;
	v4.armor = v6;
	v4.backpack = nil;
	local v10 = l__EntityUtil__3:getEntity(p1);
	if not v10 then
		return v4;
	end;
	local v11 = v10:getInventoryFolder();
	if v11 then
		local v12, v13, v14 = ipairs(v11:GetChildren());
		while true do
			v12(v13, v14);
			if not v12 then
				break;
			end;
			v14 = v12;
			table.insert(v4.items, {
				tool = v13, 
				itemType = v13.Name, 
				amount = v13:GetAttribute("Amount"), 
				addedToBackpackTime = v13:GetAttribute("AddedToBackpackTime"), 
				itemSkin = v13:GetAttribute("ItemSkin")
			});		
		end;
	end;
	local v15 = 0;
	local v16 = false;
	while true do
		if v16 then
			v15 = v15 + 1;
		else
			v16 = true;
		end;
		if not (v15 < #u1.keys(l__ArmorSlot__2)) then
			break;
		end;
		local v17 = v10:getInstance():FindFirstChild("ArmorInvItem_" .. tostring(v15));
		local v18 = v17;
		if v18 ~= nil then
			v18 = v18.Value;
		end;
		if v18 then
			local l__Value__19 = v17.Value;
			table.insert(v4.armor, {
				tool = l__Value__19, 
				itemType = l__Value__19.Name, 
				amount = l__Value__19:GetAttribute("Amount"), 
				addedToBackpackTime = l__Value__19:GetAttribute("AddedToBackpackTime"), 
				itemSkin = l__Value__19:GetAttribute("ItemSkin")
			});
		end;	
	end;
	local l__Backpack__20 = v10:getInstance():FindFirstChild("Backpack");
	local v21 = l__Backpack__20;
	if v21 ~= nil then
		v21 = v21.Value;
	end;
	if v21 then
		local l__Value__22 = l__Backpack__20.Value;
		v4.backpack = {
			tool = l__Value__22, 
			itemType = l__Value__22.Name, 
			amount = l__Value__22:GetAttribute("Amount"), 
			addedToBackpackTime = l__Value__22:GetAttribute("AddedToBackpackTime"), 
			itemSkin = l__Value__22:GetAttribute("ItemSkin")
		};
	end;
	local v23 = v10:getItemInHand();
	if v23 then
		v4.hand = {
			tool = v23, 
			itemType = v23.Name, 
			amount = v23:GetAttribute("Amount"), 
			addedToBackpackTime = v23:GetAttribute("AddedToBackpackTime"), 
			itemSkin = v23:GetAttribute("ItemSkin")
		};
	end;
	return v4;
end;
v2.getInventory = v3;
local u4 = v3;
function v2.getToolFromInventory(p2, p3)
	local v24, v25, v26 = ipairs(u4(p2).items);
	while true do
		v24(v25, v26);
		if not v24 then
			break;
		end;
		v26 = v24;
		if v25.itemType == p3 == true then
			return v25;
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
	local u5 = {};
	local u6 = 0;
	local v27, v28, v29 = ipairs(v2.getInventory(p4).items);
	while true do
		v27(v28, v29);
		if not v27 then
			break;
		end;
		v29 = v27;
		if u5[v28.tool] == nil then
			u5[v28.tool] = true;
			if v28.itemType == p5 then
				u6 = u6 + v28.amount;
			end;
		end;	
	end;
	return p6 <= u6;
end;
function v2.getAmount(p7, p8)
	local u7 = {};
	local u8 = 0;
	local v30, v31, v32 = ipairs(v2.getInventory(p7).items);
	while true do
		v30(v31, v32);
		if not v30 then
			break;
		end;
		v32 = v30;
		if u7[v31.tool] == nil then
			u7[v31.tool] = true;
			if v31.itemType == p8 then
				u8 = u8 + v31.amount;
			end;
		end;	
	end;
	return 0;
end;
u4 = {
	InventoryUtil = v2
};
return u4;
