-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "StopwatchController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "StopwatchController";
	p1.stopwatchAbilities = {};
end;
local l__RunService__2 = v4.RunService;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__4 = v4.Players;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__StopwatchConstants__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "stopwatch", "stopwatch-constants").StopwatchConstants;
local l__CollectionService__11 = v4.CollectionService;
local l__Workspace__12 = v4.Workspace;
local l__ReplicatedStorage__13 = v4.ReplicatedStorage;
local l__KnitClient__14 = v2.KnitClient;
local l__Chain__15 = v1.import(script, v1.getModule(script, "@rbxts", "catrom").src).Chain;
local l__default__16 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InOutCubic__17 = v3.InOutCubic;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__RunService__2.Heartbeat:Connect(function()
		for v8, v9 in pairs(p2.stopwatchAbilities) do
			if v8.PrimaryPart and v9.nextCaptureCheckpoint < time() then
				local v10 = p2:getCurrentAnimationOfCharacter(v8);
				if v10 ~= nil then
					v9.nextCaptureCheckpoint = time() + 1;
					table.insert(v9.checkpoints, {
						cframe = v8:GetPrimaryPartCFrame(), 
						animation = v10
					});
				end;
			end;
		end;
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		local l__character__11 = p3.character;
		local v12 = p2:createOriginMarker(p3.cframe);
		local v13 = l__Players__4:GetPlayerFromCharacter(l__character__11);
		local v14 = p2:getCurrentAnimationOfCharacter(l__character__11);
		if v14 == nil then
			return nil;
		end;
		local v15 = {};
		local v16 = l__character__11.PrimaryPart;
		if v16 ~= nil then
			v16 = v16.Position;
		end;
		v15.position = v16;
		v15.parent = l__character__11.PrimaryPart;
		v15.rollOffMaxDistance = 150;
		v15.volumeMultiplier = 1.5;
		local v17 = {};
		local v18 = l__character__11.PrimaryPart;
		if v18 ~= nil then
			v18 = v18.Position;
		end;
		v17.position = v18;
		v17.parent = l__character__11.PrimaryPart;
		v17.rollOffMaxDistance = 150;
		local v19 = l__SoundManager__5:playSound(l__GameSound__6.STOPWATCH_TICKING, v17);
		if v19 and l__SoundManager__5:playSound(l__GameSound__6.STOPWATCH_ACTIVATED, v15) then
			v19.Looped = true;
			local v20 = u7.new();
			v20:GiveTask(v19);
			v20:GiveTask(p2:attachActiveEffects(l__character__11));
			if l__Players__4.LocalPlayer == v13 then
				v20:GiveTask(l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__9.STOPWATCH));
				l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__9.STOPWATCH, l__StopwatchConstants__10.DURATION, {
					cooldownBar = {
						color = Color3.fromRGB(81, 134, 180)
					}
				});
			end;
			p2.stopwatchAbilities[l__character__11] = {
				marker = v12, 
				nextCaptureCheckpoint = time() + 1, 
				activeMaid = v20, 
				checkpoints = { {
						cframe = p3.cframe, 
						animation = v14
					} }
			};
		end;
	end);
	l__default__3.Client:OnEvent("RemoteName", v1.async(function(p4)
		local l__character__21 = p4.character;
		local v22 = p2:getCurrentAnimationOfCharacter(l__character__21);
		if v22 == nil then
			return nil;
		end;
		local v23 = p2.stopwatchAbilities[l__character__21];
		if v23 == nil then
			return nil;
		end;
		v23.activeMaid:DoCleaning();
		if p4.effect == false then
			p2:clearAbility(l__character__21);
			return nil;
		end;
		table.insert(v23.checkpoints, {
			cframe = l__character__21:GetPrimaryPartCFrame(), 
			animation = v22
		});
		local v24 = p2:cleanCheckpoints(v23.checkpoints);
		l__character__21.Archivable = true;
		local v25 = l__character__21:Clone();
		v25.HumanoidRootPart.Anchored = true;
		l__CollectionService__11:RemoveTag(v25, "entity");
		l__CollectionService__11:RemoveTag(v25, "inventory-entity");
		v25.Parent = l__Workspace__12;
		local v26 = p2:createGhostCharacter(v25);
		v26.Parent = l__ReplicatedStorage__13;
		local v27 = l__KnitClient__14.Controllers.InvisibilityPotionController:setTransparencyOfCharacter(l__character__21, 1);
		local v28 = p4.teleportBackTime - l__Workspace__12:GetServerTimeNow() + 0.1;
		if p4.player == l__Players__4.LocalPlayer then
			if v25.Humanoid == nil then
				return nil;
			end;
			l__Workspace__12.CurrentCamera.CameraSubject = v25.Humanoid;
			local v29 = l__SoundManager__5:playSound(l__GameSound__6.STOPWATCH_REWINDING, {
				volumeMultiplier = 2
			});
			if v29 then
				v29.PlaybackSpeed = 1 / v28;
			end;
		end;
		local function v30(p5)
			return p5.cframe;
		end;
		local v31 = table.create(#v24);
		for v32, v33 in ipairs(v24) do
			v31[v32] = v30(v33, v32 - 1, v24);
		end;
		local u18 = l__Chain__15.new(v31);
		local v34, v35 = pcall(function()
			u18:SolvePosition(0.5);
		end);
		if (v34 and {
			success = true, 
			value = v35
		} or {
			success = false, 
			error = v35
		}).success == true then
			local u19 = nil;
			local u20 = {};
			local u21 = #v24;
			local l__Animator__22 = v25.Humanoid.Animator;
			l__default__16(v28, l__InOutCubic__17, function(p6)
				local v36 = math.clamp(p6, 0, 1);
				local v37 = u18:SolvePosition(v36);
				local v38 = v37 + u18:SolveVelocity(v36) * Vector3.new(1, 0, 1);
				v25:SetPrimaryPartCFrame(CFrame.lookAt(v37, v38));
				if u19 then
					local v39 = u20[u19];
					if v39 ~= nil then
						v39:AdjustSpeed(v36 * 2);
					end;
				end;
				local v40 = v24[u21 - 1 + 1];
				if v40 == nil then
					return nil;
				end;
				if (v37 - v40.cframe.Position).Magnitude < 3 then
					u21 = u21 - 1;
					if u21 % 2 == 0 then
						local v41 = v26:Clone();
						v41:SetPrimaryPartCFrame(CFrame.lookAt(v37, v38));
						v41.Parent = l__Workspace__12;
						if u19 then
							local v42 = u20[u19];
							if v42 then
								local v43 = v41.AnimationController.Animator:LoadAnimation(u19);
								v43:Play(0);
								v43:AdjustSpeed(0);
								v43.TimePosition = v42.TimePosition;
							end;
						end;
						p2:tweenOutGhost(v41);
					end;
					if u19 == v40.animation then
						return nil;
					end;
					if u19 then
						local v44 = u20[u19];
						if v44 ~= nil then
							v44:Stop();
						end;
					end;
					if u20[v40.animation] ~= nil then
						local v45 = u20[v40.animation];
					else
						v45 = l__Animator__22:LoadAnimation(v40.animation);
						u20[v40.animation] = v45;
					end;
					if v45 ~= nil then
						v45:Play();
					end;
					u19 = v40.animation;
				end;
			end, 1, 0):Wait();
		end;
		v25:Destroy();
		l__character__21.Archivable = false;
		v27:DoCleaning();
		if p4.player == l__Players__4.LocalPlayer then
			l__Workspace__12.CurrentCamera.CameraSubject = l__character__21.Humanoid;
		end;
		p2:clearAbility(l__character__21);
	end));
end;
function v6.clearAbility(p7, p8)
	local v46 = p7.stopwatchAbilities[p8];
	if v46 == nil then
		error("cannot clear ability that doesn't exist");
	end;
	v46.marker:Destroy();
	v46.activeMaid:DoCleaning();
	p7.stopwatchAbilities[p8] = nil;
end;
local u23 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function v6.cleanCheckpoints(p9, p10)
	local v47 = u23.copy(p10);
	for v48, v49 in pairs(p10) do
		local v50 = p10[v48 + 1];
		if v50 ~= nil and (v49.cframe.Position - v50.cframe.Position).Magnitude < 0.25 then
			table.remove(v47, v48 + 1);
		end;
	end;
	return v47;
end;
function v6.getCurrentAnimationOfCharacter(p11, p12)
	local v51 = p12.Humanoid.Animator:GetPlayingAnimationTracks();
	table.sort(v51, function(p13, p14)
		return p14.WeightCurrent < p13.WeightCurrent;
	end);
	return v51[1].Animation;
end;
function v6.createGhostCharacter(p15, p16)
	local v52 = p16:Clone();
	v52.HumanoidRootPart.Anchored = true;
	v52.Humanoid:Destroy();
	local v53 = v52:FindFirstChildOfClass("Shirt");
	if v53 ~= nil then
		v53:Destroy();
	end;
	local v54 = v52:FindFirstChildOfClass("Pants");
	if v54 ~= nil then
		v54:Destroy();
	end;
	local v55 = Instance.new("AnimationController");
	v55.Parent = v52;
	Instance.new("Animator").Parent = v55;
	local v56, v57, v58 = ipairs(v52:GetDescendants());
	while true do
		local v59, v60 = v56(v57, v58);
		if not v59 then
			break;
		end;
		if v60:IsA("BasePart") and v60 ~= v52.HumanoidRootPart then
			v60.CanCollide = false;
			v60.Material = Enum.Material.Neon;
			v60.Color = Color3.fromRGB(81, 134, 180);
			v60.Transparency = 0.8;
		end;
		if v60:IsA("MeshPart") then
			v60.TextureID = "";
		elseif v60:IsA("SpecialMesh") then
			v60.TextureId = "";
		elseif not (not v60:IsA("BillboardGui")) or not (not v60:IsA("Beam")) or v60:IsA("ParticleEmitter") then
			v60.Enabled = false;
		end;	
	end;
	return v52;
end;
local l__InExpo__24 = v3.InExpo;
local l__scaleModel__25 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__Linear__26 = v3.Linear;
v6.tweenOutGhost = v1.async(function(p17, p18)
	task.wait(0.6);
	for v61, v62 in ipairs(p18:GetDescendants()) do
		if v62:IsA("BasePart") then
			v62.Anchored = true;
		end;
	end;
	local u27 = 0;
	l__default__16(2, l__InExpo__24, function(p19)
		l__scaleModel__25(p18, (p19 * 0.5 + 1) / (u27 * 0.5 + 1));
		u27 = p19;
		for v63, v64 in ipairs(p18:GetDescendants()) do
			if v64:IsA("BasePart") then
				v64.Transparency = l__Linear__26(p19, 0.8, 0.2, 1);
			end;
		end;
	end, 0, 1):Wait();
	p18:Destroy();
end);
function v6.createOriginMarker(p20, p21)
	local v65 = l__ReplicatedStorage__13.Assets.Effects.StopwatchEffects.StopwatchMarker:Clone();
	v65.Position = (p21 * CFrame.new(0, -2, 0)).Position;
	v65.Parent = l__Workspace__12;
	return v65;
end;
local u28 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v6.attachActiveEffects(p22, p23)
	local v66 = u28("Attachment", {
		Position = Vector3.new(0, -1.65, 0), 
		Parent = p23.HumanoidRootPart
	});
	local v67 = u28("Attachment", {
		Position = Vector3.new(0, 1.1, 0), 
		Parent = p23.HumanoidRootPart
	});
	local v68 = l__ReplicatedStorage__13.Assets.Effects.StopwatchEffects.Trail:Clone();
	v68.Lifetime = l__StopwatchConstants__10.DURATION;
	v68.Parent = p23.HumanoidRootPart;
	v68.Attachment0 = v66;
	v68.Attachment1 = v67;
	local v69 = l__ReplicatedStorage__13.Assets.Effects.StopwatchEffects.TrailParticles:Clone();
	v69.Parent = p23.HumanoidRootPart;
	local v70 = u7.new();
	v70:GiveTask(v66);
	v70:GiveTask(v67);
	v70:GiveTask(v68);
	v70:GiveTask(v69);
	return v70;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
