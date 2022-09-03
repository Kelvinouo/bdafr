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
		while { wait(3) } do
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
		local v6 = {};
		if p3.placer == l__Players__3.LocalPlayer then
			local v7 = nil;
		else
			v7 = p3.flagPosition;
		end;
		v6.position = v7;
		l__SoundManager__5:playSound(l__GameSound__6.FLAG_DROP, v6);
	end);
end;
local l__CollectionService__7 = v2.CollectionService;
local l__BalanceFile__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local l__Workspace__9 = v2.Workspace;
local l__getItemMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__InventoryUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function v4.checkForPickUp(p4)
	local v8 = 0;
	local v9 = false;
	while true do
		if v9 then
			v8 = v8 + 1;
		else
			v9 = true;
		end;
		if not (v8 < #p4.flagList) then
			break;
		end;
		local v10 = p4.flagList[v8 + 1];
		if not l__BlockEngine__4:getStore():getBlockAt((l__BlockEngine__4:getBlockPosition(v10))) then
			table.remove(p4.flagList, v8 + 1);
		else
			local v11 = {};
			local v12 = 0;
			local v13, v14, v15 = ipairs((l__CollectionService__7:GetTagged("ItemDrop")));
			while true do
				v13(v14, v15);
				if not v13 then
					break;
				end;
				if (v10 - v14.Position).Magnitude <= l__BalanceFile__8.PIRATE_FLAG_RANGE == true then
					v12 = v12 + 1;
					v11[v12] = v14;
				end;			
			end;
			local v16 = {};
			local v17 = 0;
			local v18, v19, v20 = ipairs(v11);
			while true do
				v18(v19, v20);
				if not v18 then
					break;
				end;
				if v19:GetAttribute("PickupReadyTime") < l__Workspace__9:GetServerTimeNow() == true then
					v17 = v17 + 1;
					v16[v17] = v19;
				end;			
			end;
			local v21 = {};
			local v22 = 0;
			local v23, v24, v25 = ipairs(v16);
			while true do
				v23(v24, v25);
				if not v23 then
					break;
				end;
				local v26 = v24:GetAttribute("ClientPickupAttemptTime");
				if v26 ~= nil then
					local v27 = tick() - v26 > 5;
				else
					v27 = true;
				end;
				if v27 == true then
					v22 = v22 + 1;
					v21[v22] = v24;
				end;			
			end;
			local v28 = {};
			local v29 = 0;
			local v30, v31, v32 = ipairs(v21);
			while true do
				v30(v31, v32);
				if not v30 then
					break;
				end;
				local v33 = v31:GetAttribute("ClientDropTime");
				if v33 ~= 0 and v33 == v33 and v33 ~= "" and v33 then
					local v34 = false;
				else
					v34 = true;
				end;
				if v34 == true then
					v29 = v29 + 1;
					v28[v29] = v31;
				end;			
			end;
			local function v35(p5)
				local v36 = l__getItemMeta__10(p5.Name);
				local v37 = v36;
				if v37 ~= nil then
					v37 = v37.maxStackSize;
				end;
				if v37 ~= nil then
					local v38 = l__InventoryUtil__11.getToolFromInventory(l__Players__3.LocalPlayer, p5.Name);
					local v39 = v38;
					if v39 ~= nil then
						v39 = v39.amount;
					end;
					if v39 ~= nil and v36.maxStackSize <= v38.amount then
						return false;
					end;
				end;
				return true;
			end;
			local v40 = {};
			local v41 = 0;
			local v42, v43, v44 = ipairs(v28);
			while true do
				v42(v43, v44);
				if not v42 then
					break;
				end;
				v44 = v42;
				if v35(v43, v42 - 1, v28) == true then
					v41 = v41 + 1;
					v40[v41] = v43;
				end;			
			end;
			local function v45(p6)
				local v46 = l__getItemMeta__10(p6.Name);
				local v47 = v46;
				if v47 ~= nil then
					v47 = v47.maxStackSize;
				end;
				if v47 ~= nil then
					local v48 = l__InventoryUtil__11.getToolFromInventory(l__Players__3.LocalPlayer, p6.Name);
					local v49 = v48;
					if v49 ~= nil then
						v49 = v49.amount;
					end;
					if v49 ~= nil and v46.maxStackSize <= v48.amount then
						return false;
					end;
				end;
				return true;
			end;
			local v50 = {};
			local v51 = 0;
			local v52, v53, v54 = ipairs(v40);
			while true do
				v52(v53, v54);
				if not v52 then
					break;
				end;
				v54 = v52;
				if v45(v53, v52 - 1, v40) == true then
					v51 = v51 + 1;
					v50[v51] = v53;
				end;			
			end;
			local v55 = 0;
			local v56 = false;
			while true do
				if v56 then
					v55 = v55 + 1;
				else
					v56 = true;
				end;
				if not (v55 < math.min(5, #v50)) then
					break;
				end;
				local v57 = v50[v55 + 1];
				v57:SetAttribute("ClientPickupAttemptTime", tick());
				l__default__1.Client:Get("RemoteName"):CallServerAsync({
					itemDrop = v57, 
					flagPosition = v10
				});			
			end;
		end;	
	end;
end;
local v58 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
