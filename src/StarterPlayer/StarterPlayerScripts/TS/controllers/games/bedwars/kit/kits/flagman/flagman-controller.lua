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
						for v22, v23 in ipairs(v21) do
							v23.Parent = nil;
							v23:Destroy();
						end;
						if p2:isLocalPlayer(p5) and p2.audioIsLooping then
							p2.audioLoopMaid:DoCleaning();
							p2.audioIsLooping = false;
						end;
					end;
				end;
			end;
			for v24, v25 in ipairs(v18) do
				v19(v25, v24 - 1, v18);
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
function u1.createRadius(p6, p7)
	local v26 = u10("Part", {
		Parent = l__Workspace__8, 
		Size = Vector3.new(0.2, 0, 0), 
		CFrame = CFrame.new(p7.Position) - Vector3.new(0, l__BLOCK_SIZE__9 / 2, 0), 
		Orientation = Vector3.new(0, 0, 90), 
		Shape = Enum.PartType.Cylinder, 
		Color = u7[p7.Name], 
		Transparency = 0, 
		CastShadow = false, 
		Material = Enum.Material.ForceField, 
		Reflectance = 0, 
		Anchored = true, 
		CanCollide = false, 
		CanTouch = false, 
		CanQuery = false
	});
	local v27 = l__TweenService__11:Create(v26, u12, {
		Size = Vector3.new(0.2, p6.effectRadius, p6.effectRadius)
	});
	v27:Play();
	local u14 = nil;
	u14 = v27.Completed:Connect(function()
		l__TweenService__11:Create(v26, u13, {
			Size = Vector3.new(0.5, p6.effectRadius, p6.effectRadius), 
			Position = Vector3.new(v26.Position.X, v26.Position.Y + 0.25 + 0.1, v26.Position.Z)
		}):Play();
		u14:Disconnect();
	end);
	return v26;
