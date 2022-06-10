-- Script Hash: 59d05ce816f269881d27318b0d714947fd0bd9431695af97c76a61a7ec2f9210617ec6278f994a5253caa0daf88c5a7d
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
local u2 = l__KnitController__3;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "HotbarController";
	p1.maid = u3.new();
end;
local l__Players__4 = v2.Players;
local l__CreateRoduxApp__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__HotbarAppWrapper__6 = v1.import(script, script.Parent, "ui", "hotbar-app").HotbarAppWrapper;
local l__ContextActionService__7 = v2.ContextActionService;
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
			local v6 = l__ClientStore__10:getState().Inventory.observedInventory.hotbarSlot;
			if p9.KeyCode == Enum.KeyCode.ButtonR1 then
				v6 = math.clamp(v6 + 1, 0, 8);
			elseif p9.KeyCode == Enum.KeyCode.ButtonL1 then
				v6 = math.clamp(v6 - 1, 0, 8);
			end;
			l__ClientStore__10:dispatch({
				type = "InventorySelectHotbarSlot", 
				slot = v6
			});
		end;
	end, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1);
	p2.maid:GiveTask(function()
		l__ContextActionService__7:UnbindAction("hotbar-gamepad");
	end);
	local function u15(p10)
		if p10.Inventory.observedPlayer == l__Players__4.LocalPlayer and p10.Inventory.observedPlayer.Character then
			local v7 = l__EntityUtil__12:getEntity(p10.Inventory.observedPlayer);
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
		if p11.Inventory.observedPlayer == l__Players__4.LocalPlayer and p11.Inventory.observedPlayer.Character then
			local v9 = l__EntityUtil__12:getEntity(p11.Inventory.observedPlayer);
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
	l__ClientStore__10.changed:connect(function(p13, p14)
		if p13.Inventory.observedInventory.inventory.hand ~= p14.Inventory.observedInventory.inventory.hand then
			u15(p13);
		end;
		local v11 = 0;
		local v12 = false;
		while true do
			if v12 then
				v11 = v11 + 1;
			else
				v12 = true;
			end;
			if not (v11 < #u13.values(l__ArmorSlot__14)) then
				break;
			end;
			if p13.Inventory.observedInventory.inventory.armor[v11 + 1] ~= p14.Inventory.observedInventory.inventory.armor[v11 + 1] then
				u16(p13, v11);
			end;		
		end;
	end);
	l__Players__4.LocalPlayer.CharacterAdded:Connect(function(p15)
		u15(l__ClientStore__10:getState());
		local v13 = 0;
		local v14 = false;
		while true do
			if v14 then
				v13 = v13 + 1;
			else
				v14 = true;
			end;
			if not (v13 < #u13.values(l__ArmorSlot__14)) then
				break;
			end;
			u16(l__ClientStore__10:getState(), v13);		
		end;
	end);
	if l__Players__4.LocalPlayer.Character then
		wait(0.2);
		u15(l__ClientStore__10:getState());
		local v15 = 0;
		local v16 = false;
		while true do
			if v16 then
				v15 = v15 + 1;
			else
				v16 = true;
			end;
			if not (v15 < #u13.values(l__ArmorSlot__14)) then
				break;
			end;
			u16(l__ClientStore__10:getState(), v15);		
		end;
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	HotbarController = u2
};
return u1;
