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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "StopwatchController";
	p1.stopwatchAbilities = {};
end;
local l__RunService__1 = v2.RunService;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v2.Players;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__StopwatchConstants__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "stopwatch", "stopwatch-constants").StopwatchConstants;
local l__CollectionService__10 = v2.CollectionService;
local l__Workspace__11 = v2.Workspace;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "catrom").src);
local l__default__13 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InOutCubic__14 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutCubic;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__RunService__1.Heartbeat:Connect(function()
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
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local l__character__9 = p3.character;
		local v10 = p2:createOriginMarker(p3.cframe);
		local v11 = l__Players__3:GetPlayerFromCharacter(l__character__9);
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
		local v17 = l__SoundManager__4:playSound(l__GameSound__5.STOPWATCH_TICKING, v15);
		if v17 and l__SoundManager__4:playSound(l__GameSound__5.STOPWATCH_ACTIVATED, v13) then
			v17.Looped = true;
			local v18 = u6.new();
			v18:GiveTask(v17);
			v18:GiveTask(p2:attachActiveEffects(l__character__9));
			if l__Players__3.LocalPlayer == v11 then
				v18:GiveTask(l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__8.STOPWATCH));
				l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__8.STOPWATCH, l__StopwatchConstants__9.DURATION, {
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
	l__default__2.Client:OnEvent("RemoteName", v1.async(function(p4)
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
		l__CollectionService__10:RemoveTag(v23, "entity");
		l__CollectionService__10:RemoveTag(v23, "inventory-entity");
		local v24 = v23:FindFirstChildOfClass("Shirt");
		if v24 ~= nil then
			v24:Destroy();
		end;
		local v25 = v23:FindFirstChildOfClass("Pants");
		if v25 ~= nil then
			v25:Destroy();
		end;
		local v26, v27, v28 = ipairs(v23:GetDescendants());
		while true do
			v26(v27, v28);
			if not v26 then
				break;
			end;
			v28 = v26;
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
		v23.Parent = l__Workspace__11;
		l__character__19:SetAttribute("Transparency", 1);
		local v29 = p4.teleportBackTime - l__Workspace__11:GetServerTimeNow() + 0.1;
		if p4.player == l__Players__3.LocalPlayer then
			if v23.Humanoid == nil then
				return nil;
			end;
			l__Workspace__11.CurrentCamera.CameraSubject = v23.Humanoid;
			local v30 = l__SoundManager__4:playSound(l__GameSound__5.STOPWATCH_REWINDING, {
				volumeMultiplier = 2
			});
			if v30 then
				v30.PlaybackSpeed = 1 / v29;
			end;
		end;
		local v31 = table.create(#v22);
		local v32, v33, v34 = ipairs(v22);
		while true do
			v32(v33, v34);
			if not v32 then
				break;
			end;
			v34 = v32;
			v31[v32] = v33.cframe;		
		end;
		local u15 = u12.new(v31, 0.5, 0);
		local v35, v36 = pcall(function()
			u15:SolvePosition(0.5);
		end);
		if (v35 and {
			success = true, 
			value = v36
		} or {
			success = false, 
			error = v36
		}).success == true then
			local u16 = nil;
			local u17 = {};
			local u18 = #v22;
			local l__Animator__19 = v23.Humanoid.Animator;
			l__default__13(v29, l__InOutCubic__14, function(p5)
				local v37 = math.clamp(p5, 0, 1);
				local v38 = u15:SolvePosition(v37);
				v23:SetPrimaryPartCFrame(CFrame.lookAt(v38, v38 + u15:SolveVelocity(v37) * Vector3.new(1, 0, 1)));
				if u16 then
					local v39 = u17[u16];
					if v39 ~= nil then
						v39:AdjustSpeed(v37 * 2);
					end;
				end;
				local v40 = v22[u18 - 1 + 1];
				if v40 == nil then
					return nil;
				end;
				if (v38 - v40.cframe.Position).Magnitude < 3 then
					u18 = u18 - 1;
					if u16 == v40.animation then
						return nil;
					end;
					if u16 then
						local v41 = u17[u16];
						if v41 ~= nil then
							v41:Stop();
						end;
					end;
					if u17[v40.animation] ~= nil then
						local v42 = u17[v40.animation];
					else
						v42 = l__Animator__19:LoadAnimation(v40.animation);
						u17[v40.animation] = v42;
					end;
					if v42 ~= nil then
						v42:Play();
					end;
					u16 = v40.animation;
				end;
			end, 1, 0):Wait();
		end;
		v23:Destroy();
		l__character__19.Archivable = false;
		l__character__19:SetAttribute("Transparency", 0);
		if p4.player == l__Players__3.LocalPlayer then
			l__Workspace__11.CurrentCamera.CameraSubject = l__character__19.Humanoid;
		end;
		p2:clearAbility(l__character__19);
	end));
end;
function v4.clearAbility(p6, p7)
	local v43 = p6.stopwatchAbilities[p7];
	if v43 == nil then
		error("cannot clear ability that doesn't exist");
	end;
	v43.marker:Destroy();
	v43.activeMaid:DoCleaning();
	p6.stopwatchAbilities[p7] = nil;
end;
local u20 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function v4.cleanCheckpoints(p8, p9)
	local v44 = u20.copy(p9);
	for v45, v46 in pairs(p9) do
		local v47 = p9[v45 + 1];
		if v47 ~= nil and (v46.cframe.Position - v47.cframe.Position).Magnitude < 0.25 then
			table.remove(v44, v45 + 1);
		end;
	end;
	return v44;
end;
function v4.getCurrentAnimationOfCharacter(p10, p11)
	local v48 = p11.Humanoid.Animator:GetPlayingAnimationTracks();
	table.sort(v48, function(p12, p13)
		return p13.WeightCurrent < p12.WeightCurrent;
	end);
	return v48[1].Animation;
end;
local l__ReplicatedStorage__21 = v2.ReplicatedStorage;
function v4.createOriginMarker(p14, p15)
	local v49 = l__ReplicatedStorage__21.Assets.Effects.StopwatchEffects.StopwatchMarker:Clone();
	v49.Position = (p15 * CFrame.new(0, -2, 0)).Position;
	v49.Parent = l__Workspace__11;
	return v49;
end;
local u22 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v4.attachActiveEffects(p16, p17)
	local v50 = u22("Attachment", {
		Position = Vector3.new(0, -1.65, 0), 
		Parent = p17.HumanoidRootPart
	});
	local v51 = u22("Attachment", {
		Position = Vector3.new(0, 1.1, 0), 
		Parent = p17.HumanoidRootPart
	});
	local v52 = l__ReplicatedStorage__21.Assets.Effects.StopwatchEffects.Trail:Clone();
	v52.Lifetime = l__StopwatchConstants__9.DURATION;
	v52.Parent = p17.HumanoidRootPart;
	v52.Attachment0 = v50;
	v52.Attachment1 = v51;
	local v53 = l__ReplicatedStorage__21.Assets.Effects.StopwatchEffects.TrailParticles:Clone();
	v53.Parent = p17.HumanoidRootPart;
	local v54 = u6.new();
	v54:GiveTask(v50);
	v54:GiveTask(v51);
	v54:GiveTask(v52);
	v54:GiveTask(v53);
	return v54;
end;
local v55 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
