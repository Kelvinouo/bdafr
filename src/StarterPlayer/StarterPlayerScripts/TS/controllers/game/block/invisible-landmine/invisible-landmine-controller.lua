
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v6 = {
	tag = "invisible-landmine", 
	enemyFadeTransparency = 1, 
	friendlyFadeTransparency = 0.6, 
	fadeDuration = 0.3, 
	revealTransparency = 0, 
	revealDuration = 0.25, 
	beepSound = l__GameSound__5.INVISIBLE_LANDMINE_BEEP_LOOP, 
	beepVolume = 0.3, 
	rollOffMaxDistance = 25
};
local l__KnitController__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v8 = setmetatable({}, {
	__tostring = function()
		return "InvisibleLandmineController";
	end, 
	__index = l__KnitController__7
});
v8.__index = v8;
function v8.new(...)
	local v9 = setmetatable({}, v8);
	return v9:constructor(...) and v9;
end;
local u1 = l__KnitController__7;
local l__Maid__2 = v3.Maid;
function v8.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "InvisibleLandmineController";
	p1.invisibleLandmineMap = {};
	p1.tweenMaid = l__Maid__2.new();
end;
local l__WatchCollectionTag__3 = v2.WatchCollectionTag;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__5 = v4.Players;
local l__SoundManager__6 = v2.SoundManager;
local l__ReplicatedStorage__7 = v4.ReplicatedStorage;
local l__Workspace__8 = v4.Workspace;
local l__EffectUtil__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__CollectionService__10 = v4.CollectionService;
function v8.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__3(v6.tag, function(p3)
		if not p2:isClientPrediction(p3) then
			p2:tagLandmineWithTeam(p3);
			p2:hideLandmine(p3);
			p2:handleTouch(p3);
		end;
	end);
	l__default__4.Client:OnEvent("LandmineExplode", function(p4)
		local v10 = {};
		if l__Players__5.LocalPlayer.Character and l__Players__5.LocalPlayer.Character == p4.targetEntityInstance then
			local v11 = nil;
		else
			v11 = p4.position;
		end;
		v10.position = v11;
		v10.rollOffMaxDistance = 250;
		l__SoundManager__6:playSound(l__GameSound__5.INVISIBLE_LANDMINE_EXPLOSION, v10);
		local v12 = l__ReplicatedStorage__7.Assets.Effects.LandmineExplosion:Clone();
		v12.Parent = l__Workspace__8;
		v12.CFrame = CFrame.new(p4.position);
		l__EffectUtil__9:playEffects({ v12 }, nil, {
			destroyAfterSec = 3
		});
	end);
	l__CollectionService__10:GetInstanceRemovedSignal(v6.tag):Connect(function(p5)
		if not p2:isClientPrediction(p5) then
			local v13 = p2.invisibleLandmineMap[p5];
			if v13 ~= nil then
				local l__beepLoopMaid__14 = v13.beepLoopMaid;
				if l__beepLoopMaid__14 ~= nil then
					l__beepLoopMaid__14:DoCleaning();
				end;
			end;
			p2.invisibleLandmineMap[p5] = nil;
		end;
	end);
