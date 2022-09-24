-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__6 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v7 = setmetatable({}, {
	__tostring = function()
		return "ButterflyKillEffect";
	end, 
	__index = l__KillEffect__6
});
v7.__index = v7;
function v7.new(...)
	local v8 = setmetatable({}, v7);
	return v8:constructor(...) and v8;
end;
function v7.constructor(p1, p2)
	l__KillEffect__6.constructor(p1, p2);
	l__KillEffect__6.setPlayDefaultKillEffect(p1, false);
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Workspace__2 = v5.Workspace;
local l__ReplicatedStorage__3 = v5.ReplicatedStorage;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u7 = Random.new();
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__SingleMotor__9 = v4.SingleMotor;
local l__RunService__10 = v5.RunService;
local l__RandomUtil__11 = v2.RandomUtil;
local l__default__12 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__13 = v3.Linear;
local l__Spring__14 = v4.Spring;
local l__OutQuad__15 = v3.OutQuad;
function v7.onKill(p3, p4, p5, p6)
	local v9 = u1.new();
	p5.Archivable = true;
	local v10 = p5:Clone();
	v10.HumanoidRootPart.Anchored = true;
	v10:SetPrimaryPartCFrame(p6);
	v10.Parent = l__Workspace__2;
	l__KillEffect__6.hideCharacter(p3, p5);
	v9:GiveTask(v10);
	local v11 = l__ReplicatedStorage__3.Assets.Effects.ButterflyConsumeEffect.ParticleAttachment:Clone();
	v11.Parent = l__Workspace__2.Terrain;
	v9:GiveTask(v11);
	local v12 = {};
	local v13, v14, v15 = ipairs(v11:GetDescendants());
	while true do
		v13(v14, v15);
		if not v13 then
			break;
		end;
		v15 = v13;
		if v14:IsA("ParticleEmitter") then
			v12[v14] = u4.copy(v14.Size.Keypoints);
		end;	
	end;
	l__SoundManager__5:playSound(l__GameSound__6.SPIRIT_EFFECT, {
		position = p6.Position, 
		rollOffMaxDistance = 100
	});
	local v16 = {};
	local v17 = 0;
	local v18 = false;
	while true do
		if v18 then
			v17 = v17 + 1;
		else
			v18 = true;
		end;
		if not (v17 < 10) then
			break;
		end;
		local v19 = p6 * CFrame.new(math.sin(u7:NextNumber(0, 1) * 100) * 5, 0, math.cos(u7:NextNumber(0, 1) * 100) * 5);
		local v20 = l__ReplicatedStorage__3.Assets.Effects.KillEffectButterfly:Clone();
		v20:SetPrimaryPartCFrame(CFrame.lookAt(v19.Position, p6.Position));
		v20.Parent = l__Workspace__2;
		local v21 = u8("Attachment", {
			Parent = v20.PrimaryPart
		});
		local v22 = u8("Attachment", {
			Parent = l__Workspace__2.Terrain
		});
		local v23 = u8("LinearVelocity", {
			Parent = v20.PrimaryPart, 
			MaxForce = v20.PrimaryPart.AssemblyMass * 10, 
			Attachment0 = v21
		});
		local v24 = u8("AlignOrientation", {
			Parent = v20.PrimaryPart, 
			Attachment0 = v21, 
			Attachment1 = v22, 
			MaxTorque = 50000000, 
			Responsiveness = 3
		});
		local v25 = l__ReplicatedStorage__3.Assets.Effects.ButterflyBeam:Clone();
		v25.Parent = v21;
		v25.Attachment0 = v21;
		v20.PrimaryPart.Anchored = false;
		local v26 = l__SingleMotor__9.new(1);
		v26:onStep(function(p7)
			if v20.PrimaryPart then
				v20.PrimaryPart.Size = Vector3.new(p7, p7, p7);
			end;
		end);
		table.insert(v16, {
			instance = v20, 
			origin = v19, 
			seed = u7:NextNumber(-50000, 50000), 
			linearVelocity = v23, 
			partCount = 1, 
			goalAttachment = v22, 
			elapsedTime = v17 * (math.pi * 2 / 10) * 2, 
			motor = v26, 
			beam = v25, 
			consuming = false
		});	
	end;
	v9:GiveTask(l__RunService__10.Heartbeat:Connect(function(p8)
		local v27, v28, v29 = ipairs(v16);
		while true do
			v27(v28, v29);
			if not v27 then
				break;
			end;
			v29 = v27;
			v28.elapsedTime = v28.elapsedTime + p8;
			local v30 = v28.instance:GetPivot();
			if (p6.Position - Vector3.new(0, 1, 0) - v30.Position).Y > 0 then
				local v31 = Vector3.new(0, -0.6, 0);
			else
				v31 = Vector3.new();
			end;
			local v32 = Vector3.new(math.noise(v28.elapsedTime / 3, v28.seed, 0) * 0.5, math.noise(v28.elapsedTime / 3, 1, -v28.seed) * 0.5, math.noise(v28.elapsedTime / 3, 0, v28.seed * 2) * 0.5) + v31 + (p6.Position + Vector3.new(math.sin(v28.elapsedTime * 0.5) * 6, math.sin(v28.elapsedTime + v28.seed) * 3, math.cos(v28.elapsedTime * 0.5) * 6) - v30.Position).Unit * -0.3;
			v28.goalAttachment.WorldCFrame = CFrame.lookAt(v30.Position, v30.Position + v32);
			v28.linearVelocity.VectorVelocity = ((v30 * CFrame.new(0, 0, 3)).Position + v32 - v30.Position).Unit * 4;		
		end;
	end));
	task.delay(1, function()
		local v33 = {};
		local v34 = 0;
		local v35, v36, v37 = ipairs((v10:GetDescendants()));
		while true do
			v35(v36, v37);
			if not v35 then
				break;
			end;
			v37 = v35;
			if v36:IsA("BasePart") == true then
				v34 = v34 + 1;
				v33[v34] = v36;
			end;		
		end;
		local v38, v39, v40 = ipairs(v33);
		while true do
			v38(v39, v40);
			if not v38 then
				break;
			end;
			v40 = v38;
			v39:BreakJoints();
			v39.Anchored = true;		
		end;
		local u16 = -1;
		local u17 = 4 / #v33;
		v9:GiveTask(l__RunService__10.Heartbeat:Connect(function()
			if u17 <= os.clock() - u16 then
				u16 = os.clock();
				local v41 = #v33;
				local v42 = v33[v41];
				v33[v41] = nil;
				if v42 ~= nil then
					l__SoundManager__5:playSound(l__RandomUtil__11.fromList(l__GameSound__6.SPIRITORB_PULL_1, l__GameSound__6.SPIRITORB_PULL_2, l__GameSound__6.SPIRITORB_PULL_3), {
						position = v42.Position
					});
					local v43 = v16[u7:NextInteger(0, #v16 - 1) + 1];
					local v44 = v42:FindFirstChildOfClass("Attachment");
					if v44 == nil then
						v44 = u8("Attachment", {
							Parent = v42
						});
					end;
					v43.beam.Attachment1 = v44;
					task.spawn(function()
						l__default__12(0.3, l__Linear__13, function(p9)
							v42.CFrame = p9;
						end, v42.CFrame, v43.instance:GetPivot());
						task.wait(0.2);
						if v43.instance.PrimaryPart then
							v43.motor:setGoal(l__Spring__14.new(1 + v43.partCount * 0.3, {
								dampingRatio = 0.8, 
								frequency = 6
							}));
							l__SoundManager__5:playSound(l__RandomUtil__11.fromList(l__GameSound__6.SPIRITORB_ABSORB_1, l__GameSound__6.SPIRITORB_ABSORB_2, l__GameSound__6.SPIRITORB_ABSORB_2), {
								position = v42.Position
							});
							v11.WorldCFrame = v43.instance:GetPivot();
							local v45, v46, v47 = ipairs(v11:GetChildren());
							while true do
								v45(v46, v47);
								if not v45 then
									break;
								end;
								v47 = v45;
								if v46:IsA("ParticleEmitter") then
									local v48 = v46:GetAttribute("EmitCount");
									local v49 = v12[v46];
									if v49 ~= nil then
										local v50 = {};
										for v51, v52 in pairs(v49) do
											table.insert(v50, (NumberSequenceKeypoint.new(v52.Time, v49[v51 - 1 + 1].Value * 0.6, v49[v51 - 1 + 1].Envelope)));
										end;
										v46.Size = NumberSequence.new(v50);
										v46:Emit(v48);
									end;
								end;							
							end;
							v43.partCount = v43.partCount + 1;
						end;
						l__default__12(0.1, l__OutQuad__15, function(p10)
							v42.Size = p10;
						end, v42.Size, Vector3.new(0, 0, 0)):Wait();
						v42:Destroy();
					end);
					return;
				end;
			else
				return;
			end;
			return nil;
		end));
	end);
	v9:GiveTask(function()
		local v53, v54, v55 = ipairs(v16);
		while true do
			v53(v54, v55);
			if not v53 then
				break;
			end;
			v55 = v53;
			v54.instance:Destroy();
			v54.goalAttachment:Destroy();
			v54.motor:destroy();		
		end;
	end);
	task.delay(7, function()
		local v56, v57, v58 = ipairs(v16);
		while true do
			v56(v57, v58);
			if not v56 then
				break;
			end;
			local v59 = v57.instance.PrimaryPart;
			if v59 ~= nil then
				v59 = v59.Size;
			end;
			local v60 = v59;
			if v60 == nil then
				v60 = Vector3.new(1, 1, 1);
			end;
			l__default__12(0.5, l__OutQuad__15, function(p11)
				if v57.instance.PrimaryPart then
					v57.instance.PrimaryPart.Size = p11;
				end;
			end, v60, Vector3.new());		
		end;
		task.wait(0.5);
		v9:DoCleaning();
	end);
	return v9;
end;
return v7;
