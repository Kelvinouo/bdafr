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
				local v21 = v20:GetDescendants();
				local function v22(p6)
					if p6:IsA("Texture") then
						p6.Transparency = 1;
					end;
				end;
				for v23, v24 in ipairs(v21) do
					v22(v24, v23 - 1, v21);
				end;
				return false;
			end
		});
		local v25 = {};
		for v26, v27 in ipairs((p4.to.Humanoid.Animator:GetPlayingAnimationTracks())) do
			if v27.Animation then
				local v28 = v13.Humanoid.Animator:LoadAnimation(v27.Animation);
				v28:AdjustWeight(v27.WeightTarget);
				v28:AdjustSpeed(v27.Speed);
				v28:Play();
				v28.TimePosition = v27.TimePosition;
				table.insert(v25, {
					startingSpeed = v27.Speed, 
					animationTrack = v28
				});
			end;
		end;
		l__default__17(1, l__InOutQuart__18, function(p7)
			for v29, v30 in ipairs(v25) do
				v30.animationTrack:AdjustSpeed(l__Linear__19(1 - p7, v30.startingSpeed, -v30.startingSpeed, 1));
			end;
		end, 1, 0);
	end);
	l__WatchCharacter__20(function(p8, p9)
		l__AnimatorAdded__21(p9:WaitForChild("Humanoid"), function(p10)
			p10.AnimationPlayed:Connect(function(p11)
				local v31 = p11.Animation;
				if v31 ~= nil then
					v31 = v31.AnimationId;
				end;
				if v31 == l__GameAnimationUtil__22.getAssetId(l__AnimationType__23.MINER_MINE_STONE) then
					if p2.mineCooldowns:has(p8.UserId) and p8.UserId ~= l__Players__5.LocalPlayer.UserId then
						return nil;
					end;
					p2.mineCooldowns:add(p8.UserId);
					local v32 = p9.PrimaryPart;
					if v32 ~= nil then
						v32 = v32.Position;
					end;
					if not v32 then
						return nil;
					end;
					local v33 = p2:getClosestPetrifiedPlayer(v32);
					if not v33 then
						return nil;
					end;
					local v34 = u24.new();
					local v35 = l__EntityUtil__8:getEntity(p8);
					if v35 ~= nil then
						v35 = v35:getItemInHandClient();
					end;
					if v35 then
						for v36, v37 in ipairs(v35:GetDescendants()) do
							if v37:IsA("BasePart") then
								v37.Transparency = 1;
								local l__Transparency__30 = v37.Transparency;
								v34:GiveTask(function()
									v37.Transparency = l__Transparency__30;
								end);
							end;
						end;
					end;
					if l__KnitClient__14.Controllers.KitController:getKitSkin(p9) == l__BedwarsKitSkin__25.MINER_SPACE then
						local v38 = l__ReplicatedStorage__26.Assets.Effects.MinerPickaxeSpace:Clone();
					else
						v38 = l__ReplicatedStorage__26.Assets.Effects.MinerPickaxe:Clone();
					end;
					v38.Parent = p9;
					l__WeldUtil__27.weldCharacterAccessories(p9);
					local v39 = l__ReplicatedStorage__26.Assets.Effects.MinerStoneHit:Clone();
					local v40 = v33.PrimaryPart;
					if v40 ~= nil then
						v40 = v40.CFrame;
					end;
					local v41 = v40;
					if v41 == nil then
						v41 = CFrame.new();
					end;
					v39.CFrame = v41;
					v39.Anchored = true;
					v39.Parent = l__Workspace__9;
					l__GameQueryUtil__11:setQueryIgnored(v39, true);
					v34:GiveTask(function()
						task.delay(3, function()
							v39:Destroy();
						end);
					end);
					local u31 = p9 == l__Players__5.LocalPlayer.Character;
					local l__Position__32 = p9.PrimaryPart.Position;
					local function u33(p12)
						if u31 then
							local v42 = p9.PrimaryPart;
							if v42 ~= nil then
								v42 = v42.CFrame;
							end;
							if v42 then
								l__KnitClient__7.Controllers.ScreenShakeController:shake(v42.Position, v42 * Vector3.new(-0.25, -1, -1) - v42.Position, {
									magnitude = 0.07 * p12, 
									duration = 0.15, 
									cycles = 2
								});
							end;
						end;
					end;
					p11:GetMarkerReachedSignal("hammer_1"):Connect(function()
						p2:detachParts(l__Position__32, { v33:FindFirstChild("Head") });
						l__EffectUtil__28:playEffects({ v39 }, nil);
						local v43 = {};
						if u31 then
							local v44 = nil;
						else
							local v45 = p9.PrimaryPart;
							if v45 ~= nil then
								v45 = v45.Position;
							end;
							v44 = v45;
						end;
						v43.position = v44;
						l__SoundManager__12:playSound(l__GameSound__13.MINER_STONE_HIT_1, v43);
						u33(1);
					end);
					p11:GetMarkerReachedSignal("hammer_2"):Connect(function()
						p2:detachParts(l__Position__32, { v33:FindFirstChild("RightUpperArm"), v33:FindFirstChild("LeftUpperArm") });
						l__EffectUtil__28:playEffects({ v39 }, nil);
						local v46 = {};
						if u31 then
							local v47 = nil;
						else
							local v48 = p9.PrimaryPart;
							if v48 ~= nil then
								v48 = v48.Position;
							end;
							v47 = v48;
						end;
						v46.position = v47;
						l__SoundManager__12:playSound(l__GameSound__13.MINER_STONE_HIT_2, v46);
						u33(1.25);
					end);
					p11:GetMarkerReachedSignal("hammer_3"):Connect(function()
						p2:detachParts(l__Position__32, { v33:FindFirstChild("UpperTorso") });
						l__EffectUtil__28:playEffects({ v39 }, nil);
						local v49 = {};
						if u31 then
							local v50 = nil;
						else
							local v51 = p9.PrimaryPart;
							if v51 ~= nil then
								v51 = v51.Position;
							end;
							v50 = v51;
						end;
						v49.position = v50;
						l__SoundManager__12:playSound(l__GameSound__13.MINER_STONE_HIT_3, v49);
						u33(1.25);
					end);
					p11:GetMarkerReachedSignal("hammer_4"):Connect(function()
						p2:detachParts(l__Position__32, { v33:FindFirstChild("LeftLowerLeg"), v33:FindFirstChild("RightLowerLeg"), v33:FindFirstChild("LowerTorso") });
						l__EffectUtil__28:playEffects({ v39 }, nil, {
							particleMultiplier = 3
						});
						local v52 = {};
						if u31 then
							local v53 = nil;
						else
							local v54 = p9.PrimaryPart;
							if v54 ~= nil then
								v54 = v54.Position;
							end;
							v53 = v54;
						end;
						v52.position = v53;
						l__SoundManager__12:playSound(l__GameSound__13.MINER_STONE_BREAK, v52);
						u33(2);
					end);
					p11.Stopped:Connect(function()
						v38:Destroy();
						v34:DoCleaning();
					end);
				end;
			end);
		end);
	end);
