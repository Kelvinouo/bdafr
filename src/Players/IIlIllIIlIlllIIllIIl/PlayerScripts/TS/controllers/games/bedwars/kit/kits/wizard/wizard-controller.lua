-- Script Hash: 753a99740b7bd3ea4c30e7a79126e0c6ef245b8de1ed114d7cbc51c341380f662ce3c9791f9119a51d1c264985fdd18f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__3 = v2.KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__LegacyKitKnitController__5 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "WizardController";
	end, 
	__index = l__LegacyKitKnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__LegacyKitKnitController__5;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function u1.constructor(p1)
	u2.constructor(p1, { l__BedwarsKit__3.WIZARD });
	p1.Name = "WizardController";
	p1.projectileArcs = {};
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "electric-arc").lib);
local u6 = Color3.new(1, 1, 1);
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ClientProjectileMap__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-effects-controller").ClientProjectileMap;
local u10 = Color3.new(1, 1, 0.2);
local l__DamageType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local l__Players__12 = v4.Players;
local l__Maid__13 = v2.Maid;
local l__SoundManager__14 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__default__4.Client:OnEvent("RemoteName", function(p3)
		local l__position__8 = p3.position;
		local u16 = u5.new(l__position__8, l__position__8 + Vector3.new(0, 300, 0), u6, p3.color, 12, 2);
		v1.Promise.delay(p3.duration):andThen(function()
			return u16:Destroy();
		end);
	end);
	l__ClientSyncEvents__7.ProjectileLaunched:connect(function(p4)
		local l__projectile__9 = p4.projectile;
		if p4.projectileType ~= "electric_orb" then
			return nil;
		end;
		u8("Attachment", {
			Name = "Arc", 
			Parent = l__projectile__9.PrimaryPart
		});
		p2.projectileArcs[l__projectile__9] = {};
	end);
	l__ClientSyncEvents__7.ProjectileDestroy:connect(function(p5)
		local l__projectile__10 = p5.projectile;
		if p5.projectileType ~= "electric_orb" then
			return nil;
		end;
		local v11 = p2.projectileArcs[l__projectile__10];
		if not v11 then
			return nil;
		end;
		for v12, v13 in pairs(v11) do
			v13:Destroy();
		end;
		p2.projectileArcs[l__projectile__10] = nil;
		p5:setCancelled(true);
		p2:fadeOut(l__projectile__10, 1, function()
			return l__projectile__10:Destroy();
		end);
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p6)
		local l__player__14 = p6.player;
		local v15 = l__ClientProjectileMap__9[p6.source];
		if not v15 then
			return nil;
		end;
		local v16 = l__player__14.Character:FindFirstChild("UpperTorso");
		if v16 ~= nil then
			v16 = v16:FindFirstChild("BodyFrontAttachment");
		end;
		local v17 = u5.link(v15.Handle.Arc, v16, u10, u6);
		local v18 = p2.projectileArcs[v15];
		if v18 ~= nil then
			v18[l__player__14] = v17;
		end;
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p7)
		local l__player__19 = p7.player;
		local v20 = l__ClientProjectileMap__9[p7.source];
		if not v20 then
			return nil;
		end;
		local v21 = p2.projectileArcs[v20];
		if v21 ~= nil then
			v21 = v21[l__player__19];
		end;
		if not v21 then
			return nil;
		end;
		v21:Destroy();
		local v22 = p2.projectileArcs[v20];
		if v22 ~= nil then
			v22[l__player__19] = nil;
		end;
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p8)
		if p8.damageType == l__DamageType__11.WIZARD_ORB and p8.entityInstance == l__Players__12.LocalPlayer.Character then
			local v23 = l__Maid__13.new();
			v23:GiveTask(l__KnitClient__3.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = 0.3
			}));
			task.delay(0.1, function()
				v23:DoCleaning();
			end);
		end;
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p9)
		local v24 = l__Players__12.LocalPlayer == p9.shootingPlayer;
		if p9.projectile.Name == "lightning_strike" then
			local v25 = {};
			if v24 then
				local v26 = nil;
			else
				v26 = p9.position;
			end;
			v25.position = v26;
			l__SoundManager__14:playSound(l__GameSound__15.WIZARD_LIGHTNING_CAST, v25);
			return;
		end;
		if p9.projectile.Name == "electric_orb" then
			local v27 = {};
			if v24 then
				local v28 = nil;
			else
				v28 = p9.position;
			end;
			v27.position = v28;
			l__SoundManager__14:playSound(l__GameSound__15.WIZARD_ORB_CAST, v27);
		end;
	end);
end;
local l__ContentProvider__17 = v4.ContentProvider;
local l__GameAnimationUtil__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.onKitEnabled(p10)
	v1.Promise.defer(function()
		l__ContentProvider__17:PreloadAsync({ u8("Animation", {
				AnimationId = l__GameAnimationUtil__18.getAssetId(l__AnimationType__19.WIZARD_ABILITY_SWITCH)
			}), u8("Animation", {
				AnimationId = l__GameAnimationUtil__18.getAssetId(l__AnimationType__19.WIZARD_LIGHTNING_CAST)
			}), u8("Animation", {
				AnimationId = l__GameAnimationUtil__18.getAssetId(l__AnimationType__19.WIZARD_BALL_CAST)
			}) });
	end);
end;
function u1.onKitDisabled(p11)

end;
local l__TweenService__20 = v4.TweenService;
function u1.fadeOut(p12, p13, p14, p15)
	v1.Promise.defer(function(p16)
		for v29, v30 in ipairs(p13:GetDescendants()) do
			if v30:IsA("BasePart") then
				l__TweenService__20:Create(v30, TweenInfo.new(p14), {
					Transparency = 1
				}):Play();
			end;
		end;
		p13.Handle.Particle.Area.Enabled = false;
		p13.Handle.Particle.Spikes.Enabled = false;
		wait(p14);
		p13.Handle.Trail.Enabled = false;
		wait(p14 * 2);
		p16(true);
	end):andThen(p15);
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
