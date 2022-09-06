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
local v30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "random-foliage-block-handler").RandomFoliageBlockHandler;
local l__SmokeBlockHandler__31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "smoke-block-handler").SmokeBlockHandler;
local v32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "snow-cone-machine-block-handler").SnowConeMachineBlockHandler;
local l__StonePlayerBlockHandler__33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "stone-player-block-handler").StonePlayerBlockHandler;
local l__TeslaTrapBlockHandler__34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "tesla-trap-block-handler").TeslaTrapBlockHandler;
local l__ZiplineBlockHandler__35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "zipline-block-handler").ZiplineBlockHandler;
local v36, v37, v38 = ipairs(v9.values(l__ItemType__18));
while true do
	v36(v37, v38);
	if not v36 then
		break;
	end;
	v38 = v36;
	local v39 = l__getItemMeta__17(v37);
	if v39.block then
		local v40 = {};
		function v40.placeSound()
			return { l__SoundManager__6:createSound(l__GameSound__20.GENERIC_BLOCK_PLACE) };
		end;
		function v40.breakSound()
			return { l__SoundManager__6:createSound(l__GameSound__20.GENERIC_BLOCK_BREAK) };
		end;
		v40.breakType = l__BreakBlockDamageType__4.WOOD;
		v39.block = v9.assign(v40, v39.block);
		local v41 = false;
		if v37 == l__ItemType__18.GRASS then
			l__BlockEngine__3:getHandlerRegistry():registerHandler(l__GrassBlockHandler__28.new(v37, 1, v39.block));
		elseif v37 == l__ItemType__18.GLASS then
			l__BlockEngine__3:getHandlerRegistry():registerHandler(l__GlassBlockHandler__27.new(v37, 1, v39.block));
		else
			if v37 == l__ItemType__18.MELON then
				v41 = true;
			end;
			if v41 or v37 == l__ItemType__18.CARROT then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__CropBlockHandler__26.new(v37, 1, v39.block));
			elseif v37 == l__ItemType__18.SMOKE_BLOCK then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__SmokeBlockHandler__31.new(v37, 1, v39.block));
			elseif v37 == l__ItemType__18.STONE_PLAYER_BLOCK then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__StonePlayerBlockHandler__33.new(v37, 1, v39.block));
			elseif v37 == l__ItemType__18.BARRIER then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__BarrierBlockHandler__23.new(v37, 1, v39.block));
			elseif v39.block.greedyMesh then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__GreedyBlockHandler__5.new(v37, 1, v39.block));
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
		local v42 = l__StatusEffectUtil__22:getStacks(p1.player.Character, l__StatusEffectType__21.SNOW_CONE);
		if l__BalanceFile__14.SNOW_CONE_BLOCK_COST <= v42 then
			p1.damage = p1.damage * (l__BalanceFile__14.SNOW_CONE_BLOCK_BASE_DMG + l__BalanceFile__14.SNOW_CONE_BLOCK_STACK_BONUS * v42);
		end;
		local v43 = l__BlockEngine__3:getStore():getBlockAt(p1.blockRef.blockPosition);
		if v43 then
			local v44 = l__getItemMeta__17(v43.Name).block;
			if v44 ~= nil then
				v44 = v44.breakableOnlyByHosts;
			end;
			if v44 and p1.player:GetAttribute("Host") ~= true and p1.player:GetAttribute("Cohost") ~= true then
				p1.damage = 0;
				return nil;
			end;
			local v45 = v43:GetAttribute("BedShieldEndTime");
			local v46 = v45;
			if v46 ~= 0 and v46 == v46 and v46 then
				v46 = l__Workspace__13:GetServerTimeNow() < v45;
			end;
			if v46 ~= 0 and v46 == v46 and v46 then
				p1.damage = 0;
				return nil;
			end;
		end;
	end;
