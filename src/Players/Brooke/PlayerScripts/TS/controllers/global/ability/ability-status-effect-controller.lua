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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "AbilityStatusEffectController";
end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__AbilityId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__getAbilityMeta__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).getAbilityMeta;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__SyncEventPriority__7 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEventPriority;
local l__EntityUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__StatusEffectUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__ClientSyncEvents__1.StatusEffectAdded:connect(function(p3)
		if p3.entityInstance ~= l__Players__2.LocalPlayer.Character then
			return nil;
		end;
		local v5, v6, v7 = ipairs(u3.values(l__AbilityId__4));
		while true do
			v5(v6, v7);
			if not v5 then
				break;
			end;
			if table.find(l__getAbilityMeta__5(v6).blockingStatusEffects or {}, p3.statusEffect) ~= nil then
				l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):blockAbility(v6, "status-effect:" .. p3.statusEffect);
			end;		
		end;
	end);
	l__ClientSyncEvents__1.StatusEffectRemoved:connect(function(p4)
		if p4.entityInstance ~= l__Players__2.LocalPlayer.Character then
			return nil;
		end;
		local v8, v9, v10 = ipairs(u3.values(l__AbilityId__4));
		while true do
			v8(v9, v10);
			if not v8 then
				break;
			end;
			if table.find(l__getAbilityMeta__5(v9).blockingStatusEffects or {}, p4.statusEffect) ~= nil then
				l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):unblockAbility(v9, "status-effect:" .. p4.statusEffect);
			end;		
		end;
	end);
	l__ClientSyncEvents__1.CanUseLocalAbility:setPriority(l__SyncEventPriority__7.HIGHEST):connect(function(p5)
		if p5:isCancelled() then
			return nil;
		end;
		local v11 = l__getAbilityMeta__5(p5.ability);
		if not v11.blockingStatusEffects then
			return nil;
		end;
		local v12 = l__EntityUtil__8:getEntity(l__Players__2.LocalPlayer);
		if v12 ~= nil then
			v12 = v12:getInstance();
		end;
		if not v12 then
			return nil;
		end;
		if l__StatusEffectUtil__9:hasAnyActive(v12, v11.blockingStatusEffects) then
			p5:setCancelled(true);
		end;
	end);
end;
local v13 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
