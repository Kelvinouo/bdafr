-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "HotbarController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "HotbarController";
	p1.maid = u2.new();
end;
local l__Players__3 = v2.Players;
local l__CreateRoduxApp__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__HotbarAppWrapper__5 = v1.import(script, script.Parent, "ui", "hotbar-app").HotbarAppWrapper;
local l__ContextActionService__6 = v2.ContextActionService;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__AppConfiguration__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "apps").AppConfiguration;
local l__ClientStore__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__HotbarKeyboardNumbers__10 = v1.import(script, script.Parent, "lib", "hotbar-keyboard-numbers").HotbarKeyboardNumbers;
local l__EntityUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ArmorSlot__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local l__ClientSyncEvents__14 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function u1.KnitStart(p2)
	l__Players__3.LocalPlayer.CharacterAdded:Connect(function(p3)
		l__CreateRoduxApp__4("hotbar", l__HotbarAppWrapper__5);
	end);
	v1.Promise.defer(function()
		if l__Players__3.LocalPlayer.Character then
			l__CreateRoduxApp__4("hotbar", l__HotbarAppWrapper__5);
		end;
	end);
	l__ContextActionService__6:BindActionAtPriority("hotbar-keyboard", function(p4, p5, p6)
		if l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(l__AppConfiguration__8.INVENTORY) then
			return Enum.ContextActionResult.Pass;
		end;
		if p5 ~= Enum.UserInputState.Begin then
			return;
		end;
		l__ClientStore__9:dispatch({
			type = "InventorySelectHotbarSlot", 
			slot = p6.KeyCode.Value - 49
		});
		return Enum.ContextActionResult.Sink;
	end, false, Enum.ContextActionPriority.High.Value, unpack(l__HotbarKeyboardNumbers__10));
	p2.maid:GiveTask(function()
		l__ContextActionService__6:UnbindAction("hotbar-keyboard");
	end);
	l__ContextActionService__6:BindAction("hotbar-gamepad", function(p7, p8, p9)
		if p8 == Enum.UserInputState.Begin then
			local v6 = l__ClientStore__9:getState().Inventory.observedInventory.hotbarSlot;
			if p9.KeyCode == Enum.KeyCode.ButtonR1 then
				v6 = math.clamp(v6 + 1, 0, 8);
			elseif p9.KeyCode == Enum.KeyCode.ButtonL1 then
				v6 = math.clamp(v6 - 1, 0, 8);
			end;
			l__ClientStore__9:dispatch({
				type = "InventorySelectHotbarSlot", 
				slot = v6
			});
		end;
	end, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1);
	p2.maid:GiveTask(function()
		l__ContextActionService__6:UnbindAction("hotbar-gamepad");
	end);
	local function u15(p10)
		if p10.Inventory.observedPlayer == l__Players__3.LocalPlayer and p10.Inventory.observedPlayer.Character then
			local v7 = l__EntityUtil__11:getEntity(p10.Inventory.observedPlayer);
			if v7 and v7:isAlive() then
				local v8 = p10.Inventory.observedInventory.hotbar[p10.Inventory.observedInventory.hotbarSlot + 1];
				if v8.item then
					v7:equipItem(v8.item.tool);
					return;
				end;
				v7:unequipItemInHand();
			end;
		end;
	end;
	local function u16(p11, p12)
		if p11.Inventory.observedPlayer == l__Players__3.LocalPlayer and p11.Inventory.observedPlayer.Character then
			local v9 = l__EntityUtil__11:getEntity(p11.Inventory.observedPlayer);
			if v9 and v9:isAlive() then
				local v10 = p11.Inventory.observedInventory.inventory.armor[p12 + 1];
				if v10 ~= "empty" then
					v1.Promise.defer(function()
						v9:equipArmorItem(v10.tool, p12);
					end);
					return;
				end;
				v1.Promise.defer(function()
					v9:unequipArmorSlot(p12);
				end);
			end;
		end;
	end;
	local function u17(p13)
		if p13.Inventory.observedPlayer == l__Players__3.LocalPlayer and p13.Inventory.observedPlayer.Character then
			local v11 = l__EntityUtil__11:getEntity(p13.Inventory.observedPlayer);
			if v11 and v11:isAlive() then
				local l__backpack__12 = p13.Inventory.observedInventory.inventory.backpack;
				if l__backpack__12 then
					v1.Promise.defer(function()
						v11:equipBackpack(l__backpack__12.tool);
					end);
					return;
				end;
				v1.Promise.defer(function()
					v11:unequipBackpackSlot();
				end);
			end;
		end;
	end;
	l__ClientStore__9.changed:connect(function(p14, p15)
		if p14.Inventory.observedInventory.inventory.hand ~= p15.Inventory.observedInventory.inventory.hand then
			u15(p14);
		end;
		local v13 = 0;
		local v14 = false;
		while true do
			if v14 then
				v13 = v13 + 1;
			else
				v14 = true;
			end;
			if not (v13 < #u12.values(l__ArmorSlot__13)) then
				break;
			end;
			if p14.Inventory.observedInventory.inventory.armor[v13 + 1] ~= p15.Inventory.observedInventory.inventory.armor[v13 + 1] then
				u16(p14, v13);
			end;		
		end;
		if p14.Inventory.observedInventory.inventory.backpack ~= p15.Inventory.observedInventory.inventory.backpack then
			local v15 = p14.Inventory.observedInventory.inventory.backpack;
			if v15 ~= nil then
				v15 = v15.itemType;
			end;
			l__ClientSyncEvents__14.BackpackEquipEvent:fire(v15, l__Players__3.LocalPlayer);
			u17(p14);
		end;
	end);
	l__Players__3.LocalPlayer.CharacterAdded:Connect(function(p16)
		u15(l__ClientStore__9:getState());
		local v16 = 0;
		local v17 = false;
		while true do
			if v17 then
				v16 = v16 + 1;
			else
				v17 = true;
			end;
			if not (v16 < #u12.values(l__ArmorSlot__13)) then
				break;
			end;
			u16(l__ClientStore__9:getState(), v16);		
		end;
	end);
	if l__Players__3.LocalPlayer.Character then
		wait(0.2);
		u15(l__ClientStore__9:getState());
		local v18 = 0;
		local v19 = false;
		while true do
			if v19 then
				v18 = v18 + 1;
			else
				v19 = true;
			end;
			if not (v18 < #u12.values(l__ArmorSlot__13)) then
				break;
			end;
			u16(l__ClientStore__9:getState(), v18);		
		end;
	end;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	HotbarController = u1
};
