-- Script Hash: e53dc3255edb60a500f11d178e0555b362087bd433642294e7718747c12eaae330cea716b2d6463bee5ee20a03aa34ea
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ItemDropController";
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
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "ItemDropController";
end;
local l__ContextActionService__3 = v3.ContextActionService;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__AppConfiguration__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "apps").AppConfiguration;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__7 = v3.Players;
local l__SoundManager__8 = v2.SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.KnitStart(p2)
	v1.Promise.defer(function()
		while { wait(0.2) } do
			v1.Promise.defer(function()
				p2:checkForPickup();
			end);		
		end;
	end);
	l__ContextActionService__3:BindAction("drop-item", function(p3, p4, p5)
		if p4 == Enum.UserInputState.Begin and not l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(l__AppConfiguration__5.INVENTORY) then
			p2:dropItemInHand();
		end;
	end, false, Enum.KeyCode.Q, Enum.KeyCode.Backspace, Enum.KeyCode.ButtonX);
	l__default__6.Client:Get("RemoteName"):Connect(function(p6)
		if p6.player ~= l__Players__7.LocalPlayer then
			local v7 = Vector3.new(p6.position.X, p6.position.Y, p6.position.Z);
			local v8 = l__Players__7.LocalPlayer.Character;
			if v8 ~= nil then
				v8 = v8.PrimaryPart;
			end;
			if v8 and (l__Players__7.LocalPlayer.Character:GetPrimaryPartCFrame().Position - v7).Magnitude <= 30 then
				l__SoundManager__8:playSound(l__GameSound__9.PICKUP_ITEM_DROP, {
					position = v7
				});
			end;
		end;
	end);
end;
local l__ClientStore__10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.dropItemInHand(p7)
	local l__hand__9 = l__ClientStore__10:getState().Inventory.observedInventory.inventory.hand;
	if l__hand__9 ~= nil then
		local v10 = l__default__6.Client:Get("RemoteName"):CallServer({
			item = l__hand__9.tool
		});
		l__SoundManager__8:playSound(l__GameSound__9.DROP_ITEM);
		if v10 then
			v10:SetAttribute("ClientDropTime", tick());
		end;
	end;
end;
local l__CollectionService__11 = v3.CollectionService;
local l__Workspace__12 = v3.Workspace;
local u13 = v2.ConstantManager.registerConstants(script, {
	PickupPerItemCooldown = 3
});
local l__getItemMeta__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__InventoryUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function u1.checkForPickup(p8)
	if l__Players__7.LocalPlayer.Character then
		local l__PrimaryPart__11 = l__Players__7.LocalPlayer.Character.PrimaryPart;
		if l__PrimaryPart__11 then
			local v12 = l__CollectionService__11:GetTagged("ItemDrop");
			local function v13(p9)
				return (l__PrimaryPart__11.Position - p9.Position).Magnitude <= 6;
			end;
			local v14 = {};
			local v15 = 0;
			for v16, v17 in ipairs(v12) do
				if v13(v17, v16 - 1, v12) == true then
					v15 = v15 + 1;
					v14[v15] = v17;
				end;
			end;
			local function v18(p10)
				return p10:GetAttribute("PickupReadyTime") < l__Workspace__12:GetServerTimeNow();
			end;
			local v19 = {};
			local v20 = 0;
			for v21, v22 in ipairs(v14) do
				if v18(v22, v21 - 1, v14) == true then
					v20 = v20 + 1;
					v19[v20] = v22;
				end;
			end;
			local function v23(p11)
				local v24 = p11:GetAttribute("ClientPickupAttemptTime");
				if v24 == nil then
					return true;
				end;
				return u13.PickupPerItemCooldown < tick() - v24;
			end;
			local v25 = {};
			local v26 = 0;
			for v27, v28 in ipairs(v19) do
				if v23(v28, v27 - 1, v19) == true then
					v26 = v26 + 1;
					v25[v26] = v28;
				end;
			end;
			local function v29(p12)
				local v30 = l__getItemMeta__14(p12.Name);
				local v31 = v30;
				if v31 ~= nil then
					v31 = v31.maxStackSize;
				end;
				if v31 ~= nil then
					local v32 = l__InventoryUtil__15.getToolFromInventory(l__Players__7.LocalPlayer, p12.Name);
					local v33 = v32;
					if v33 ~= nil then
						v33 = v33.amount;
					end;
					if v33 ~= nil and v30.maxStackSize <= v32.amount then
						return false;
					end;
				end;
				return true;
			end;
			local v34 = {};
			local v35 = 0;
			for v36, v37 in ipairs(v25) do
				if v29(v37, v36 - 1, v25) == true then
					v35 = v35 + 1;
					v34[v35] = v37;
				end;
			end;
			local v38 = false;
			local v39 = 0;
			local v40 = false;
			while true do
				if v40 then
					v39 = v39 + 1;
				else
					v40 = true;
				end;
				if not (v39 < math.min(5, #v34)) then
					break;
				end;
				local v41 = v34[v39 + 1];
				v41:SetAttribute("ClientPickupAttemptTime", tick());
				local u16 = v38;
				l__default__6.Client:Get("RemoteName"):CallServerAsync({
					itemDrop = v41
				}):andThen(function(p13)
					if p13 and not u16 then
						l__SoundManager__8:playSound(l__GameSound__9.PICKUP_ITEM_DROP);
						u16 = true;
					end;
				end);			
			end;
		end;
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ItemDropController = u2
};
return u1;
