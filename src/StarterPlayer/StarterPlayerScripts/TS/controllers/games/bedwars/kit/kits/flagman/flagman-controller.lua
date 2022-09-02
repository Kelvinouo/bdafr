-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v7 = setmetatable({}, {
	__tostring = function()
		return "FlagManController";
	end, 
	__index = l__KnitController__5
});
v7.__index = v7;
local u1 = v7;
function u1.new(...)
	local v8 = setmetatable({}, u1);
	return v8:constructor(...) and v8;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "FlagManController";
	p1.effectRadius = 30;
	p1.flagViewMap = {};
	p1.beamMap = {};
	p1.playerBeamMap = {};
	p1.beamTickRate = 1;
	p1.tickAccumulator = 0;
	p1.audioIsLooping = false;
	p1.audioLoopMaid = u2.new();
end;
local l__WatchCollectionTag__3 = v2.WatchCollectionTag;
local l__CollectionService__4 = v3.CollectionService;
local l__Players__5 = v3.Players;
function u1.KnitStart(p2)
	p2:startBeamTicker();
	l__WatchCollectionTag__3("flag-kit", function(p3)
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
	l__CollectionService__4:GetInstanceRemovedSignal("flag-kit"):Connect(function(p4)
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
			local v18 = l__Players__5:GetPlayers();
			local function v19(p5)
				local v20 = p2.playerBeamMap[p5];
				if v20 then
					local v21 = v20[p4];
					if v21 then
						local v22, v23, v24 = ipairs(v21);
						while true do
							v22(v23, v24);
							if not v22 then
								break;
							end;
							v24 = v22;
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
			local v25, v26, v27 = ipairs(v18);
			while true do
				v25(v26, v27);
				if not v25 then
					break;
				end;
				v27 = v25;
				v19(v26, v25 - 1, v18);			
			end;
			p4:Destroy();
			p2.flagViewMap[p4] = nil;
		end;
	end);
end;
local u6 = {
	[l__ItemType__6.DAMAGE_BANNER] = Color3.fromRGB(255, 113, 78), 
	[l__ItemType__6.HEAL_BANNER] = Color3.fromRGB(112, 189, 92), 
	[l__ItemType__6.DEFENSE_BANNER] = Color3.fromRGB(80, 137, 188)
};
local l__Workspace__7 = v3.Workspace;
local l__BLOCK_SIZE__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__TweenService__10 = v3.TweenService;
local u11 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
local u12 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
function u1.createRadius(p6, p7)
	local v28 = u9("Part", {
		Parent = l__Workspace__7, 
		Size = Vector3.new(0.2, 0, 0), 
		CFrame = CFrame.new(p7.Position) - Vector3.new(0, l__BLOCK_SIZE__8 / 2, 0), 
		Orientation = Vector3.new(0, 0, 90), 
		Shape = Enum.PartType.Cylinder, 
		Color = u6[p7.Name], 
		Transparency = 0, 
		CastShadow = false, 
		Material = Enum.Material.ForceField, 
		Reflectance = 0, 
		Anchored = true, 
		CanCollide = false, 
		CanTouch = false, 
		CanQuery = false
	});
	local v29 = l__TweenService__10:Create(v28, u11, {
		Size = Vector3.new(0.2, p6.effectRadius, p6.effectRadius)
	});
	v29:Play();
	local u13 = nil;
	u13 = v29.Completed:Connect(function()
		l__TweenService__10:Create(v28, u12, {
			Size = Vector3.new(0.5, p6.effectRadius, p6.effectRadius), 
			Position = Vector3.new(v28.Position.X, v28.Position.Y + 0.25 + 0.1, v28.Position.Z)
		}):Play();
		u13:Disconnect();
	end);
	return v28;
end;
local l__BedwarsImageId__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
function u1.createTeamIndicator(p8, p9)
	return u9("BillboardGui", {
		Parent = l__Workspace__7, 
		Adornee = p9, 
		AlwaysOnTop = true, 
		MaxDistance = 100, 
		Size = UDim2.fromScale(1, 1), 
		StudsOffset = Vector3.new(0, 7, 0), 
		Children = { u9("ImageLabel", {
				Image = l__BedwarsImageId__14.SKULL_ICON, 
				Size = UDim2.fromScale(1, 1), 
				ScaleType = Enum.ScaleType.Fit, 
				BackgroundTransparency = 1
			}) }
	});
end;
local u15 = TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.InOut);
function u1.animateFlag(p10, p11)
	local v30 = p11:Clone();
	l__CollectionService__4:RemoveTag(v30, "flag-kit");
	local l__Banner__31 = v30:WaitForChild("Banner", 3);
	l__Banner__31.Transparency = 0;
	l__Banner__31.Position = p11.Position + Vector3.new(0, 40, 0);
	l__TweenService__10:Create(l__Banner__31, u15, {
		CFrame = CFrame.new(p11.CFrame.Position + Vector3.new(0, l__BLOCK_SIZE__8 / 2, 0))
	}):Play();
	local v32, v33, v34 = ipairs((l__Banner__31:GetChildren()));
	while true do
		v32(v33, v34);
		if not v32 then
			break;
		end;
		v34 = v32;
		v33.Transparency = 0;	
	end;
	l__Banner__31.Parent = l__Workspace__7;
	return l__Banner__31;
