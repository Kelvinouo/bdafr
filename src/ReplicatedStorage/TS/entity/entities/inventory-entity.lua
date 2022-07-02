-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__Entity__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity").Entity;
local v4 = setmetatable({}, {
	__tostring = function()
		return "InventoryEntity";
	end, 
	__index = l__Entity__3
});
v4.__index = v4;
local u1 = l__Entity__3;
function v4.constructor(p1, p2)
	u1.constructor(p1, p2);
end;
local l__HttpService__2 = v2.HttpService;
local l__Players__3 = v2.Players;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ReplicatedStorage__5 = v2.ReplicatedStorage;
local l__CollectionService__6 = v2.CollectionService;
function v4.onServerSetup(p3)
	u1.onServerSetup(p3);
	local v5 = l__HttpService__2:GenerateGUID(false);
	local v6 = l__Players__3:GetPlayerFromCharacter(p3.instance);
	if v6 then
		v5 = v6.Name;
	end;
	u4("ObjectValue", {
		Name = "InventoryFolder", 
		Value = u4("Folder", {
			Name = v5, 
			Parent = l__ReplicatedStorage__5:WaitForChild("Inventories")
		}), 
		Parent = p3.instance
	});
	u4("ObjectValue", {
		Name = "HandInvItem", 
		Value = nil, 
		Parent = p3.instance
	});
	local v7 = 0;
	local v8 = false;
	while true do
		if v8 then
			v7 = v7 + 1;
		else
			v8 = true;
		end;
		if not (v7 < 3) then
			break;
		end;
		u4("ObjectValue", {
			Name = "ArmorInvItem_" .. tostring(v7), 
			Value = nil, 
			Parent = p3.instance
		});	
	end;
	u4("ObjectValue", {
		Name = "ObservedChestFolder", 
		Value = nil, 
		Parent = p3.instance
	});
	l__CollectionService__6:AddTag(p3.instance, "inventory-entity");
end;
function v4.kill(p4)
	u1.kill(p4);
	local v9 = p4:getInventoryFolder();
	if v9 ~= nil then
		v9:Destroy();
	end;
end;
function v4.waitForInventoryFolder(p5)
	return p5.instance:WaitForChild("InventoryFolder").Value;
end;
function v4.getInventoryFolder(p6)
	local v10 = p6.instance:FindFirstChild("InventoryFolder");
	if v10 ~= nil then
		v10 = v10.Value;
	end;
	return v10;
end;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.inventoryFolderAddedEvent(p7, p8)
	local u8 = u7.new();
	u8:GiveTask(p7.instance.ChildAdded:Connect(function(p9)
		if p9.Name == "InventoryFolder" and p9:IsA("ObjectValue") then
			local l__Value__11 = p9.Value;
			if l__Value__11 then
				p8(l__Value__11);
			end;
			u8:GiveTask(p9.Changed:Connect(function(p10)
				if p10 then
					p8(p10);
				end;
			end));
		end;
	end));
	return u8;
end;
function v4.getItemInHandClient(p11)
	for v12, v13 in ipairs((p11.instance:GetChildren())) do
		local v14 = false;
		if v13:GetAttribute("InvItem") == true then
			v14 = v13:GetAttribute("ArmorSlot") == nil;
		end;
		if v14 == true then
			return v13;
		end;
	end;
	return nil;
end;
function v4.getItemInHand(p12)
	if not p12.instance:FindFirstChild("HandInvItem") then
		return nil;
	end;
	return p12.instance.HandInvItem.Value;
end;
function v4.getItemTypeInHand(p13)
	if not p13.instance:FindFirstChild("HandInvItem") then
		return nil;
	end;
	local v15 = p13.instance.HandInvItem.Value;
	if v15 ~= nil then
		v15 = v15.Name;
	end;
	return v15;
end;
function v4.getItemsFromArmorSlot(p14, p15)
	local v16 = {};
	local v17 = 0;
	local v18, v19, v20 = ipairs((p14.instance:GetChildren()));
	while true do
		local v21, v22 = v18(v19, v20);
		if not v21 then
			break;
		end;
		if v22:GetAttribute("ArmorSlot") == p15 == true then
			v17 = v17 + 1;
			v16[v17] = v22;
		end;	
	end;
	return v16;
end;
function v4.getHandItemInstanceFromCharacter(p16)
	local v23 = p16:getItemInHand();
	if not v23 then
		return nil;
	end;
	local v24 = p16.instance:FindFirstChild(v23.Name);
	if v24 and v24:IsA("Accessory") then
		return v24;
	end;
	return nil;
end;
function v4.getItemInstanceFromCharacter(p17, p18)
	local v25 = p17.instance:FindFirstChild(p18);
	if v25 and v25:IsA("Accessory") then
		return v25;
	end;
	return nil;
end;
function v4.getItemInstanceFromArmorSlot(p19, p20)
	return p19:getInstance():WaitForChild("ArmorInvItem_" .. tostring(p20)).Value;
