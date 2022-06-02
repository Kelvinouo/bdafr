-- Script Hash: 5795b746adb2e30b2c63356abd19c6599ce0ed40bd5bc7764cf0051626601effaee7c3a5c84dec70fc53e8bbb2bc85f6
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
	local v12 = p11.instance:GetChildren();
	local function v13(p12)
		local v14 = false;
		if p12:GetAttribute("InvItem") == true then
			v14 = p12:GetAttribute("ArmorSlot") == nil;
		end;
		return v14;
	end;
	for v15, v16 in ipairs(v12) do
		if v13(v16, v15 - 1, v12) == true then
			return v16;
		end;
	end;
	return nil;
end;
function v4.getItemInHand(p13)
	if not p13.instance:FindFirstChild("HandInvItem") then
		return nil;
	end;
	return p13.instance.HandInvItem.Value;
end;
function v4.getItemTypeInHand(p14)
	if not p14.instance:FindFirstChild("HandInvItem") then
		return nil;
	end;
	local v17 = p14.instance.HandInvItem.Value;
	if v17 ~= nil then
		v17 = v17.Name;
	end;
	return v17;
end;
function v4.getItemsFromArmorSlot(p15, p16)
	local v18 = p15.instance:GetChildren();
	local function v19(p17)
		return p17:GetAttribute("ArmorSlot") == p16;
	end;
	local v20 = {};
	local v21 = 0;
	for v22, v23 in ipairs(v18) do
		if v19(v23, v22 - 1, v18) == true then
			v21 = v21 + 1;
			v20[v21] = v23;
		end;
	end;
	return v20;
end;
function v4.getHandItemInstanceFromCharacter(p18)
	local v24 = p18:getItemInHand();
	if not v24 then
		return nil;
	end;
	local v25 = p18.instance:FindFirstChild(v24.Name);
	if v25 and v25:IsA("Accessory") then
		return v25;
	end;
	return nil;
end;
function v4.getItemInstanceFromCharacter(p19, p20)
	local v26 = p19.instance:FindFirstChild(p20);
	if v26 and v26:IsA("Accessory") then
		return v26;
	end;
	return nil;
end;
function v4.getItemInstanceFromArmorSlot(p21, p22)
	return p21:getInstance():WaitForChild("ArmorInvItem_" .. tostring(p22)).Value;
end;
local l__AccessoriesCovered__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").AccessoriesCovered;
function v4.setAccessoryVisibility(p23, p24, p25)
	local v27, v28, v29 = ipairs(p23:getHumanoid():GetAccessories());
	while true do
		local v30, v31 = v27(v28, v29);
		if not v30 then
			break;
		end;
		local l__Handle__32 = v31:FindFirstChild("Handle");
		local v33 = l__Handle__32;
		if v33 ~= nil then
			v33 = v33:FindFirstChildOfClass("Attachment");
		end;
		if l__Handle__32 and v33 and not l__ReplicatedStorage__5.Assets.Armor:FindFirstChild(v31.Name, true) then
			local v34 = false;
			for v35, v36 in ipairs(l__AccessoriesCovered__9[p24]) do
				v34 = string.match(string.lower(v33.Name), (string.lower(v36))) ~= nil;
				if v34 then
					break;
				end;
			end;
			if v34 then
				if p25 then
					local v37 = 0;
				else
					v37 = 1;
				end;
				l__Handle__32.Transparency = v37;
			end;
		end;	
	end;
end;
local l__WeldUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__default__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.equipArmorItem(p26, p27, p28)
	local v38 = p26:getItemsFromArmorSlot(p28);
	local function v39(p29)
		return p29:Destroy();
	end;
	for v40, v41 in ipairs(v38) do
		v39(v41, v40 - 1, v38);
	end;
	for v42, v43 in ipairs(l__ReplicatedStorage__5:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(p27.Name):GetChildren()) do
		local v44 = v43:Clone();
		v44:SetAttribute("ArmorSlot", p28);
		local v45 = p26:getHumanoid();
		if v45 ~= nil then
			v45:AddAccessory(v44);
		end;
		p26:setAccessoryVisibility(p28, false);
	end;
	l__WeldUtil__10.weldCharacterAccessories(p26.instance);
	if p26:isAlive() and l__Players__3.LocalPlayer.Character == p26.instance then
		local v46 = p26.instance:FindFirstChild("ArmorInvItem_" .. tostring(p28));
		if v46 then
			v46.Value = p27;
			l__default__11.Client:Get("SetArmorInvItem"):CallServerAsync({
				item = p27, 
				armorSlot = p28
			}):andThen(function()

			end);
		end;
	end;
end;
function v4.unequipArmorSlot(p30, p31)
	local v47 = p30:getItemsFromArmorSlot(p31);
	local function v48(p32)
		return p32:Destroy();
	end;
	for v49, v50 in ipairs(v47) do
		v48(v50, v49 - 1, v47);
	end;
	p30:setAccessoryVisibility(p31, true);
	if p30:isAlive() and l__Players__3.LocalPlayer.Character == p30.instance then
		local v51 = p30.instance:FindFirstChild("ArmorInvItem_" .. tostring(p31));
		if v51 then
			v51.Value = nil;
			l__default__11.Client:Get("SetArmorInvItem"):CallServerAsync({
				item = false, 
				armorSlot = p31
			}):andThen(function()

			end);
		end;
	end;
end;
local l__getItemMeta__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v4.equipItem(p33, p34)
	local v52 = p33:getItemInHandClient();
	if v52 then
		v52:Destroy();
	end;
	local v53 = l__getItemMeta__12(p34.Name);
	local u13 = p34:Clone();
	p34.AttributeChanged:Connect(function(p35)
		u13:SetAttribute(p35, (p34:GetAttribute(p35)));
	end);
	if v53.armor then
		local v54 = u13:GetDescendants();
		local function v55(p36)
			if p36:IsA("Attachment") then
				p36.Name = "RightGripAttachment";
			end;
		end;
		for v56, v57 in ipairs(v54) do
			v55(v57, v56 - 1, v54);
		end;
	end;
	local v58 = p33:getHumanoid();
	if v58 ~= nil then
		v58:AddAccessory(u13);
	end;
	if v53.additionalAccessories then
		local v59, v60, v61 = ipairs(v53.additionalAccessories);
		while true do
			local v62, v63 = v59(v60, v61);
			if not v62 then
				break;
			end;
			local v64 = l__ReplicatedStorage__5:FindFirstChild("Items");
			if v64 ~= nil then
				v64 = v64:FindFirstChild(v63);
				if v64 ~= nil then
					v64 = v64:Clone();
				end;
			end;
			if v64 and v58 ~= nil then
				v58:AddAccessory(v64);
			end;		
		end;
	end;
	l__WeldUtil__10.weldCharacterAccessories(p33.instance);
	if p33:isAlive() and l__Players__3.LocalPlayer.Character == p33.instance and p33.instance:FindFirstChild("HandInvItem") then
		p33.instance.HandInvItem.Value = p34;
		task.spawn(function()
			l__default__11.Client:Get("SetInvItem"):CallServerAsync({
				hand = p34
			}):andThen(function()

			end);
		end);
	end;
end;
function v4.unequipItemInHand(p37)
	local v65 = p37:getItemInHandClient();
	if v65 then
		v65:Destroy();
	end;
	if p37:isAlive() and l__Players__3.LocalPlayer.Character == p37.instance and p37.instance:FindFirstChild("HandInvItem") then
		p37.instance.HandInvItem.Value = nil;
		task.spawn(function()
			l__default__11.Client:Get("SetInvItem"):CallServerAsync({
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
