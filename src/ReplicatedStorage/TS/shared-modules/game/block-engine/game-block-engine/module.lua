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
local l__EntityUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__getItemMeta__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__BedBlockHandler__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "bed-block-handler").BedBlockHandler;
local l__GameSound__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CameraTurretBlockHandler__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "camera-turret-block-handler").CameraTurretBlockHandler;
local l__CannonBlockHandler__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "cannon-block-handler").CannonBlockHandler;
local l__CropBlockHandler__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "crop-block-handler").CropBlockHandler;
local l__GlassBlockHandler__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "glass-block-handler").GlassBlockHandler;
local l__GrassBlockHandler__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "grass-block-handler").GrassBlockHandler;
local l__HugeLuckyBlockHandler__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "huge-lucky-block-handler").HugeLuckyBlockHandler;
local v25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "random-foliage-block-handler").RandomFoliageBlockHandler;
local l__SmokeBlockHandler__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "smoke-block-handler").SmokeBlockHandler;
local l__StonePlayerBlockHandler__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "stone-player-block-handler").StonePlayerBlockHandler;
local l__TeslaTrapBlockHandler__28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "tesla-trap-block-handler").TeslaTrapBlockHandler;
local l__ZiplineBlockHandler__29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "zipline-block-handler").ZiplineBlockHandler;
for v30, v31 in ipairs(v9.values(l__ItemType__16)) do
	local v32 = l__getItemMeta__15(v31);
	if v32.block then
		local v33 = {};
		function v33.placeSound()
			return { l__SoundManager__6:createSound(l__GameSound__18.GENERIC_BLOCK_PLACE) };
		end;
		function v33.breakSound()
			return { l__SoundManager__6:createSound(l__GameSound__18.GENERIC_BLOCK_BREAK) };
		end;
		v33.breakType = l__BreakBlockDamageType__4.WOOD;
		v32.block = v9.assign(v33, v32.block);
		local v34 = false;
		if v31 == l__ItemType__16.GRASS then
			l__BlockEngine__3:getHandlerRegistry():registerHandler(l__GrassBlockHandler__23.new(v31, 1, v32.block));
		elseif v31 == l__ItemType__16.GLASS then
			l__BlockEngine__3:getHandlerRegistry():registerHandler(l__GlassBlockHandler__22.new(v31, 1, v32.block));
		else
			if v31 == l__ItemType__16.MELON then
				v34 = true;
			end;
			if v34 or v31 == l__ItemType__16.CARROT then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__CropBlockHandler__21.new(v31, 1, v32.block));
			elseif v31 == l__ItemType__16.SMOKE_BLOCK then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__SmokeBlockHandler__26.new(v31, 1, v32.block));
			elseif v31 == l__ItemType__16.STONE_PLAYER_BLOCK then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__StonePlayerBlockHandler__27.new(v31, 1, v32.block));
			elseif v32.block.greedyMesh then
				l__BlockEngine__3:getHandlerRegistry():registerHandler(l__GreedyBlockHandler__5.new(v31, 1, v32.block));
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
		local v35 = l__BlockEngine__3:getStore():getBlockAt(p1.blockRef.blockPosition);
		if v35 then
			local v36 = l__getItemMeta__15(v35.Name).block;
			if v36 ~= nil then
				v36 = v36.breakableOnlyByHosts;
			end;
			if v36 and p1.player:GetAttribute("Host") ~= true and p1.player:GetAttribute("Cohost") ~= true then
				p1.damage = 0;
				return nil;
			end;
			local v37 = v35:GetAttribute("BedShieldEndTime");
			local v38 = v37;
			if v38 ~= 0 and v38 == v38 and v38 then
				v38 = l__Workspace__13:GetServerTimeNow() < v37;
			end;
			if v38 ~= 0 and v38 == v38 and v38 then
				p1.damage = 0;
				return nil;
			end;
		end;
	end;
end);
l__BlockEngine__3:getBlockDamageHook():setPriority(l__SyncEventPriority__7.HIGH):connect(function(p2)
	local v39 = l__EntityUtil__14:getEntity(p2.player);
	if v39 then
		local l__Value__40 = v39:getInstance().HandInvItem.Value;
		if l__Value__40 then
			local v41 = l__BlockEngine__3:getStore():getBlockAt(p2.blockRef.blockPosition);
			if v41 then
				local v42 = l__getItemMeta__15(l__Value__40.Name);
				local v43 = l__getItemMeta__15(v41.Name);
				local v44 = v43.block;
				if v44 ~= nil then
					v44 = v44.breakType;
				end;
				if v44 then
					local v45 = v42.breakBlock;
					if v45 ~= nil then
						v45 = v45[v43.block.breakType];
					end;
					if v45 ~= nil then
						p2.damage = v45;
					end;
				end;
			end;
		end;
	end;
end);
local l__PrefabBlockHandler__1 = v2.PrefabBlockHandler;
l__BlockEngine__3:hookCreateSourceBlockHandler(function(p3, p4, p5)
	local v46 = l__getItemMeta__15(p3);
	if v46 == nil then
		return nil;
	end;
	if v46.block == nil then
		warn("Failed to find block meta for source block: " .. p3);
		return nil;
	end;
	if p3 == l__ItemType__16.BED then
		return l__BedBlockHandler__17.new(p3, p4, v46.block, p5);
	end;
	if p3 == l__ItemType__16.ZIPLINE_BASE then
		return l__ZiplineBlockHandler__29.new(p3, p4, v46.block, p5);
	end;
	if p3 == l__ItemType__16.TESLA_TRAP then
		return l__TeslaTrapBlockHandler__28.new(p3, p4, v46.block, p5);
	end;
	if p3 == l__ItemType__16.CANNON then
		return l__CannonBlockHandler__20.new(p3, p4, v46.block, p5);
	end;
	if p3 == l__ItemType__16.CAMERA_TURRET then
		return l__CameraTurretBlockHandler__19.new(p3, p4, v46.block, p5);
	end;
	if p3 == l__ItemType__16.HUGE_LUCKY_BLOCK then
		return l__HugeLuckyBlockHandler__24.new(p3, p4, v46.block, p5);
	end;
	if p3 == l__ItemType__16.FLOWER_PURPLE then
		return v25.new(p3, 1, v46.block, { "flower_purple", "flower_orange", "flower_pink", "flower_blue" });
	end;
	if p3 == l__ItemType__16.SMALL_BUSH then
		return v25.new(p3, 1, v46.block, { "small_bush" });
	end;
	if p3 == l__ItemType__16.LARGE_BUSH then
		return v25.new(p3, 1, v46.block, { "large_bush" });
	end;
	return l__PrefabBlockHandler__1.new(p3, p4, v46.block, p5);
end);
l__BlockEngine__3:watchSourceFolder(v10.ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Blocks"));
if l__RunService__12:IsServer() then
	l__PhysicsService__11:CreateCollisionGroup("InflatedBalloons");
	l__PhysicsService__11:CollisionGroupSetCollidable("InflatedBalloons", "Players", false);
end;
return {};