end;
local l__AccessoriesCovered__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").AccessoriesCovered;
function v4.setAccessoryVisibility(p21, p22, p23)
	local v26, v27, v28 = ipairs(p21:getHumanoid():GetAccessories());
	while true do
		local v29, v30 = v26(v27, v28);
		if not v29 then
			break;
		end;
		local l__Handle__31 = v30:FindFirstChild("Handle");
		local v32 = l__Handle__31;
		if v32 ~= nil then
			v32 = v32:FindFirstChildOfClass("Attachment");
		end;
		if l__Handle__31 and v32 and not l__ReplicatedStorage__5.Assets.Armor:FindFirstChild(v30.Name, true) then
			local v33 = false;
			for v34, v35 in ipairs(l__AccessoriesCovered__9[p22]) do
				v33 = string.match(string.lower(v32.Name), (string.lower(v35))) ~= nil;
				if v33 then
					break;
				end;
			end;
			if v33 then
				if p23 then
					local v36 = 0;
				else
					v36 = 1;
				end;
				l__Handle__31.Transparency = v36;
			end;
		end;	
	end;
end;
local l__WeldUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__default__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.equipArmorItem(p24, p25, p26)
	for v37, v38 in ipairs((p24:getItemsFromArmorSlot(p26))) do
		local v39 = v38:Destroy();
	end;
	for v40, v41 in ipairs(l__ReplicatedStorage__5:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(p25.Name):GetChildren()) do
		local v42 = v41:Clone();
		v42:SetAttribute("ArmorSlot", p26);
		local v43 = p24:getHumanoid();
		if v43 ~= nil then
			v43:AddAccessory(v42);
		end;
		p24:setAccessoryVisibility(p26, false);
	end;
	l__WeldUtil__10.weldCharacterAccessories(p24.instance);
	if p24:isAlive() and l__Players__3.LocalPlayer.Character == p24.instance then
		local v44 = p24.instance:FindFirstChild("ArmorInvItem_" .. tostring(p26));
		if v44 then
			v44.Value = p25;
			l__default__11.Client:Get("RemoteName"):CallServerAsync({
				item = p25, 
				armorSlot = p26
			}):andThen(function()

			end);
		end;
	end;
end;
function v4.unequipArmorSlot(p27, p28)
	for v45, v46 in ipairs((p27:getItemsFromArmorSlot(p28))) do
		local v47 = v46:Destroy();
	end;
	p27:setAccessoryVisibility(p28, true);
	if p27:isAlive() and l__Players__3.LocalPlayer.Character == p27.instance then
		local v48 = p27.instance:FindFirstChild("ArmorInvItem_" .. tostring(p28));
		if v48 then
			v48.Value = nil;
			l__default__11.Client:Get("RemoteName"):CallServerAsync({
				item = false, 
				armorSlot = p28
			}):andThen(function()

			end);
		end;
	end;
end;
local l__getItemMeta__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v4.equipItem(p29, p30)
	local v49 = p29:getItemInHandClient();
	if v49 then
		v49:Destroy();
	end;
	local v50 = l__getItemMeta__12(p30.Name);
	local u13 = p30:Clone();
	p30.AttributeChanged:Connect(function(p31)
		u13:SetAttribute(p31, p30:GetAttribute(p31));
	end);
	if v50.armor then
		for v51, v52 in ipairs((u13:GetDescendants())) do
			if v52:IsA("Attachment") then
				v52.Name = "RightGripAttachment";
			end;
		end;
	end;
	local v53 = p29:getHumanoid();
	if v53 ~= nil then
		v53:AddAccessory(u13);
	end;
	if v50.additionalAccessories then
		local v54, v55, v56 = ipairs(v50.additionalAccessories);
		while true do
			local v57, v58 = v54(v55, v56);
			if not v57 then
				break;
			end;
			local v59 = l__ReplicatedStorage__5:FindFirstChild("Items");
			if v59 ~= nil then
				v59 = v59:FindFirstChild(v58);
				if v59 ~= nil then
					v59 = v59:Clone();
				end;
			end;
			if v59 and v53 ~= nil then
				v53:AddAccessory(v59);
			end;		
		end;
	end;
	l__WeldUtil__10.weldCharacterAccessories(p29.instance);
	if p29:isAlive() and l__Players__3.LocalPlayer.Character == p29.instance and p29.instance:FindFirstChild("HandInvItem") then
		p29.instance.HandInvItem.Value = p30;
		task.spawn(function()
			l__default__11.Client:Get("RemoteName"):CallServerAsync({
				hand = p30
			}):andThen(function()

			end);
		end);
	end;
end;
function v4.unequipItemInHand(p32)
	local v60 = p32:getItemInHandClient();
	if v60 then
		v60:Destroy();
	end;
	if p32:isAlive() and l__Players__3.LocalPlayer.Character == p32.instance and p32.instance:FindFirstChild("HandInvItem") then
		p32.instance.HandInvItem.Value = nil;
		task.spawn(function()
			l__default__11.Client:Get("RemoteName"):CallServerAsync({
				hand = false
			}):andThen(function()

			end);
		end);
	end;
end;
u1 = {
	InventoryEntity = v4
};
return u1;
