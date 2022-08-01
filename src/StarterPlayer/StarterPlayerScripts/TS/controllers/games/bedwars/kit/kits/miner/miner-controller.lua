-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__LegacyKitKnitController__6 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "MinerController";
	end, 
	__index = l__LegacyKitKnitController__6
});
v7.__index = v7;
function v7.new(...)
	local v8 = setmetatable({}, v7);
	return v8:constructor(...) and v8;
end;
local u1 = l__LegacyKitKnitController__6;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__ExpireList__3 = v2.ExpireList;
function v7.constructor(p1)
	u1.constructor(p1, { l__BedwarsKit__2.MINER });
	p1.Name = "MinerController";
	p1.mineCooldowns = l__ExpireList__3.new(2);
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__5 = v5.Players;
local l__default__6 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__KnitClient__7 = v3.KnitClient;
local l__EntityUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Workspace__9 = v5.Workspace;
local l__CollectionService__10 = v5.CollectionService;
local l__GameQueryUtil__11 = v2.GameQueryUtil;
local l__SoundManager__12 = v2.SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__14 = v3.KnitClient;
local u15 = Color3.fromRGB(120, 120, 120);
local l__ArmorSlot__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local l__default__17 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InOutQuart__18 = v4.InOutQuart;
local l__Linear__19 = v4.Linear;
local l__WatchCharacter__20 = v2.WatchCharacter;
local l__AnimatorAdded__21 = v2.AnimatorAdded;
local l__GameAnimationUtil__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local u24 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__BedwarsKitSkin__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__ReplicatedStorage__26 = v5.ReplicatedStorage;
local l__WeldUtil__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__EffectUtil__28 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v7.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__4.Client:OnEvent("RemoteName", function(p3)
		l__default__6.Debug("Petrified player was destroyed");
		local v9 = p2:getPetrifyModel(p3.petrifyId);
		local v10 = v9;
		if v10 ~= nil then
			v10 = v10.PrimaryPart;
		end;
		if v10 == nil then
			return nil;
		end;
		if p3.destroyer then
			local l__destroyer__29 = p3.destroyer;
			if p3.destroyer == l__Players__5.LocalPlayer then
				local v11 = "PlayLocally";
			else
				v11 = "PlayGlobally";
			end;
			l__KnitClient__7.Controllers.ReceiveItemEffectController:playEffectForItems(p3.rewards, v9.PrimaryPart.Position, function()
				local v12 = l__EntityUtil__8:getEntity(l__destroyer__29);
				if v12 == nil then
					return nil;
				end;
				return v12:getInstance():GetPrimaryPartCFrame();
			end, v11, 1);
		end;
		p2:destroyPetrifyModel(v9, p3.destroyer);
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p4)
		p4.to.Archivable = true;
		local v13 = p4.to:Clone();
		v13.Parent = l__Workspace__9;
		v13.HumanoidRootPart.Anchored = true;
		v13:SetAttribute("Team", p4.to:GetAttribute("Team"));
		v13:SetAttribute("PetrifyId", p4.petrifyId);
		l__CollectionService__10:AddTag(v13, "petrified-player");
		l__CollectionService__10:AddTag(v13, "petrified-player:" .. p4.petrifyId);
		for v14, v15 in ipairs(p4.to:GetDescendants()) do
			if v15:IsA("BasePart") then
				v15.Transparency = 1;
			end;
		end;
		for v16, v17 in ipairs(v13:GetDescendants()) do
			if v17:IsA("BasePart") then
				v17.CanCollide = false;
				l__GameQueryUtil__11:setQueryIgnored(v17, true);
			end;
		end;
		for v18, v19 in ipairs(v13:GetDescendants()) do
			if v19:IsA("BillboardGui") then
				v19:Destroy();
			end;
		end;
		l__SoundManager__12:playSound(l__GameSound__13.TURN_TO_STONE, {
			position = v13:GetPrimaryPartCFrame().Position
		});
		l__KnitClient__14.Controllers.EntityHighlightController:highlight(v13, {
			color = u15, 
			transparency = 0, 
			fadeInTime = 1, 
			lastsForever = true, 
			shouldApplyToPart = function(p5)
				local v20 = p5:FindFirstAncestorWhichIsA("Accessory");
				if not v20 or v20:GetAttribute("ArmorSlot") ~= l__ArmorSlot__16.HELMET then
					return true;
				end;
				for v21, v22 in ipairs((v20:GetDescendants())) do
					if v22:IsA("Texture") then
						v22.Transparency = 1;
					end;
				end;
				return false;
			end
		});
		local v23 = {};
		for v24, v25 in ipairs((p4.to.Humanoid.Animator:GetPlayingAnimationTracks())) do
			if v25.Animation then
				local v26 = v13.Humanoid.Animator:LoadAnimation(v25.Animation);
				v26:AdjustWeight(v25.WeightTarget);
				v26:AdjustSpeed(v25.Speed);
				v26:Play();
				v26.TimePosition = v25.TimePosition;
				table.insert(v23, {
					startingSpeed = v25.Speed, 
					animationTrack = v26
				});
			end;
		end;
		l__default__17(1, l__InOutQuart__18, function(p6)
			for v27, v28 in ipairs(v23) do
				v28.animationTrack:AdjustSpeed(l__Linear__19(1 - p6, v28.startingSpeed, -v28.startingSpeed, 1));
			end;
		end, 1, 0);
	end);
	l__WatchCharacter__20(function(p7, p8)
		l__AnimatorAdded__21(p8:WaitForChild("Humanoid"), function(p9)
			p9.AnimationPlayed:Connect(function(p10)
				local v29 = p10.Animation;
				if v29 ~= nil then
					v29 = v29.AnimationId;
				end;
				if v29 == l__GameAnimationUtil__22.getAssetId(l__AnimationType__23.MINER_MINE_STONE) then
					if p2.mineCooldowns:has(p7.UserId) and p7.UserId ~= l__Players__5.LocalPlayer.UserId then
						return nil;
					end;
					p2.mineCooldowns:add(p7.UserId);
					local v30 = p8.PrimaryPart;
					if v30 ~= nil then
						v30 = v30.Position;
					end;
					if not v30 then
						return nil;
					end;
					local v31 = p2:getClosestPetrifiedPlayer(v30);
					if not v31 then
						return nil;
					end;
					local v32 = u24.new();
					local v33 = l__EntityUtil__8:getEntity(p7);
					if v33 ~= nil then
						v33 = v33:getItemInHandClient();
					end;
					if v33 then
						for v34, v35 in ipairs(v33:GetDescendants()) do
							if v35:IsA("BasePart") then
								v35.Transparency = 1;
								local l__Transparency__30 = v35.Transparency;
								v32:GiveTask(function()
									v35.Transparency = l__Transparency__30;
								end);
							end;
						end;
					end;
					if l__KnitClient__14.Controllers.KitController:getKitSkin(p8) == l__BedwarsKitSkin__25.MINER_SPACE then
						local v36 = l__ReplicatedStorage__26.Assets.Effects.MinerPickaxeSpace:Clone();
					else
						v36 = l__ReplicatedStorage__26.Assets.Effects.MinerPickaxe:Clone();
					end;
					v36.Parent = p8;
					l__WeldUtil__27.weldCharacterAccessories(p8);
					local v37 = l__ReplicatedStorage__26.Assets.Effects.MinerStoneHit:Clone();
					local v38 = v31.PrimaryPart;
					if v38 ~= nil then
						v38 = v38.CFrame;
					end;
					local v39 = v38;
					if v39 == nil then
						v39 = CFrame.new();
					end;
					v37.CFrame = v39;
					v37.Anchored = true;
					v37.Parent = l__Workspace__9;
					l__GameQueryUtil__11:setQueryIgnored(v37, true);
					v32:GiveTask(function()
						task.delay(3, function()
							v37:Destroy();
						end);
					end);
					local u31 = p8 == l__Players__5.LocalPlayer.Character;
					local l__Position__32 = p8.PrimaryPart.Position;
					local function u33(p11)
						if u31 then
							local v40 = p8.PrimaryPart;
							if v40 ~= nil then
								v40 = v40.CFrame;
							end;
							if v40 then
								l__KnitClient__7.Controllers.ScreenShakeController:shake(v40.Position, v40 * Vector3.new(-0.25, -1, -1) - v40.Position, {
									magnitude = 0.07 * p11, 
									duration = 0.15, 
									cycles = 2
								});
							end;
						end;
					end;
					p10:GetMarkerReachedSignal("hammer_1"):Connect(function()
						p2:detachParts(l__Position__32, { v31:FindFirstChild("Head") });
						l__EffectUtil__28:playEffects({ v37 }, nil);
						local v41 = {};
						if u31 then
							local v42 = nil;
						else
							local v43 = p8.PrimaryPart;
							if v43 ~= nil then
								v43 = v43.Position;
							end;
							v42 = v43;
						end;
						v41.position = v42;
						l__SoundManager__12:playSound(l__GameSound__13.MINER_STONE_HIT_1, v41);
						u33(1);
					end);
					p10:GetMarkerReachedSignal("hammer_2"):Connect(function()
						p2:detachParts(l__Position__32, { v31:FindFirstChild("RightUpperArm"), v31:FindFirstChild("LeftUpperArm") });
						l__EffectUtil__28:playEffects({ v37 }, nil);
						local v44 = {};
						if u31 then
							local v45 = nil;
						else
							local v46 = p8.PrimaryPart;
							if v46 ~= nil then
								v46 = v46.Position;
							end;
							v45 = v46;
						end;
						v44.position = v45;
						l__SoundManager__12:playSound(l__GameSound__13.MINER_STONE_HIT_2, v44);
						u33(1.25);
					end);
					p10:GetMarkerReachedSignal("hammer_3"):Connect(function()
						p2:detachParts(l__Position__32, { v31:FindFirstChild("UpperTorso") });
						l__EffectUtil__28:playEffects({ v37 }, nil);
						local v47 = {};
						if u31 then
							local v48 = nil;
						else
							local v49 = p8.PrimaryPart;
							if v49 ~= nil then
								v49 = v49.Position;
							end;
							v48 = v49;
						end;
						v47.position = v48;
						l__SoundManager__12:playSound(l__GameSound__13.MINER_STONE_HIT_3, v47);
						u33(1.25);
					end);
					p10:GetMarkerReachedSignal("hammer_4"):Connect(function()
						p2:detachParts(l__Position__32, { v31:FindFirstChild("LeftLowerLeg"), v31:FindFirstChild("RightLowerLeg"), v31:FindFirstChild("LowerTorso") });
						l__EffectUtil__28:playEffects({ v37 }, nil, {
							particleMultiplier = 3
						});
						local v50 = {};
						if u31 then
							local v51 = nil;
						else
							local v52 = p8.PrimaryPart;
							if v52 ~= nil then
								v52 = v52.Position;
							end;
							v51 = v52;
						end;
						v50.position = v51;
						l__SoundManager__12:playSound(l__GameSound__13.MINER_STONE_BREAK, v50);
						u33(2);
					end);
					p10.Stopped:Connect(function()
						v36:Destroy();
						v32:DoCleaning();
					end);
				end;
			end);
		end);
	end);
