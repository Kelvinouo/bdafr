-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "GrimReaperController";
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
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "GrimReaperController";
	p1.soulsByPosition = {};
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p2)
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		p2:spawnSoul(p3.position, p3.secret, p3.soulOfPlayer);
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p4)
		p2:startChannel(p4.entity, p4.position);
	end);
end;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__7 = v3.Players;
local l__Workspace__8 = v3.Workspace;
function u1.spawnSoul(p5, p6, p7, p8)
	local v7 = l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("GrimReaperSoul"):Clone();
	v7:SetAttribute("GrimReaperSoulSecret", p7);
	local v8 = u5("ProximityPrompt", {
		ActionText = "Player's Soul", 
		ObjectText = "CONSUME", 
		HoldDuration = 0, 
		KeyboardKeyCode = l__Theme__6.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		MaxActivationDistance = 120, 
		Parent = v7
	});
	v8.Triggered:Connect(function(p9)
		if p9 == l__Players__7.LocalPlayer then
			local v9 = p9.Character;
			if v9 ~= nil then
				v9 = v9:GetAttribute("GrimReaperChannel");
			end;
			if v9 ~= true then
				v8:Destroy();
				p5:consumeSoul(v7);
			end;
		end;
	end);
	v7:SetPrimaryPartCFrame(CFrame.new(p6));
	p5.soulsByPosition[tostring(p6)] = v7;
	v7.Parent = l__Workspace__8;
	v1.Promise.delay(10):andThen(function()
		if v7.Parent then
			v7:Destroy();
		end;
	end);
end;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.consumeSoul(p10, p11)
	local v10 = p11:GetAttribute("GrimReaperSoulSecret");
	l__GameAnimationUtil__9.playAnimation(l__Players__7.LocalPlayer, l__AnimationType__10.GRIM_REAPER_CONSUME);
	l__default__3.Client:Get("RemoteName"):CallServer({
		secret = v10
	});
end;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SoundManager__12 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__14 = v3.TweenService;
local l__ClientSyncEvents__15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function u1.startChannel(p12, p13, p14)
	local v11 = p13:FindFirstChild("3DClothing");
	if v11 ~= nil then
		local v12 = nil;
		for v13, v14 in ipairs((v11:GetDescendants())) do
			if v14.Name == "GrimReaperChannelAttachment" == true then
				v12 = v14;
				break;
			end;
		end;
		v11 = v12;
	end;
	local v15 = v11;
	if v15 == nil then
		local v16 = p13:FindFirstChild("UpperTorso");
		if v16 ~= nil then
			v16 = v16:FindFirstChild("BodyFrontAttachment");
		end;
		v15 = v16;
	end;
	if v15 then
		local v17 = u11.new();
		local v18 = p13 == l__Players__7.LocalPlayer.Character;
		local v19 = {};
		if v18 then
			local v20 = nil;
		else
			v20 = p13:GetPrimaryPartCFrame().Position;
		end;
		v19.position = v20;
		l__SoundManager__12:playSound(l__GameSound__13.GRIM_REAPER_CONSUME, v19);
		local v21 = {};
		if v18 then
			local v22 = nil;
		else
			v22 = p13:GetPrimaryPartCFrame().Position;
		end;
		v21.position = v22;
		if v18 then
			local v23 = nil;
		else
			v23 = p13.PrimaryPart;
		end;
		v21.parent = v23;
		local v24 = l__SoundManager__12:playSound(l__GameSound__13.GRIM_REAPER_CHANNEL, v21);
		if v24 then
			v24.Looped = true;
			v17:GiveTask(function()
				local v25 = l__TweenService__14:Create(v24, TweenInfo.new(0.1), {
					Volume = 0
				});
				v25:Play();
				v25.Completed:Wait();
				if v24 ~= nil then
					v24:Stop();
				end;
				if v24 ~= nil then
					v24:Destroy();
				end;
			end);
		end;
		local v26 = p12.soulsByPosition[tostring(p14)];
		if v26 == nil then
			v26 = l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("GrimReaperSoul"):Clone();
			v26:SetPrimaryPartCFrame(CFrame.new(p14));
			v26.Parent = l__Workspace__8;
		end;
		v17:GiveTask(function()
			if v26 ~= nil then
				v26:Destroy();
			end;
		end);
		local v27 = u5("Beam", {
			Attachment0 = v26:FindFirstChild("Spirit"):FindFirstChild("Attachment"), 
			Attachment1 = v15, 
			LightEmission = 0.6, 
			LightInfluence = 1, 
			Transparency = NumberSequence.new(0), 
			Width0 = 0.4, 
			Width1 = 0.2, 
			CurveSize0 = 3, 
			CurveSize1 = -3, 
			FaceCamera = true, 
			Parent = v26
		});
		local v28 = v27:Clone();
		v28.FaceCamera = false;
		v28.Parent = v26;
		v1.Promise.defer(function()
			local v29 = 1;
			while v27.Parent do
				local v30 = 0.4 + 0.2 * math.random();
				local v31 = l__TweenService__14:Create(v27, TweenInfo.new(v30), {
					CurveSize0 = -3 * v29, 
					CurveSize1 = 3 * v29
				});
				l__TweenService__14:Create(v28, TweenInfo.new(v30), {
					CurveSize0 = -3 * v29, 
					CurveSize1 = 3 * v29
				}):Play();
				v31:Play();
				v31.Completed:Wait();
				v29 = v29 * -1;			
			end;
		end);
		for v32, v33 in ipairs(p13:GetDescendants()) do
			if v33:IsA("BasePart") then
				if v33.Transparency < 0.5 then
					l__TweenService__14:Create(v33, TweenInfo.new(0.1), {
						Transparency = 0.369
					}):Play();
					v33.Material = Enum.Material.ForceField;
					local l__Transparency__16 = v33.Transparency;
					local l__Material__17 = v33.Material;
					v17:GiveTask(function()
						if v33.Parent then
							l__TweenService__14:Create(v33, TweenInfo.new(0.1), {
								Transparency = l__Transparency__16
							}):Play();
							v33.Material = l__Material__17;
						end;
					end);
				end;
			elseif v33:IsA("ParticleEmitter") then
				local l__Transparency__34 = v33.Transparency;
			end;
		end;
		if v18 then
			v17:GiveTask(l__KnitClient__2.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = 1.6
			}));
		end;
		if v18 then
			v17:GiveTask(l__ClientSyncEvents__15.PerformCombat:connect(function(p15)
				p15:setCancelled(true);
			end));
		end;
		v1.Promise.delay(2.5):andThen(function()
			v17:DoCleaning();
		end);
	end;
end;
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