end;
function v7.detachParts(p13, p14, p15)
	local v55, v56, v57 = ipairs(p15);
	while true do
		local v58, v59 = v55(v56, v57);
		if not v58 then
			break;
		end;
		local v60 = v59;
		if v60 ~= nil then
			v60 = v60:IsA("BasePart");
		end;
		if v60 then
			for v61, v62 in ipairs(v59:GetChildren()) do
				if v62:IsA("Motor6D") then
					v62:Destroy();
				end;
			end;
			local v63 = v59.Position - p14;
			v59:ApplyImpulse((Vector3.new(v63.X, 0, v63.Z).Unit * 20 + Vector3.new(0, 30, 0)) * v59.AssemblyMass);
			v59:ApplyAngularImpulse(Vector3.new(5, 10, 5) * v59.AssemblyMass);
			v59.Touched:Connect(function(p16)
				if v59.Parent and p16:IsDescendantOf(v59.Parent) then
					return nil;
				end;
				if l__GameQueryUtil__11:isQueryIgnored(p16) then
					return nil;
				end;
				wait(0.15);
				p13:despawnPart(v59);
			end);
		end;	
	end;
end;
local l__RandomUtil__34 = v2.RandomUtil;
function v7.despawnPart(p17, p18)
	if not p18.Parent then
		return nil;
	end;
	l__SoundManager__12:playSound(l__RandomUtil__34.fromList(l__GameSound__13.ROCK_CRUMBLE_1, l__GameSound__13.ROCK_CRUMBLE_2, l__GameSound__13.ROCK_CRUMBLE_3), {
		position = p18.Position, 
		volumeMultiplier = 0.2
	});
	local v64 = p18:GetConnectedParts(false);
	p18:Destroy();
	task.delay(0.12, function()
		local function v65(p19)
			p17:despawnPart(p19);
		end;
		for v66, v67 in ipairs(v64) do
			v65(v67, v66 - 1, v64);
		end;
	end);