end;
local l__TweenService__11 = v4.TweenService;
local u12 = TweenInfo.new(v6.fadeDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
function v8.hideLandmine(p6, p7)
	local l__Landmine__15 = p7:WaitForChild("Landmine");
	local v16 = p7:GetAttribute("LandmineActive");
	local v17 = p7:GetAttribute("LandmineDetonating");
	local v18 = p6:isFriendlyLandmine(p7);
	if v16 then
		p6.invisibleLandmineMap[p7] = {
			isActive = v16, 
			isDetonating = v17
		};
		if v18 then
			local v19 = v6.friendlyFadeTransparency;
		else
			v19 = v6.enemyFadeTransparency;
		end;
		l__Landmine__15.Transparency = v19;
		if not v17 and not v18 then
			p6:setupSound(p7);
			return;
		end;
	else
		local v20 = {};
		if v18 then
			local v21 = v6.friendlyFadeTransparency;
		else
			v21 = v6.enemyFadeTransparency;
		end;
		v20.Transparency = v21;
		local v22 = l__TweenService__11:Create(l__Landmine__15, u12, v20);
		local u13 = nil;
		u13 = v22.Completed:Connect(function()
			p6.invisibleLandmineMap[p7] = {
				isActive = true, 
				isDetonating = false
			};
			p7:SetAttribute("LandmineActive", true);
			if not v18 then
				p6:setupSound(p7);
			end;
			p6.tweenMaid:GiveTask(u13);
			p6.tweenMaid:DoCleaning();
		end);
		v22:Play();
	end;
end;
local u14 = TweenInfo.new(v6.revealDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
function v8.revealLandmine(p8, p9)
	l__TweenService__11:Create(p9:WaitForChild("Landmine"), u14, {
		Transparency = v6.revealTransparency
	}):Play();
end;
function v8.handleTouch(p10, p11)
	p11.Touched:Connect(function(p12)
		local v23 = p10.invisibleLandmineMap[p11];
		local v24 = p10:isHumanoid(p12) and (not p10:isLandmineOwner(p11, p12) and not p10:playerOnLandmineOwnersTeam(p11, p12));
		if v24 then
			local v25 = v23;
			if v25 ~= nil then
				v25 = v25.isActive;
			end;
			v24 = v25;
			if v24 then
				local v26 = v23;
				if v26 ~= nil then
					v26 = v26.isDetonating;
				end;
				v24 = not v26;
			end;
		end;
		if v24 then
			local v27 = p10:isLocalPlayer(p12);
			if v23 ~= nil then
				local l__beepLoopMaid__28 = v23.beepLoopMaid;
				if l__beepLoopMaid__28 ~= nil then
					l__beepLoopMaid__28:DoCleaning();
				end;
			end;
			p10:revealLandmine(p11);
			v23.isDetonating = true;
			if v27 then
				p11:SetAttribute("LandmineDetonating", true);
				l__default__4.Client:Get("ttbnsYcdivtaMbpvijyetdmivdbgbqc"):SendToServer({
					invisibleLandmine = p11
				});
			end;
		end;
	end);
end;
function v8.setupSound(p13, p14)
	local v29 = l__Maid__2.new();
	v29:GiveTask((p13:startBeepLoop(p14)));
	local v30 = p13.invisibleLandmineMap[p14];
	if v30 then
		v30.beepLoopMaid = v29;
	end;
end;
function v8.startBeepLoop(p15, p16)
	local v31 = l__SoundManager__6:playSound(v6.beepSound, {
		position = p16.Position, 
		volumeMultiplier = v6.beepVolume, 
		rollOffMaxDistance = v6.rollOffMaxDistance
	});
	v31.Looped = true;
	return v31;
end;
function v8.tagLandmineWithTeam(p17, p18)
	local v32 = l__Players__5:GetPlayerByUserId((p18:GetAttribute("PlacedByUserId")));
	if v32 then
		local v33 = v32.Team;
		if v33 ~= nil then
			v33 = v33.Name;
		end;
		p18:SetAttribute("LandmineTeam", v33);
	end;
end;
function v8.isLandmineOwner(p19, p20, p21)
	local v34 = l__Players__5:GetPlayerFromCharacter(p21.Parent);
	if v34 ~= nil then
		v34 = v34.UserId;
	end;
	return p20:GetAttribute("PlacedByUserId") == v34;
end;
function v8.playerOnLandmineOwnersTeam(p22, p23, p24)
	local v35 = l__Players__5:GetPlayerByUserId((p23:GetAttribute("PlacedByUserId")));
	if v35 ~= nil then
		v35 = v35.Team;
		if v35 ~= nil then
			v35 = v35.Name;
		end;
	end;
	local v36 = l__Players__5:GetPlayerFromCharacter(p24.Parent);
	if v36 ~= nil then
		v36 = v36.Team;
		if v36 ~= nil then
			v36 = v36.Name;
		end;
	end;
	return v35 == v36;
end;
function v8.isFriendlyLandmine(p25, p26)
	local v37 = l__Players__5.LocalPlayer.Team;
	if v37 ~= nil then
		v37 = v37.Name;
	end;
	return p26:GetAttribute("LandmineTeam") == v37;
end;
function v8.isLocalPlayer(p27, p28)
	return l__Players__5.LocalPlayer.Character and p28.Parent == l__Players__5.LocalPlayer.Character;
end;
function v8.isHumanoid(p29, p30)
	local v38 = p30.Parent;
	if v38 ~= nil then
		v38 = v38:FindFirstChild("Humanoid");
	end;
	return v38 ~= nil;
end;
function v8.isClientPrediction(p31, p32)
	return p32:GetAttribute("ClientPlaced");
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v8.new());
return nil;