end;
function v7.detachParts(p12, p13, p14)
	local v53, v54, v55 = ipairs(p14);
	while true do
		local v56, v57 = v53(v54, v55);
		if not v56 then
			break;
		end;
		local v58 = v57;
		if v58 ~= nil then
			v58 = v58:IsA("BasePart");
		end;
		if v58 then
			for v59, v60 in ipairs(v57:GetChildren()) do
				if v60:IsA("Motor6D") then
					v60:Destroy();
				end;
			end;
			local v61 = v57.Position - p13;
			v57:ApplyImpulse((Vector3.new(v61.X, 0, v61.Z).Unit * 20 + Vector3.new(0, 30, 0)) * v57.AssemblyMass);
			v57:ApplyAngularImpulse(Vector3.new(5, 10, 5) * v57.AssemblyMass);
			v57.Touched:Connect(function(p15)
				if v57.Parent and p15:IsDescendantOf(v57.Parent) then
					return nil;
				end;
				if l__GameQueryUtil__11:isQueryIgnored(p15) then
					return nil;
				end;
				wait(0.15);
				p12:despawnPart(v57);
			end);
		end;	
	end;
end;
local l__RandomUtil__34 = v2.RandomUtil;
function v7.despawnPart(p16, p17)
	if not p17.Parent then
		return nil;
	end;
	l__SoundManager__12:playSound(l__RandomUtil__34.fromList(l__GameSound__13.ROCK_CRUMBLE_1, l__GameSound__13.ROCK_CRUMBLE_2, l__GameSound__13.ROCK_CRUMBLE_3), {
		position = p17.Position, 
		volumeMultiplier = 0.2
	});
	local v62 = p17:GetConnectedParts(false);
	p17:Destroy();
	task.delay(0.12, function()
		for v63, v64 in ipairs(v62) do
			p16:despawnPart(v64);
		end;
	end);