end;
local l__BannerPoint__16 = l__ReplicatedStorage__4.Assets.Effects.BannerPoint;
local l__EffectUtil__17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function u1.createPointLight(p12, p13)
	local v35 = l__BannerPoint__16:Clone();
	v35.CFrame = CFrame.new(p13.Position);
	v35.Anchored = true;
	v35.CanCollide = false;
	local v36 = u6[p13.Name];
	v35.Point.Cubes.Color = ColorSequence.new(v36);
	v35.Point.Gradient.Color = ColorSequence.new(v36);
	v35.Point.PointLight.Color = v36;
	v35.Point.Shine.Color = ColorSequence.new(v36);
	v35.Parent = l__Workspace__7;
	l__EffectUtil__17:playEffects({ v35 }, nil);
	return v35;
end;
local l__SoundManager__18 = v2.SoundManager;
local l__GameSound__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function u1.playFlagDropSound(p14, p15)
	l__SoundManager__18:playSound(l__GameSound__19.FLAG_DROP, {
		position = p15.Position
	});
end;
function u1.playBuffLoop(p16)
	p16.audioLoopMaid:GiveTask((l__SoundManager__18:playSound(l__GameSound__19.FLAG_BUFF, {
		position = nil, 
		looped = true
	})));
end;
function u1.playFlagShockwave(p17, p18)
	local v37 = l__ReplicatedStorage__4.Assets.Effects.FlagShockwave:Clone();
	v37.Parent = l__Workspace__7;
	v37.CFrame = CFrame.new(p18.Position);
	l__EffectUtil__17:playEffects({ v37 }, nil, {
		destroyAfterSec = 3
	});
end;
function u1.hideFlagForAnimation(p19, p20)
	local l__Banner__38 = p20:WaitForChild("Banner", 3);
	if l__Banner__38 then
		l__Banner__38.Transparency = 1;
		local v39, v40, v41 = ipairs((l__Banner__38:GetChildren()));
		while true do
			v39(v40, v41);
			if not v39 then
				break;
			end;
			v41 = v39;
			v40.Transparency = 1;		
		end;
	end;
end;
local l__RunService__20 = v3.RunService;
function u1.startBeamTicker(p21)
	l__RunService__20.Heartbeat:Connect(function(p22)
		p21.tickAccumulator = p21.tickAccumulator + p22;
		if p21.beamTickRate <= p21.tickAccumulator then
			for v42, v43 in pairs(p21.flagViewMap) do
				p21:createBeams(v42, (p21:getBeamEligibleEntities(v42)));
			end;
			p21.tickAccumulator = 0;
		end;
	end);
