-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__ReplicatedStorage__5 = v4.ReplicatedStorage;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__KnitController__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v8 = setmetatable({}, {
	__tostring = function()
		return "FlagManController";
	end, 
	__index = l__KnitController__7
});
v8.__index = v8;
local u1 = v8;
function u1.new(...)
	local v9 = setmetatable({}, u1);
	return v9:constructor(...) and v9;
end;
local u2 = l__KnitController__7;
local l__Maid__3 = v3.Maid;
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
	p1.audioLoopMaid = l__Maid__3.new();
end;
local l__WatchCollectionTag__4 = v2.WatchCollectionTag;
local l__CollectionService__5 = v4.CollectionService;
local l__Players__6 = v4.Players;
function u1.KnitStart(p2)
	p2:startBeamTicker();
	l__WatchCollectionTag__4("flag-kit", function(p3)
		p2:hideFlagForAnimation(p3);
		if not p2:isClientPrediction(p3) then
			local v10 = p2:animateFlag(p3);
			local v11 = p2:createRadius(p3);
			local v12 = p2:createPointLight(p3);
			p2:playFlagDropSound(p3);
			p2:playFlagShockwave(p3);
			local v13 = {
				radius = v11, 
				flagClone = v10, 
				pointLight = v12
			};
			if not p2:isFriendlyFlag(p3) then
				v13.teamIndicator = p2:createTeamIndicator(p3);
			end;
			p2.flagViewMap[p3] = v13;
		end;
	end);
	l__CollectionService__5:GetInstanceRemovedSignal("flag-kit"):Connect(function(p4)
		if not p2:isClientPrediction(p4) then
			local v14 = p2.flagViewMap[p4];
			local v15 = v14;
			if v15 ~= nil then
				v15 = v15.radius;
			end;
			if v15 then
				v14.radius:Destroy();
			end;
			local v16 = v14;
			if v16 ~= nil then
				v16 = v16.teamIndicator;
			end;
			if v16 then
				v14.teamIndicator:Destroy();
			end;
			local v17 = v14;
			if v17 ~= nil then
				v17 = v17.flagClone;
			end;
			if v17 then
				v14.flagClone:Destroy();
			end;
			local v18 = v14;
			if v18 ~= nil then
				v18 = v18.pointLight;
			end;
			if v18 then
				v14.pointLight:Destroy();
			end;
			local v19 = l__Players__6:GetPlayers();
			local function v20(p5)
				local v21 = p2.playerBeamMap[p5];
				if v21 then
					local v22 = v21[p4];
					if v22 then
						local function v23(p6)
							p6.Parent = nil;
							p6:Destroy();
						end;
						for v24, v25 in ipairs(v22) do
							v23(v25, v24 - 1, v22);
						end;
						if p2:isLocalPlayer(p5) and p2.audioIsLooping then
							p2.audioLoopMaid:DoCleaning();
							p2.audioIsLooping = false;
						end;
					end;
				end;
			end;
			for v26, v27 in ipairs(v19) do
				v20(v27, v26 - 1, v19);
			end;
			p4:Destroy();
			p2.flagViewMap[p4] = nil;
		end;
	end);
