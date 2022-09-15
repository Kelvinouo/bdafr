-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "PirateFlagController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "PirateFlagController";
	p1.flagList = {};
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__Players__3 = v2.Players;
local l__BlockEngine__4 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	v1.Promise.defer(function()
		while true do
			local v6 = task.wait(3);
			if v6 == 0 then
				break;
			end;
			if v6 ~= v6 then
				break;
			end;
			if not v6 then
				break;
			end;
			v1.Promise.defer(function()
				p2:checkForPickUp();
			end);		
		end;
	end);
	l__default__1.Client:Get("RemoteName"):Connect(function(p3)
		if not p3.flagPosition then
			l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
				message = "There is an enemy flag nearby!"
			});
			return nil;
		end;
		if p3.placer == l__Players__3.LocalPlayer then
			table.insert(p2.flagList, (l__BlockEngine__4:getWorldPosition(p3.flagPosition)));
		end;
		local v7 = {};
		if p3.placer == l__Players__3.LocalPlayer then
			local v8 = nil;
		else
			v8 = p3.flagPosition;
		end;
		v7.position = v8;
		l__SoundManager__5:playSound(l__GameSound__6.FLAG_DROP, v7);
	end);
end;
local l__CollectionService__7 = v2.CollectionService;
local l__BalanceFile__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local l__Workspace__9 = v2.Workspace;
local l__getItemMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__InventoryUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function v4.checkForPickUp(p4)
	local v9 = 0;
	local v10 = false;
	while true do
		if v10 then
			v9 = v9 + 1;
		else
			v10 = true;
		end;
		if not (v9 < #p4.flagList) then
			break;
		end;
		local v11 = p4.flagList[v9 + 1];
		if not l__BlockEngine__4:getStore():getBlockAt((l__BlockEngine__4:getBlockPosition(v11))) then
			table.remove(p4.flagList, v9 + 1);
		else
			local v12 = {};
			local v13 = 0;
			local v14, v15, v16 = ipairs((l__CollectionService__7:GetTagged("ItemDrop")));
			while true do
				v14(v15, v16);
				if not v14 then
					break;
				end;
				if (v11 - v15.Position).Magnitude <= l__BalanceFile__8.PIRATE_FLAG_RANGE == true then
					v13 = v13 + 1;
					v12[v13] = v15;
				end;			
			end;
			local v17 = {};
			local v18 = 0;
			local v19, v20, v21 = ipairs(v12);
			while true do
				v19(v20, v21);
				if not v19 then
					break;
				end;
				if v20:GetAttribute("PickupReadyTime") < l__Workspace__9:GetServerTimeNow() == true then
					v18 = v18 + 1;
					v17[v18] = v20;
				end;			
			end;
			local v22 = {};
			local v23 = 0;
			local v24, v25, v26 = ipairs(v17);
			while true do
				v24(v25, v26);
				if not v24 then
					break;
				end;
				local v27 = v25:GetAttribute("ClientPickupAttemptTime");
				if v27 ~= nil then
					local v28 = tick() - v27 > 5;
				else
					v28 = true;
				end;
				if v28 == true then
					v23 = v23 + 1;
					v22[v23] = v25;
				end;			
			end;
			local v29 = {};
			local v30 = 0;
			local v31, v32, v33 = ipairs(v22);
			while true do
				v31(v32, v33);
				if not v31 then
					break;
				end;
				local v34 = v32:GetAttribute("ClientDropTime");
				if v34 ~= 0 and v34 == v34 and v34 ~= "" and v34 then
					local v35 = false;
				else
					v35 = true;
				end;
				if v35 == true then
					v30 = v30 + 1;
					v29[v30] = v32;
				end;			
			end;
			local function v36(p5)
				local v37 = l__getItemMeta__10(p5.Name);
				local v38 = v37;
				if v38 ~= nil then
					v38 = v38.maxStackSize;
				end;
				if v38 ~= nil then
					local v39 = l__InventoryUtil__11.getToolFromInventory(l__Players__3.LocalPlayer, p5.Name);
					local v40 = v39;
					if v40 ~= nil then
						v40 = v40.amount;
					end;
					if v40 ~= nil and v37.maxStackSize <= v39.amount then
						return false;
					end;
				end;
				return true;
			end;
			local v41 = {};
			local v42 = 0;
			local v43, v44, v45 = ipairs(v29);
			while true do
				v43(v44, v45);
				if not v43 then
					break;
				end;
				v45 = v43;
				if v36(v44, v43 - 1, v29) == true then
					v42 = v42 + 1;
					v41[v42] = v44;
				end;			
			end;
			local function v46(p6)
				local v47 = l__getItemMeta__10(p6.Name);
				local v48 = v47;
				if v48 ~= nil then
					v48 = v48.maxStackSize;
				end;
				if v48 ~= nil then
					local v49 = l__InventoryUtil__11.getToolFromInventory(l__Players__3.LocalPlayer, p6.Name);
					local v50 = v49;
					if v50 ~= nil then
						v50 = v50.amount;
					end;
					if v50 ~= nil and v47.maxStackSize <= v49.amount then
						return false;
					end;
				end;
				return true;
			end;
			local v51 = {};
			local v52 = 0;
			local v53, v54, v55 = ipairs(v41);
			while true do
				v53(v54, v55);
				if not v53 then
					break;
				end;
				v55 = v53;
				if v46(v54, v53 - 1, v41) == true then
					v52 = v52 + 1;
					v51[v52] = v54;
				end;			
			end;
			local v56 = 0;
			local v57 = false;
			while true do
				if v57 then
					v56 = v56 + 1;
				else
					v57 = true;
				end;
				if not (v56 < math.min(5, #v51)) then
					break;
				end;
				local v58 = v51[v56 + 1];
				v58:SetAttribute("ClientPickupAttemptTime", tick());
				l__default__1.Client:Get("RemoteName"):CallServerAsync({
					itemDrop = v58, 
					flagPosition = v11
				});			
			end;
		end;	
	end;
end;
local v59 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
