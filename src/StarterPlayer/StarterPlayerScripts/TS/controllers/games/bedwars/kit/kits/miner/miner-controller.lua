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
local l__BedwarsKit__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__ExpireList__2 = v2.ExpireList;
function v7.constructor(p1)
	l__LegacyKitKnitController__6.constructor(p1, { l__BedwarsKit__1.MINER });
	p1.Name = "MinerController";
	p1.mineCooldowns = l__ExpireList__2.new(2);
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__4 = v5.Players;
local l__default__5 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__KnitClient__6 = v3.KnitClient;
local l__EntityUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Workspace__8 = v5.Workspace;
local l__CollectionService__9 = v5.CollectionService;
local l__GameQueryUtil__10 = v2.GameQueryUtil;
local l__SoundManager__11 = v2.SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__13 = v3.KnitClient;
local u14 = Color3.fromRGB(120, 120, 120);
local l__ArmorSlot__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local l__default__16 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InOutQuart__17 = v4.InOutQuart;
local l__Linear__18 = v4.Linear;
local l__WatchCharacter__19 = v2.WatchCharacter;
local l__AnimatorAdded__20 = v2.AnimatorAdded;
local l__GameAnimationUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local u23 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__BedwarsKitSkin__24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__ReplicatedStorage__25 = v5.ReplicatedStorage;
local l__WeldUtil__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__EffectUtil__27 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v7.KnitStart(p2)
	l__LegacyKitKnitController__6.KnitStart(p2);
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		l__default__5.Debug("Petrified player was destroyed");
		local v9 = p2:getPetrifyModel(p3.petrifyId);
		local v10 = v9;
		if v10 ~= nil then
			v10 = v10.PrimaryPart;
		end;
		if v10 == nil then
			return nil;
		end;
		if p3.destroyer then
			local l__destroyer__28 = p3.destroyer;
			if p3.destroyer == l__Players__4.LocalPlayer then
				local v11 = "PlayLocally";
			else
				v11 = "PlayGlobally";
			end;
			l__KnitClient__6.Controllers.ReceiveItemEffectController:playEffectForItems(p3.rewards, v9.PrimaryPart.Position, function()
				local v12 = l__EntityUtil__7:getEntity(l__destroyer__28);
				if v12 == nil then
					return nil;
				end;
				return v12:getInstance():GetPrimaryPartCFrame();
			end, v11, 1);
		end;
		p2:destroyPetrifyModel(v9, p3.destroyer);
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p4)
		p4.to.Archivable = true;
		local v13 = p4.to:Clone();
		v13.Parent = l__Workspace__8;
		v13.HumanoidRootPart.Anchored = true;
		v13:SetAttribute("Team", p4.to:GetAttribute("Team"));
		v13:SetAttribute("PetrifyId", p4.petrifyId);
		l__CollectionService__9:AddTag(v13, "petrified-player");
		l__CollectionService__9:AddTag(v13, "petrified-player:" .. p4.petrifyId);
		local v14, v15, v16 = ipairs(p4.to:GetDescendants());
		while true do
			v14(v15, v16);
			if not v14 then
				break;
			end;
			v16 = v14;
			if v15:IsA("BasePart") then
				v15.Transparency = 1;
			end;		
		end;
		local v17, v18, v19 = ipairs(v13:GetDescendants());
		while true do
			v17(v18, v19);
			if not v17 then
				break;
			end;
			v19 = v17;
			if v18:IsA("BasePart") then
				v18.CanCollide = false;
				l__GameQueryUtil__10:setQueryIgnored(v18, true);
			end;		
		end;
		local v20, v21, v22 = ipairs(v13:GetDescendants());
		while true do
			v20(v21, v22);
			if not v20 then
				break;
			end;
			v22 = v20;
			if v21:IsA("BillboardGui") then
				v21:Destroy();
			end;		
		end;
		l__SoundManager__11:playSound(l__GameSound__12.TURN_TO_STONE, {
			position = v13:GetPrimaryPartCFrame().Position
		});
		l__KnitClient__13.Controllers.EntityHighlightController:highlight(v13, {
			color = u14, 
			transparency = 0, 
			fadeInTime = 1, 
			lastsForever = true, 
			shouldApplyToPart = function(p5)
				local v23 = p5:FindFirstAncestorWhichIsA("Accessory");
				if not v23 or v23:GetAttribute("ArmorSlot") ~= l__ArmorSlot__15.HELMET then
					return true;
				end;
				local v24, v25, v26 = ipairs((v23:GetDescendants()));
				while true do
					v24(v25, v26);
					if not v24 then
						break;
					end;
					v26 = v24;
					if v25:IsA("Texture") then
						v25.Transparency = 1;
					end;				
				end;
				return false;
			end
		});
		local v27 = {};
		local v28, v29, v30 = ipairs((p4.to.Humanoid.Animator:GetPlayingAnimationTracks()));
		while true do
			v28(v29, v30);
			if not v28 then
				break;
			end;
			v30 = v28;
			if v29.Animation then
				local v31 = v13.Humanoid.Animator:LoadAnimation(v29.Animation);
				v31:AdjustWeight(v29.WeightTarget);
				v31:AdjustSpeed(v29.Speed);
				v31:Play();
				v31.TimePosition = v29.TimePosition;
				table.insert(v27, {
					startingSpeed = v29.Speed, 
					animationTrack = v31
				});
			end;		
		end;
		l__default__16(1, l__InOutQuart__17, function(p6)
			local v32, v33, v34 = ipairs(v27);
			while true do
				v32(v33, v34);
				if not v32 then
					break;
				end;
				v34 = v32;
				v33.animationTrack:AdjustSpeed(l__Linear__18(1 - p6, v33.startingSpeed, -v33.startingSpeed, 1));			
			end;
		end, 1, 0);
	end);
	l__WatchCharacter__19(function(p7, p8)
		l__AnimatorAdded__20(p8:WaitForChild("Humanoid"), function(p9)
			p9.AnimationPlayed:Connect(function(p10)
				local v35 = p10.Animation;
				if v35 ~= nil then
					v35 = v35.AnimationId;
				end;
				if v35 == l__GameAnimationUtil__21.getAssetId(l__AnimationType__22.MINER_MINE_STONE) then
					if p2.mineCooldowns:has(p7.UserId) and p7.UserId ~= l__Players__4.LocalPlayer.UserId then
						return nil;
					end;
					p2.mineCooldowns:add(p7.UserId);
					local v36 = p8.PrimaryPart;
					if v36 ~= nil then
						v36 = v36.Position;
					end;
					if not v36 then
						return nil;
					end;
					local v37 = p2:getClosestPetrifiedPlayer(v36);
					if not v37 then
						return nil;
					end;
					local v38 = u23.new();
					local v39 = l__EntityUtil__7:getEntity(p7);
					if v39 ~= nil then
						v39 = v39:getItemInHandClient();
					end;
					if v39 then
						local v40, v41, v42 = ipairs(v39:GetDescendants());
						while true do
							v40(v41, v42);
							if not v40 then
								break;
							end;
							v42 = v40;
							if v41:IsA("BasePart") then
								v41.Transparency = 1;
								local l__Transparency__29 = v41.Transparency;
								v38:GiveTask(function()
									v41.Transparency = l__Transparency__29;
								end);
							end;						
						end;
					end;
					if l__KnitClient__13.Controllers.KitController:getKitSkin(p8) == l__BedwarsKitSkin__24.MINER_SPACE then
						local v43 = l__ReplicatedStorage__25.Assets.Effects.MinerPickaxeSpace:Clone();
					else
						v43 = l__ReplicatedStorage__25.Assets.Effects.MinerPickaxe:Clone();
					end;
					v43.Parent = p8;
					l__WeldUtil__26:weldCharacterAccessories(p8);
					local v44 = l__ReplicatedStorage__25.Assets.Effects.MinerStoneHit:Clone();
					local v45 = v37.PrimaryPart;
					if v45 ~= nil then
						v45 = v45.CFrame;
					end;
					local v46 = v45;
					if v46 == nil then
						v46 = CFrame.new();
					end;
					v44.CFrame = v46;
					v44.Anchored = true;
					v44.Parent = l__Workspace__8;
					l__GameQueryUtil__10:setQueryIgnored(v44, true);
					v38:GiveTask(function()
						task.delay(3, function()
							v44:Destroy();
						end);
					end);
					local u30 = p8 == l__Players__4.LocalPlayer.Character;
					local l__Position__31 = p8.PrimaryPart.Position;
					local function u32(p11)
						if u30 then
							local v47 = p8.PrimaryPart;
							if v47 ~= nil then
								v47 = v47.CFrame;
							end;
							if v47 then
								l__KnitClient__6.Controllers.ScreenShakeController:shake(v47.Position, v47 * Vector3.new(-0.25, -1, -1) - v47.Position, {
									magnitude = 0.07 * p11, 
									duration = 0.15, 
									cycles = 2
								});
							end;
						end;
					end;
					p10:GetMarkerReachedSignal("hammer_1"):Connect(function()
						p2:detachParts(l__Position__31, { v37:FindFirstChild("Head") });
						l__EffectUtil__27:playEffects({ v44 }, nil);
						local v48 = {};
						if u30 then
							local v49 = nil;
						else
							local v50 = p8.PrimaryPart;
							if v50 ~= nil then
								v50 = v50.Position;
							end;
							v49 = v50;
						end;
						v48.position = v49;
						l__SoundManager__11:playSound(l__GameSound__12.MINER_STONE_HIT_1, v48);
						u32(1);
					end);
					p10:GetMarkerReachedSignal("hammer_2"):Connect(function()
						p2:detachParts(l__Position__31, { v37:FindFirstChild("RightUpperArm"), v37:FindFirstChild("LeftUpperArm") });
						l__EffectUtil__27:playEffects({ v44 }, nil);
						local v51 = {};
						if u30 then
							local v52 = nil;
						else
							local v53 = p8.PrimaryPart;
							if v53 ~= nil then
								v53 = v53.Position;
							end;
							v52 = v53;
						end;
						v51.position = v52;
						l__SoundManager__11:playSound(l__GameSound__12.MINER_STONE_HIT_2, v51);
						u32(1.25);
					end);
					p10:GetMarkerReachedSignal("hammer_3"):Connect(function()
						p2:detachParts(l__Position__31, { v37:FindFirstChild("UpperTorso") });
						l__EffectUtil__27:playEffects({ v44 }, nil);
						local v54 = {};
						if u30 then
							local v55 = nil;
						else
							local v56 = p8.PrimaryPart;
							if v56 ~= nil then
								v56 = v56.Position;
							end;
							v55 = v56;
						end;
						v54.position = v55;
						l__SoundManager__11:playSound(l__GameSound__12.MINER_STONE_HIT_3, v54);
						u32(1.25);
					end);
					p10:GetMarkerReachedSignal("hammer_4"):Connect(function()
						p2:detachParts(l__Position__31, { v37:FindFirstChild("LeftLowerLeg"), v37:FindFirstChild("RightLowerLeg"), v37:FindFirstChild("LowerTorso") });
						l__EffectUtil__27:playEffects({ v44 }, nil, {
							particleMultiplier = 3
						});
						local v57 = {};
						if u30 then
							local v58 = nil;
						else
							local v59 = p8.PrimaryPart;
							if v59 ~= nil then
								v59 = v59.Position;
							end;
							v58 = v59;
						end;
						v57.position = v58;
						l__SoundManager__11:playSound(l__GameSound__12.MINER_STONE_BREAK, v57);
						u32(2);
					end);
					p10.Stopped:Connect(function()
						v43:Destroy();
						v38:DoCleaning();
					end);
				end;
			end);
		end);
	end);
