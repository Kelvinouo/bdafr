-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v5 = {
	tag = "invisible-landmine", 
	enemyFadeTransparency = 1, 
	friendlyFadeTransparency = 0.6, 
	fadeDuration = 0.3, 
	revealTransparency = 0, 
	revealDuration = 0.25, 
	beepSound = l__GameSound__4.INVISIBLE_LANDMINE_BEEP_LOOP, 
	beepVolume = 0.3, 
	rollOffMaxDistance = 25
};
local l__KnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "InvisibleLandmineController";
	end, 
	__index = l__KnitController__6
});
v7.__index = v7;
function v7.new(...)
	local v8 = setmetatable({}, v7);
	return v8:constructor(...) and v8;
end;
local u1 = l__KnitController__6;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v7.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "InvisibleLandmineController";
	p1.invisibleLandmineMap = {};
	p1.tweenMaid = u2.new();
end;
local l__WatchCollectionTag__3 = v2.WatchCollectionTag;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__5 = v3.Players;
local l__SoundManager__6 = v2.SoundManager;
local l__ReplicatedStorage__7 = v3.ReplicatedStorage;
local l__Workspace__8 = v3.Workspace;
local l__EffectUtil__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__CollectionService__10 = v3.CollectionService;
function v7.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__3(v5.tag, function(p3)
		if not p2:isClientPrediction(p3) then
			p2:tagLandmineWithTeam(p3);
			p2:hideLandmine(p3);
			p2:handleTouch(p3);
		end;
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p4)
		local v9 = {};
		if l__Players__5.LocalPlayer.Character and l__Players__5.LocalPlayer.Character == p4.targetEntityInstance then
			local v10 = nil;
		else
			v10 = p4.position;
		end;
		v9.position = v10;
		v9.rollOffMaxDistance = 250;
		l__SoundManager__6:playSound(l__GameSound__4.INVISIBLE_LANDMINE_EXPLOSION, v9);
		local v11 = l__ReplicatedStorage__7.Assets.Effects.LandmineExplosion:Clone();
		v11.Parent = l__Workspace__8;
		v11.CFrame = CFrame.new(p4.position);
		l__EffectUtil__9:playEffects({ v11 }, nil, {
			destroyAfterSec = 3
		});
	end);
	l__CollectionService__10:GetInstanceRemovedSignal(v5.tag):Connect(function(p5)
		if not p2:isClientPrediction(p5) then
			local v12 = p2.invisibleLandmineMap[p5];
			if v12 ~= nil then
				local l__beepLoopMaid__13 = v12.beepLoopMaid;
				if l__beepLoopMaid__13 ~= nil then
					l__beepLoopMaid__13:DoCleaning();
				end;
			end;
			p2.invisibleLandmineMap[p5] = nil;
		end;
	end);
