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
local l__getItemMeta__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__BedBlockHandler__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "bed-block-handler").BedBlockHandler;
local l__GameSound__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__StatusEffectType__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__StatusEffectUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local l__BarrierBlockHandler__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "barrier-block-handler").BarrierBlockHandler;
local l__CameraTurretBlockHandler__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "camera-turret-block-handler").CameraTurretBlockHandler;
local l__CannonBlockHandler__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "cannon-block-handler").CannonBlockHandler;
local l__CropBlockHandler__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "crop-block-handler").CropBlockHandler;
local l__GlassBlockHandler__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "glass-block-handler").GlassBlockHandler;
local l__GrassBlockHandler__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "grass-block-handler").GrassBlockHandler;
local l__HugeLuckyBlockHandler__28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "huge-lucky-block-handler").HugeLuckyBlockHandler;
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "random-foliage-block-handler").RandomFoliageBlockHandler;
local l__SmokeBlockHandler__30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "smoke-block-handler").SmokeBlockHandler;
local v31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "snow-cone-machine-block-handler").SnowConeMachineBlockHandler;
local l__StonePlayerBlockHandler__32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "stone-player-block-handler").StonePlayerBlockHandler;
local l__TeslaTrapBlockHandler__33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "tesla-trap-block-handler").TeslaTrapBlockHandler;
local l__ZiplineBlockHandler__34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "zipline-block-handler").ZiplineBlockHandler;
local v35, v36, v37 = ipairs(v9.values(l__ItemType__17));
while true do
	v35(v36, v37);
	if not v35 then
		break;
	end;
	v37 = v35;
	local v38 = l__getItemMeta__16(v36);
	if v38.block then
		local v39 = {};
		function v39.placeSound()
			return { l__SoundManager__6:createSound(l__GameSound__19.GENERIC_BLOCK_PLACE) };
		end;
		function v39.breakSound()
			return { l__SoundManager__6:createSound(l__GameSound__19.GENERIC_BLOCK_BREAK) };
		end;
		v39.breakType = l__BreakBlockDamageType__4.WOOD;
		v38.block = v9.assign(v39, v38.block);
		local v40 = false;
		if v36 == l__ItemType__17.GRASS then
			l__BlockEngine__3:getHandlerRegistry():registerHandler(l__GrassBlockHandler__27.new(v36, 1, v38.block));
		elseif v36 == l__ItemType__17.GLASS then
			l__BlockEngine__3:getHandlerRegistry():registerHandler(l__GlassBlockHandler__26.new(v36, 1, v38.block));
		else
			if v36 == l__ItemType__17.MELON then
				v40 = true;
			end;
			if v40 or v36 == l__ItemType__17.CARROT then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__CropBlockHandler__25.new(v36, 1, v38.block));
			elseif v36 == l__ItemType__17.SMOKE_BLOCK then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__SmokeBlockHandler__30.new(v36, 1, v38.block));
			elseif v36 == l__ItemType__17.STONE_PLAYER_BLOCK then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__StonePlayerBlockHandler__32.new(v36, 1, v38.block));
			elseif v36 == l__ItemType__17.BARRIER then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__BarrierBlockHandler__22.new(v36, 1, v38.block));
			elseif v38.block.greedyMesh then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__GreedyBlockHandler__5.new(v36, 1, v38.block));
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
		local v41 = l__StatusEffectUtil__21:getStacks(p1.player.Character, l__StatusEffectType__20.SNOW_CONE);
		if l__BalanceFile__14.SNOW_CONE_BLOCK_COST <= v41 then
			p1.damage = p1.damage * (l__BalanceFile__14.SNOW_CONE_BLOCK_BASE_DMG + l__BalanceFile__14.SNOW_CONE_BLOCK_STACK_BONUS * v41);
		end;
		local v42 = l__BlockEngine__3:getStore():getBlockAt(p1.blockRef.blockPosition);
		if v42 then
			local v43 = l__getItemMeta__16(v42.Name).block;
			if v43 ~= nil then
				v43 = v43.breakableOnlyByHosts;
			end;
			if v43 and p1.player:GetAttribute("Host") ~= true and p1.player:GetAttribute("Cohost") ~= true then
				p1.damage = 0;
				return nil;
			end;
			local v44 = v42:GetAttribute("BedShieldEndTime");
			local v45 = v44;
			if v45 ~= 0 and v45 == v45 and v45 then
				v45 = l__Workspace__13:GetServerTimeNow() < v44;
			end;
			if v45 ~= 0 and v45 == v45 and v45 then
				p1.damage = 0;
				return nil;
			end;
		end;
	end;
