-- Script Hash: 3b079911bdb2b9d2ef465b6b351366840524e88c5f7343552c439b2c772b45aa71b154262b125719a171394ec24cb088
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__ItemType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__KnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "FlagManController";
	end, 
	__index = l__KnitController__6
});
v7.__index = v7;
local u1 = v7;
function u1.new(...)
	local v8 = setmetatable({}, u1);
	return v8:constructor(...) and v8;
end;
local u2 = l__KnitController__6;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "FlagManController";
	p1.effectRadius = 30;
	p1.flagViewMap = {};
	p1.beamMap = {};
	p1.playerBeamMap = {};
	p1.beamTickRate = 1;
	p1.tickAccumulator = 0;
	p1.audioIsLooping = false;
	p1.audioLoopMaid = u3.new();
end;
local l__WatchCollectionTag__4 = v2.WatchCollectionTag;
local l__CollectionService__5 = v3.CollectionService;
local l__Players__6 = v3.Players;
function u1.KnitStart(p2)
	p2:startBeamTicker();
	l__WatchCollectionTag__4("flag-kit", function(p3)
		p2:hideFlagForAnimation(p3);
		if not p2:isClientPrediction(p3) then
			local v9 = p2:animateFlag(p3);
			local v10 = p2:createRadius(p3);
			local v11 = p2:createPointLight(p3);
			p2:playFlagDropSound(p3);
			p2:playFlagShockwave(p3);
			local v12 = {
				radius = v10, 
				flagClone = v9, 
				pointLight = v11
			};
			if not p2:isFriendlyFlag(p3) then
				v12.teamIndicator = p2:createTeamIndicator(p3);
			end;
			p2.flagViewMap[p3] = v12;
		end;
	end);
	l__CollectionService__5:GetInstanceRemovedSignal("flag-kit"):Connect(function(p4)
		if not p2:isClientPrediction(p4) then
			local v13 = p2.flagViewMap[p4];
			local v14 = v13;
			if v14 ~= nil then
				v14 = v14.radius;
			end;
			if v14 then
				v13.radius:Destroy();
			end;
			local v15 = v13;
			if v15 ~= nil then
				v15 = v15.teamIndicator;
			end;
			if v15 then
				v13.teamIndicator:Destroy();
			end;
			local v16 = v13;
			if v16 ~= nil then
				v16 = v16.flagClone;
			end;
			if v16 then
				v13.flagClone:Destroy();
			end;
			local v17 = v13;
			if v17 ~= nil then
				v17 = v17.pointLight;
			end;
			if v17 then
				v13.pointLight:Destroy();
			end;
			local v18 = l__Players__6:GetPlayers();
			local function v19(p5)
				local v20 = p2.playerBeamMap[p5];
				if v20 then
					local v21 = v20[p4];
					if v21 then
						local function v22(p6)
							p6.Parent = nil;
							p6:Destroy();
						end;
						for v23, v24 in ipairs(v21) do
							v22(v24, v23 - 1, v21);
						end;
						if p2:isLocalPlayer(p5) and p2.audioIsLooping then
							p2.audioLoopMaid:DoCleaning();
							p2.audioIsLooping = false;
						end;
					end;
				end;
			end;
			for v25, v26 in ipairs(v18) do
				v19(v26, v25 - 1, v18);
			end;
			p4:Destroy();
			p2.flagViewMap[p4] = nil;
		end;
	end);
end;
local u7 = {
	[l__ItemType__5.DAMAGE_BANNER] = Color3.fromRGB(255, 113, 78), 
	[l__ItemType__5.HEAL_BANNER] = Color3.fromRGB(112, 189, 92), 
	[l__ItemType__5.DEFENSE_BANNER] = Color3.fromRGB(80, 137, 188)
};
local l__Workspace__8 = v3.Workspace;
local l__BLOCK_SIZE__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__TweenService__11 = v3.TweenService;
local u12 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
local u13 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
function u1.createRadius(p7, p8)
	local v27 = u10("Part", {
		Parent = l__Workspace__8, 
		Size = Vector3.new(0.2, 0, 0), 
		CFrame = CFrame.new(p8.Position) - Vector3.new(0, l__BLOCK_SIZE__9 / 2, 0), 
		Orientation = Vector3.new(0, 0, 90), 
		Shape = Enum.PartType.Cylinder, 
		Color = u7[p8.Name], 
		Transparency = 0, 
		CastShadow = false, 
		Material = Enum.Material.ForceField, 
		Reflectance = 0, 
		Anchored = true, 
		CanCollide = false, 
		CanTouch = false, 
		CanQuery = false
	});
	local v28 = l__TweenService__11:Create(v27, u12, {
		Size = Vector3.new(0.2, p7.effectRadius, p7.effectRadius)
	});
	v28:Play();
	local u14 = nil;
	u14 = v28.Completed:Connect(function()
		l__TweenService__11:Create(v27, u13, {
			Size = Vector3.new(0.5, p7.effectRadius, p7.effectRadius), 
			Position = Vector3.new(v27.Position.X, v27.Position.Y + 0.25 + 0.1, v27.Position.Z)
		}):Play();
		u14:Disconnect();
	end);
	return v27;
