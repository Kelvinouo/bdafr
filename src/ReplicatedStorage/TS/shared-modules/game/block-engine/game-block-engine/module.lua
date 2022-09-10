-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out);
local l__BlockEngine__3 = v2.BlockEngine;
local l__BreakBlockDamageType__4 = v2.BreakBlockDamageType;
local l__GreedyBlockHandler__5 = v2.GreedyBlockHandler;
local l__SoundManager__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__SyncEventPriority__7 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEventPriority;
local v8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local v9 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local v10 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__PhysicsService__11 = v10.PhysicsService;
local l__RunService__12 = v10.RunService;
local l__Workspace__13 = v10.Workspace;
local l__BalanceFile__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local l__EntityUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__BedwarsKitSkinMeta__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local l__getItemMeta__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__BedBlockHandler__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "bed-block-handler").BedBlockHandler;
local l__GameSound__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__StatusEffectType__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__StatusEffectUtil__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local l__BarrierBlockHandler__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "barrier-block-handler").BarrierBlockHandler;
local l__CameraTurretBlockHandler__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "camera-turret-block-handler").CameraTurretBlockHandler;
local l__CannonBlockHandler__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "cannon-block-handler").CannonBlockHandler;
local l__CropBlockHandler__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "crop-block-handler").CropBlockHandler;
local l__GlassBlockHandler__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "glass-block-handler").GlassBlockHandler;
local l__GrassBlockHandler__28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "grass-block-handler").GrassBlockHandler;
local l__HugeLuckyBlockHandler__29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "huge-lucky-block-handler").HugeLuckyBlockHandler;
local l__PinataBlockHandler__30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "pinata-block-handler").PinataBlockHandler;
local v31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "random-foliage-block-handler").RandomFoliageBlockHandler;
local l__SmokeBlockHandler__32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "smoke-block-handler").SmokeBlockHandler;
local v33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "snow-cone-machine-block-handler").SnowConeMachineBlockHandler;
local l__StonePlayerBlockHandler__34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "stone-player-block-handler").StonePlayerBlockHandler;
local l__TeslaTrapBlockHandler__35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "tesla-trap-block-handler").TeslaTrapBlockHandler;
local l__ZiplineBlockHandler__36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "zipline-block-handler").ZiplineBlockHandler;
local v37, v38, v39 = ipairs(v9.values(l__ItemType__18));
while true do
	v37(v38, v39);
	if not v37 then
		break;
	end;
	v39 = v37;
	local v40 = l__getItemMeta__17(v38);
	if v40.block then
		local v41 = {};
		function v41.placeSound()
			return { l__SoundManager__6:createSound(l__GameSound__20.GENERIC_BLOCK_PLACE) };
		end;
		function v41.breakSound()
			return { l__SoundManager__6:createSound(l__GameSound__20.GENERIC_BLOCK_BREAK) };
		end;
		v41.breakType = l__BreakBlockDamageType__4.WOOD;
		v40.block = v9.assign(v41, v40.block);
		local v42 = false;
		if v38 == l__ItemType__18.GRASS then
			l__BlockEngine__3:getHandlerRegistry():registerHandler(l__GrassBlockHandler__28.new(v38, 1, v40.block));
		elseif v38 == l__ItemType__18.GLASS then
			l__BlockEngine__3:getHandlerRegistry():registerHandler(l__GlassBlockHandler__27.new(v38, 1, v40.block));
		else
			if v38 == l__ItemType__18.MELON then
				v42 = true;
			end;
			if v42 or v38 == l__ItemType__18.CARROT then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__CropBlockHandler__26.new(v38, 1, v40.block));
			elseif v38 == l__ItemType__18.SMOKE_BLOCK then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__SmokeBlockHandler__32.new(v38, 1, v40.block));
			elseif v38 == l__ItemType__18.STONE_PLAYER_BLOCK then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__StonePlayerBlockHandler__34.new(v38, 1, v40.block));
			elseif v38 == l__ItemType__18.BARRIER then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__BarrierBlockHandler__23.new(v38, 1, v40.block));
			elseif v40.block.greedyMesh then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__GreedyBlockHandler__5.new(v38, 1, v40.block));
			end;
		end;
	end;
end;
if l__RunService__12:IsClient() then
	v8("BoolValue", {
		Name = "BlockHandlersReady", 
		Value = true, 
		Parent = l__Workspace__13
	});
