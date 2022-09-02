-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "GrimReaperController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "GrimReaperController";
	p1.soulsByPosition = {};
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p2)
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		p2:spawnSoul(p3.position, p3.secret, p3.soulOfPlayer);
	end);
	l__default__2.Client:OnEvent("RemoteName", function(p4)
		p2:startChannel(p4.entity, p4.position);
	end);
end;
local l__ReplicatedStorage__3 = v2.ReplicatedStorage;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__6 = v2.Players;
local l__Workspace__7 = v2.Workspace;
function u1.spawnSoul(p5, p6, p7, p8)
	local v6 = l__ReplicatedStorage__3:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("GrimReaperSoul"):Clone();
	v6:SetAttribute("GrimReaperSoulSecret", p7);
	local v7 = u4("ProximityPrompt", {
		ActionText = "Player's Soul", 
		ObjectText = "CONSUME", 
		HoldDuration = 0, 
		KeyboardKeyCode = l__Theme__5.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		MaxActivationDistance = 120, 
		Parent = v6
	});
	v7.Triggered:Connect(function(p9)
		if p9 == l__Players__6.LocalPlayer then
			local v8 = p9.Character;
			if v8 ~= nil then
				v8 = v8:GetAttribute("GrimReaperChannel");
			end;
			if v8 ~= true then
				v7:Destroy();
				p5:consumeSoul(v6);
			end;
		end;
	end);
	v6:SetPrimaryPartCFrame(CFrame.new(p6));
	p5.soulsByPosition[tostring(p6)] = v6;
	v6.Parent = l__Workspace__7;
	v1.Promise.delay(10):andThen(function()
		if v6.Parent then
			v6:Destroy();
		end;
	end);
end;
local l__GameAnimationUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.consumeSoul(p10, p11)
	local v9 = p11:GetAttribute("GrimReaperSoulSecret");
	l__GameAnimationUtil__8.playAnimation(l__Players__6.LocalPlayer, l__AnimationType__9.GRIM_REAPER_CONSUME);
	l__default__2.Client:Get("RemoteName"):CallServer({
		secret = v9
	});
end;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SoundManager__11 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__13 = v2.TweenService;
local l__KnitClient__14 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ClientSyncEvents__15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function u1.startChannel(p12, p13, p14)
	local v10 = p13:FindFirstChild("3DClothing");
	if v10 ~= nil then
		local v11 = nil;
		local v12, v13, v14 = ipairs((v10:GetDescendants()));
		while true do
			v12(v13, v14);
			if not v12 then
				break;
			end;
			v14 = v12;
			if v13.Name == "GrimReaperChannelAttachment" == true then
				v11 = v13;
				break;
			end;		
		end;
		v10 = v11;
	end;
	local v15 = v10;
	if v15 == nil then
		local v16 = p13:FindFirstChild("UpperTorso");
		if v16 ~= nil then
			v16 = v16:FindFirstChild("BodyFrontAttachment");
		end;
		v15 = v16;
	end;
	if v15 then
		local v17 = u10.new();
		local v18 = p13 == l__Players__6.LocalPlayer.Character;
		local v19 = {};
		if v18 then
			local v20 = nil;
		else
			v20 = p13:GetPrimaryPartCFrame().Position;
		end;
		v19.position = v20;
		l__SoundManager__11:playSound(l__GameSound__12.GRIM_REAPER_CONSUME, v19);
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
		local v24 = l__SoundManager__11:playSound(l__GameSound__12.GRIM_REAPER_CHANNEL, v21);
		if v24 then
			v24.Looped = true;
			v17:GiveTask(function()
				local v25 = l__TweenService__13:Create(v24, TweenInfo.new(0.1), {
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
			v26 = l__ReplicatedStorage__3:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("GrimReaperSoul"):Clone();
			v26:SetPrimaryPartCFrame(CFrame.new(p14));
			v26.Parent = l__Workspace__7;
		end;
		v17:GiveTask(function()
			if v26 ~= nil then
				v26:Destroy();
			end;
		end);
		local v27 = u4("Beam", {
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
				local v31 = l__TweenService__13:Create(v27, TweenInfo.new(v30), {
					CurveSize0 = -3 * v29, 
					CurveSize1 = 3 * v29
				});
				l__TweenService__13:Create(v28, TweenInfo.new(v30), {
					CurveSize0 = -3 * v29, 
					CurveSize1 = 3 * v29
				}):Play();
				v31:Play();
				v31.Completed:Wait();
				v29 = v29 * -1;			
			end;
		end);
		local v32, v33, v34 = ipairs(p13:GetDescendants());
		while true do
			v32(v33, v34);
			if not v32 then
				break;
			end;
			v34 = v32;
			if v33:IsA("BasePart") then
				if v33.Transparency < 0.5 then
					l__TweenService__13:Create(v33, TweenInfo.new(0.1), {
						Transparency = 0.369
					}):Play();
					v33.Material = Enum.Material.ForceField;
					local l__Transparency__16 = v33.Transparency;
					local l__Material__17 = v33.Material;
					v17:GiveTask(function()
						if v33.Parent then
							l__TweenService__13:Create(v33, TweenInfo.new(0.1), {
								Transparency = l__Transparency__16
							}):Play();
							v33.Material = l__Material__17;
						end;
					end);
				end;
			elseif v33:IsA("ParticleEmitter") then
				local l__Transparency__35 = v33.Transparency;
			end;		
		end;
		if v18 then
			v17:GiveTask(l__KnitClient__14.Controllers.SprintController:getMovementStatusModifier():addModifier({
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
u1 = l__KnitClient__14.CreateController;
u1 = u1(u1.new());
return nil;