end);
v2.BlockEngineServerSyncEvents.PlaceBlock:connect(function(p2)
	local v47 = p2:getBlockType();
	local v48 = l__getItemMeta__17(v47);
	if not v48.block or not v48.skins then
		return nil;
	end;
	local v49 = p2:getPlayer();
	local v50 = v49;
	if v50 ~= nil then
		v50 = v50.Character;
	end;
	if v50 then
		local v51 = v49.Character:GetAttribute("KitSkin");
		if v51 then
			local v52 = l__BedwarsKitSkinMeta__16[v51].itemSkins;
			if v52 ~= nil then
				local v53 = nil;
				local v54, v55, v56 = ipairs(v52);
				while true do
					v54(v55, v56);
					if not v54 then
						break;
					end;
					local v57 = v55.itemType == v47;
					if v57 then
						local v58 = v48.skins;
						if v58 ~= nil then
							v58 = table.find(v58, v55.name) ~= nil;
						end;
						v57 = v58;
					end;
					if v57 == true then
						v53 = v55;
						break;
					end;				
				end;
				v52 = v53;
			end;
			if v52 then
				p2:setData((table.find(v48.skins, v52.name) and 0) - 1 + 1);
			end;
		end;
	end;
end);
l__BlockEngine__3:getBlockDamageHook():setPriority(l__SyncEventPriority__7.HIGH):connect(function(p3)
	local v59 = l__EntityUtil__15:getEntity(p3.player);
	if v59 then
		local l__Value__60 = v59:getInstance().HandInvItem.Value;
		if l__Value__60 then
			local v61 = l__BlockEngine__3:getStore():getBlockAt(p3.blockRef.blockPosition);
			if v61 then
				local v62 = l__getItemMeta__17(l__Value__60.Name);
				local v63 = l__getItemMeta__17(v61.Name);
				local v64 = v63.block;
				if v64 ~= nil then
					v64 = v64.breakType;
				end;
				if v64 then
					local v65 = v62.breakBlock;
					if v65 ~= nil then
						v65 = v65[v63.block.breakType];
					end;
					if v65 ~= nil then
						p3.damage = v65;
					end;
				end;
			end;
		end;
	end;
end);
local l__PrefabBlockHandler__1 = v2.PrefabBlockHandler;
l__BlockEngine__3:hookCreateSourceBlockHandler(function(p4, p5, p6)
	local v66 = l__getItemMeta__17(p4);
	if v66 == nil then
		return nil;
	end;
	if v66.block == nil then
		warn("Failed to find block meta for source block: " .. p4);
		return nil;
	end;
	if p4 == l__ItemType__18.BED then
		return l__BedBlockHandler__19.new(p4, p5, v66.block, p6);
	end;
	if p4 == l__ItemType__18.ZIPLINE_BASE then
		return l__ZiplineBlockHandler__35.new(p4, p5, v66.block, p6);
	end;
	if p4 == l__ItemType__18.TESLA_TRAP then
		return l__TeslaTrapBlockHandler__34.new(p4, p5, v66.block, p6);
	end;
	if p4 == l__ItemType__18.CANNON then
		return l__CannonBlockHandler__25.new(p4, p5, v66.block, p6);
	end;
	if p4 == l__ItemType__18.CAMERA_TURRET then
		return l__CameraTurretBlockHandler__24.new(p4, p5, v66.block, p6);
	end;
	if p4 == l__ItemType__18.HUGE_LUCKY_BLOCK then
		return l__HugeLuckyBlockHandler__29.new(p4, p5, v66.block, p6);
	end;
	if p4 == l__ItemType__18.FLOWER_PURPLE then
		return v30.new(p4, 1, v66.block, { "flower_purple", "flower_orange", "flower_pink", "flower_blue" });
	end;
	if p4 == l__ItemType__18.SMALL_BUSH then
		return v30.new(p4, 1, v66.block, { "small_bush" });
	end;
	if p4 == l__ItemType__18.LARGE_BUSH then
		return v30.new(p4, 1, v66.block, { "large_bush" });
	end;
	if p4 ~= l__ItemType__18.SNOW_CONE_MACHINE and not l__ItemType__18.BROKEN_SNOW_CONE_MACHINE then
		return l__PrefabBlockHandler__1.new(p4, p5, v66.block, p6);
	end;
	return v32.new(p4, p5, v66.block, p6);
end);
l__BlockEngine__3:watchSourceFolder(v10.ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Blocks"));
if l__RunService__12:IsServer() then
	l__PhysicsService__11:CreateCollisionGroup("InflatedBalloons");
	l__PhysicsService__11:CollisionGroupSetCollidable("InflatedBalloons", "Players", false);
end;
return {};