end;
l__BlockEngine__3:getBlockDamageHook():connect(function(p1)
	if p1.player.Character then
		if p1.player.Character:GetAttribute("AxolotlBreakSpeed") == true then
			p1.damage = p1.damage * 1.4;
		end;
		local v43 = l__StatusEffectUtil__22:getStacks(p1.player.Character, l__StatusEffectType__21.SNOW_CONE);
		if l__BalanceFile__14.SNOW_CONE_BLOCK_COST <= v43 then
			p1.damage = p1.damage * (l__BalanceFile__14.SNOW_CONE_BLOCK_BASE_DMG + l__BalanceFile__14.SNOW_CONE_BLOCK_STACK_BONUS * v43);
		end;
		local v44 = l__BlockEngine__3:getStore():getBlockAt(p1.blockRef.blockPosition);
		if v44 then
			local v45 = l__getItemMeta__17(v44.Name).block;
			if v45 ~= nil then
				v45 = v45.breakableOnlyByHosts;
			end;
			if v45 and p1.player:GetAttribute("Host") ~= true and p1.player:GetAttribute("Cohost") ~= true then
				p1.damage = 0;
				return nil;
			end;
			local v46 = v44:GetAttribute("BedShieldEndTime");
			local v47 = v46;
			if v47 ~= 0 and v47 == v47 and v47 then
				v47 = l__Workspace__13:GetServerTimeNow() < v46;
			end;
			if v47 ~= 0 and v47 == v47 and v47 then
				p1.damage = 0;
				return nil;
			end;
		end;
	end;
end);
v2.BlockEngineServerSyncEvents.PlaceBlock:connect(function(p2)
	local v48 = p2:getBlockType();
	local v49 = l__getItemMeta__17(v48);
	if not v49.block or not v49.skins then
		return nil;
	end;
	local v50 = p2:getPlayer();
	local v51 = v50;
	if v51 ~= nil then
		v51 = v51.Character;
	end;
	if v51 then
		local v52 = v50.Character:GetAttribute("KitSkin");
		if v52 then
			local v53 = l__BedwarsKitSkinMeta__16[v52].itemSkins;
			if v53 ~= nil then
				local v54 = nil;
				local v55, v56, v57 = ipairs(v53);
				while true do
					v55(v56, v57);
					if not v55 then
						break;
					end;
					local v58 = v56.itemType == v48;
					if v58 then
						local v59 = v49.skins;
						if v59 ~= nil then
							v59 = table.find(v59, v56.name) ~= nil;
						end;
						v58 = v59;
					end;
					if v58 == true then
						v54 = v56;
						break;
					end;				
				end;
				v53 = v54;
			end;
			if v53 then
				p2:setData((table.find(v49.skins, v53.name) and 0) - 1 + 1);
			end;
		end;
	end;
end);
l__BlockEngine__3:getBlockDamageHook():setPriority(l__SyncEventPriority__7.HIGH):connect(function(p3)
	local v60 = l__EntityUtil__15:getEntity(p3.player);
	if v60 then
		local l__Value__61 = v60:getInstance().HandInvItem.Value;
		if l__Value__61 then
			local v62 = l__BlockEngine__3:getStore():getBlockAt(p3.blockRef.blockPosition);
			if v62 then
				local v63 = l__getItemMeta__17(l__Value__61.Name);
				local v64 = l__getItemMeta__17(v62.Name);
				local v65 = v64.block;
				if v65 ~= nil then
					v65 = v65.breakType;
				end;
				if v65 then
					local v66 = v63.breakBlock;
					if v66 ~= nil then
						v66 = v66[v64.block.breakType];
					end;
					if v66 ~= nil then
						p3.damage = v66;
					end;
				end;
			end;
		end;
	end;
end);
local l__PrefabBlockHandler__1 = v2.PrefabBlockHandler;
l__BlockEngine__3:hookCreateSourceBlockHandler(function(p4, p5, p6)
	local v67 = l__getItemMeta__17(p4);
	if v67 == nil then
		return nil;
	end;
	if v67.block == nil then
		warn("Failed to find block meta for source block: " .. p4);
		return nil;
	end;
	if p4 == l__ItemType__18.BED then
		return l__BedBlockHandler__19.new(p4, p5, v67.block, p6);
	end;
	if p4 == l__ItemType__18.ZIPLINE_BASE then
		return l__ZiplineBlockHandler__36.new(p4, p5, v67.block, p6);
	end;
	if p4 == l__ItemType__18.TESLA_TRAP then
		return l__TeslaTrapBlockHandler__35.new(p4, p5, v67.block, p6);
	end;
	if p4 == l__ItemType__18.CANNON then
		return l__CannonBlockHandler__25.new(p4, p5, v67.block, p6);
	end;
	if p4 == l__ItemType__18.CAMERA_TURRET then
		return l__CameraTurretBlockHandler__24.new(p4, p5, v67.block, p6);
	end;
	if p4 == l__ItemType__18.HUGE_LUCKY_BLOCK then
		return l__HugeLuckyBlockHandler__29.new(p4, p5, v67.block, p6);
	end;
	if p4 == l__ItemType__18.FLOWER_PURPLE then
		return v31.new(p4, 1, v67.block, { "flower_purple", "flower_orange", "flower_pink", "flower_blue" });
	end;
	if p4 == l__ItemType__18.SMALL_BUSH then
		return v31.new(p4, 1, v67.block, { "small_bush" });
	end;
	if p4 == l__ItemType__18.LARGE_BUSH then
		return v31.new(p4, 1, v67.block, { "large_bush" });
	end;
	if p4 == l__ItemType__18.SNOW_CONE_MACHINE or p4 == l__ItemType__18.BROKEN_SNOW_CONE_MACHINE then
		return v33.new(p4, p5, v67.block, p6);
	end;
	if p4 == l__ItemType__18.PINATA then
		return l__PinataBlockHandler__30.new(p4, p5, v67.block, p6);
	end;
	return l__PrefabBlockHandler__1.new(p4, p5, v67.block, p6);
end);
l__BlockEngine__3:watchSourceFolder(v10.ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Blocks"));
if l__RunService__12:IsServer() then
	l__PhysicsService__11:CreateCollisionGroup("InflatedBalloons");
	l__PhysicsService__11:CollisionGroupSetCollidable("InflatedBalloons", "Players", false);
end;
return {};
