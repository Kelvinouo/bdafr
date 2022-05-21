-- Script Hash: 404dc12835697c3027caf4554c81a1e2ae7e0e1984d4d0d6850549fa8372f40f2e54cdd8de84e373b0e2dd691515e05a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "HotbarController";
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
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "HotbarController";
	p1.maid = l__Maid__3.new();
end;
local l__Players__4 = v3.Players;
local l__CreateRoduxApp__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__HotbarAppWrapper__6 = v1.import(script, script.Parent, "ui", "hotbar-app").HotbarAppWrapper;
local l__ContextActionService__7 = v3.ContextActionService;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__AppConfiguration__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "apps").AppConfiguration;
local l__ClientStore__10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__HotbarKeyboardNumbers__11 = v1.import(script, script.Parent, "lib", "hotbar-keyboard-numbers").HotbarKeyboardNumbers;
local l__EntityUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ArmorSlot__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
function u1.KnitStart(p2)
	l__Players__4.LocalPlayer.CharacterAdded:Connect(function(p3)
		l__CreateRoduxApp__5("hotbar", l__HotbarAppWrapper__6);
	end);
	v1.Promise.defer(function()
		if l__Players__4.LocalPlayer.Character then
			l__CreateRoduxApp__5("hotbar", l__HotbarAppWrapper__6);
		end;
	end);
	l__ContextActionService__7:BindActionAtPriority("hotbar-keyboard", function(p4, p5, p6)
		if l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(l__AppConfiguration__9.INVENTORY) then
			return Enum.ContextActionResult.Pass;
		end;
		if p5 ~= Enum.UserInputState.Begin then
			return;
		end;
		l__ClientStore__10:dispatch({
			type = "InventorySelectHotbarSlot", 
			slot = p6.KeyCode.Value - 49
		});
		return Enum.ContextActionResult.Sink;
	end, false, Enum.ContextActionPriority.High.Value, unpack(l__HotbarKeyboardNumbers__11));
	p2.maid:GiveTask(function()
		l__ContextActionService__7:UnbindAction("hotbar-keyboard");
	end);
	l__ContextActionService__7:BindAction("hotbar-gamepad", function(p7, p8, p9)
		if p8 == Enum.UserInputState.Begin then
			local v7 = l__ClientStore__10:getState().Inventory.observedInventory.hotbarSlot;
			if p9.KeyCode == Enum.KeyCode.ButtonR1 then
				v7 = math.clamp(v7 + 1, 0, 8);
			elseif p9.KeyCode == Enum.KeyCode.ButtonL1 then
				v7 = math.clamp(v7 - 1, 0, 8);
			end;
			l__ClientStore__10:dispatch({
				type = "InventorySelectHotbarSlot", 
				slot = v7
			});
		end;
	end, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1);
	p2.maid:GiveTask(function()
		l__ContextActionService__7:UnbindAction("hotbar-gamepad");
	end);
	local function u15(p10)
		if p10.Inventory.observedPlayer == l__Players__4.LocalPlayer and p10.Inventory.observedPlayer.Character then
			local v8 = l__EntityUtil__12:getEntity(p10.Inventory.observedPlayer);
			if v8 and v8:isAlive() then
				local v9 = p10.Inventory.observedInventory.hotbar[p10.Inventory.observedInventory.hotbarSlot + 1];
				if v9.item then
					v8:equipItem(v9.item.tool);
					return;
				end;
				v8:unequipItemInHand();
			end;
		end;
	end;
	local function u16(p11, p12)
		if p11.Inventory.observedPlayer == l__Players__4.LocalPlayer and p11.Inventory.observedPlayer.Character then
			local v10 = l__EntityUtil__12:getEntity(p11.Inventory.observedPlayer);
			if v10 and v10:isAlive() then
				local v11 = p11.Inventory.observedInventory.inventory.armor[p12 + 1];
				if v11 ~= "empty" then
					v1.Promise.defer(function()
						v10:equipArmorItem(v11.tool, p12);
					end);
					return;
				end;
				v1.Promise.defer(function()
					v10:unequipArmorSlot(p12);
				end);
			end;
		end;
	end;
	l__ClientStore__10.changed:connect(function(p13, p14)
		if p13.Inventory.observedInventory.inventory.hand ~= p14.Inventory.observedInventory.inventory.hand then
			u15(p13);
		end;
		local v12 = 0;
		local v13 = false;
		while true do
			if v13 then
				v12 = v12 + 1;
			else
				v13 = true;
			end;
			if not (v12 < #u13.values(l__ArmorSlot__14)) then
				break;
			end;
			if p13.Inventory.observedInventory.inventory.armor[v12 + 1] ~= p14.Inventory.observedInventory.inventory.armor[v12 + 1] then
				u16(p13, v12);
			end;		
		end;
	end);
	l__Players__4.LocalPlayer.CharacterAdded:Connect(function(p15)
		u15(l__ClientStore__10:getState());
		local v14 = 0;
		local v15 = false;
		while true do
			if v15 then
				v14 = v14 + 1;
			else
				v15 = true;
			end;
			if not (v14 < #u13.values(l__ArmorSlot__14)) then
				break;
			end;
			u16(l__ClientStore__10:getState(), v14);		
		end;
	end);
	if l__Players__4.LocalPlayer.Character then
		wait(0.2);
		u15(l__ClientStore__10:getState());
		local v16 = 0;
		local v17 = false;
		while true do
			if v17 then
				v16 = v16 + 1;
			else
				v17 = true;
			end;
			if not (v16 < #u13.values(l__ArmorSlot__14)) then
				break;
			end;
			u16(l__ClientStore__10:getState(), v16);		
		end;
	end;
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	HotbarController = u2
};
return u1;
