-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "InventoryController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__StarterGui__3 = v3.StarterGui;
function u1.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "InventoryController";
	p1.playerMaid = u2.new();
	task.spawn(function()
		l__StarterGui__3:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
	end);
end;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Players__5 = v3.Players;
local l__ContextActionService__6 = v3.ContextActionService;
local l__PlaceUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__KnitClient__10 = v2.KnitClient;
local l__UILayers__11 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).UILayers;
local l__getItemMeta__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.KnitStart(p2)
	l__ClientStore__4.changed:connect(function(p3, p4)
		if p3.Inventory.observedPlayer and p3.Inventory.observedPlayer ~= p4.Inventory.observedPlayer then
			local l__observedPlayer__13 = p3.Inventory.observedPlayer;
			task.spawn(function()
				p2:hookObservedPlayer(l__Players__5.LocalPlayer, l__observedPlayer__13);
			end);
		end;
	end);
	local l__observedPlayer__7 = l__ClientStore__4:getState().Inventory.observedPlayer;
	if l__observedPlayer__7 then
		p2:hookObservedPlayer(l__Players__5.LocalPlayer, l__observedPlayer__7);
	end;
	l__ContextActionService__6:BindActionAtPriority("inventory-toggle", function(p5, p6, p7)
		if p6 == Enum.UserInputState.Begin then
			if not l__PlaceUtil__7.isLobbyServer() then
				if l__PlaceUtil__7.isGameServer() then
					if l__KnitClient__10.Controllers.GamemodeController:isLocalPlayerInCreativeMode() then
						l__KnitClient__10.Controllers.GamemodeController:toggleCreativeInventory();
						return;
					else
						local v8 = l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
						if v8:isAppOpen(l__BedwarsAppIds__9.INVENTORY) then
							v8:closeApp(l__BedwarsAppIds__9.INVENTORY);
							return;
						else
							v8:openApp(l__BedwarsAppIds__9.INVENTORY, {});
							return;
						end;
					end;
				else
					return;
				end;
			end;
		else
			return;
		end;
		local v9 = l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
		if v9:isAppOpen(l__BedwarsAppIds__9.INVENTORY) then
			v9:closeApp(l__BedwarsAppIds__9.INVENTORY);
			return;
		end;
		v9:openApp(l__BedwarsAppIds__9.INVENTORY, {});
	end, false, Enum.ContextActionPriority.Low.Value, Enum.KeyCode.E, Enum.KeyCode.ButtonY);
	l__ContextActionService__6:BindAction("close-ui-gamepad", function(p8, p9, p10)
		local v10 = l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
		if p9 == Enum.UserInputState.Begin then
			v10:closeLayer(l__UILayers__11.MAIN);
		end;
	end, false, Enum.KeyCode.ButtonB);
	local l__items__11 = l__ClientStore__4:getState().Inventory.observedInventory.inventory.items;
	local v12 = 0;
	local v13 = false;
	while true do
		if v13 then
			v12 = v12 + 1;
		else
			v13 = true;
		end;
		if not (v12 < 9) then
			break;
		end;
		if not (v12 < #l__items__11) then
			break;
		end;
		l__ClientStore__4:dispatch({
			type = "InventoryAddToHotbar", 
			item = l__items__11[v12 + 1], 
			slot = v12
		});	
	end;
	local v14, v15, v16 = ipairs(l__ClientStore__4:getState().Inventory.observedInventory.inventory.items);
	while true do
		v14(v15, v16);
		if not v14 then
			break;
		end;
		local v17 = l__getItemMeta__12(v15.itemType);
		if v17.armor and l__ClientStore__4:getState().Inventory.observedInventory.inventory.armor[v17.armor.slot + 1] == "empty" then
			l__ClientStore__4:dispatch({
				type = "InventorySetArmorItem", 
				armorSlot = v17.armor.slot, 
				item = v15
			});
		end;
		if v17.backpack and l__ClientStore__4:getState().Inventory.observedInventory.inventory.backpack == nil then
			l__ClientStore__4:dispatch({
				type = "InventorySetBackpack", 
				item = v15
			});
		end;	
	end;
	p2:inventoryReplication();
end;
local l__CollectionTagAdded__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local l__EntityUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u16 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ArmorSlot__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
function u1.inventoryReplication(p11)
	l__CollectionTagAdded__14("inventory-entity", function(p12)
		if l__Players__5.LocalPlayer.Name == p12.Name then
			return nil;
		end;
		local v18 = u2.new();
		local v19 = l__EntityUtil__15:getEntity(p12);
		if not v19 then
			error("Failed to find entity during client entity replication.");
		end;
		p12:WaitForChild("HandInvItem");
		local l__Value__20 = p12.HandInvItem.Value;
		if l__Value__20 then
			v19:equipItem(l__Value__20);
		else
			v19:unequipItemInHand();
		end;
		v18:GiveTask(p12.HandInvItem.Changed:Connect(function(p13)
			if p13 then
				v19:equipItem(p13);
				return;
			end;
			v19:unequipItemInHand();
		end));
		local v21 = 0;
		local v22 = false;
		while true do
			local v23 = nil;
			local v24 = v21;
			if v22 then
				v24 = v24 + 1;
			else
				v22 = true;
			end;
			if not (v24 < #u16.values(l__ArmorSlot__17)) then
				break;
			end;
			local v25 = p12:WaitForChild("ArmorInvItem_" .. tostring(v24));
			v23 = v24;
			local l__Value__26 = v25.Value;
			if l__Value__26 then
				v19:equipArmorItem(l__Value__26, v23);
			else
				v19:unequipArmorSlot(v23);
			end;
			local function u18(p14, p15)
				if not p15 then
					v19:unequipArmorSlot(p14);
					return;
				end;
				v19:equipArmorItem(p15, p14);
			end;
			v18:GiveTask(v25.Changed:Connect(function(p16)
				return u18(v24, p16);
			end));
			v21 = v24;		
		end;
		local l__Backpack__27 = p12:WaitForChild("Backpack");
		v18:GiveTask(l__Backpack__27.Changed:Connect(function(p17)
			if not l__Backpack__27.Value then
				v19:unequipBackpackSlot();
				return;
			end;
			v19:equipBackpack(l__Backpack__27.Value);
		end));
		v18:GiveTask(p12.AncestryChanged:Connect(function(p18, p19)
			if p19 == nil then
				v18:DoCleaning();
			end;
		end));
	end);
end;
local l__ClientSyncEvents__19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function u1.hookObservedPlayer(p20, p21, p22)
	p20.playerMaid:DoCleaning();
	local u20 = {};
	local u21 = u2.new();
	local function u22(p23)
		u20[p23] = true;
		local v28 = u2.new();
		u21:GiveTask(v28);
		v28:GiveTask(p23:GetAttributeChangedSignal("Amount"):Connect(function()
			l__ClientStore__4:dispatch({
				type = "InventorySetItemAmount", 
				tool = p23, 
				amount = p23:GetAttribute("Amount")
			});
		end));
		v28:GiveTask(p23.AncestryChanged:Connect(function(p24, p25)
			if p25 == nil then
				v28:DoCleaning();
			end;
		end));
		v28:GiveTask(function()
			u20[p23] = nil;
			l__ClientStore__4:dispatch({
				type = "InventoryRemoveItem", 
				tool = p23
			});
		end);
		task.spawn(function()
			l__ClientSyncEvents__19.ItemAdded:fire(p23);
		end);
		return v28;
	end;
	local function u23(p26)
		u21:DoCleaning();
		local v29 = l__EntityUtil__15:getEntity(p26);
		if not v29 then
			error("character not found!");
		end;
		local function v30(p27)
			local v31, v32, v33 = ipairs(p27:GetChildren());
			while true do
				v31(v32, v33);
				if not v31 then
					break;
				end;
				v33 = v31;
				if u20[v32] == nil then
					l__ClientStore__4:dispatch({
						type = "InventoryAddItem", 
						tool = v32
					});
					u22(v32);
				end;			
			end;
			u21:GiveTask(p27.ChildAdded:Connect(function(p28)
				if u20[p28] == nil then
					l__ClientStore__4:dispatch({
						type = "InventoryAddItem", 
						tool = p28
					});
					u22(p28);
				end;
			end));
		end;
		local v34 = v29:getInventoryFolder();
		if v34 then
			v30(v34);
		end;
		u21:GiveTask(v29:inventoryFolderAddedEvent(function(p29)
			v30(p29);
		end));
		u21:GiveTask(p26.AncestryChanged:Connect(function(p30, p31)
			if p31 == nil then
				u21:DoCleaning();
			end;
		end));
		u21:GiveTask(function()

		end);
		local u24 = u2.new();
		u21:GiveTask(function()
			u24:DoCleaning();
			l__ClientStore__4:dispatch({
				type = "ChestClear"
			});
		end);
		local function u25(p32)
			local v35, v36, v37 = ipairs(p32:GetChildren());
			while true do
				v35(v36, v37);
				if not v35 then
					break;
				end;
				v37 = v35;
				if v36:IsA("Accessory") then
					l__ClientStore__4:dispatch({
						type = "ChestAddItem", 
						itemInstance = v36
					});
					u24:GiveTask(v36:GetAttributeChangedSignal("Amount"):Connect(function()
						l__ClientStore__4:dispatch({
							type = "ChestItemSetAmount", 
							itemInstance = v36, 
							amount = v36:GetAttribute("Amount")
						});
					end));
				end;			
			end;
			u24:GiveTask(p32.ChildAdded:Connect(function(p33)
				if p33:IsA("Accessory") then
					l__ClientStore__4:dispatch({
						type = "ChestAddItem", 
						itemInstance = p33
					});
					u24:GiveTask(p33:GetAttributeChangedSignal("Amount"):Connect(function()
						l__ClientStore__4:dispatch({
							type = "ChestItemSetAmount", 
							itemInstance = p33, 
							amount = p33:GetAttribute("Amount")
						});
					end));
				end;
			end));
			u24:GiveTask(p32.ChildRemoved:Connect(function(p34)
				l__ClientStore__4:dispatch({
					type = "ChestRemoveItem", 
					itemInstance = p34
				});
			end));
		end;
		if not p26:FindFirstChild("ObservedChestFolder") then
			u21:GiveTask(p26.ChildAdded:Connect(function(p35)
				if p35.Name == "ObservedChestFolder" then
					if p35.Value then
						u25(p35.Value);
					end;
					u21:GiveTask(p35.Changed:Connect(function(p36)
						if p36 then
							u25(p36);
							return;
						end;
						u24:DoCleaning();
						l__ClientStore__4:dispatch({
							type = "ChestClear"
						});
					end));
				end;
			end));
			return;
		end;
		local l__ObservedChestFolder__38 = p26:FindFirstChild("ObservedChestFolder");
		if l__ObservedChestFolder__38.Value then
			u25(l__ObservedChestFolder__38.Value);
		end;
		u21:GiveTask(l__ObservedChestFolder__38.Changed:Connect(function(p37)
			if p37 then
				u25(p37);
				return;
			end;
			u24:DoCleaning();
			l__ClientStore__4:dispatch({
				type = "ChestClear"
			});
		end));
	end;
	p20.playerMaid:GiveTask(p22.CharacterAdded:Connect(function(p38)
		u23(p38);
	end));
	if p22.Character then
		u23(p22.Character);
	end;
	p20.playerMaid:GiveTask(function()
		u21:DoCleaning();
	end);
end;
function u1.setObservedPlayer(p39, p40)
	l__ClientStore__4:dispatch({
		type = "SetObservedPlayer", 
		observedPlayer = p40
	});
end;
function u1.getEquippedArmor(p41, p42)
	local v39 = p42 or l__ClientStore__4:getState().Inventory.observedInventory.inventory.armor;
	local v40 = {};
	for v41 = 1, #v39 do
		local v42 = v39[v41];
		if v42 == "empty" then
			local v43 = v40;
		else
			local v44 = l__getItemMeta__12(v42.itemType);
			if v44.armor then
				v40[v44.armor.slot] = v42.itemType;
			end;
			v43 = v40;
		end;
	end;
	return v43;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(u1.new());
return {
	InventoryController = u1
};
