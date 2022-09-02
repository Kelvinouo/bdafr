-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "StopwatchController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "StopwatchController";
	p1.stopwatchAbilities = {};
end;
local l__RunService__2 = v2.RunService;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__4 = v2.Players;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__StopwatchConstants__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "stopwatch", "stopwatch-constants").StopwatchConstants;
local l__CollectionService__11 = v2.CollectionService;
local l__Workspace__12 = v2.Workspace;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "catrom").src);
local l__default__14 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InOutCubic__15 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutCubic;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__RunService__2.Heartbeat:Connect(function()
		for v6, v7 in pairs(p2.stopwatchAbilities) do
			if v6.PrimaryPart and v7.nextCaptureCheckpoint < time() then
				local v8 = p2:getCurrentAnimationOfCharacter(v6);
				if v8 ~= nil then
					v7.nextCaptureCheckpoint = time() + 1;
					table.insert(v7.checkpoints, {
						cframe = v6:GetPrimaryPartCFrame(), 
						animation = v8
					});
				end;
			end;
		end;
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		local l__character__9 = p3.character;
		local v10 = p2:createOriginMarker(p3.cframe);
		local v11 = l__Players__4:GetPlayerFromCharacter(l__character__9);
		local v12 = p2:getCurrentAnimationOfCharacter(l__character__9);
		if v12 == nil then
			return nil;
		end;
		local v13 = {};
		local v14 = l__character__9.PrimaryPart;
		if v14 ~= nil then
			v14 = v14.Position;
		end;
		v13.position = v14;
		v13.parent = l__character__9.PrimaryPart;
		v13.rollOffMaxDistance = 150;
		v13.volumeMultiplier = 1.5;
		local v15 = {};
		local v16 = l__character__9.PrimaryPart;
		if v16 ~= nil then
			v16 = v16.Position;
		end;
		v15.position = v16;
		v15.parent = l__character__9.PrimaryPart;
		v15.rollOffMaxDistance = 150;
		local v17 = l__SoundManager__5:playSound(l__GameSound__6.STOPWATCH_TICKING, v15);
		if v17 and l__SoundManager__5:playSound(l__GameSound__6.STOPWATCH_ACTIVATED, v13) then
			v17.Looped = true;
			local v18 = u7.new();
			v18:GiveTask(v17);
			v18:GiveTask(p2:attachActiveEffects(l__character__9));
			if l__Players__4.LocalPlayer == v11 then
				v18:GiveTask(l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__9.STOPWATCH));
				l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__9.STOPWATCH, l__StopwatchConstants__10.DURATION, {
					cooldownBar = {
						color = Color3.fromRGB(81, 134, 180)
					}
				});
			end;
			p2.stopwatchAbilities[l__character__9] = {
				marker = v10, 
				nextCaptureCheckpoint = time() + 1, 
				activeMaid = v18, 
				checkpoints = { {
						cframe = p3.cframe, 
						animation = v12
					} }
			};
		end;
	end);
	l__default__3.Client:OnEvent("RemoteName", v1.async(function(p4)
		local l__character__19 = p4.character;
		local v20 = p2:getCurrentAnimationOfCharacter(l__character__19);
		if v20 == nil then
			return nil;
		end;
		local v21 = p2.stopwatchAbilities[l__character__19];
		if v21 == nil then
			return nil;
		end;
		v21.activeMaid:DoCleaning();
		if p4.effect == false then
			p2:clearAbility(l__character__19);
			return nil;
		end;
		table.insert(v21.checkpoints, {
			cframe = l__character__19:GetPrimaryPartCFrame(), 
			animation = v20
		});
		local v22 = p2:cleanCheckpoints(v21.checkpoints);
		l__character__19.Archivable = true;
		local v23 = l__character__19:Clone();
		v23.HumanoidRootPart.Anchored = true;
		l__CollectionService__11:RemoveTag(v23, "entity");
		l__CollectionService__11:RemoveTag(v23, "inventory-entity");
		local v24 = v23:FindFirstChildOfClass("Shirt");
		if v24 ~= nil then
			v24:Destroy();
		end;
		local v25 = v23:FindFirstChildOfClass("Pants");
		if v25 ~= nil then
			v25:Destroy();
		end;
		for v26, v27 in ipairs(v23:GetDescendants()) do
			if v27:IsA("BasePart") and v27 ~= v23.PrimaryPart then
				v27.Color = Color3.fromRGB(81, 134, 180);
				v27.Material = Enum.Material.Neon;
				v27.Transparency = 0.7;
				if v27:IsA("MeshPart") then
					v27.TextureID = "";
				end;
			elseif not (not v27:IsA("Decal")) and v27.Name ~= "face" or not (not v27:IsA("Texture")) or not (not v27:IsA("BillboardGui")) or not (not v27:IsA("Beam")) or v27:IsA("ParticleEmitter") then
				v27:Destroy();
			elseif v27:IsA("SpecialMesh") then
				v27.TextureId = "";
			end;
		end;
		v23.Parent = l__Workspace__12;
		l__character__19:SetAttribute("Transparency", 1);
		local v28 = p4.teleportBackTime - l__Workspace__12:GetServerTimeNow() + 0.1;
		if p4.player == l__Players__4.LocalPlayer then
			if v23.Humanoid == nil then
				return nil;
			end;
			l__Workspace__12.CurrentCamera.CameraSubject = v23.Humanoid;
			local v29 = l__SoundManager__5:playSound(l__GameSound__6.STOPWATCH_REWINDING, {
				volumeMultiplier = 2
			});
			if v29 then
				v29.PlaybackSpeed = 1 / v28;
			end;
		end;
		local v30 = table.create(#v22);
		for v31, v32 in ipairs(v22) do
			v30[v31] = v32.cframe;
		end;
		local u16 = u13.new(v30, 0.5, 0);
		local v33, v34 = pcall(function()
			u16:SolvePosition(0.5);
		end);
		if (v33 and {
			success = true, 
			value = v34
		} or {
			success = false, 
			error = v34
		}).success == true then
			local u17 = nil;
			local u18 = {};
			local u19 = #v22;
			local l__Animator__20 = v23.Humanoid.Animator;
			l__default__14(v28, l__InOutCubic__15, function(p5)
				local v35 = math.clamp(p5, 0, 1);
				local v36 = u16:SolvePosition(v35);
				v23:SetPrimaryPartCFrame(CFrame.lookAt(v36, v36 + u16:SolveVelocity(v35) * Vector3.new(1, 0, 1)));
				if u17 then
					local v37 = u18[u17];
					if v37 ~= nil then
						v37:AdjustSpeed(v35 * 2);
					end;
				end;
				local v38 = v22[u19 - 1 + 1];
				if v38 == nil then
					return nil;
				end;
				if (v36 - v38.cframe.Position).Magnitude < 3 then
					u19 = u19 - 1;
					if u17 == v38.animation then
						return nil;
					end;
					if u17 then
						local v39 = u18[u17];
						if v39 ~= nil then
							v39:Stop();
						end;
					end;
					if u18[v38.animation] ~= nil then
						local v40 = u18[v38.animation];
					else
						v40 = l__Animator__20:LoadAnimation(v38.animation);
						u18[v38.animation] = v40;
					end;
					if v40 ~= nil then
						v40:Play();
					end;
					u17 = v38.animation;
				end;
			end, 1, 0):Wait();
		end;
		v23:Destroy();
		l__character__19.Archivable = false;
		l__character__19:SetAttribute("Transparency", 0);
		if p4.player == l__Players__4.LocalPlayer then
			l__Workspace__12.CurrentCamera.CameraSubject = l__character__19.Humanoid;
		end;
		p2:clearAbility(l__character__19);
	end));
end;
function v4.clearAbility(p6, p7)
	local v41 = p6.stopwatchAbilities[p7];
	if v41 == nil then
		error("cannot clear ability that doesn't exist");
	end;
	v41.marker:Destroy();
	v41.activeMaid:DoCleaning();
	p6.stopwatchAbilities[p7] = nil;
end;
local u21 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function v4.cleanCheckpoints(p8, p9)
	local v42 = u21.copy(p9);
	for v43, v44 in pairs(p9) do
		local v45 = p9[v43 + 1];
		if v45 ~= nil and (v44.cframe.Position - v45.cframe.Position).Magnitude < 0.25 then
			table.remove(v42, v43 + 1);
		end;
	end;
	return v42;
end;
function v4.getCurrentAnimationOfCharacter(p10, p11)
	local v46 = p11.Humanoid.Animator:GetPlayingAnimationTracks();
	table.sort(v46, function(p12, p13)
		return p13.WeightCurrent < p12.WeightCurrent;
	end);
	return v46[1].Animation;
end;
local l__ReplicatedStorage__22 = v2.ReplicatedStorage;
function v4.createOriginMarker(p14, p15)
	local v47 = l__ReplicatedStorage__22.Assets.Effects.StopwatchEffects.StopwatchMarker:Clone();
	v47.Position = (p15 * CFrame.new(0, -2, 0)).Position;
	v47.Parent = l__Workspace__12;
	return v47;
end;
local u23 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v4.attachActiveEffects(p16, p17)
	local v48 = u23("Attachment", {
		Position = Vector3.new(0, -1.65, 0), 
		Parent = p17.HumanoidRootPart
	});
	local v49 = u23("Attachment", {
		Position = Vector3.new(0, 1.1, 0), 
		Parent = p17.HumanoidRootPart
	});
	local v50 = l__ReplicatedStorage__22.Assets.Effects.StopwatchEffects.Trail:Clone();
	v50.Lifetime = l__StopwatchConstants__10.DURATION;
	v50.Parent = p17.HumanoidRootPart;
	v50.Attachment0 = v48;
	v50.Attachment1 = v49;
	local v51 = l__ReplicatedStorage__22.Assets.Effects.StopwatchEffects.TrailParticles:Clone();
	v51.Parent = p17.HumanoidRootPart;
	local v52 = u7.new();
	v52:GiveTask(v48);
	v52:GiveTask(v49);
	v52:GiveTask(v50);
	v52:GiveTask(v51);
	return v52;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
