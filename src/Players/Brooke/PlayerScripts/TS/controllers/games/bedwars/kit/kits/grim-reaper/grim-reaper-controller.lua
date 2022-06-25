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
		local v12 = v11:GetDescendants();
		local function v13(p15)
			return p15.Name == "GrimReaperChannelAttachment";
		end;
		local v14 = nil;
		for v15, v16 in ipairs(v12) do
			if v13(v16, v15 - 1, v12) == true then
				v14 = v16;
				break;
			end;
		end;
		v11 = v14;
	end;
	local v17 = v11;
	if v17 == nil then
		local v18 = p13:FindFirstChild("UpperTorso");
		if v18 ~= nil then
			v18 = v18:FindFirstChild("BodyFrontAttachment");
		end;
		v17 = v18;
	end;
	if v17 then
		local v19 = u11.new();
		local v20 = p13 == l__Players__7.LocalPlayer.Character;
		local v21 = {};
		if v20 then
			local v22 = nil;
		else
			v22 = p13:GetPrimaryPartCFrame().Position;
		end;
		v21.position = v22;
		l__SoundManager__12:playSound(l__GameSound__13.GRIM_REAPER_CONSUME, v21);
		local v23 = {};
		if v20 then
			local v24 = nil;
		else
			v24 = p13:GetPrimaryPartCFrame().Position;
		end;
		v23.position = v24;
		if v20 then
			local v25 = nil;
		else
			v25 = p13.PrimaryPart;
		end;
		v23.parent = v25;
		local v26 = l__SoundManager__12:playSound(l__GameSound__13.GRIM_REAPER_CHANNEL, v23);
		if v26 then
			v26.Looped = true;
			v19:GiveTask(function()
				local v27 = l__TweenService__14:Create(v26, TweenInfo.new(0.1), {
					Volume = 0
				});
				v27:Play();
				v27.Completed:Wait();
				if v26 ~= nil then
					v26:Stop();
				end;
				if v26 ~= nil then
					v26:Destroy();
				end;
			end);
		end;
		local v28 = p12.soulsByPosition[tostring(p14)];
		if v28 == nil then
			v28 = l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("GrimReaperSoul"):Clone();
			v28:SetPrimaryPartCFrame(CFrame.new(p14));
			v28.Parent = l__Workspace__8;
		end;
		v19:GiveTask(function()
			if v28 ~= nil then
				v28:Destroy();
			end;
		end);
		local v29 = u5("Beam", {
			Attachment0 = v28:FindFirstChild("Spirit"):FindFirstChild("Attachment"), 
			Attachment1 = v17, 
			LightEmission = 0.6, 
			LightInfluence = 1, 
			Transparency = NumberSequence.new(0), 
			Width0 = 0.4, 
			Width1 = 0.2, 
			CurveSize0 = 3, 
			CurveSize1 = -3, 
			FaceCamera = true, 
			Parent = v28
		});
		local v30 = v29:Clone();
		v30.FaceCamera = false;
		v30.Parent = v28;
		(function()
			v1.Promise.defer(function()
				local v31 = 1;
				while v29.Parent do
					local v32 = 0.4 + 0.2 * math.random();
					local v33 = l__TweenService__14:Create(v29, TweenInfo.new(v32), {
						CurveSize0 = -3 * v31, 
						CurveSize1 = 3 * v31
					});
					l__TweenService__14:Create(v30, TweenInfo.new(v32), {
						CurveSize0 = -3 * v31, 
						CurveSize1 = 3 * v31
					}):Play();
					v33:Play();
					v33.Completed:Wait();
					v31 = v31 * -1;				
				end;
			end);
		end)();
		for v34, v35 in ipairs(p13:GetDescendants()) do
			if v35:IsA("BasePart") then
				if v35.Transparency < 0.5 then
					l__TweenService__14:Create(v35, TweenInfo.new(0.1), {
						Transparency = 0.369
					}):Play();
					v35.Material = Enum.Material.ForceField;
					local l__Transparency__16 = v35.Transparency;
					local l__Material__17 = v35.Material;
					v19:GiveTask(function()
						if v35.Parent then
							l__TweenService__14:Create(v35, TweenInfo.new(0.1), {
								Transparency = l__Transparency__16
							}):Play();
							v35.Material = l__Material__17;
						end;
					end);
				end;
			elseif v35:IsA("ParticleEmitter") then
				local l__Transparency__36 = v35.Transparency;
			end;
		end;
		if v20 then
			v19:GiveTask(l__KnitClient__2.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = 1.6
			}));
		end;
		if v20 then
			v19:GiveTask(l__ClientSyncEvents__15.PerformCombat:connect(function(p16)
				p16:setCancelled(true);
			end));
		end;
		v1.Promise.delay(2.5):andThen(function()
			v19:DoCleaning();
		end);
	end;
end;
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
