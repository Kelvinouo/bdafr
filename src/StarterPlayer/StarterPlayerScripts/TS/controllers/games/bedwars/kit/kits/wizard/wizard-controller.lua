-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__LegacyKitKnitController__4 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "WizardController";
	end, 
	__index = l__LegacyKitKnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__LegacyKitKnitController__4;
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
local l__Players__12 = v3.Players;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SoundManager__14 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__default__4.Client:OnEvent("RemoteName", function(p3)
		local l__position__7 = p3.position;
		local u16 = u5.new(l__position__7, l__position__7 + Vector3.new(0, 300, 0), u6, p3.color, 12, 2);
		v1.Promise.delay(p3.duration):andThen(function()
			return u16:Destroy();
		end);
	end);
	l__ClientSyncEvents__7.ProjectileLaunched:connect(function(p4)
		local l__projectile__8 = p4.projectile;
		if p4.projectileType ~= "electric_orb" then
			return nil;
		end;
		u8("Attachment", {
			Name = "Arc", 
			Parent = l__projectile__8.PrimaryPart
		});
		p2.projectileArcs[l__projectile__8] = {};
	end);
	l__ClientSyncEvents__7.ProjectileDestroy:connect(function(p5)
		local l__projectile__9 = p5.projectile;
		if p5.projectileType ~= "electric_orb" then
			return nil;
		end;
		local v10 = p2.projectileArcs[l__projectile__9];
		if not v10 then
			return nil;
		end;
		for v11, v12 in pairs(v10) do
			v12:Destroy();
		end;
		p2.projectileArcs[l__projectile__9] = nil;
		p5:setCancelled(true);
		p2:fadeOut(l__projectile__9, 1, function()
			return l__projectile__9:Destroy();
		end);
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p6)
		local l__player__13 = p6.player;
		local v14 = l__ClientProjectileMap__9[p6.source];
		if not v14 then
			return nil;
		end;
		local v15 = l__player__13.Character:FindFirstChild("UpperTorso");
		if v15 ~= nil then
			v15 = v15:FindFirstChild("BodyFrontAttachment");
		end;
		local v16 = u5.link(v14.Handle.Arc, v15, u10, u6);
		local v17 = p2.projectileArcs[v14];
		if v17 ~= nil then
			v17[l__player__13] = v16;
		end;
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p7)
		local l__player__18 = p7.player;
		local v19 = l__ClientProjectileMap__9[p7.source];
		if not v19 then
			return nil;
		end;
		local v20 = p2.projectileArcs[v19];
		if v20 ~= nil then
			v20 = v20[l__player__18];
		end;
		if not v20 then
			return nil;
		end;
		v20:Destroy();
		local v21 = p2.projectileArcs[v19];
		if v21 ~= nil then
			v21[l__player__18] = nil;
		end;
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p8)
		if p8.damageType == l__DamageType__11.WIZARD_ORB and p8.entityInstance == l__Players__12.LocalPlayer.Character then
			local v22 = u13.new();
			v22:GiveTask(l__KnitClient__2.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = 0.3
			}));
			task.delay(0.1, function()
				v22:DoCleaning();
			end);
		end;
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p9)
		local v23 = l__Players__12.LocalPlayer == p9.shootingPlayer;
		if p9.projectile.Name == "lightning_strike" then
			local v24 = {};
			if v23 then
				local v25 = nil;
			else
				v25 = p9.position;
			end;
			v24.position = v25;
			l__SoundManager__14:playSound(l__GameSound__15.WIZARD_LIGHTNING_CAST, v24);
			return;
		end;
		if p9.projectile.Name == "electric_orb" then
			local v26 = {};
			if v23 then
				local v27 = nil;
			else
				v27 = p9.position;
			end;
			v26.position = v27;
			l__SoundManager__14:playSound(l__GameSound__15.WIZARD_ORB_CAST, v26);
		end;
	end);
end;
local l__ContentProvider__17 = v3.ContentProvider;
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
local l__TweenService__20 = v3.TweenService;
function u1.fadeOut(p12, p13, p14, p15)
	v1.Promise.defer(function(p16)
		for v28, v29 in ipairs(p13:GetDescendants()) do
			if v29:IsA("BasePart") then
				l__TweenService__20:Create(v29, TweenInfo.new(p14), {
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
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
