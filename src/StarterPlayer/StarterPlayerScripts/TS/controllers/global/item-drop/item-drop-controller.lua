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
function u1.dropHotbarItem(p8, p9)
	local l__item__11 = l__ClientStore__10:getState().Inventory.observedInventory.hotbar[p9 + 1].item;
	if not l__item__11 then
		return false;
	end;
	local v12 = l__default__6.Client:Get("RemoteName"):CallServer({
		item = l__item__11.tool, 
		amount = l__item__11.amount
	});
	l__SoundManager__8:playSound(l__GameSound__9.DROP_ITEM);
	if v12 then
		v12:SetAttribute("ClientDropTime", tick());
	end;
	return v12 ~= nil;
end;
local l__CollectionService__11 = v3.CollectionService;
local l__Workspace__12 = v3.Workspace;
local u13 = v2.ConstantManager.registerConstants(script, {
	PickupPerItemCooldown = 3
});
local l__getItemMeta__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__InventoryUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function u1.checkForPickup(p10)
	if l__Players__7.LocalPlayer.Character then
		local l__PrimaryPart__13 = l__Players__7.LocalPlayer.Character.PrimaryPart;
		if l__PrimaryPart__13 then
			local v14 = {};
			local v15 = 0;
			local v16, v17, v18 = ipairs((l__CollectionService__11:GetTagged("ItemDrop")));
			while true do
				local v19, v20 = v16(v17, v18);
				if not v19 then
					break;
				end;
				if (l__PrimaryPart__13.Position - v20.Position).Magnitude <= 6 == true then
					v15 = v15 + 1;
					v14[v15] = v20;
				end;			
			end;
			local v21 = {};
			local v22 = 0;
			local v23, v24, v25 = ipairs(v14);
			while true do
				local v26, v27 = v23(v24, v25);
				if not v26 then
					break;
				end;
				if v27:GetAttribute("PickupReadyTime") < l__Workspace__12:GetServerTimeNow() == true then
					v22 = v22 + 1;
					v21[v22] = v27;
				end;			
			end;
			local v28 = {};
			local v29 = 0;
			local v30, v31, v32 = ipairs(v21);
			while true do
				local v33, v34 = v30(v31, v32);
				if not v33 then
					break;
				end;
				local v35 = v34:GetAttribute("ClientPickupAttemptTime");
				if v35 ~= nil then
					local v36 = u13.PickupPerItemCooldown < tick() - v35;
				else
					v36 = true;
				end;
				if v36 == true then
					v29 = v29 + 1;
					v28[v29] = v34;
				end;			
			end;
			local function v37(p11)
				local v38 = l__getItemMeta__14(p11.Name);
				local v39 = v38;
				if v39 ~= nil then
					v39 = v39.maxStackSize;
				end;
				if v39 ~= nil then
					local v40 = l__InventoryUtil__15.getToolFromInventory(l__Players__7.LocalPlayer, p11.Name);
					local v41 = v40;
					if v41 ~= nil then
						v41 = v41.amount;
					end;
					if v41 ~= nil and v38.maxStackSize <= v40.amount then
						return false;
					end;
				end;
				return true;
			end;
			local v42 = {};
			local v43 = 0;
			for v44, v45 in ipairs(v28) do
				if v37(v45, v44 - 1, v28) == true then
					v43 = v43 + 1;
					v42[v43] = v45;
				end;
			end;
			local v46 = false;
			local v47 = 0;
			local v48 = false;
			while true do
				if v48 then
					v47 = v47 + 1;
				else
					v48 = true;
				end;
				if not (v47 < math.min(5, #v42)) then
					break;
				end;
				local v49 = v42[v47 + 1];
				v49:SetAttribute("ClientPickupAttemptTime", tick());
				local u16 = v46;
				l__default__6.Client:Get("RemoteName"):CallServerAsync({
					itemDrop = v49
				}):andThen(function(p12)
					if p12 and not u16 then
						l__SoundManager__8:playSound(l__GameSound__9.PICKUP_ITEM_DROP);
						u16 = true;
					end;
				end);			
			end;
		end;
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ItemDropController = u2
};
return u1;