end;
local u7 = {
	[l__ItemType__6.DAMAGE_BANNER] = Color3.fromRGB(255, 113, 78), 
	[l__ItemType__6.HEAL_BANNER] = Color3.fromRGB(112, 189, 92), 
	[l__ItemType__6.DEFENSE_BANNER] = Color3.fromRGB(80, 137, 188)
};
local l__Workspace__8 = v4.Workspace;
local l__BLOCK_SIZE__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__TweenService__11 = v4.TweenService;
local u12 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
local u13 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
function u1.createRadius(p7, p8)
	local v28 = u10("Part", {
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
	local v29 = l__TweenService__11:Create(v28, u12, {
		Size = Vector3.new(0.2, p7.effectRadius, p7.effectRadius)
	});
	v29:Play();
	local u14 = nil;
	u14 = v29.Completed:Connect(function()
		l__TweenService__11:Create(v28, u13, {
			Size = Vector3.new(0.5, p7.effectRadius, p7.effectRadius), 
			Position = Vector3.new(v28.Position.X, v28.Position.Y + 0.25 + 0.1, v28.Position.Z)
		}):Play();
		u14:Disconnect();
	end);
	return v28;
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
	local v30 = p12:Clone();
	l__CollectionService__5:RemoveTag(v30, "flag-kit");
	local l__Banner__31 = v30:WaitForChild("Banner", 3);
	l__Banner__31.Transparency = 0;
	l__Banner__31.Position = p12.Position + Vector3.new(0, 40, 0);
	l__TweenService__11:Create(l__Banner__31, u16, {
		CFrame = CFrame.new(p12.CFrame.Position + Vector3.new(0, l__BLOCK_SIZE__9 / 2, 0))
	}):Play();
	local v32 = l__Banner__31:GetChildren();
	local function v33(p13)
		p13.Transparency = 0;
	end;
	for v34, v35 in ipairs(v32) do
		v33(v35, v34 - 1, v32);
	end;
	l__Banner__31.Parent = l__Workspace__8;
	return l__Banner__31;
end;
local l__BannerPoint__17 = l__ReplicatedStorage__5.Assets.Effects.BannerPoint;
local l__EffectUtil__18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function u1.createPointLight(p14, p15)
	local v36 = l__BannerPoint__17:Clone();
	v36.CFrame = CFrame.new(p15.Position);
	v36.Anchored = true;
	v36.CanCollide = false;
	local v37 = u7[p15.Name];
	v36.Point.Cubes.Color = ColorSequence.new(v37);
	v36.Point.Gradient.Color = ColorSequence.new(v37);
	v36.Point.PointLight.Color = v37;
	v36.Point.Shine.Color = ColorSequence.new(v37);
	v36.Parent = l__Workspace__8;
	l__EffectUtil__18:playEffects({ v36 }, nil);
	return v36;
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
	local v38 = l__ReplicatedStorage__5.Assets.Effects.FlagShockwave:Clone();
	v38.Parent = l__Workspace__8;
	v38.CFrame = CFrame.new(p20.Position);
	l__EffectUtil__18:playEffects({ v38 }, nil, {
		destroyAfterSec = 3
	});
end;
function u1.hideFlagForAnimation(p21, p22)
	local l__Banner__39 = p22:WaitForChild("Banner", 3);
	if l__Banner__39 then
		l__Banner__39.Transparency = 1;
		local v40 = l__Banner__39:GetChildren();
		local function v41(p23)
			p23.Transparency = 1;
		end;
		for v42, v43 in ipairs(v40) do
			v41(v43, v42 - 1, v40);
		end;
	end;
end;
local l__RunService__21 = v4.RunService;
function u1.startBeamTicker(p24)
	l__RunService__21.Heartbeat:Connect(function(p25)
		p24.tickAccumulator = p24.tickAccumulator + p25;
		if p24.beamTickRate <= p24.tickAccumulator then
			local l__flagViewMap__44 = p24.flagViewMap;
			local function v45(p26, p27)
				p24:createBeams(p27, (p24:getBeamEligibleEntities(p27)));
			end;
			for v46, v47 in pairs(l__flagViewMap__44) do
				v45(v47, v46, l__flagViewMap__44);
			end;
			p24.tickAccumulator = 0;
		end;
	end);
end;
local l__BannerConnection__22 = l__ReplicatedStorage__5.Assets.Effects.BannerConnection;
function u1.createBeams(p28, p29, p30)
	local u23 = p28.beamMap[p29];
	local u24 = p28.flagViewMap[p29];
	local function v48(p31)
		local v49 = u23;
		if v49 ~= nil then
			v49 = table.find(v49, p31) ~= nil;
		end;
		local v50 = u7[p29.Name];
		if not v49 then
			local v51 = l__BannerConnection__22.Beam1:Clone();
			local v52 = l__BannerConnection__22.Beam2:Clone();
			local v53 = p31.Character;
			if v53 ~= nil then
				v53 = v53:WaitForChild("UpperTorso"):WaitForChild("BodyFrontAttachment");
			end;
			local v54 = u24;
			if v54 ~= nil then
				v54 = v54.pointLight;
			end;
			if v54 then
				local l__Point__55 = u24.pointLight:WaitForChild("Point", 3);
				if l__Point__55 then
					v51.Color = ColorSequence.new(v50);
					v51.Attachment0 = l__Point__55;
					v51.Attachment1 = v53;
					v51.Parent = v53;
					v52.Color = ColorSequence.new(v50);
					v52.Attachment0 = l__Point__55;
					v52.Attachment1 = v53;
					v52.Parent = v53;
					if p28:isLocalPlayer(p31) and not p28.audioIsLooping then
						p28.audioIsLooping = true;
						p28:playBuffLoop();
					end;
					local v56 = p28.playerBeamMap[p31];
					if not v56 then
						p28.playerBeamMap[p31] = {
							[p29] = { v51, v52 }
						};
						return;
					end;
					local v57 = v56[p29];
					if v57 then
						table.insert(v57, v51);
						table.insert(v57, v52);
						return;
					end;
					v56[p29] = { v51, v52 };
				end;
			end;
		end;
	end;
	for v58, v59 in ipairs(p30) do
		v48(v59, v58 - 1, p30);
	end;
	if u23 ~= nil then
		local function v60(p32)
			if table.find(p30, p32) == nil then
				local v61 = p28.playerBeamMap[p32];
				if v61 then
					local v62 = v61[p29];
					if v62 then
						local function v63(p33)
							p33.Parent = nil;
							p33:Destroy();
						end;
						for v64, v65 in ipairs(v62) do
							v63(v65, v64 - 1, v62);
						end;
						if p28:isLocalPlayer(p32) and p28.audioIsLooping then
							p28.audioLoopMaid:DoCleaning();
							p28.audioIsLooping = false;
						end;
					end;
				end;
			end;
		end;
		for v66, v67 in ipairs(u23) do
			v60(v67, v66 - 1, u23);
		end;
	end;
	p28.beamMap[p29] = p30;
end;
local l__WorldUtil__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "world-util").WorldUtil;
local l__PlayerEntity__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
function u1.getBeamEligibleEntities(p34, p35)
	local v68 = p34.flagViewMap[p35];
	if not v68 then
		return {};
	end;
	local v69 = l__WorldUtil__25.getEntitiesWithinRadius(v68.radius.Position, p34.effectRadius / 2);
	local u27 = {};
	local function v70(p36)
		if v1.instanceof(p36, l__PlayerEntity__26) and p34:wasPlacedByTeammate(p36:getPlayer(), p35) then
			table.insert(u27, (p36:getPlayer()));
		end;
	end;
	for v71, v72 in ipairs(v69) do
		v70(v72, v71 - 1, v69);
	end;
	return u27;
end;
function u1.wasPlacedByTeammate(p37, p38, p39)
	local v73 = p38.Team;
	if v73 ~= nil then
		v73 = v73.Name;
	end;
	return p39:GetAttribute("FlagTeam") == v73;
end;
function u1.isFriendlyFlag(p40, p41)
	local v74 = l__Players__6.LocalPlayer.Team;
	if v74 ~= nil then
		v74 = v74.Name;
	end;
	return v74 == p41:GetAttribute("FlagTeam");
end;
function u1.isClientPrediction(p42, p43)
	return p43:GetAttribute("ClientPlaced");
end;
function u1.isLocalPlayer(p44, p45)
	return p45.Character == l__Players__6.LocalPlayer.Character;
end;
u2 = v3.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
