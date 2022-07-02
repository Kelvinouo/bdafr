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
	for v7, v8 in ipairs((l__Players__5:GetPlayers())) do
		local v9 = p2:hookPlayer(v8);
	end;
	p2.particles = l__ReplicatedStorage__6.Assets.Effects.FootstepParticles:Clone();
	p2.particles.Parent = p2.particleAttachment;
	p2.particles.Enabled = false;
end;
function u1.hookPlayer(p4, p5)
	local l__Character__7 = p5.Character;
	v1.Promise.defer(function()
		if l__Character__7 then
			p4:hookCharacter(p5, l__Character__7);
		end;
	end);
	p5.CharacterAdded:Connect(function(p6)
		p4:hookCharacter(p5, p6);
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
function u1.hookCharacter(p7, p8, p9, p10)
	local v10 = l__PhysicsService__8:GetCollisionGroupId("Players");
	local l__Humanoid__11 = p9:WaitForChild("Humanoid");
	local l__HumanoidRootPart__12 = p9:WaitForChild("HumanoidRootPart");
	if p8 then
		local v13 = p8 == l__Players__5.LocalPlayer;
	else
		v13 = false;
	end;
	p7:muteHumanoidSound(l__HumanoidRootPart__12, "Running");
	p7:muteHumanoidSound(l__HumanoidRootPart__12, "Landing");
	p7:muteHumanoidSound(l__HumanoidRootPart__12, "Jumping");
	p7:muteHumanoidSound(l__HumanoidRootPart__12, "Landing");
	local v14 = p9:GetAttribute("NoFootstepSounds");
	if v14 == nil then
		v14 = false;
	end;
	local u16 = v14;
	p9:GetAttributeChangedSignal("NoFootstepSounds"):Connect(function()
		local v15 = p9:GetAttribute("NoFootstepSounds");
		if v15 == nil then
			v15 = false;
		end;
		u16 = v15;
	end);
	local v16 = os.clock();
	while v1.Promise.delay(0.1):await() and p9.Parent ~= nil do
		if l__Workspace__4.CurrentCamera then
			local v17 = l__Workspace__4.CurrentCamera;
			if v17 ~= nil then
				v17 = (v17.CFrame.Position - l__HumanoidRootPart__12.Position).Magnitude;
			end;
			if not (l__BLOCK_SIZE__9 * 50 < v17) and not u16 then
				local v18 = Vector3.new(l__HumanoidRootPart__12.AssemblyLinearVelocity.X, 0, l__HumanoidRootPart__12.AssemblyLinearVelocity.Z);
				local v19 = "standing";
				local v20 = l__Humanoid__11:GetState();
				if v20 == Enum.HumanoidStateType.Running or v20 == Enum.HumanoidStateType.RunningNoPhysics then
					if v18.Magnitude > 17 then
						v19 = "running";
					elseif v18.Magnitude > 1 then
						v19 = "walking";
					end;
				end;
				if v19 ~= "standing" then
					local v21 = 0.3;
					if v19 == "running" then
						v21 = 0.2;
					end;
					if not (os.clock() - v16 < v21) then
						local v22 = p7:findPlatform(l__HumanoidRootPart__12);
						local v23 = nil;
						local v24 = 0.13;
						if p10 then
							if v19 == "walking" then
								v23 = l__RandomUtil__10.fromList(unpack(p10.walk));
							elseif v19 == "running" then
								v23 = l__RandomUtil__10.fromList(unpack(p10.run));
							end;
						elseif v22.block then
							local v25 = l__getItemMeta__11(v22.block.Name).footstepSound;
							if v25 == nil then
								v25 = l__DefaultFootstepSound__12;
							end;
							local v26 = l__FootstepSounds__13[v25];
							if v26.volume ~= nil then
								v24 = v26.volume;
							end;
							if v19 == "walking" then
								v23 = l__RandomUtil__10.fromList(unpack(v26.walk));
							elseif v19 == "running" then
								v23 = l__RandomUtil__10.fromList(unpack(v26.run));
							end;
						elseif v22.terrainMaterial then
							local v27 = l__TerrainFootstepSounds__14[v22.terrainMaterial];
							if v27 == nil then
								v27 = l__BlockFootstepSound__15.WOOD;
							end;
							local v28 = l__FootstepSounds__13[v27];
							if v28.volume ~= nil then
								v24 = v28.volume;
							end;
							if v19 == "walking" then
								v23 = l__RandomUtil__10.fromList(unpack(v28.walk));
							elseif v19 == "running" then
								v23 = l__RandomUtil__10.fromList(unpack(v28.run));
							end;
						end;
						local v29 = v23;
						if v29 ~= "" and v29 then
							v29 = v22.raycastResult;
						end;
						if v29 ~= "" and v29 then
							v16 = os.clock();
							local v30 = 0.85 + math.random() * 0.2;
							if p7.particles and p9:GetAttribute("Transparency") ~= nil then
								p7.particleAttachment.CFrame = CFrame.new(v22.raycastResult.Position + Vector3.new(0, 0.1, 0));
								p7.particles:Emit(1);
							end;
							if v13 then
								local v31 = u3("Sound", {
									SoundId = v23, 
									Looped = false, 
									PlaybackSpeed = v30, 
									Volume = v24, 
									Parent = p7.footstepSoundFolder
								});
								v31:Play();
								v1.Promise.delay(1):andThen(function()
									v31:Destroy();
								end);
							else
								local v32 = u3("Part", {
									Size = Vector3.new(1, 1, 1), 
									CFrame = CFrame.new(v22.raycastResult.Position), 
									Anchored = true, 
									CanCollide = false, 
									CollisionGroupId = v10, 
									Transparency = 1, 
									Parent = p7.footstepSoundFolder
								});
								u3("Sound", {
									SoundId = v23, 
									Looped = false, 
									PlaybackSpeed = v30, 
									Volume = v24 * 0.75, 
									RollOffMaxDistance = 50, 
									Parent = v32
								}):Play();
								v1.Promise.delay(1):andThen(function()
									v32:Destroy();
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
function u1.findPlatform(p11, p12, p13)
	if p13 == nil then
		p13 = {};
	end;
	local v33 = RaycastParams.new();
	v33.CollisionGroup = "Players";
	v33.FilterDescendantsInstances = p13;
	v33.FilterType = Enum.RaycastFilterType.Blacklist;
	local v34 = l__Workspace__4:Raycast(p12.Position, Vector3.new(0, -9, 0), v33);
	if v34 then
		if v34.Instance:IsA("Terrain") then
			return {
				raycastResult = v34, 
				block = nil, 
				terrainMaterial = v34.Material
			};
		end;
		if not v34.Instance:IsA("BasePart") then
			return {
				raycastResult = v34, 
				block = nil, 
				terrainMaterial = nil
			};
		end;
	else
		return {
			raycastResult = v34, 
			block = nil, 
			terrainMaterial = nil
		};
	end;
	if not v34.Instance.CanCollide then
		table.insert(p13, v34.Instance);
		return p11:findPlatform(p12, p13);
	end;
	local v35 = l__BlockEngine__17:getBlockInstanceFromChild(v34.Instance);
	if v35 then
		return {
			raycastResult = v34, 
			block = v35, 
			terrainMaterial = nil
		};
	end;
	return {
		raycastResult = v34, 
		block = nil, 
		terrainMaterial = v34.Instance.Material
	};
end;
function u1.muteHumanoidSound(p14, p15, p16)
	local v36 = p15:FindFirstChild(p16);
	if v36 then
		v36.Volume = 0;
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	FootstepsController = u2
};
return u1;