end;
function v7.destroyPetrifyModel(p18, p19, p20)
	p19:Destroy();
end;
function v7.getPetrifyModel(p21, p22)
	for v65, v66 in ipairs((l__CollectionService__10:GetTagged("petrified-player:" .. p22))) do
		if true == true then
			return v66;
		end;
	end;
	return nil;
end;
local l__CollectionTagAdded__35 = v2.CollectionTagAdded;
local u36 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__38 = v2.DeviceUtil;
local l__ClientStore__39 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Flamework__40 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v7.onKitEnabled(p23)
	l__CollectionTagAdded__35("petrified-player", function(p24)
		if p24.PrimaryPart == nil then
			p24:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		local v67 = u36("ProximityPrompt", {
			Parent = p24.PrimaryPart, 
			ActionText = "Gather", 
			ObjectText = "Petrified Player", 
			KeyboardKeyCode = l__Theme__37.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			HoldDuration = 3.68, 
			ClickablePrompt = l__DeviceUtil__38.isMobileControls()
		});
		v67.PromptButtonHoldBegan:Connect(function(p25)
			local v68 = l__ClientStore__39:getState().Game.myTeam;
			if v68 ~= nil then
				v68 = v68.id;
			end;
			if p24:GetAttribute("Team") == v68 then
				v67:InputHoldEnd();
				l__Flamework__40.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
					message = "You cannot mine your teammates!"
				});
				return nil;
			end;
			local v69 = u24.new();
			local u41 = l__GameAnimationUtil__22.playAnimation(l__Players__5.LocalPlayer, l__AnimationType__23.MINER_MINE_STONE);
			v69:GiveTask(function()
				if u41 ~= nil then
					u41:Stop();
				end;
				if u41 ~= nil then
					u41:Destroy();
				end;
			end);
			v67.PromptButtonHoldEnded:Connect(function()
				v69:DoCleaning();
			end);
		end);
		v67.Triggered:Connect(function(p26)
			l__default__4.Client:Get("RemoteName"):SendToServer({
				petrifyId = p24:GetAttribute("PetrifyId")
			});
		end);
	end);
end;
function v7.onKitDisabled(p27)

end;
function v7.getClosestPetrifiedPlayer(p28, p29)
	local v70 = {};
	local v71 = 0;
	local v72, v73, v74 = ipairs((l__CollectionService__10:GetTagged("petrified-player")));
	while true do
		local v75, v76 = v72(v73, v74);
		if not v75 then
			break;
		end;
		if v76.PrimaryPart ~= nil == true then
			v71 = v71 + 1;
			v70[v71] = v76;
		end;	
	end;
	table.sort(v70, function(p30, p31)
		return (p30.PrimaryPart.Position - p29).Magnitude < (p31.PrimaryPart.Position - p29).Magnitude;
	end);
	local v77 = nil;
	for v78, v79 in ipairs(v70) do
		if true == true then
			v77 = v79;
			break;
		end;
	end;
	return v77;
end;
u1 = l__KnitClient__14.CreateController;
u1 = u1(v7.new());
return nil;
