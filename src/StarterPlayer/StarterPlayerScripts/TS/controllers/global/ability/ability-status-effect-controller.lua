-- Script Hash: 68ad0674651426522eee8e95dbbd48bc42055b560dffa3bea00907f0e4a0bc427badc98d33ab4f914ba52416b576565a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "AbilityStatusEffectController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "AbilityStatusEffectController";
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__AbilityId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__getAbilityMeta__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).getAbilityMeta;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__SyncEventPriority__8 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEventPriority;
local l__EntityUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__StatusEffectUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__2.StatusEffectAdded:connect(function(p3)
		if p3.entityInstance ~= l__Players__3.LocalPlayer.Character then
			return nil;
		end;
		local v5, v6, v7 = ipairs(u4.values(l__AbilityId__5));
		while true do
			local v8, v9 = v5(v6, v7);
			if not v8 then
				break;
			end;
			if table.find(l__getAbilityMeta__6(v9).blockingStatusEffects or {}, p3.statusEffect) ~= nil then
				l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):blockAbility(v9, "status-effect:" .. p3.statusEffect);
			end;		
		end;
	end);
	l__ClientSyncEvents__2.StatusEffectRemoved:connect(function(p4)
		if p4.entityInstance ~= l__Players__3.LocalPlayer.Character then
			return nil;
		end;
		local v10, v11, v12 = ipairs(u4.values(l__AbilityId__5));
		while true do
			local v13, v14 = v10(v11, v12);
			if not v13 then
				break;
			end;
			if table.find(l__getAbilityMeta__6(v14).blockingStatusEffects or {}, p4.statusEffect) ~= nil then
				l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):unblockAbility(v14, "status-effect:" .. p4.statusEffect);
			end;		
		end;
	end);
	l__ClientSyncEvents__2.CanUseLocalAbility:setPriority(l__SyncEventPriority__8.HIGHEST):connect(function(p5)
		if p5:isCancelled() then
			return nil;
		end;
		local v15 = l__getAbilityMeta__6(p5.ability);
		if not v15.blockingStatusEffects then
			return nil;
		end;
		local v16 = l__EntityUtil__9:getEntity(l__Players__3.LocalPlayer);
		if v16 ~= nil then
			v16 = v16:getInstance();
		end;
		if not v16 then
			return nil;
		end;
		if l__StatusEffectUtil__10:hasAnyActive(v16, v15.blockingStatusEffects) then
			p5:setCancelled(true);
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
