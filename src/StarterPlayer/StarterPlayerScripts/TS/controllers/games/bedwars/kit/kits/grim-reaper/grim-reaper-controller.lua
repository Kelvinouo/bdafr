-- Script Hash: dc29a7f4fa07e788d0e685c7ff223fbc610db440b2a233e65a843f9b1acc24c0abad4a58354eef3ab333bfc58c17ec0e
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__3 = v2.KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "GrimReaperController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__KnitController__5;
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
local l__ReplicatedStorage__4 = v4.ReplicatedStorage;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__7 = v4.Players;
local l__Workspace__8 = v4.Workspace;
function u1.spawnSoul(p5, p6, p7, p8)
	local v8 = l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("GrimReaperSoul"):Clone();
	v8:SetAttribute("GrimReaperSoulSecret", p7);
	local v9 = u5("ProximityPrompt", {
		ActionText = "Player's Soul", 
		ObjectText = "CONSUME", 
		HoldDuration = 0, 
		KeyboardKeyCode = l__Theme__6.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		MaxActivationDistance = 120, 
		Parent = v8
	});
	v9.Triggered:Connect(function(p9)
		if p9 == l__Players__7.LocalPlayer then
			local v10 = p9.Character;
			if v10 ~= nil then
				v10 = v10:GetAttribute("GrimReaperChannel");
			end;
			if v10 ~= true then
				v9:Destroy();
				p5:consumeSoul(v8);
			end;
		end;
	end);
	v8:SetPrimaryPartCFrame(CFrame.new(p6));
	p5.soulsByPosition[tostring(p6)] = v8;
	v8.Parent = l__Workspace__8;
	v1.Promise.delay(10):andThen(function()
		if v8.Parent then
			v8:Destroy();
		end;
	end);
end;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.consumeSoul(p10, p11)
	local v11 = p11:GetAttribute("GrimReaperSoulSecret");
	l__GameAnimationUtil__9.playAnimation(l__Players__7.LocalPlayer, l__AnimationType__10.GRIM_REAPER_CONSUME);
	l__default__3.Client:Get("RemoteName"):CallServer({
		secret = v11
	});
end;
local l__Maid__11 = v2.Maid;
local l__SoundManager__12 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__14 = v4.TweenService;
local l__ClientSyncEvents__15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function u1.startChannel(p12, p13, p14)
	local v12 = p13:FindFirstChild("3DClothing");
	if v12 ~= nil then
		local v13 = v12:GetDescendants();
		local function v14(p15)
			return p15.Name == "GrimReaperChannelAttachment";
		end;
		local v15 = nil;
		for v16, v17 in ipairs(v13) do
			if v14(v17, v16 - 1, v13) == true then
				v15 = v17;
				break;
			end;
		end;
		v12 = v15;
	end;
	local v18 = v12;
	if v18 == nil then
		local v19 = p13:FindFirstChild("UpperTorso");
		if v19 ~= nil then
			v19 = v19:FindFirstChild("BodyFrontAttachment");
		end;
		v18 = v19;
	end;
	if v18 then
		local v20 = l__Maid__11.new();
		local v21 = p13 == l__Players__7.LocalPlayer.Character;
		local v22 = {};
		if v21 then
			local v23 = nil;
		else
			v23 = p13:GetPrimaryPartCFrame().Position;
		end;
		v22.position = v23;
		l__SoundManager__12:playSound(l__GameSound__13.GRIM_REAPER_CONSUME, v22);
		local v24 = {};
		if v21 then
			local v25 = nil;
		else
			v25 = p13:GetPrimaryPartCFrame().Position;
		end;
		v24.position = v25;
		if v21 then
			local v26 = nil;
		else
			v26 = p13.PrimaryPart;
		end;
		v24.parent = v26;
		local v27 = l__SoundManager__12:playSound(l__GameSound__13.GRIM_REAPER_CHANNEL, v24);
		if v27 then
			v27.Looped = true;
			v20:GiveTask(function()
				local v28 = l__TweenService__14:Create(v27, TweenInfo.new(0.1), {
					Volume = 0
				});
				v28:Play();
				v28.Completed:Wait();
				if v27 ~= nil then
					v27:Stop();
				end;
				if v27 ~= nil then
					v27:Destroy();
				end;
			end);
		end;
		local v29 = p12.soulsByPosition[tostring(p14)];
		if v29 == nil then
			v29 = l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("GrimReaperSoul"):Clone();
			v29:SetPrimaryPartCFrame(CFrame.new(p14));
			v29.Parent = l__Workspace__8;
		end;
		v20:GiveTask(function()
			if v29 ~= nil then
				v29:Destroy();
			end;
		end);
		local v30 = u5("Beam", {
			Attachment0 = v29:FindFirstChild("Spirit"):FindFirstChild("Attachment"), 
			Attachment1 = v18, 
			LightEmission = 0.6, 
			LightInfluence = 1, 
			Transparency = NumberSequence.new(0), 
			Width0 = 0.4, 
			Width1 = 0.2, 
			CurveSize0 = 3, 
			CurveSize1 = -3, 
			FaceCamera = true, 
			Parent = v29
		});
		local v31 = v30:Clone();
		v31.FaceCamera = false;
		v31.Parent = v29;
		(function()
			v1.Promise.defer(function()
				local v32 = 1;
				while v30.Parent do
					local v33 = 0.4 + 0.2 * math.random();
					local v34 = l__TweenService__14:Create(v30, TweenInfo.new(v33), {
						CurveSize0 = -3 * v32, 
						CurveSize1 = 3 * v32
					});
					l__TweenService__14:Create(v31, TweenInfo.new(v33), {
						CurveSize0 = -3 * v32, 
						CurveSize1 = 3 * v32
					}):Play();
					v34:Play();
					v34.Completed:Wait();
					v32 = v32 * -1;				
				end;
			end);
		end)();
		for v35, v36 in ipairs(p13:GetDescendants()) do
			if v36:IsA("BasePart") then
				if v36.Transparency < 0.5 then
					l__TweenService__14:Create(v36, TweenInfo.new(0.1), {
						Transparency = 0.369
					}):Play();
					v36.Material = Enum.Material.ForceField;
					local l__Transparency__16 = v36.Transparency;
					local l__Material__17 = v36.Material;
					v20:GiveTask(function()
						if v36.Parent then
							l__TweenService__14:Create(v36, TweenInfo.new(0.1), {
								Transparency = l__Transparency__16
							}):Play();
							v36.Material = l__Material__17;
						end;
					end);
				end;
			elseif v36:IsA("ParticleEmitter") then
				local l__Transparency__37 = v36.Transparency;
			end;
		end;
		if v21 then
			v20:GiveTask(l__KnitClient__3.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = 1.6
			}));
		end;
		if v21 then
			v20:GiveTask(l__ClientSyncEvents__15.PerformCombat:connect(function(p16)
				p16:setCancelled(true);
			end));
		end;
		v1.Promise.delay(2.5):andThen(function()
			v20:DoCleaning();
		end);
	end;
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
