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
function v4.constructor(p1, p2)
	l__Entity__3.constructor(p1, p2);
end;
local l__HttpService__1 = v2.HttpService;
local l__Players__2 = v2.Players;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ReplicatedStorage__4 = v2.ReplicatedStorage;
local l__CollectionService__5 = v2.CollectionService;
function v4.onServerSetup(p3)
	l__Entity__3.onServerSetup(p3);
	local v5 = l__HttpService__1:GenerateGUID(false);
	local v6 = l__Players__2:GetPlayerFromCharacter(p3.instance);
	if v6 then
		v5 = v6.Name;
	end;
	u3("ObjectValue", {
		Name = "InventoryFolder", 
		Value = u3("Folder", {
			Name = v5, 
			Parent = l__ReplicatedStorage__4:WaitForChild("Inventories")
		}), 
		Parent = p3.instance
	});
	u3("ObjectValue", {
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
		u3("ObjectValue", {
			Name = "ArmorInvItem_" .. tostring(v7), 
			Value = nil, 
			Parent = p3.instance
		});	
	end;
	u3("ObjectValue", {
		Name = "Backpack", 
		Value = nil, 
		Parent = p3.instance
	});
	u3("ObjectValue", {
		Name = "ObservedChestFolder", 
		Value = nil, 
		Parent = p3.instance
	});
	l__CollectionService__5:AddTag(p3.instance, "inventory-entity");
end;
function v4.kill(p4)
	l__Entity__3.kill(p4);
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
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.inventoryFolderAddedEvent(p7, p8)
	local u7 = u6.new();
	u7:GiveTask(p7.instance.ChildAdded:Connect(function(p9)
		if p9.Name == "InventoryFolder" and p9:IsA("ObjectValue") then
			local l__Value__11 = p9.Value;
			if l__Value__11 then
				p8(l__Value__11);
			end;
			u7:GiveTask(p9.Changed:Connect(function(p10)
				if p10 then
					p8(p10);
				end;
			end));
		end;
	end));
	return u7;
end;
function v4.getItemInHandClient(p11)
	local v12, v13, v14 = ipairs((p11.instance:GetChildren()));
	while true do
		v12(v13, v14);
		if not v12 then
			break;
		end;
		v14 = v12;
		local v15 = false;
		if v13:GetAttribute("InvItem") == true then
			v15 = false;
			if v13:GetAttribute("ArmorSlot") == nil then
				v15 = v13:GetAttribute("IsBackpack") == nil;
			end;
		end;
		if v15 == true then
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
	local v16 = p13.instance.HandInvItem.Value;
	if v16 ~= nil then
		v16 = v16.Name;
	end;
	return v16;
end;
function v4.getItemsFromArmorSlot(p14, p15)
	local v17 = {};
	local v18 = 0;
	local v19, v20, v21 = ipairs((p14.instance:GetChildren()));
	while true do
		v19(v20, v21);
		if not v19 then
			break;
		end;
		if v20:GetAttribute("ArmorSlot") == p15 == true then
			v18 = v18 + 1;
			v17[v18] = v20;
		end;	
	end;
	return v17;
end;
function v4.getBackpack(p16)
	local v22 = {};
	local v23 = 0;
	local v24, v25, v26 = ipairs((p16.instance:GetChildren()));
	while true do
		v24(v25, v26);
		if not v24 then
			break;
		end;
		if v25:GetAttribute("IsBackpack") == true == true then
			v23 = v23 + 1;
			v22[v23] = v25;
		end;	
	end;
	return v22;
end;
function v4.getHandItemInstanceFromCharacter(p17)
	local v27 = p17:getItemInHand();
	if not v27 then
		return nil;
	end;
	local v28 = p17.instance:FindFirstChild(v27.Name);
	if v28 and v28:IsA("Accessory") then
		return v28;
	end;
	return nil;
end;
function v4.getItemInstanceFromCharacter(p18, p19)
	local v29 = p18.instance:FindFirstChild(p19);
	if v29 and v29:IsA("Accessory") then
		return v29;
	end;
	return nil;
end;
function v4.getItemInstanceFromArmorSlot(p20, p21)
	return p20:getInstance():WaitForChild("ArmorInvItem_" .. tostring(p21)).Value;
end;
local l__AccessoriesCovered__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").AccessoriesCovered;
function v4.setAccessoryVisibility(p22, p23, p24)
	local v30, v31, v32 = ipairs(p22:getHumanoid():GetAccessories());
	while true do
		v30(v31, v32);
		if not v30 then
			break;
		end;
		local l__Handle__33 = v31:FindFirstChild("Handle");
		local v34 = l__Handle__33;
		if v34 ~= nil then
			v34 = v34:FindFirstChildOfClass("Attachment");
		end;
		if l__Handle__33 and v34 and not l__ReplicatedStorage__4.Assets.Armor:FindFirstChild(v31.Name, true) then
			local v35 = false;
			local v36, v37, v38 = ipairs(l__AccessoriesCovered__8[p23]);
			while true do
				v36(v37, v38);
				if not v36 then
					break;
				end;
				v38 = v36;
				v35 = string.match(string.lower(v34.Name), (string.lower(v37))) ~= nil;
				if v35 then
					break;
				end;			
			end;
			if v35 then
				if p24 then
					local v39 = 0;
				else
					v39 = 1;
				end;
				l__Handle__33.Transparency = v39;
			end;
		end;	
	end;
end;
local l__WeldUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__default__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.equipArmorItem(p25, p26, p27)
	local v40, v41, v42 = ipairs((p25:getItemsFromArmorSlot(p27)));
	while true do
		v40(v41, v42);
		if not v40 then
			break;
		end;
		v42 = v40;
		local v43 = v41:Destroy();	
	end;
	local v44, v45, v46 = ipairs(l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(p26.Name):GetChildren());
	while true do
		v44(v45, v46);
		if not v44 then
			break;
		end;
		v46 = v44;
		local v47 = v45:Clone();
		v47:SetAttribute("ArmorSlot", p27);
		local v48 = p25:getHumanoid();
		if v48 ~= nil then
			v48:AddAccessory(v47);
		end;
		p25:setAccessoryVisibility(p27, false);	
	end;
	l__WeldUtil__9.weldCharacterAccessories(p25.instance);
	if p25:isAlive() and l__Players__2.LocalPlayer.Character == p25.instance then
		local v49 = p25.instance:FindFirstChild("ArmorInvItem_" .. tostring(p27));
		if v49 then
			v49.Value = p26;
			l__default__10.Client:Get("RemoteName"):CallServerAsync({
				item = p26, 
				armorSlot = p27
			}):andThen(function()

			end);
		end;
	end;
end;
function v4.unequipArmorSlot(p28, p29)
	local v50, v51, v52 = ipairs((p28:getItemsFromArmorSlot(p29)));
	while true do
		v50(v51, v52);
		if not v50 then
			break;
		end;
		v52 = v50;
		local v53 = v51:Destroy();	
	end;
	p28:setAccessoryVisibility(p29, true);
	if p28:isAlive() and l__Players__2.LocalPlayer.Character == p28.instance then
		local v54 = p28.instance:FindFirstChild("ArmorInvItem_" .. tostring(p29));
		if v54 then
			v54.Value = nil;
			l__default__10.Client:Get("RemoteName"):CallServerAsync({
				item = false, 
				armorSlot = p29
			}):andThen(function()

			end);
		end;
	end;
end;
function v4.equipBackpack(p30, p31)
	local v55, v56, v57 = ipairs((p30:getBackpack()));
	while true do
		v55(v56, v57);
		if not v55 then
			break;
		end;
		v57 = v55;
		local v58 = v56:Destroy();	
	end;
	local v59 = l__ReplicatedStorage__4:WaitForChild("Items"):WaitForChild(p31.Name):Clone();
	v59:SetAttribute("IsBackpack", true);
	local v60 = p30:getHumanoid();
	if v60 ~= nil then
		v60:AddAccessory(v59);
	end;
	l__WeldUtil__9.weldCharacterAccessories(p30.instance);
	if p30:isAlive() and l__Players__2.LocalPlayer.Character == p30.instance then
		local l__Backpack__61 = p30.instance:FindFirstChild("Backpack");
		if l__Backpack__61 then
			l__Backpack__61.Value = p31;
			l__default__10.Client:Get("RemoteName"):CallServerAsync({
				item = p31
			}):andThen(function()

			end);
		end;
	end;
end;
function v4.unequipBackpackSlot(p32)
	local v62, v63, v64 = ipairs((p32:getBackpack()));
	while true do
		v62(v63, v64);
		if not v62 then
			break;
		end;
		v64 = v62;
		local v65 = v63:Destroy();	
	end;
	if p32:isAlive() and l__Players__2.LocalPlayer.Character == p32.instance then
		local l__Backpack__66 = p32.instance:FindFirstChild("Backpack");
		if l__Backpack__66 then
			l__Backpack__66.Value = nil;
			l__default__10.Client:Get("RemoteName"):CallServerAsync({
				item = false
			}):andThen(function()

			end);
		end;
	end;
end;
local l__getItemMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v4.equipItem(p33, p34)
	local v67 = p33:getItemInHandClient();
	if v67 then
		v67:Destroy();
	end;
	local v68 = l__getItemMeta__11(p34.Name);
	local u12 = p34:Clone();
	p34.AttributeChanged:Connect(function(p35)
		u12:SetAttribute(p35, p34:GetAttribute(p35));
	end);
	if v68.armor then
		local v69, v70, v71 = ipairs((u12:GetDescendants()));
		while true do
			v69(v70, v71);
			if not v69 then
				break;
			end;
			v71 = v69;
			if v70:IsA("Attachment") then
				v70.Name = "RightGripAttachment";
			end;		
		end;
	end;
	local v72 = p33:getHumanoid();
	if v72 ~= nil then
		v72:AddAccessory(u12);
	end;
	if v68.additionalAccessories then
		local v73, v74, v75 = ipairs(v68.additionalAccessories);
		while true do
			v73(v74, v75);
			if not v73 then
				break;
			end;
			local v76 = l__ReplicatedStorage__4:FindFirstChild("Items");
			if v76 ~= nil then
				v76 = v76:FindFirstChild(v74);
				if v76 ~= nil then
					v76 = v76:Clone();
				end;
			end;
			if v76 and v72 ~= nil then
				v72:AddAccessory(v76);
			end;		
		end;
	end;
	l__WeldUtil__9.weldCharacterAccessories(p33.instance);
	if p33:isAlive() and l__Players__2.LocalPlayer.Character == p33.instance and p33.instance:FindFirstChild("HandInvItem") then
		p33.instance.HandInvItem.Value = p34;
		task.spawn(function()
			l__default__10.Client:Get("RemoteName"):CallServerAsync({
				hand = p34
			}):andThen(function()

			end);
		end);
	end;
end;
function v4.unequipItemInHand(p36)
	local v77 = p36:getItemInHandClient();
	if v77 then
		v77:Destroy();
	end;
	if p36:isAlive() and l__Players__2.LocalPlayer.Character == p36.instance and p36.instance:FindFirstChild("HandInvItem") then
		p36.instance.HandInvItem.Value = nil;
		task.spawn(function()
			l__default__10.Client:Get("RemoteName"):CallServerAsync({
				hand = false
			}):andThen(function()

			end);
		end);
	end;
end;
return {
	InventoryEntity = v4
};
