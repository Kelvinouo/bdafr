-- Script Hash: c379f9df7f21c36de20ffd3c499bdf5255772f2359dc07dff5346394d177f7686468fd46086259c8fa7eeea27f77a9a4
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "footstep-sounds");
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "FootstepsController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__4 = v2.Workspace;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "FootstepsController";
	p1.footstepSoundFolder = u3("Folder", {
		Name = "FootstepSounds", 
		Parent = l__Workspace__4
	});
	p1.particleAttachment = u3("Attachment", {
		Parent = l__Workspace__4.Terrain
	});
end;
local l__Players__5 = v2.Players;
local l__ReplicatedStorage__6 = v2.ReplicatedStorage;
function u1.KnitStart(p2)
	l__Players__5.PlayerAdded:Connect(function(p3)
		p2:hookPlayer(p3);
	end);
	local v7 = l__Players__5:GetPlayers();
	local function v8(p4)
		return p2:hookPlayer(p4);
	end;
	for v9, v10 in ipairs(v7) do
		v8(v10, v9 - 1, v7);
	end;
	p2.particles = l__ReplicatedStorage__6.Assets.Effects.FootstepParticles:Clone();
	p2.particles.Parent = p2.particleAttachment;
	p2.particles.Enabled = false;
end;
function u1.hookPlayer(p5, p6)
	local l__Character__7 = p6.Character;
	v1.Promise.defer(function()
		if l__Character__7 then
			p5:hookCharacter(p6, l__Character__7);
		end;
	end);
	p6.CharacterAdded:Connect(function(p7)
		p5:hookCharacter(p6, p7);
	end);
end;
local l__PhysicsService__8 = v2.PhysicsService;
local l__BLOCK_SIZE__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__RandomUtil__10 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).RandomUtil;
local l__getItemMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__DefaultFootstepSound__12 = v3.DefaultFootstepSound;
local l__FootstepSounds__13 = v3.FootstepSounds;
local l__TerrainFootstepSounds__14 = v3.TerrainFootstepSounds;
local l__BlockFootstepSound__15 = v3.BlockFootstepSound;
function u1.hookCharacter(p8, p9, p10, p11)
	local v11 = l__PhysicsService__8:GetCollisionGroupId("Players");
	local l__Humanoid__12 = p10:WaitForChild("Humanoid");
	local l__HumanoidRootPart__13 = p10:WaitForChild("HumanoidRootPart");
	if p9 then
		local v14 = p9 == l__Players__5.LocalPlayer;
	else
		v14 = false;
	end;
	p8:muteHumanoidSound(l__HumanoidRootPart__13, "Running");
	p8:muteHumanoidSound(l__HumanoidRootPart__13, "Landing");
	p8:muteHumanoidSound(l__HumanoidRootPart__13, "Jumping");
	p8:muteHumanoidSound(l__HumanoidRootPart__13, "Landing");
	local v15 = p10:GetAttribute("NoFootstepSounds");
	if v15 == nil then
		v15 = false;
	end;
	local u16 = v15;
	p10:GetAttributeChangedSignal("NoFootstepSounds"):Connect(function()
		local v16 = p10:GetAttribute("NoFootstepSounds");
		if v16 == nil then
			v16 = false;
		end;
		u16 = v16;
	end);
	local v17 = os.clock();
	while v1.Promise.delay(0.1):await() and p10.Parent ~= nil do
		if l__Workspace__4.CurrentCamera then
			local v18 = l__Workspace__4.CurrentCamera;
			if v18 ~= nil then
				v18 = (v18.CFrame.Position - l__HumanoidRootPart__13.Position).Magnitude;
			end;
			if not (l__BLOCK_SIZE__9 * 50 < v18) and not u16 then
				local v19 = Vector3.new(l__HumanoidRootPart__13.AssemblyLinearVelocity.X, 0, l__HumanoidRootPart__13.AssemblyLinearVelocity.Z);
				local v20 = "standing";
				local v21 = l__Humanoid__12:GetState();
				if v21 == Enum.HumanoidStateType.Running or v21 == Enum.HumanoidStateType.RunningNoPhysics then
					if v19.Magnitude > 17 then
						v20 = "running";
					elseif v19.Magnitude > 1 then
						v20 = "walking";
					end;
				end;
				if v20 ~= "standing" then
					local v22 = 0.3;
					if v20 == "running" then
						v22 = 0.2;
					end;
					if not (os.clock() - v17 < v22) then
						local v23 = p8:findPlatform(l__HumanoidRootPart__13);
						local v24 = nil;
						local v25 = 0.13;
						if p11 then
							if v20 == "walking" then
								v24 = l__RandomUtil__10.fromList(unpack(p11.walk));
							elseif v20 == "running" then
								v24 = l__RandomUtil__10.fromList(unpack(p11.run));
							end;
						elseif v23.block then
							local v26 = l__getItemMeta__11(v23.block.Name).footstepSound;
							if v26 == nil then
								v26 = l__DefaultFootstepSound__12;
							end;
							local v27 = l__FootstepSounds__13[v26];
							if v27.volume ~= nil then
								v25 = v27.volume;
							end;
							if v20 == "walking" then
								v24 = l__RandomUtil__10.fromList(unpack(v27.walk));
							elseif v20 == "running" then
								v24 = l__RandomUtil__10.fromList(unpack(v27.run));
							end;
						elseif v23.terrainMaterial then
							local v28 = l__TerrainFootstepSounds__14[v23.terrainMaterial];
							if v28 == nil then
								v28 = l__BlockFootstepSound__15.WOOD;
							end;
							local v29 = l__FootstepSounds__13[v28];
							if v29.volume ~= nil then
								v25 = v29.volume;
							end;
							if v20 == "walking" then
								v24 = l__RandomUtil__10.fromList(unpack(v29.walk));
							elseif v20 == "running" then
								v24 = l__RandomUtil__10.fromList(unpack(v29.run));
							end;
						end;
						local v30 = v24;
						if v30 ~= "" and v30 then
							v30 = v23.raycastResult;
						end;
						if v30 ~= "" and v30 then
							v17 = os.clock();
							local v31 = 0.85 + math.random() * 0.2;
							if p8.particles and p10:GetAttribute("Transparency") ~= nil then
								p8.particleAttachment.CFrame = CFrame.new(v23.raycastResult.Position + Vector3.new(0, 0.1, 0));
								p8.particles:Emit(1);
							end;
							if v14 then
								local v32 = u3("Sound", {
									SoundId = v24, 
									Looped = false, 
									PlaybackSpeed = v31, 
									Volume = v25, 
									Parent = p8.footstepSoundFolder
								});
								v32:Play();
								v1.Promise.delay(1):andThen(function()
									v32:Destroy();
								end);
							else
								local v33 = u3("Part", {
									Size = Vector3.new(1, 1, 1), 
									CFrame = CFrame.new(v23.raycastResult.Position), 
									Anchored = true, 
									CanCollide = false, 
									CollisionGroupId = v11, 
									Transparency = 1, 
									Parent = p8.footstepSoundFolder
								});
								u3("Sound", {
									SoundId = v24, 
									Looped = false, 
									PlaybackSpeed = v31, 
									Volume = v25 * 0.75, 
									RollOffMaxDistance = 50, 
									Parent = v33
								}):Play();
								v1.Promise.delay(1):andThen(function()
									v33:Destroy();
								end);
							end;
						end;
					end;
				end;
			end;
		end;	
	end;
