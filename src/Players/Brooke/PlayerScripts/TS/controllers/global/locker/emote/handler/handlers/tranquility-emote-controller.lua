-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "TranquilityEmoteController";
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
	p1.Name = "TranquilityEmoteController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__EmoteType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__EmoteHandler__3 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__5 = v2.ReplicatedStorage;
local l__Workspace__6 = v2.Workspace;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__SoundManager__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__SingleMotor__11 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src).SingleMotor;
local l__RunService__12 = v2.RunService;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	local l__EmoteHandlerController__6 = l__KnitClient__1.Controllers.EmoteHandlerController;
	local v7 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__3
	});
	v7.__index = v7;
	function v7.new(...)
		local v8 = setmetatable({}, v7);
		return v8:constructor(...) and v8;
	end;
	local u13 = l__EmoteHandler__3;
	function v7.constructor(p3, ...)
		u13.constructor(p3, ...);
		p3.maid = u4.new();
	end;
	function v7.onEnable(p4, p5, p6, p7)
		local v9 = l__ReplicatedStorage__5.Assets.Effects.ButterflyConsumeEffect.ParticleAttachment:Clone();
		v9.Parent = l__Workspace__6.Terrain;
		p4.maid:GiveTask(v9);
		local v10 = {};
		local v11, v12, v13 = ipairs(v9:GetDescendants());
		while true do
			v11(v12, v13);
			if not v11 then
				break;
			end;
			v13 = v11;
			if v12:IsA("ParticleEmitter") then
				v10[v12] = u7.copy(v12.Size.Keypoints);
			end;		
		end;
		l__SoundManager__8:playSound(l__GameSound__9.SPIRIT_EFFECT, {
			position = p6:GetPivot().Position, 
			rollOffMaxDistance = 100
		});
		local v14 = {};
		local v15 = Random.new();
		local v16 = 0;
		local v17 = false;
		while true do
			if v17 then
				v16 = v16 + 1;
			else
				v17 = true;
			end;
			if not (v16 < 10) then
				break;
			end;
			local v18 = p6:GetPivot() * CFrame.new(math.sin(v15:NextNumber(0, 1) * 100) * 5, 0, math.cos(v15:NextNumber(0, 1) * 100) * 5);
			local v19 = l__ReplicatedStorage__5.Assets.Effects.KillEffectButterfly:Clone();
			v19:SetPrimaryPartCFrame(CFrame.lookAt(v18.Position, p6:GetPivot().Position));
			v19.Parent = l__Workspace__6;
			local v20 = u10("Attachment", {
				Parent = v19.PrimaryPart
			});
			local v21 = u10("Attachment", {
				Parent = l__Workspace__6.Terrain
			});
			local v22 = u10("LinearVelocity", {
				Parent = v19.PrimaryPart, 
				MaxForce = v19.PrimaryPart.AssemblyMass * 10, 
				Attachment0 = v20
			});
			local v23 = u10("AlignOrientation", {
				Parent = v19.PrimaryPart, 
				Attachment0 = v20, 
				Attachment1 = v21, 
				MaxTorque = 50000000, 
				Responsiveness = 3
			});
			local v24 = l__ReplicatedStorage__5.Assets.Effects.ButterflyBeam:Clone();
			v24.Parent = v20;
			v24.Attachment0 = v20;
			v19.PrimaryPart.Anchored = false;
			local v25 = l__SingleMotor__11.new(1);
			v25:onStep(function(p8)
				if v19.PrimaryPart then
					v19.PrimaryPart.Size = Vector3.new(p8, p8, p8);
				end;
			end);
			table.insert(v14, {
				instance = v19, 
				origin = v18, 
				seed = v15:NextNumber(-50000, 50000), 
				linearVelocity = v22, 
				partCount = 1, 
				goalAttachment = v21, 
				elapsedTime = v16 * (math.pi * 2 / 10) * 2, 
				motor = v25, 
				beam = v24, 
				consuming = false
			});		
		end;
		p4.maid:GiveTask(l__RunService__12.Heartbeat:Connect(function(p9)
			local v26, v27, v28 = ipairs(v14);
			while true do
				v26(v27, v28);
				if not v26 then
					break;
				end;
				v28 = v26;
				v27.elapsedTime = v27.elapsedTime + p9;
				local v29 = v27.instance:GetPivot();
				if (p6:GetPivot().Position - Vector3.new(0, 1, 0) - v29.Position).Y > 0 then
					local v30 = Vector3.new(0, -0.6, 0);
				else
					v30 = Vector3.new();
				end;
				local v31 = Vector3.new(math.noise(v27.elapsedTime / 3, v27.seed, 0) * 0.5, math.noise(v27.elapsedTime / 3, 1, -v27.seed) * 0.5, math.noise(v27.elapsedTime / 3, 0, v27.seed * 2) * 0.5) + v30 + (p6:GetPivot().Position + Vector3.new(math.sin(v27.elapsedTime * 0.5) * 6, math.sin(v27.elapsedTime + v27.seed) * 3, math.cos(v27.elapsedTime * 0.5) * 6) - v29.Position).Unit * -0.3;
				v27.goalAttachment.WorldCFrame = CFrame.lookAt(v29.Position, v29.Position + v31);
				v27.linearVelocity.VectorVelocity = ((v29 * CFrame.new(0, 0, 3)).Position + v31 - v29.Position).Unit * 4;			
			end;
		end));
		p4.maid:GiveTask(function()
			local v32, v33, v34 = ipairs(v14);
			while true do
				v32(v33, v34);
				if not v32 then
					break;
				end;
				v34 = v32;
				v33.instance:Destroy();
				v33.goalAttachment:Destroy();
				v33.motor:destroy();			
			end;
		end);
	end;
	function v7.onDisable(p10, p11, p12, p13)
		p10.maid:DoCleaning();
	end;
	u13 = l__EmoteHandlerController__6.registerHandler;
	u13(l__EmoteHandlerController__6, l__EmoteType__2.ZEN_HOVER, v7);
end;
local v35 = l__KnitClient__1.CreateController(v4.new());
return nil;
