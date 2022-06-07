-- Script Hash: e0d81608d554923346eadaeb7af703600d6c6143d905a35382fb99c112953c09461e58ae721f017f74db57ec62265556
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "InventoryController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__KnitController__3;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__StarterGui__4 = v2.StarterGui;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "InventoryController";
	p1.playerMaid = u3.new();
	task.spawn(function()
		l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
	end);
end;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Players__6 = v2.Players;
local l__ContextActionService__7 = v2.ContextActionService;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__UILayers__10 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).UILayers;
local l__getItemMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.KnitStart(p2)
	l__ClientStore__5.changed:connect(function(p3, p4)
		if p3.Inventory.observedPlayer and p3.Inventory.observedPlayer ~= p4.Inventory.observedPlayer then
			local l__observedPlayer__12 = p3.Inventory.observedPlayer;
			task.spawn(function()
				p2:hookObservedPlayer(l__Players__6.LocalPlayer, l__observedPlayer__12);
			end);
		end;
	end);
	local l__observedPlayer__6 = l__ClientStore__5:getState().Inventory.observedPlayer;
	if l__observedPlayer__6 then
		p2:hookObservedPlayer(l__Players__6.LocalPlayer, l__observedPlayer__6);
	end;
	l__ContextActionService__7:BindActionAtPriority("inventory-toggle", function(p5, p6, p7)
		local v7 = nil;
		if p6 == Enum.UserInputState.Begin then
			v7 = l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
			if not v7:isAppOpen(l__BedwarsAppIds__9.INVENTORY) then
				v7:openApp(l__BedwarsAppIds__9.INVENTORY, {});
				return;
			end;
		else
			return;
		end;
		v7:closeApp(l__BedwarsAppIds__9.INVENTORY);
	end, false, Enum.ContextActionPriority.Low.Value, Enum.KeyCode.E, Enum.KeyCode.ButtonY);
	l__ContextActionService__7:BindAction("close-ui-gamepad", function(p8, p9, p10)
		local v8 = l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
		if p9 == Enum.UserInputState.Begin then
			v8:closeLayer(l__UILayers__10.MAIN);
		end;
	end, false, Enum.KeyCode.ButtonB);
	local l__items__9 = l__ClientStore__5:getState().Inventory.observedInventory.inventory.items;
	local v10 = 0;
	local v11 = false;
	while true do
		if v11 then
			v10 = v10 + 1;
		else
			v11 = true;
		end;
		if not (v10 < 9) then
			break;
		end;
		if not (v10 < #l__items__9) then
			break;
		end;
		l__ClientStore__5:dispatch({
			type = "InventoryAddToHotbar", 
			item = l__items__9[v10 + 1], 
			slot = v10
		});	
	end;
	for v12, v13 in ipairs(l__ClientStore__5:getState().Inventory.observedInventory.inventory.items) do
		local v14 = l__getItemMeta__11(v13.itemType);
		if v14.armor and l__ClientStore__5:getState().Inventory.observedInventory.inventory.armor[v14.armor.slot + 1] == "empty" then
			l__ClientStore__5:dispatch({
				type = "InventorySetArmorItem", 
				armorSlot = v14.armor.slot, 
				item = v13
			});
		end;
	end;
	p2:inventoryReplication();
end;
local l__CollectionTagAdded__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local l__EntityUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ArmorSlot__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
function u1.inventoryReplication(p11)
	l__CollectionTagAdded__13("inventory-entity", function(p12)
		if l__Players__6.LocalPlayer.Name == p12.Name then
			return nil;
		end;
		local v15 = u3.new();
		local v16 = l__EntityUtil__14:getEntity(p12);
		if not v16 then
			error("Failed to find entity during client entity replication.");
		end;
		p12:WaitForChild("HandInvItem");
		local function v17(p13)
			if p13 then
				v16:equipItem(p13);
				return;
			end;
			v16:unequipItemInHand();
		end;
		v17(p12.HandInvItem.Value);
		v15:GiveTask(p12.HandInvItem.Changed:Connect(function(p14)
			v17(p14);
		end));
		local v18 = 0;
		local v19 = false;
		while true do
			local v20 = v18;
			if v19 then
				v20 = v20 + 1;
			else
				v19 = true;
			end;
			if not (v20 < #u15.values(l__ArmorSlot__16)) then
				break;
			end;
			local v21 = p12:WaitForChild("ArmorInvItem_" .. tostring(v20));
			local function v22(p15, p16)
				if not p16 then
					v16:unequipArmorSlot(p15);
					return;
				end;
				v16:equipArmorItem(p16, p15);
			end;
			v22(v20, v21.Value);
			v15:GiveTask(v21.Changed:Connect(function(p17)
				return v22(v20, p17);
			end));
			v18 = v20;		
		end;
		v15:GiveTask(p12.AncestryChanged:Connect(function(p18, p19)
			if p19 == nil then
				v15:DoCleaning();
			end;
		end));
	end);
end;
local l__ClientSyncEvents__17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function u1.hookObservedPlayer(p20, p21, p22)
	p20.playerMaid:DoCleaning();
	local u18 = {};
	local u19 = u3.new();
	local function u20(p23)
		u18[p23] = true;
		local v23 = u3.new();
		u19:GiveTask(v23);
		v23:GiveTask(p23:GetAttributeChangedSignal("Amount"):Connect(function()
			l__ClientStore__5:dispatch({
				type = "InventorySetItemAmount", 
				tool = p23, 
				amount = p23:GetAttribute("Amount")
			});
		end));
		v23:GiveTask(p23.AncestryChanged:Connect(function(p24, p25)
			if p25 == nil then
				v23:DoCleaning();
			end;
		end));
		v23:GiveTask(function()
			u18[p23] = nil;
			l__ClientStore__5:dispatch({
				type = "InventoryRemoveItem", 
				tool = p23
			});
		end);
		task.spawn(function()
			l__ClientSyncEvents__17.ItemAdded:fire(p23);
		end);
		return v23;
	end;
	local function u21(p26)
		local v24 = nil;
		print("hooking character..");
		u19:DoCleaning();
		local v25 = l__EntityUtil__14:getEntity(p26);
		if not v25 then
			error("character not found!");
		end;
		local function v26(p27)
			for v27, v28 in ipairs(p27:GetChildren()) do
				if u18[v28] == nil then
					l__ClientStore__5:dispatch({
						type = "InventoryAddItem", 
						tool = v28
					});
					u20(v28);
				end;
			end;
			u19:GiveTask(p27.ChildAdded:Connect(function(p28)
				if u18[p28] == nil then
					l__ClientStore__5:dispatch({
						type = "InventoryAddItem", 
						tool = p28
					});
					u20(p28);
				end;
			end));
		end;
		local v29 = v25:getInventoryFolder();
		if v29 then
			v26(v29);
		end;
		u19:GiveTask(v25:inventoryFolderAddedEvent(function(p29)
			v26(p29);
		end));
		u19:GiveTask(p26.AncestryChanged:Connect(function(p30, p31)
			if p31 == nil then
				u19:DoCleaning();
			end;
		end));
		u19:GiveTask(function()
			print("unhooking character.");
		end);
		local u22 = u3.new();
		local function u23()
			u22:DoCleaning();
			l__ClientStore__5:dispatch({
				type = "ChestClear"
			});
		end;
		u19:GiveTask(function()
			u23();
		end);
		local function u24(p32)
			local function v30(p33)
				u22:GiveTask(p33:GetAttributeChangedSignal("Amount"):Connect(function()
					l__ClientStore__5:dispatch({
						type = "ChestItemSetAmount", 
						itemInstance = p33, 
						amount = p33:GetAttribute("Amount")
					});
				end));
			end;
			for v31, v32 in ipairs(p32:GetChildren()) do
				if v32:IsA("Accessory") then
					l__ClientStore__5:dispatch({
						type = "ChestAddItem", 
						itemInstance = v32
					});
					v30(v32);
				end;
			end;
			u22:GiveTask(p32.ChildAdded:Connect(function(p34)
				if p34:IsA("Accessory") then
					l__ClientStore__5:dispatch({
						type = "ChestAddItem", 
						itemInstance = p34
					});
					v30(p34);
				end;
			end));
			u22:GiveTask(p32.ChildRemoved:Connect(function(p35)
				l__ClientStore__5:dispatch({
					type = "ChestRemoveItem", 
					itemInstance = p35
				});
			end));
		end;
		v24 = function(p36)
			if p36.Value then
				u24(p36.Value);
			end;
			u19:GiveTask(p36.Changed:Connect(function(p37)
				if not p37 then
					u23();
					return;
				end;
				u24(p37);
			end));
		end;
		if p26:FindFirstChild("ObservedChestFolder") then
			v24((p26:FindFirstChild("ObservedChestFolder")));
			return;
		end;
		u19:GiveTask(p26.ChildAdded:Connect(function(p38)
			if p38.Name == "ObservedChestFolder" then
				v24(p38);
			end;
		end));
	end;
	p20.playerMaid:GiveTask(p22.CharacterAdded:Connect(function(p39)
		u21(p39);
	end));
	if p22.Character then
		u21(p22.Character);
	end;
	p20.playerMaid:GiveTask(function()
		u19:DoCleaning();
	end);
end;
local l__InventoryUtil__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function u1.fullUpdateInventory(p40)
	local l__observedPlayer__33 = l__ClientStore__5:getState().Inventory.observedPlayer;
	if l__observedPlayer__33 then
		l__ClientStore__5:dispatch({
			type = "InventoryFullUpdate", 
			inventory = l__InventoryUtil__25.getInventory(l__observedPlayer__33)
		});
	end;
end;
function u1.setObservedPlayer(p41, p42)
	l__ClientStore__5:dispatch({
		type = "SetObservedPlayer", 
		observedPlayer = p42
	});
end;
function u1.getEquippedArmor(p43, p44)
	local v34 = nil;
	local v35 = p44 or l__ClientStore__5:getState().Inventory.observedInventory.inventory.armor;
	v34 = {};
	local function v36(p45, p46)
		if p46 == "empty" then
			return p45;
		end;
		local v37 = l__getItemMeta__11(p46.itemType);
		if v37.armor then
			p45[v37.armor.slot] = p46.itemType;
		end;
		return p45;
	end;
	for v38 = 1, #v35 do
		v34 = v36(v34, v35[v38], v38 - 1, v35);
	end;
	return local v39;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	InventoryController = u2
};
return u1;