end;
local l__BlockEngine__17 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
function u1.findPlatform(p12, p13, p14)
	if p14 == nil then
		p14 = {};
	end;
	local v34 = RaycastParams.new();
	v34.CollisionGroup = "Players";
	v34.FilterDescendantsInstances = p14;
	v34.FilterType = Enum.RaycastFilterType.Blacklist;
	local v35 = l__Workspace__4:Raycast(p13.Position, Vector3.new(0, -9, 0), v34);
	if v35 then
		if v35.Instance:IsA("Terrain") then
			return {
				raycastResult = v35, 
				block = nil, 
				terrainMaterial = v35.Material
			};
		end;
		if not v35.Instance:IsA("BasePart") then
			return {
				raycastResult = v35, 
				block = nil, 
				terrainMaterial = nil
			};
		end;
	else
		return {
			raycastResult = v35, 
			block = nil, 
			terrainMaterial = nil
		};
	end;
	if not v35.Instance.CanCollide then
		table.insert(p14, v35.Instance);
		return p12:findPlatform(p13, p14);
	end;
	local v36 = l__BlockEngine__17:getBlockInstanceFromChild(v35.Instance);
	if v36 then
		return {
			raycastResult = v35, 
			block = v36, 
			terrainMaterial = nil
		};
	end;
	return {
		raycastResult = v35, 
		block = nil, 
		terrainMaterial = v35.Instance.Material
	};
end;
function u1.muteHumanoidSound(p15, p16, p17)
	local v37 = p16:FindFirstChild(p17);
	if v37 then
		v37.Volume = 0;
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	FootstepsController = u2
};
return u1;
