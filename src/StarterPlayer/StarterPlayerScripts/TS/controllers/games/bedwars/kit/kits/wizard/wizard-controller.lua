-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__LegacyKitKnitController__3 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "WizardController";
	end, 
	__index = l__LegacyKitKnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function u1.constructor(p1)
	l__LegacyKitKnitController__3.constructor(p1, { l__BedwarsKit__2.WIZARD });
	p1.Name = "WizardController";
	p1.projectileArcs = {};
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "electric-arc").lib);
local u5 = Color3.new(1, 1, 1);
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ClientProjectileMap__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-effects-controller").ClientProjectileMap;
local u9 = Color3.new(1, 1, 0.2);
local l__DamageType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local l__Players__11 = v2.Players;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__KnitClient__13 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__SoundManager__14 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.KnitStart(p2)
	l__LegacyKitKnitController__3.KnitStart(p2);
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		local l__position__6 = p3.position;
		local u16 = u4.new(l__position__6, l__position__6 + Vector3.new(0, 300, 0), u5, p3.color, 12, 2);
		v1.Promise.delay(p3.duration):andThen(function()
			return u16:Destroy();
		end);
	end);
	l__ClientSyncEvents__6.ProjectileLaunched:connect(function(p4)
		local l__projectile__7 = p4.projectile;
		if p4.projectileType ~= "electric_orb" then
			return nil;
		end;
		u7("Attachment", {
			Name = "Arc", 
			Parent = l__projectile__7.PrimaryPart
		});
		p2.projectileArcs[l__projectile__7] = {};
	end);
	l__ClientSyncEvents__6.ProjectileDestroy:connect(function(p5)
		local l__projectile__8 = p5.projectile;
		if p5.projectileType ~= "electric_orb" then
			return nil;
		end;
		local v9 = p2.projectileArcs[l__projectile__8];
		if not v9 then
			return nil;
		end;
		for v10, v11 in pairs(v9) do
			v11:Destroy();
		end;
		p2.projectileArcs[l__projectile__8] = nil;
		p5:setCancelled(true);
		p2:fadeOut(l__projectile__8, 1, function()
			return l__projectile__8:Destroy();
		end);
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p6)
		local l__player__12 = p6.player;
		local v13 = l__ClientProjectileMap__8[p6.source];
		if not v13 then
			return nil;
		end;
		local v14 = l__player__12.Character:FindFirstChild("UpperTorso");
		if v14 ~= nil then
			v14 = v14:FindFirstChild("BodyFrontAttachment");
		end;
		local v15 = u4.link(v13.Handle.Arc, v14, u9, u5);
		local v16 = p2.projectileArcs[v13];
		if v16 ~= nil then
			v16[l__player__12] = v15;
		end;
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p7)
		local l__player__17 = p7.player;
		local v18 = l__ClientProjectileMap__8[p7.source];
		if not v18 then
			return nil;
		end;
		local v19 = p2.projectileArcs[v18];
		if v19 ~= nil then
			v19 = v19[l__player__17];
		end;
		if not v19 then
			return nil;
		end;
		v19:Destroy();
		local v20 = p2.projectileArcs[v18];
		if v20 ~= nil then
			v20[l__player__17] = nil;
		end;
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p8)
		if p8.damageType == l__DamageType__10.WIZARD_ORB and p8.entityInstance == l__Players__11.LocalPlayer.Character then
			local v21 = u12.new();
			v21:GiveTask(l__KnitClient__13.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = 0.3
			}));
			task.delay(0.1, function()
				v21:DoCleaning();
			end);
		end;
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p9)
		local v22 = l__Players__11.LocalPlayer == p9.shootingPlayer;
		if p9.projectile.Name == "lightning_strike" then
			local v23 = {};
			if v22 then
				local v24 = nil;
			else
				v24 = p9.position;
			end;
			v23.position = v24;
			l__SoundManager__14:playSound(l__GameSound__15.WIZARD_LIGHTNING_CAST, v23);
			return;
		end;
		if p9.projectile.Name == "electric_orb" then
			local v25 = {};
			if v22 then
				local v26 = nil;
			else
				v26 = p9.position;
			end;
			v25.position = v26;
			l__SoundManager__14:playSound(l__GameSound__15.WIZARD_ORB_CAST, v25);
		end;
	end);
end;
local l__ContentProvider__17 = v2.ContentProvider;
local l__GameAnimationUtil__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.onKitEnabled(p10)
	v1.Promise.defer(function()
		l__ContentProvider__17:PreloadAsync({ u7("Animation", {
				AnimationId = l__GameAnimationUtil__18.getAssetId(l__AnimationType__19.WIZARD_ABILITY_SWITCH)
			}), u7("Animation", {
				AnimationId = l__GameAnimationUtil__18.getAssetId(l__AnimationType__19.WIZARD_LIGHTNING_CAST)
			}), u7("Animation", {
				AnimationId = l__GameAnimationUtil__18.getAssetId(l__AnimationType__19.WIZARD_BALL_CAST)
			}) });
	end);
end;
function u1.onKitDisabled(p11)

end;
local l__TweenService__20 = v2.TweenService;
function u1.fadeOut(p12, p13, p14, p15)
	v1.Promise.defer(function(p16)
		local v27, v28, v29 = ipairs(p13:GetDescendants());
		while true do
			v27(v28, v29);
			if not v27 then
				break;
			end;
			v29 = v27;
			if v28:IsA("BasePart") then
				l__TweenService__20:Create(v28, TweenInfo.new(p14), {
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
u1 = l__KnitClient__13.CreateController;
u1 = u1(u1.new());
return nil;