end;
local l__BedwarsImageId__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
function u1.createTeamIndicator(p9, p10)
	return u10("BillboardGui", {
		Parent = l__Workspace__8, 
		Adornee = p10, 
		AlwaysOnTop = true, 
		MaxDistance = 100, 
		Size = UDim2.fromScale(1, 1), 
		StudsOffset = Vector3.new(0, 7, 0), 
		Children = { u10("ImageLabel", {
				Image = l__BedwarsImageId__15.SKULL_ICON, 
				Size = UDim2.fromScale(1, 1), 
				ScaleType = Enum.ScaleType.Fit, 
				BackgroundTransparency = 1
			}) }
	});
end;
local u16 = TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.InOut);
function u1.animateFlag(p11, p12)
	local v29 = p12:Clone();
	l__CollectionService__5:RemoveTag(v29, "flag-kit");
	local l__Banner__30 = v29:WaitForChild("Banner", 3);
	l__Banner__30.Transparency = 0;
	l__Banner__30.Position = p12.Position + Vector3.new(0, 40, 0);
	l__TweenService__11:Create(l__Banner__30, u16, {
		CFrame = CFrame.new(p12.CFrame.Position + Vector3.new(0, l__BLOCK_SIZE__9 / 2, 0))
	}):Play();
	local v31 = l__Banner__30:GetChildren();
	local function v32(p13)
		p13.Transparency = 0;
	end;
	for v33, v34 in ipairs(v31) do
		v32(v34, v33 - 1, v31);
	end;
	l__Banner__30.Parent = l__Workspace__8;
	return l__Banner__30;
end;
local l__BannerPoint__17 = l__ReplicatedStorage__4.Assets.Effects.BannerPoint;
local l__EffectUtil__18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function u1.createPointLight(p14, p15)
	local v35 = l__BannerPoint__17:Clone();
	v35.CFrame = CFrame.new(p15.Position);
	v35.Anchored = true;
	v35.CanCollide = false;
	local v36 = u7[p15.Name];
	v35.Point.Cubes.Color = ColorSequence.new(v36);
	v35.Point.Gradient.Color = ColorSequence.new(v36);
	v35.Point.PointLight.Color = v36;
	v35.Point.Shine.Color = ColorSequence.new(v36);
	v35.Parent = l__Workspace__8;
	l__EffectUtil__18:playEffects({ v35 }, nil);
	return v35;
end;
local l__SoundManager__19 = v2.SoundManager;
local l__GameSound__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.playFlagDropSound(p16, p17)
	l__SoundManager__19:playSound(l__GameSound__20.FLAG_DROP, {
		position = p17.Position
	});
end;
function u1.playBuffLoop(p18)
	p18.audioLoopMaid:GiveTask((l__SoundManager__19:playSound(l__GameSound__20.FLAG_BUFF, {
		position = nil, 
		looped = true
	})));
end;
function u1.playFlagShockwave(p19, p20)
	local v37 = l__ReplicatedStorage__4.Assets.Effects.FlagShockwave:Clone();
	v37.Parent = l__Workspace__8;
	v37.CFrame = CFrame.new(p20.Position);
	l__EffectUtil__18:playEffects({ v37 }, nil, {
		destroyAfterSec = 3
	});
end;
function u1.hideFlagForAnimation(p21, p22)
	local l__Banner__38 = p22:WaitForChild("Banner", 3);
	if l__Banner__38 then
		l__Banner__38.Transparency = 1;
		local v39 = l__Banner__38:GetChildren();
		local function v40(p23)
			p23.Transparency = 1;
		end;
		for v41, v42 in ipairs(v39) do
			v40(v42, v41 - 1, v39);
		end;
	end;
