-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "KillEffectController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "KillEffectController";
	p1.killEffects = {};
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__KillEffectType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local u4 = v1.import(script, script.Parent, "effects", "default-kill-effect");
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__6 = v2.Players;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__DamageType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local l__ContentProvider__9 = v2.ContentProvider;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.KnitStart(p2)
	local v6, v7, v8 = ipairs(u2.values(l__KillEffectType__3));
	while true do
		v6(v7, v8);
		if not v6 then
			break;
		end;
		local v9 = script.Parent;
		if v9 ~= nil then
			v9 = v9:FindFirstChild("effects");
			if v9 ~= nil then
				v9 = v9:FindFirstChild(v7 .. "-kill-effect");
			end;
		end;
		if v9 then
			p2.killEffects[v7] = require(v9);
		else
			if v7 ~= l__KillEffectType__3.NONE then

			end;
			p2.killEffects[v7] = u4;
		end;	
	end;
	l__default__5.Client:OnEvent("RemoteName", function(p3)
		local v10 = l__Players__6:GetPlayerFromCharacter(p3.fromEntity);
		local v11 = l__Players__6:GetPlayerFromCharacter(p3.entityInstance);
		if l__ClientSyncEvents__7.KillEffect:fire(p3.entityInstance, p3.fromEntity):isCancelled() then
			return nil;
		end;
		if p3.damageType == l__DamageType__8.VOID then
			return nil;
		end;
		if v11 and v11.Character then
			if p3.finalKill and v10 then
				local v12 = v10:GetAttribute("KillEffectType");
				if v12 and v10 ~= v11 then
					local v13 = p2.killEffects[v12].new(v10);
					v13:onKill(v11, v11.Character, p3.cframe);
					if v13:isPlayDefaultKillEffect() then
						local u12 = u4.new(v10);
						v1.try(function()
							u12:onKill(v11, v11.Character, p3.cframe);
						end, function(p4)
							warn(p4);
						end);
					end;
					return nil;
				end;
			end;
			local u13 = u4.new(v10 and v11);
			v1.try(function()
				u13:onKill(v11, v11.Character, p3.cframe);
			end, function(p5)
				warn(p5);
			end);
		end;
	end);
	l__ContentProvider__9:PreloadAsync({ l__GameAnimationUtil__10.getAnimation(l__AnimationType__11.MIRROR_KILL_EFFECT) });
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