end;
function v7.detachParts(p12, p13, p14)
	local v60, v61, v62 = ipairs(p14);
	while true do
		v60(v61, v62);
		if not v60 then
			break;
		end;
		local v63 = v61;
		if v63 ~= nil then
			v63 = v63:IsA("BasePart");
		end;
		if v63 then
			local v64, v65, v66 = ipairs(v61:GetChildren());
			while true do
				v64(v65, v66);
				if not v64 then
					break;
				end;
				v66 = v64;
				if v65:IsA("Motor6D") then
					v65:Destroy();
				end;			
			end;
			local v67 = v61.Position - p13;
			v61:ApplyImpulse((Vector3.new(v67.X, 0, v67.Z).Unit * 20 + Vector3.new(0, 30, 0)) * v61.AssemblyMass);
			v61:ApplyAngularImpulse(Vector3.new(5, 10, 5) * v61.AssemblyMass);
			v61.Touched:Connect(function(p15)
				if v61.Parent and p15:IsDescendantOf(v61.Parent) then
					return nil;
				end;
				if l__GameQueryUtil__10:isQueryIgnored(p15) then
					return nil;
				end;
				wait(0.15);
				p12:despawnPart(v61);
			end);
		end;	
	end;
end;
local l__RandomUtil__33 = v2.RandomUtil;
function v7.despawnPart(p16, p17)
	if not p17.Parent then
		return nil;
	end;
	l__SoundManager__11:playSound(l__RandomUtil__33.fromList(l__GameSound__12.ROCK_CRUMBLE_1, l__GameSound__12.ROCK_CRUMBLE_2, l__GameSound__12.ROCK_CRUMBLE_3), {
		position = p17.Position, 
		volumeMultiplier = 0.2
	});
	local v68 = p17:GetConnectedParts(false);
	p17:Destroy();
	task.delay(0.12, function()
		local v69, v70, v71 = ipairs(v68);
		while true do
			v69(v70, v71);
			if not v69 then
				break;
			end;
			v71 = v69;
			p16:despawnPart(v70);		
		end;
	end);