end;
function v7.destroyPetrifyModel(p20, p21, p22)
	p21:Destroy();
end;
function v7.getPetrifyModel(p23, p24)
	local v68 = l__CollectionService__10:GetTagged("petrified-player:" .. p24);
	local function v69(p25)
		return true;
	end;
	for v70, v71 in ipairs(v68) do
		if v69(v71, v70 - 1, v68) == true then
			return v71;
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
function v7.onKitEnabled(p26)
	l__CollectionTagAdded__35("petrified-player", function(p27)
		if p27.PrimaryPart == nil then
			p27:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		local v72 = u36("ProximityPrompt", {
			Parent = p27.PrimaryPart, 
			ActionText = "Gather", 
			ObjectText = "Petrified Player", 
			KeyboardKeyCode = l__Theme__37.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			HoldDuration = 3.68, 
			ClickablePrompt = l__DeviceUtil__38.isMobileControls()
		});
		v72.PromptButtonHoldBegan:Connect(function(p28)
			local v73 = l__ClientStore__39:getState().Game.myTeam;
			if v73 ~= nil then
				v73 = v73.id;
			end;
			if p27:GetAttribute("Team") == v73 then
				v72:InputHoldEnd();
				l__Flamework__40.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
					message = "You cannot mine your teammates!"
				});
				return nil;
			end;
			local v74 = u24.new();
			local u41 = l__GameAnimationUtil__22.playAnimation(l__Players__5.LocalPlayer, l__AnimationType__23.MINER_MINE_STONE);
			v74:GiveTask(function()
				if u41 ~= nil then
					u41:Stop();
				end;
				if u41 ~= nil then
					u41:Destroy();
				end;
			end);
			v72.PromptButtonHoldEnded:Connect(function()
				v74:DoCleaning();
			end);
		end);
		v72.Triggered:Connect(function(p29)
			l__default__4.Client:Get("RemoteName"):SendToServer({
				petrifyId = p27:GetAttribute("PetrifyId")
			});
		end);
	end);
end;
function v7.onKitDisabled(p30)

end;
function v7.getClosestPetrifiedPlayer(p31, p32)
	local v75 = l__CollectionService__10:GetTagged("petrified-player");
	local function v76(p33)
		return p33.PrimaryPart ~= nil;
	end;
	local v77 = {};
	local v78 = 0;
	for v79, v80 in ipairs(v75) do
		if v76(v80, v79 - 1, v75) == true then
			v78 = v78 + 1;
			v77[v78] = v80;
		end;
	end;
	table.sort(v77, function(p34, p35)
		return (p34.PrimaryPart.Position - p32).Magnitude < (p35.PrimaryPart.Position - p32).Magnitude;
	end);
	local function v81(p36)
		return true;
	end;
	local v82 = nil;
	for v83, v84 in ipairs(v77) do
		if v81(v84, v83 - 1, v77) == true then
			v82 = v84;
			break;
		end;
	end;
	return v82;
end;
u1 = l__KnitClient__14.CreateController;
u1 = u1(v7.new());
return nil;