end;
local l__BedwarsImageId__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
function u1.createTeamIndicator(p8, p9)
	return u10("BillboardGui", {
		Parent = l__Workspace__8, 
		Adornee = p9, 
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
function u1.animateFlag(p10, p11)
	local v28 = p11:Clone();
	l__CollectionService__5:RemoveTag(v28, "flag-kit");
	local l__Banner__29 = v28:WaitForChild("Banner", 3);
	l__Banner__29.Transparency = 0;
	l__Banner__29.Position = p11.Position + Vector3.new(0, 40, 0);
	l__TweenService__11:Create(l__Banner__29, u16, {
		CFrame = CFrame.new(p11.CFrame.Position + Vector3.new(0, l__BLOCK_SIZE__9 / 2, 0))
	}):Play();
	for v30, v31 in ipairs((l__Banner__29:GetChildren())) do
		v31.Transparency = 0;
	end;
	l__Banner__29.Parent = l__Workspace__8;
	return l__Banner__29;
end;
local l__BannerPoint__17 = l__ReplicatedStorage__4.Assets.Effects.BannerPoint;
local l__EffectUtil__18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function u1.createPointLight(p12, p13)
	local v32 = l__BannerPoint__17:Clone();
	v32.CFrame = CFrame.new(p13.Position);
	v32.Anchored = true;
	v32.CanCollide = false;
	local v33 = u7[p13.Name];
	v32.Point.Cubes.Color = ColorSequence.new(v33);
	v32.Point.Gradient.Color = ColorSequence.new(v33);
	v32.Point.PointLight.Color = v33;
	v32.Point.Shine.Color = ColorSequence.new(v33);
	v32.Parent = l__Workspace__8;
	l__EffectUtil__18:playEffects({ v32 }, nil);
	return v32;
end;
local l__SoundManager__19 = v2.SoundManager;
local l__GameSound__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.playFlagDropSound(p14, p15)
	l__SoundManager__19:playSound(l__GameSound__20.FLAG_DROP, {
		position = p15.Position
	});
end;
function u1.playBuffLoop(p16)
	p16.audioLoopMaid:GiveTask((l__SoundManager__19:playSound(l__GameSound__20.FLAG_BUFF, {
		position = nil, 
		looped = true
	})));
end;
function u1.playFlagShockwave(p17, p18)
	local v34 = l__ReplicatedStorage__4.Assets.Effects.FlagShockwave:Clone();
	v34.Parent = l__Workspace__8;
	v34.CFrame = CFrame.new(p18.Position);
	l__EffectUtil__18:playEffects({ v34 }, nil, {
		destroyAfterSec = 3
	});
end;
function u1.hideFlagForAnimation(p19, p20)
	local l__Banner__35 = p20:WaitForChild("Banner", 3);
	if l__Banner__35 then
		l__Banner__35.Transparency = 1;
		for v36, v37 in ipairs((l__Banner__35:GetChildren())) do
			v37.Transparency = 1;
		end;
	end;
end;
local l__RunService__21 = v3.RunService;
function u1.startBeamTicker(p21)
	l__RunService__21.Heartbeat:Connect(function(p22)
		p21.tickAccumulator = p21.tickAccumulator + p22;
		if p21.beamTickRate <= p21.tickAccumulator then
			for v38, v39 in pairs(p21.flagViewMap) do
				p21:createBeams(v38, (p21:getBeamEligibleEntities(v38)));
			end;
			p21.tickAccumulator = 0;
		end;
	end);
end;
local l__BannerConnection__22 = l__ReplicatedStorage__4.Assets.Effects.BannerConnection;
function u1.createBeams(p23, p24, p25)
	local u23 = p23.beamMap[p24];
	local u24 = p23.flagViewMap[p24];
	local function v40(p26)
		local v41 = u23;
		if v41 ~= nil then
			v41 = table.find(v41, p26) ~= nil;
		end;
		local v42 = u7[p24.Name];
		if not v41 then
			local v43 = l__BannerConnection__22.Beam1:Clone();
			local v44 = l__BannerConnection__22.Beam2:Clone();
			local v45 = p26.Character;
			if v45 ~= nil then
				v45 = v45:WaitForChild("UpperTorso"):WaitForChild("BodyFrontAttachment");
			end;
			local v46 = u24;
			if v46 ~= nil then
				v46 = v46.pointLight;
			end;
			if v46 then
				local l__Point__47 = u24.pointLight:WaitForChild("Point", 3);
				if l__Point__47 then
					v43.Color = ColorSequence.new(v42);
					v43.Attachment0 = l__Point__47;
					v43.Attachment1 = v45;
					v43.Parent = v45;
					v44.Color = ColorSequence.new(v42);
					v44.Attachment0 = l__Point__47;
					v44.Attachment1 = v45;
					v44.Parent = v45;
					if p23:isLocalPlayer(p26) and not p23.audioIsLooping then
						p23.audioIsLooping = true;
						p23:playBuffLoop();
					end;
					local v48 = p23.playerBeamMap[p26];
					if not v48 then
						p23.playerBeamMap[p26] = {
							[p24] = { v43, v44 }
						};
						return;
					end;
					local v49 = v48[p24];
					if v49 then
						table.insert(v49, v43);
						table.insert(v49, v44);
						return;
					end;
					v48[p24] = { v43, v44 };
				end;
			end;
		end;
	end;
	for v50, v51 in ipairs(p25) do
		v40(v51, v50 - 1, p25);
	end;
	if u23 ~= nil then
		local function v52(p27)
			if table.find(p25, p27) == nil then
				local v53 = p23.playerBeamMap[p27];
				if v53 then
					local v54 = v53[p24];
					if v54 then
						for v55, v56 in ipairs(v54) do
							v56.Parent = nil;
							v56:Destroy();
						end;
						if p23:isLocalPlayer(p27) and p23.audioIsLooping then
							p23.audioLoopMaid:DoCleaning();
							p23.audioIsLooping = false;
						end;
					end;
				end;
			end;
		end;
		for v57, v58 in ipairs(u23) do
			v52(v58, v57 - 1, u23);
		end;
	end;
	p23.beamMap[p24] = p25;
end;
local l__GameWorldUtil__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local l__PlayerEntity__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
function u1.getBeamEligibleEntities(p28, p29)
	local v59 = p28.flagViewMap[p29];
	if not v59 then
		return {};
	end;
	local u27 = {};
	for v60, v61 in ipairs((l__GameWorldUtil__25.getEntitiesWithinRadius(v59.radius.Position, p28.effectRadius / 2))) do
		if v1.instanceof(v61, l__PlayerEntity__26) and p28:wasPlacedByTeammate(v61:getPlayer(), p29) then
			table.insert(u27, (v61:getPlayer()));
		end;
	end;
	return u27;
end;
function u1.wasPlacedByTeammate(p30, p31, p32)
	local v62 = p31.Team;
	if v62 ~= nil then
		v62 = v62.Name;
	end;
	return p32:GetAttribute("FlagTeam") == v62;
end;
function u1.isFriendlyFlag(p33, p34)
	local v63 = l__Players__6.LocalPlayer.Team;
	if v63 ~= nil then
		v63 = v63.Name;
	end;
	return v63 == p34:GetAttribute("FlagTeam");
end;
function u1.isClientPrediction(p35, p36)
	return p36:GetAttribute("ClientPlaced");
end;
function u1.isLocalPlayer(p37, p38)
	return p38.Character == l__Players__6.LocalPlayer.Character;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
