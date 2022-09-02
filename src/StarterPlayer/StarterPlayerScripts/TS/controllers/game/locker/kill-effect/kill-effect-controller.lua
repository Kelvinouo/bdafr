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
local u2 = l__KnitController__2;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "KillEffectController";
	p1.killEffects = {};
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__KillEffectType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local u5 = v1.import(script, script.Parent, "effects", "default-kill-effect");
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function u1.KnitStart(p2)
	local v5, v6, v7 = ipairs(u3.values(l__KillEffectType__4));
	while true do
		local v8, v9 = v5(v6, v7);
		if not v8 then
			break;
		end;
		local v10 = script.Parent;
		if v10 ~= nil then
			v10 = v10:FindFirstChild("effects");
			if v10 ~= nil then
				v10 = v10:FindFirstChild(v9 .. "-kill-effect");
			end;
		end;
		if v10 then
			p2.killEffects[v9] = require(v10);
		else
			if v9 ~= l__KillEffectType__4.NONE then

			end;
			p2.killEffects[v9] = u5;
		end;	
	end;
	l__default__6.Client:OnEvent("RemoteName", function(p3)
		local v11 = l__Players__7:GetPlayerFromCharacter(p3.fromEntity);
		local v12 = l__Players__7:GetPlayerFromCharacter(p3.entityInstance);
		if l__ClientSyncEvents__8.KillEffect:fire(p3.entityInstance, p3.fromEntity):isCancelled() then
			return nil;
		end;
		local v13 = v12;
		if v13 ~= nil then
			v13 = v13.Character;
		end;
		print("dead player character:", v13);
		if v12 and v12.Character then
			print("1");
			if p3.finalKill then
				print("2");
				if v11 then
					print("3");
					local v14 = v11:GetAttribute("KillEffectType");
					if v14 and v11 ~= v12 then
						print("kill has kill effect:", v14);
						local v15 = p2.killEffects[v14].new(v11);
						v15:onKill(v12, v12.Character, p3.cframe);
						if v15:isPlayDefaultKillEffect() then
							local u9 = u5.new(v11);
							v1.try(function()
								u9:onKill(v12, v12.Character, p3.cframe);
							end, function(p4)
								warn(p4);
							end);
						end;
						return nil;
					end;
				end;
			end;
			local u10 = u5.new(v11 and v12);
			v1.try(function()
				u10:onKill(v12, v12.Character, p3.cframe);
			end, function(p5)
				warn(p5);
			end);
		end;
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
