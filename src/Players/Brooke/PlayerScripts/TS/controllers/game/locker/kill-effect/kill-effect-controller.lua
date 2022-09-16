-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "KillEffectController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "KillEffectController";
	p1.killEffects = {};
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__KillEffectType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local u4 = v1.import(script, script.Parent, "effects", "default-kill-effect");
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__DamageType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
function u1.KnitStart(p2)
	local v5, v6, v7 = ipairs(u2.values(l__KillEffectType__3));
	while true do
		v5(v6, v7);
		if not v5 then
			break;
		end;
		local v8 = script.Parent;
		if v8 ~= nil then
			v8 = v8:FindFirstChild("effects");
			if v8 ~= nil then
				v8 = v8:FindFirstChild(v6 .. "-kill-effect");
			end;
		end;
		if v8 then
			p2.killEffects[v6] = require(v8);
		else
			if v6 ~= l__KillEffectType__3.NONE then

			end;
			p2.killEffects[v6] = u4;
		end;	
	end;
	l__default__5.Client:OnEvent("RemoteName", function(p3)
		local v9 = l__Players__6:GetPlayerFromCharacter(p3.fromEntity);
		local v10 = l__Players__6:GetPlayerFromCharacter(p3.entityInstance);
		if l__ClientSyncEvents__7.KillEffect:fire(p3.entityInstance, p3.fromEntity):isCancelled() then
			return nil;
		end;
		if p3.damageType == l__DamageType__8.VOID then
			return nil;
		end;
		if v10 and v10.Character then
			if p3.finalKill and v9 then
				local v11 = v9:GetAttribute("KillEffectType");
				if v11 and v9 ~= v10 then
					local v12 = p2.killEffects[v11].new(v9);
					v12:onKill(v10, v10.Character, p3.cframe);
					if v12:isPlayDefaultKillEffect() then
						local u9 = u4.new(v9);
						v1.try(function()
							u9:onKill(v10, v10.Character, p3.cframe);
						end, function(p4)
							warn(p4);
						end);
					end;
					return nil;
				end;
			end;
			local u10 = u4.new(v9 and v10);
			v1.try(function()
				u10:onKill(v10, v10.Character, p3.cframe);
			end, function(p5)
				warn(p5);
			end);
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