end;
function v7.destroyPetrifyModel(p18, p19, p20)
	p19:Destroy();
end;
function v7.getPetrifyModel(p21, p22)
	local v72, v73, v74 = ipairs((l__CollectionService__9:GetTagged("petrified-player:" .. p22)));
	while true do
		v72(v73, v74);
		if not v72 then
			break;
		end;
		v74 = v72;
		if true == true then
			return v73;
		end;	
	end;
	return nil;
end;
local l__CollectionTagAdded__34 = v2.CollectionTagAdded;
local u35 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__37 = v2.DeviceUtil;
local l__ClientStore__38 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Flamework__39 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v7.onKitEnabled(p23)
	l__CollectionTagAdded__34("petrified-player", function(p24)
		if p24.PrimaryPart == nil then
			p24:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		local v75 = u35("ProximityPrompt", {
			Parent = p24.PrimaryPart, 
			ActionText = "Gather", 
			ObjectText = "Petrified Player", 
			KeyboardKeyCode = l__Theme__36.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			HoldDuration = 3.68, 
			ClickablePrompt = l__DeviceUtil__37.isMobileControls()
		});
		v75.PromptButtonHoldBegan:Connect(function(p25)
			local v76 = l__ClientStore__38:getState().Game.myTeam;
			if v76 ~= nil then
				v76 = v76.id;
			end;
			if p24:GetAttribute("Team") == v76 then
				v75:InputHoldEnd();
				l__Flamework__39.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
					message = "You cannot mine your teammates!"
				});
				return nil;
			end;
			local v77 = u23.new();
			local u40 = l__GameAnimationUtil__21.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__22.MINER_MINE_STONE);
			v77:GiveTask(function()
				if u40 ~= nil then
					u40:Stop();
				end;
				if u40 ~= nil then
					u40:Destroy();
				end;
			end);
			v75.PromptButtonHoldEnded:Connect(function()
				v77:DoCleaning();
			end);
		end);
		v75.Triggered:Connect(function(p26)
			l__default__3.Client:Get("RemoteName"):SendToServer({
				petrifyId = p24:GetAttribute("PetrifyId")
			});
		end);
	end);
end;
function v7.onKitDisabled(p27)

end;
function v7.getClosestPetrifiedPlayer(p28, p29)
	local v78 = {};
	local v79 = 0;
	local v80, v81, v82 = ipairs((l__CollectionService__9:GetTagged("petrified-player")));
	while true do
		v80(v81, v82);
		if not v80 then
			break;
		end;
		if v81.PrimaryPart ~= nil == true then
			v79 = v79 + 1;
			v78[v79] = v81;
		end;	
	end;
	table.sort(v78, function(p30, p31)
		return (p30.PrimaryPart.Position - p29).Magnitude < (p31.PrimaryPart.Position - p29).Magnitude;
	end);
	local v83 = nil;
	local v84, v85, v86 = ipairs(v78);
	while true do
		v84(v85, v86);
		if not v84 then
			break;
		end;
		v86 = v84;
		if true == true then
			v83 = v85;
			break;
		end;	
	end;
	return v83;
end;
local v87 = l__KnitClient__13.CreateController(v7.new());
return nil;
