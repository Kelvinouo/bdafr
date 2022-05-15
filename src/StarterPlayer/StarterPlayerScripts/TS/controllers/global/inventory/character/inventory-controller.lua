
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
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
local u2 = l__KnitController__4;
local l__Maid__3 = v2.Maid;
local l__StarterGui__4 = v3.StarterGui;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "InventoryController";
	p1.playerMaid = l__Maid__3.new();
	task.spawn(function()
		l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
	end);
end;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Players__6 = v3.Players;
local l__ContextActionService__7 = v3.ContextActionService;
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
	local l__observedPlayer__7 = l__ClientStore__5:getState().Inventory.observedPlayer;
	if l__observedPlayer__7 then
		p2:hookObservedPlayer(l__Players__6.LocalPlayer, l__observedPlayer__7);
	end;
	l__ContextActionService__7:BindActionAtPriority("inventory-toggle", function(p5, p6, p7)
		local v8 = nil;
		if p6 == Enum.UserInputState.Begin then
			v8 = l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
			if not v8:isAppOpen(l__BedwarsAppIds__9.INVENTORY) then
				v8:openApp(l__BedwarsAppIds__9.INVENTORY, {});
				return;
			end;
		else
			return;
		end;
		v8:closeApp(l__BedwarsAppIds__9.INVENTORY);
	end, false, Enum.ContextActionPriority.Low.Value, Enum.KeyCode.E, Enum.KeyCode.ButtonY);
	l__ContextActionService__7:BindAction("close-ui-gamepad", function(p8, p9, p10)
		local v9 = l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
		if p9 == Enum.UserInputState.Begin then
			v9:closeLayer(l__UILayers__10.MAIN);
		end;
	end, false, Enum.KeyCode.ButtonB);
	local l__items__10 = l__ClientStore__5:getState().Inventory.observedInventory.inventory.items;
	local v11 = 0;
	local v12 = false;
	while true do
		if v12 then
			v11 = v11 + 1;
		else
			v12 = true;
		end;
		if not (v11 < 9) then
			break;
		end;
		if not (v11 < #l__items__10) then
			break;
		end;
		l__ClientStore__5:dispatch({
			type = "InventoryAddToHotbar", 
			item = l__items__10[v11 + 1], 
			slot = v11
		});	
	end;
	for v13, v14 in ipairs(l__ClientStore__5:getState().Inventory.observedInventory.inventory.items) do
		local v15 = l__getItemMeta__11(v14.itemType);
		if v15.armor and l__ClientStore__5:getState().Inventory.observedInventory.inventory.armor[v15.armor.slot + 1] == "empty" then
			l__ClientStore__5:dispatch({
				type = "InventorySetArmorItem", 
				armorSlot = v15.armor.slot, 
				item = v14
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
		local v16 = l__Maid__3.new();
		local v17 = l__EntityUtil__14:getEntity(p12);
		if not v17 then
			error("Failed to find entity during client entity replication.");
		end;
		p12:WaitForChild("HandInvItem");
		local function v18(p13)
			if p13 then
				v17:equipItem(p13);
				return;
			end;
			v17:unequipItemInHand();
		end;
		v18(p12.HandInvItem.Value);
		v16:GiveTask(p12.HandInvItem.Changed:Connect(function(p14)
			v18(p14);
		end));
		local v19 = 0;
		local v20 = false;
		while true do
			local v21 = v19;
			if v20 then
				v21 = v21 + 1;
			else
				v20 = true;
			end;
			if not (v21 < #u15.values(l__ArmorSlot__16)) then
				break;
			end;
			local v22 = p12:WaitForChild("ArmorInvItem_" .. tostring(v21));
			local function v23(p15, p16)
				if not p16 then
					v17:unequipArmorSlot(p15);
					return;
				end;
				v17:equipArmorItem(p16, p15);
			end;
			v23(v21, v22.Value);
			v16:GiveTask(v22.Changed:Connect(function(p17)
				return v23(v21, p17);
			end));
			v19 = v21;		
		end;
		v16:GiveTask(p12.AncestryChanged:Connect(function(p18, p19)
			if p19 == nil then
				v16:DoCleaning();
			end;
		end));
	end);
end;
local l__ClientSyncEvents__17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function u1.hookObservedPlayer(p20, p21, p22)
	p20.playerMaid:DoCleaning();
	local u18 = {};
	local u19 = l__Maid__3.new();
	local function u20(p23)
		u18[p23] = true;
		local v24 = l__Maid__3.new();
		u19:GiveTask(v24);
		v24:GiveTask(p23:GetAttributeChangedSignal("Amount"):Connect(function()
			l__ClientStore__5:dispatch({
				type = "InventorySetItemAmount", 
				tool = p23, 
				amount = p23:GetAttribute("Amount")
			});
		end));
		v24:GiveTask(p23.AncestryChanged:Connect(function(p24, p25)
			if p25 == nil then
				v24:DoCleaning();
			end;
		end));
		v24:GiveTask(function()
			u18[p23] = nil;
			l__ClientStore__5:dispatch({
				type = "InventoryRemoveItem", 
				tool = p23
			});
		end);
		task.spawn(function()
			l__ClientSyncEvents__17.ItemAdded:fire(p23);
		end);
		return v24;
	end;
	local function u21(p26)
		local v25 = nil;
		print("hooking character..");
		u19:DoCleaning();
		local v26 = l__EntityUtil__14:getEntity(p26);
		if not v26 then
			error("character not found!");
		end;
		local function v27(p27)
			for v28, v29 in ipairs(p27:GetChildren()) do
				if u18[v29] == nil then
					l__ClientStore__5:dispatch({
						type = "InventoryAddItem", 
						tool = v29
					});
					u20(v29);
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
		local v30 = v26:getInventoryFolder();
		if v30 then
			v27(v30);
		end;
		u19:GiveTask(v26:inventoryFolderAddedEvent(function(p29)
			v27(p29);
		end));
		u19:GiveTask(p26.AncestryChanged:Connect(function(p30, p31)
			if p31 == nil then
				u19:DoCleaning();
			end;
		end));
		u19:GiveTask(function()
			print("unhooking character.");
		end);
		local u22 = l__Maid__3.new();
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
			local function v31(p33)
				u22:GiveTask(p33:GetAttributeChangedSignal("Amount"):Connect(function()
					l__ClientStore__5:dispatch({
						type = "ChestItemSetAmount", 
						itemInstance = p33, 
						amount = p33:GetAttribute("Amount")
					});
				end));
			end;
			for v32, v33 in ipairs(p32:GetChildren()) do
				if v33:IsA("Accessory") then
					l__ClientStore__5:dispatch({
						type = "ChestAddItem", 
						itemInstance = v33
					});
					v31(v33);
				end;
			end;
			u22:GiveTask(p32.ChildAdded:Connect(function(p34)
				if p34:IsA("Accessory") then
					l__ClientStore__5:dispatch({
						type = "ChestAddItem", 
						itemInstance = p34
					});
					v31(p34);
				end;
			end));
			u22:GiveTask(p32.ChildRemoved:Connect(function(p35)
				l__ClientStore__5:dispatch({
					type = "ChestRemoveItem", 
					itemInstance = p35
				});
			end));
		end;
		v25 = function(p36)
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
			v25((p26:FindFirstChild("ObservedChestFolder")));
			return;
		end;
		u19:GiveTask(p26.ChildAdded:Connect(function(p38)
			if p38.Name == "ObservedChestFolder" then
				v25(p38);
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
	local l__observedPlayer__34 = l__ClientStore__5:getState().Inventory.observedPlayer;
	if l__observedPlayer__34 then
		l__ClientStore__5:dispatch({
			type = "InventoryFullUpdate", 
			inventory = l__InventoryUtil__25.getInventory(l__observedPlayer__34)
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
	local v35 = nil;
	local v36 = p44 or l__ClientStore__5:getState().Inventory.observedInventory.inventory.armor;
	v35 = {};
	local function v37(p45, p46)
		if p46 == "empty" then
			return p45;
		end;
		local v38 = l__getItemMeta__11(p46.itemType);
		if v38.armor then
			p45[v38.armor.slot] = p46.itemType;
		end;
		return p45;
	end;
	for v39 = 1, #v36 do
		v35 = v37(v35, v36[v39], v39 - 1, v36);
	end;
	return local v40;
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	InventoryController = u2
};
return u1;