end);
l__BlockEngine__3:getBlockDamageHook():setPriority(l__SyncEventPriority__7.HIGH):connect(function(p2)
	local v46 = l__EntityUtil__15:getEntity(p2.player);
	if v46 then
		local l__Value__47 = v46:getInstance().HandInvItem.Value;
		if l__Value__47 then
			local v48 = l__BlockEngine__3:getStore():getBlockAt(p2.blockRef.blockPosition);
			if v48 then
				local v49 = l__getItemMeta__16(l__Value__47.Name);
				local v50 = l__getItemMeta__16(v48.Name);
				local v51 = v50.block;
				if v51 ~= nil then
					v51 = v51.breakType;
				end;
				if v51 then
					local v52 = v49.breakBlock;
					if v52 ~= nil then
						v52 = v52[v50.block.breakType];
					end;
					if v52 ~= nil then
						p2.damage = v52;
					end;
				end;
			end;
		end;
	end;
end);
local l__PrefabBlockHandler__1 = v2.PrefabBlockHandler;
l__BlockEngine__3:hookCreateSourceBlockHandler(function(p3, p4, p5)
	local v53 = l__getItemMeta__16(p3);
	if v53 == nil then
		return nil;
	end;
	if v53.block == nil then
		warn("Failed to find block meta for source block: " .. p3);
		return nil;
	end;
	if p3 == l__ItemType__17.BED then
		return l__BedBlockHandler__18.new(p3, p4, v53.block, p5);
	end;
	if p3 == l__ItemType__17.ZIPLINE_BASE then
		return l__ZiplineBlockHandler__34.new(p3, p4, v53.block, p5);
	end;
	if p3 == l__ItemType__17.TESLA_TRAP then
		return l__TeslaTrapBlockHandler__33.new(p3, p4, v53.block, p5);
	end;
	if p3 == l__ItemType__17.CANNON then
		return l__CannonBlockHandler__24.new(p3, p4, v53.block, p5);
	end;
	if p3 == l__ItemType__17.CAMERA_TURRET then
		return l__CameraTurretBlockHandler__23.new(p3, p4, v53.block, p5);
	end;
	if p3 == l__ItemType__17.HUGE_LUCKY_BLOCK then
		return l__HugeLuckyBlockHandler__28.new(p3, p4, v53.block, p5);
	end;
	if p3 == l__ItemType__17.FLOWER_PURPLE then
		return v29.new(p3, 1, v53.block, { "flower_purple", "flower_orange", "flower_pink", "flower_blue" });
	end;
	if p3 == l__ItemType__17.SMALL_BUSH then
		return v29.new(p3, 1, v53.block, { "small_bush" });
	end;
	if p3 == l__ItemType__17.LARGE_BUSH then
		return v29.new(p3, 1, v53.block, { "large_bush" });
	end;
	if p3 ~= l__ItemType__17.SNOW_CONE_MACHINE and not l__ItemType__17.BROKEN_SNOW_CONE_MACHINE then
		return l__PrefabBlockHandler__1.new(p3, p4, v53.block, p5);
	end;
	return v31.new(p3, p4, v53.block, p5);
end);
l__BlockEngine__3:watchSourceFolder(v10.ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Blocks"));
if l__RunService__12:IsServer() then
	l__PhysicsService__11:CreateCollisionGroup("InflatedBalloons");
	l__PhysicsService__11:CollisionGroupSetCollidable("InflatedBalloons", "Players", false);
end;
return {};