end;
local l__TweenService__11 = v3.TweenService;
local u12 = TweenInfo.new(v5.fadeDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
function v7.hideLandmine(p6, p7)
	local l__Landmine__14 = p7:WaitForChild("Landmine");
	local v15 = p7:GetAttribute("LandmineActive");
	local v16 = p7:GetAttribute("LandmineDetonating");
	local v17 = p6:isFriendlyLandmine(p7);
	if v15 then
		p6.invisibleLandmineMap[p7] = {
			isActive = v15, 
			isDetonating = v16
		};
		if v17 then
			local v18 = v5.friendlyFadeTransparency;
		else
			v18 = v5.enemyFadeTransparency;
		end;
		l__Landmine__14.Transparency = v18;
		if not v16 and not v17 then
			p6:setupSound(p7);
			return;
		end;
	else
		local v19 = {};
		if v17 then
			local v20 = v5.friendlyFadeTransparency;
		else
			v20 = v5.enemyFadeTransparency;
		end;
		v19.Transparency = v20;
		local v21 = l__TweenService__11:Create(l__Landmine__14, u12, v19);
		local u13 = nil;
		u13 = v21.Completed:Connect(function()
			p6.invisibleLandmineMap[p7] = {
				isActive = true, 
				isDetonating = false
			};
			p7:SetAttribute("LandmineActive", true);
			if not v17 then
				p6:setupSound(p7);
			end;
			p6.tweenMaid:GiveTask(u13);
			p6.tweenMaid:DoCleaning();
		end);
		v21:Play();
	end;
end;
local u14 = TweenInfo.new(v5.revealDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
function v7.revealLandmine(p8, p9)
	l__TweenService__11:Create(p9:WaitForChild("Landmine"), u14, {
		Transparency = v5.revealTransparency
	}):Play();
end;
function v7.handleTouch(p10, p11)
	p11.Touched:Connect(function(p12)
		local v22 = p10.invisibleLandmineMap[p11];
		local v23 = p10:isHumanoid(p12) and (not p10:isLandmineOwner(p11, p12) and not p10:playerOnLandmineOwnersTeam(p11, p12));
		if v23 then
			local v24 = v22;
			if v24 ~= nil then
				v24 = v24.isActive;
			end;
			v23 = v24;
			if v23 then
				local v25 = v22;
				if v25 ~= nil then
					v25 = v25.isDetonating;
				end;
				v23 = not v25;
			end;
		end;
		if v23 then
			local v26 = p10:isLocalPlayer(p12);
			if v22 ~= nil then
				local l__beepLoopMaid__27 = v22.beepLoopMaid;
				if l__beepLoopMaid__27 ~= nil then
					l__beepLoopMaid__27:DoCleaning();
				end;
			end;
			p10:revealLandmine(p11);
			v22.isDetonating = true;
			if v26 then
				p11:SetAttribute("LandmineDetonating", true);
				l__default__4.Client:Get("RemoteName"):SendToServer({
					invisibleLandmine = p11
				});
			end;
		end;
	end);
end;
function v7.setupSound(p13, p14)
	local v28 = u2.new();
	v28:GiveTask((p13:startBeepLoop(p14)));
	local v29 = p13.invisibleLandmineMap[p14];
	if v29 then
		v29.beepLoopMaid = v28;
	end;
end;
function v7.startBeepLoop(p15, p16)
	local v30 = l__SoundManager__6:playSound(v5.beepSound, {
		position = p16.Position, 
		volumeMultiplier = v5.beepVolume, 
		rollOffMaxDistance = v5.rollOffMaxDistance
	});
	v30.Looped = true;
	return v30;
end;
function v7.tagLandmineWithTeam(p17, p18)
	local v31 = l__Players__5:GetPlayerByUserId((p18:GetAttribute("PlacedByUserId")));
	if v31 then
		local v32 = v31.Team;
		if v32 ~= nil then
			v32 = v32.Name;
		end;
		p18:SetAttribute("LandmineTeam", v32);
	end;
end;
function v7.isLandmineOwner(p19, p20, p21)
	local v33 = l__Players__5:GetPlayerFromCharacter(p21.Parent);
	if v33 ~= nil then
		v33 = v33.UserId;
	end;
	return p20:GetAttribute("PlacedByUserId") == v33;
end;
function v7.playerOnLandmineOwnersTeam(p22, p23, p24)
	local v34 = l__Players__5:GetPlayerByUserId((p23:GetAttribute("PlacedByUserId")));
	if v34 ~= nil then
		v34 = v34.Team;
		if v34 ~= nil then
			v34 = v34.Name;
		end;
	end;
	local v35 = l__Players__5:GetPlayerFromCharacter(p24.Parent);
	if v35 ~= nil then
		v35 = v35.Team;
		if v35 ~= nil then
			v35 = v35.Name;
		end;
	end;
	return v34 == v35;
end;
function v7.isFriendlyLandmine(p25, p26)
	local v36 = l__Players__5.LocalPlayer.Team;
	if v36 ~= nil then
		v36 = v36.Name;
	end;
	return p26:GetAttribute("LandmineTeam") == v36;
end;
function v7.isLocalPlayer(p27, p28)
	return l__Players__5.LocalPlayer.Character and p28.Parent == l__Players__5.LocalPlayer.Character;
end;
function v7.isHumanoid(p29, p30)
	local v37 = p30.Parent;
	if v37 ~= nil then
		v37 = v37:FindFirstChild("Humanoid");
	end;
	return v37 ~= nil;
end;
function v7.isClientPrediction(p31, p32)
	return p32:GetAttribute("ClientPlaced");
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v7.new());
return nil;