end;
local l__RunService__21 = v3.RunService;
function u1.startBeamTicker(p24)
	l__RunService__21.Heartbeat:Connect(function(p25)
		p24.tickAccumulator = p24.tickAccumulator + p25;
		if p24.beamTickRate <= p24.tickAccumulator then
			local l__flagViewMap__43 = p24.flagViewMap;
			local function v44(p26, p27)
				p24:createBeams(p27, (p24:getBeamEligibleEntities(p27)));
			end;
			for v45, v46 in pairs(l__flagViewMap__43) do
				v44(v46, v45, l__flagViewMap__43);
			end;
			p24.tickAccumulator = 0;
		end;
	end);
end;
local l__BannerConnection__22 = l__ReplicatedStorage__4.Assets.Effects.BannerConnection;
function u1.createBeams(p28, p29, p30)
	local u23 = p28.beamMap[p29];
	local u24 = p28.flagViewMap[p29];
	local function v47(p31)
		local v48 = u23;
		if v48 ~= nil then
			v48 = table.find(v48, p31) ~= nil;
		end;
		local v49 = u7[p29.Name];
		if not v48 then
			local v50 = l__BannerConnection__22.Beam1:Clone();
			local v51 = l__BannerConnection__22.Beam2:Clone();
			local v52 = p31.Character;
			if v52 ~= nil then
				v52 = v52:WaitForChild("UpperTorso"):WaitForChild("BodyFrontAttachment");
			end;
			local v53 = u24;
			if v53 ~= nil then
				v53 = v53.pointLight;
			end;
			if v53 then
				local l__Point__54 = u24.pointLight:WaitForChild("Point", 3);
				if l__Point__54 then
					v50.Color = ColorSequence.new(v49);
					v50.Attachment0 = l__Point__54;
					v50.Attachment1 = v52;
					v50.Parent = v52;
					v51.Color = ColorSequence.new(v49);
					v51.Attachment0 = l__Point__54;
					v51.Attachment1 = v52;
					v51.Parent = v52;
					if p28:isLocalPlayer(p31) and not p28.audioIsLooping then
						p28.audioIsLooping = true;
						p28:playBuffLoop();
					end;
					local v55 = p28.playerBeamMap[p31];
					if not v55 then
						p28.playerBeamMap[p31] = {
							[p29] = { v50, v51 }
						};
						return;
					end;
					local v56 = v55[p29];
					if v56 then
						table.insert(v56, v50);
						table.insert(v56, v51);
						return;
					end;
					v55[p29] = { v50, v51 };
				end;
			end;
		end;
	end;
	for v57, v58 in ipairs(p30) do
		v47(v58, v57 - 1, p30);
	end;
	if u23 ~= nil then
		local function v59(p32)
			if table.find(p30, p32) == nil then
				local v60 = p28.playerBeamMap[p32];
				if v60 then
					local v61 = v60[p29];
					if v61 then
						local function v62(p33)
							p33.Parent = nil;
							p33:Destroy();
						end;
						for v63, v64 in ipairs(v61) do
							v62(v64, v63 - 1, v61);
						end;
						if p28:isLocalPlayer(p32) and p28.audioIsLooping then
							p28.audioLoopMaid:DoCleaning();
							p28.audioIsLooping = false;
						end;
					end;
				end;
			end;
		end;
		for v65, v66 in ipairs(u23) do
			v59(v66, v65 - 1, u23);
		end;
	end;
	p28.beamMap[p29] = p30;
end;
local l__GameWorldUtil__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local l__PlayerEntity__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
function u1.getBeamEligibleEntities(p34, p35)
	local v67 = p34.flagViewMap[p35];
	if not v67 then
		return {};
	end;
	local v68 = l__GameWorldUtil__25.getEntitiesWithinRadius(v67.radius.Position, p34.effectRadius / 2);
	local u27 = {};
	local function v69(p36)
		if v1.instanceof(p36, l__PlayerEntity__26) and p34:wasPlacedByTeammate(p36:getPlayer(), p35) then
			table.insert(u27, (p36:getPlayer()));
		end;
	end;
	for v70, v71 in ipairs(v68) do
		v69(v71, v70 - 1, v68);
	end;
	return u27;
end;
function u1.wasPlacedByTeammate(p37, p38, p39)
	local v72 = p38.Team;
	if v72 ~= nil then
		v72 = v72.Name;
	end;
	return p39:GetAttribute("FlagTeam") == v72;
end;
function u1.isFriendlyFlag(p40, p41)
	local v73 = l__Players__6.LocalPlayer.Team;
	if v73 ~= nil then
		v73 = v73.Name;
	end;
	return v73 == p41:GetAttribute("FlagTeam");
end;
function u1.isClientPrediction(p42, p43)
	return p43:GetAttribute("ClientPlaced");
end;
function u1.isLocalPlayer(p44, p45)
	return p45.Character == l__Players__6.LocalPlayer.Character;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