end;
local l__BannerConnection__21 = l__ReplicatedStorage__4.Assets.Effects.BannerConnection;
function u1.createBeams(p23, p24, p25)
	local u22 = p23.beamMap[p24];
	local u23 = p23.flagViewMap[p24];
	local function v44(p26)
		local v45 = u22;
		if v45 ~= nil then
			v45 = table.find(v45, p26) ~= nil;
		end;
		local v46 = u6[p24.Name];
		if not v45 then
			local v47 = l__BannerConnection__21.Beam1:Clone();
			local v48 = l__BannerConnection__21.Beam2:Clone();
			local v49 = p26.Character;
			if v49 ~= nil then
				v49 = v49:WaitForChild("UpperTorso"):WaitForChild("BodyFrontAttachment");
			end;
			local v50 = u23;
			if v50 ~= nil then
				v50 = v50.pointLight;
			end;
			if v50 then
				local l__Point__51 = u23.pointLight:WaitForChild("Point", 3);
				if l__Point__51 then
					v47.Color = ColorSequence.new(v46);
					v47.Attachment0 = l__Point__51;
					v47.Attachment1 = v49;
					v47.Parent = v49;
					v48.Color = ColorSequence.new(v46);
					v48.Attachment0 = l__Point__51;
					v48.Attachment1 = v49;
					v48.Parent = v49;
					if p23:isLocalPlayer(p26) and not p23.audioIsLooping then
						p23.audioIsLooping = true;
						p23:playBuffLoop();
					end;
					local v52 = p23.playerBeamMap[p26];
					if not v52 then
						p23.playerBeamMap[p26] = {
							[p24] = { v47, v48 }
						};
						return;
					end;
					local v53 = v52[p24];
					if v53 then
						table.insert(v53, v47);
						table.insert(v53, v48);
						return;
					end;
					v52[p24] = { v47, v48 };
				end;
			end;
		end;
	end;
	local v54, v55, v56 = ipairs(p25);
	while true do
		v54(v55, v56);
		if not v54 then
			break;
		end;
		v56 = v54;
		v44(v55, v54 - 1, p25);	
	end;
	if u22 ~= nil then
		local function v57(p27)
			if table.find(p25, p27) == nil then
				local v58 = p23.playerBeamMap[p27];
				if v58 then
					local v59 = v58[p24];
					if v59 then
						local v60, v61, v62 = ipairs(v59);
						while true do
							v60(v61, v62);
							if not v60 then
								break;
							end;
							v62 = v60;
							v61.Parent = nil;
							v61:Destroy();						
						end;
						if p23:isLocalPlayer(p27) and p23.audioIsLooping then
							p23.audioLoopMaid:DoCleaning();
							p23.audioIsLooping = false;
						end;
					end;
				end;
			end;
		end;
		local v63, v64, v65 = ipairs(u22);
		while true do
			v63(v64, v65);
			if not v63 then
				break;
			end;
			v65 = v63;
			v57(v64, v63 - 1, u22);		
		end;
	end;
	p23.beamMap[p24] = p25;
end;
local l__GameWorldUtil__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local l__PlayerEntity__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
function u1.getBeamEligibleEntities(p28, p29)
	local v66 = p28.flagViewMap[p29];
	if not v66 then
		return {};
	end;
	local u26 = {};
	local v67, v68, v69 = ipairs((l__GameWorldUtil__24.getEntitiesWithinRadius(v66.radius.Position, p28.effectRadius / 2)));
	while true do
		v67(v68, v69);
		if not v67 then
			break;
		end;
		v69 = v67;
		if v1.instanceof(v68, l__PlayerEntity__25) and p28:wasPlacedByTeammate(v68:getPlayer(), p29) then
			table.insert(u26, (v68:getPlayer()));
		end;	
	end;
	return u26;
end;
function u1.wasPlacedByTeammate(p30, p31, p32)
	local v70 = p31.Team;
	if v70 ~= nil then
		v70 = v70.Name;
	end;
	return p32:GetAttribute("FlagTeam") == v70;
end;
function u1.isFriendlyFlag(p33, p34)
	local v71 = l__Players__5.LocalPlayer.Team;
	if v71 ~= nil then
		v71 = v71.Name;
	end;
	return v71 == p34:GetAttribute("FlagTeam");
end;
function u1.isClientPrediction(p35, p36)
	return p36:GetAttribute("ClientPlaced");
end;
function u1.isLocalPlayer(p37, p38)
	return p38.Character == l__Players__5.LocalPlayer.Character;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
