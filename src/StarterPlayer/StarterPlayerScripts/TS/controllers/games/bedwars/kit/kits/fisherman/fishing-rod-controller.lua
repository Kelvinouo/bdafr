-- Script Hash: ad111313fa24d5f78d0d2e7ecaec916f368f150541d18f4f786397d4bd353a3a5eb0d5ed380cf915875b28dcacf5e224
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "FishingRodController";
	end, 
	__index = v3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v3;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "FishingRodController";
	p1.animationMaid = u2.new();
	p1.activeFishing = false;
end;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__3.ProjectileDestroy:connect(function(p3)
		if p3.projectileType ~= "fisherman_bobber" then
			return nil;
		end;
		if p3.projectile:GetAttribute("ProjectileShooter") ~= l__Players__4.LocalPlayer.UserId then
			return nil;
		end;
		l__default__5.Client:Get("RemoteName"):SendToServer({
			success = false
		});
	end);
end;
local l__GameAnimationUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__KnitClient__8 = v2.KnitClient;
function v4.onEnable(p4, p5, p6)
	u1.onEnable(p4, p5, p6);
	p4.maid:GiveTask(l__ClientSyncEvents__3.ProjectileLaunched:connect(function(p7)
		if p7.projectileType ~= "fisherman_bobber" then
			return nil;
		end;
		if p7.projectile:GetAttribute("ProjectileShooter") ~= l__Players__4.LocalPlayer.UserId then
			return nil;
		end;
		p4.activeFishing = true;
	end));
	p4.maid:GiveTask(l__ClientSyncEvents__3.ProjectileDestroy:connect(function(p8)
		if p8.projectileType ~= "fisherman_bobber" then
			return nil;
		end;
		if p8.projectile:GetAttribute("ProjectileShooter") ~= l__Players__4.LocalPlayer.UserId then
			return nil;
		end;
		p4.animationMaid:DoCleaning();
		p4.activeFishing = false;
	end));
	p4.maid:GiveTask(function()
		p4.activeFishing = false;
		l__default__5.Client:Get("RemoteName"):SendToServer({
			success = false
		});
	end);
	p4.animationMaid:DoCleaning();
	p4.maid:GiveTask(p4.animationMaid);
	task.spawn(function()
		p4.maid:GiveTask(l__default__5.Client:WaitFor("RemoteName"):expect():Connect(function(p9)
			if not p6() then
				return nil;
			end;
			local l__idleAnimation__6 = p4.idleAnimation;
			if l__idleAnimation__6 ~= nil then
				l__idleAnimation__6:Stop();
			end;
			p4.idleAnimation = l__GameAnimationUtil__6.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__7.FISHING_ROD_PULLING, {
				looped = true
			});
			if p4.idleAnimation then
				p4.animationMaid:GiveTask(function()
					local v7 = p4.idleAnimation;
					if v7 ~= nil then
						v7 = v7:Stop();
					end;
					return v7;
				end);
			end;
			l__KnitClient__8.Controllers.FishermanController:startMinigame(p9.dropData, function(p10)
				if p10.win then
					local v8 = l__GameAnimationUtil__6.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__7.FISHING_ROD_CATCH_SUCCESS, {
						looped = false
					});
					l__default__5.Client:Get("RemoteName"):SendToServer({
						success = true
					});
				else
					v8 = l__GameAnimationUtil__6.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__7.FISHING_ROD_CATCH_FAIL, {
						looped = false
					});
					l__default__5.Client:Get("RemoteName"):SendToServer({
						success = false
					});
				end;
				if v8 then
					p4.animationMaid:GiveTask(v8);
				end;
				local l__idleAnimation__9 = p4.idleAnimation;
				if l__idleAnimation__9 ~= nil then
					l__idleAnimation__9:Stop();
				end;
			end);
		end));
	end);
end;
function v4.canLaunch(p11)
	return not p11.activeFishing;
end;
function v4.onStartCharging(p12)

end;
function v4.onStopCharging(p13)

end;
function v4.onLaunch(p14, p15)
	p14.animationMaid:DoCleaning();
	p14.idleAnimation = l__GameAnimationUtil__6.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__7.FISHING_ROD_IDLE, {
		looped = true
	});
	if p14.idleAnimation then
		p14.animationMaid:GiveTask(function()
			local v10 = p14.idleAnimation;
			if v10 ~= nil then
				v10 = v10:Stop();
			end;
			return v10;
		end);
	end;
	local v11 = l__GameAnimationUtil__6.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__7.FISHING_ROD_CAST, {
		looped = false
	});
	if v11 then
		p14.animationMaid:GiveTask(function()
			return v11:Stop();
		end);
	end;
	if v11 ~= nil then
		local v12 = v11:GetMarkerReachedSignal("cast"):Wait();
	end;
	if not p15() then
		return false;
	end;
	return true;
end;
function v4.onStartReload(p16, p17)

end;
local l__ItemType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.isRelevantItem(p18, p19)
	return p19.itemType == l__ItemType__9.FISHING_ROD;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
