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
function u1.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "ItemDropController";
end;
local l__ContextActionService__2 = v3.ContextActionService;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__AppConfiguration__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "apps").AppConfiguration;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__6 = v3.Players;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__getItemMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.KnitStart(p2)
	v1.Promise.defer(function()
		while { wait(0.2) } do
			v1.Promise.defer(function()
				p2:checkForPickup();
			end);		
		end;
	end);
	l__ContextActionService__2:BindAction("drop-item", function(p3, p4, p5)
		if p4 == Enum.UserInputState.Begin and not l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(l__AppConfiguration__4.INVENTORY) then
			p2:dropItemInHand();
		end;
	end, false, Enum.KeyCode.Q, Enum.KeyCode.Backspace, Enum.KeyCode.ButtonX);
	l__default__5.Client:Get("RemoteName"):Connect(function(p6)
		if p6.player ~= l__Players__6.LocalPlayer then
			local v7 = Vector3.new(p6.position.X, p6.position.Y, p6.position.Z);
			local v8 = l__Players__6.LocalPlayer.Character;
			if v8 ~= nil then
				v8 = v8.PrimaryPart;
			end;
			if v8 and (l__Players__6.LocalPlayer.Character:GetPrimaryPartCFrame().Position - v7).Magnitude <= 30 then
				l__SoundManager__7:playSound(l__GameSound__8.PICKUP_ITEM_DROP, {
					position = v7
				});
				local l__pickUpOverlaySound__9 = l__getItemMeta__9(p6.itemType).pickUpOverlaySound;
				if l__pickUpOverlaySound__9 ~= "" and l__pickUpOverlaySound__9 then
					l__SoundManager__7:playSound(l__pickUpOverlaySound__9, {
						position = v7, 
						volumeMultiplier = 0.9
					});
				end;
			end;
		end;
	end);
end;
local l__ClientStore__10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.dropItemInHand(p7)
	local l__hand__10 = l__ClientStore__10:getState().Inventory.observedInventory.inventory.hand;
	if l__hand__10 ~= nil then
		local v11 = l__default__5.Client:Get("RemoteName"):CallServer({
			item = l__hand__10.tool
		});
		l__SoundManager__7:playSound(l__GameSound__8.DROP_ITEM);
		if v11 then
			v11:SetAttribute("ClientDropTime", tick());
		end;
	end;
end;
function u1.dropHotbarItem(p8, p9)
	local l__item__12 = l__ClientStore__10:getState().Inventory.observedInventory.hotbar[p9 + 1].item;
	if not l__item__12 then
		return false;
	end;
	local v13 = l__default__5.Client:Get("RemoteName"):CallServer({
		item = l__item__12.tool, 
		amount = l__item__12.amount
	});
	l__SoundManager__7:playSound(l__GameSound__8.DROP_ITEM);
	if v13 then
		v13:SetAttribute("ClientDropTime", tick());
	end;
	return v13 ~= nil;
end;
local l__CollectionService__11 = v3.CollectionService;
local l__Workspace__12 = v3.Workspace;
local u13 = v2.ConstantManager.registerConstants(script, {
	PickupPerItemCooldown = 3
});
local l__InventoryUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function u1.checkForPickup(p10)
	if l__Players__6.LocalPlayer.Character then
		local l__PrimaryPart__14 = l__Players__6.LocalPlayer.Character.PrimaryPart;
		if l__PrimaryPart__14 then
			local v15 = {};
			local v16 = 0;
			local v17, v18, v19 = ipairs((l__CollectionService__11:GetTagged("ItemDrop")));
			while true do
				v17(v18, v19);
				if not v17 then
					break;
				end;
				if (l__PrimaryPart__14.Position - v18.Position).Magnitude <= 6 == true then
					v16 = v16 + 1;
					v15[v16] = v18;
				end;			
			end;
			local v20 = {};
			local v21 = 0;
			local v22, v23, v24 = ipairs(v15);
			while true do
				v22(v23, v24);
				if not v22 then
					break;
				end;
				if v23:GetAttribute("PickupReadyTime") < l__Workspace__12:GetServerTimeNow() == true then
					v21 = v21 + 1;
					v20[v21] = v23;
				end;			
			end;
			local v25 = {};
			local v26 = 0;
			local v27, v28, v29 = ipairs(v20);
			while true do
				v27(v28, v29);
				if not v27 then
					break;
				end;
				local v30 = v28:GetAttribute("ClientPickupAttemptTime");
				if v30 ~= nil then
					local v31 = u13.PickupPerItemCooldown < tick() - v30;
				else
					v31 = true;
				end;
				if v31 == true then
					v26 = v26 + 1;
					v25[v26] = v28;
				end;			
			end;
			local function v32(p11)
				local v33 = l__getItemMeta__9(p11.Name);
				local v34 = v33;
				if v34 ~= nil then
					v34 = v34.maxStackSize;
				end;
				if v34 ~= nil then
					local v35 = l__InventoryUtil__14.getToolFromInventory(l__Players__6.LocalPlayer, p11.Name);
					local v36 = v35;
					if v36 ~= nil then
						v36 = v36.amount;
					end;
					if v36 ~= nil and v33.maxStackSize <= v35.amount then
						return false;
					end;
				end;
				return true;
			end;
			local v37 = {};
			local v38 = 0;
			local v39, v40, v41 = ipairs(v25);
			while true do
				v39(v40, v41);
				if not v39 then
					break;
				end;
				v41 = v39;
				if v32(v40, v39 - 1, v25) == true then
					v38 = v38 + 1;
					v37[v38] = v40;
				end;			
			end;
			local v42 = false;
			local v43 = 0;
			local v44 = false;
			while true do
				if v44 then
					v43 = v43 + 1;
				else
					v44 = true;
				end;
				if not (v43 < math.min(5, #v37)) then
					break;
				end;
				local v45 = v37[v43 + 1];
				v45:SetAttribute("ClientPickupAttemptTime", tick());
				local u15 = v42;
				l__default__5.Client:Get("RemoteName"):CallServerAsync({
					itemDrop = v45
				}):andThen(function(p12)
					if p12 and not u15 then
						l__SoundManager__7:playSound(l__GameSound__8.PICKUP_ITEM_DROP);
						local l__pickUpOverlaySound__46 = l__getItemMeta__9(v45.Name).pickUpOverlaySound;
						if l__pickUpOverlaySound__46 ~= "" and l__pickUpOverlaySound__46 then
							l__SoundManager__7:playSound(l__pickUpOverlaySound__46, {
								position = l__PrimaryPart__14.Position, 
								volumeMultiplier = 0.9
							});
						end;
						u15 = true;
					end;
				end);			
			end;
		end;
	end;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	ItemDropController = u1
};
