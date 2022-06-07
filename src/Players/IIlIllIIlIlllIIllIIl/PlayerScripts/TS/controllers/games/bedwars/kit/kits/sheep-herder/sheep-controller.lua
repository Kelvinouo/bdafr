-- Script Hash: 3ba3f8c313d53b65bad7e92bba6c6e607a487443801d4d7dc333d2f1ae963dc3a0d184209bbe66e316e6cf1477be2f10
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SheepController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__3 = v3.Workspace;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "SheepController";
	p1.sheepModelFolder = u2("Folder", {
		Name = "SheepModel", 
		Parent = l__Workspace__3
	});
end;
local l__WatchCollectionTag__4 = v2.WatchCollectionTag;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__4("SheepData", function(p3)
		p2:createSheepModel(p3);
	end);
end;
local l__ReplicatedStorage__5 = v3.ReplicatedStorage;
local l__GameQueryUtil__6 = v2.GameQueryUtil;
local l__TweenService__7 = v3.TweenService;
local l__CollectionService__8 = v3.CollectionService;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SheepState__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "sheep-herder", "sheep-state").SheepState;
function v5.createSheepModel(p4, p5)
	p5:WaitForChild("SheepModel");
	p5:WaitForChild("Owner");
	if p5.Parent == nil then
		return nil;
	end;
	local v7 = l__ReplicatedStorage__5.Assets.Misc.Sheep.Sheep1:Clone();
	v7.PrimaryPart.Anchored = true;
	for v8, v9 in ipairs(v7:GetDescendants()) do
		if v9:IsA("BasePart") then
			v9.CanCollide = false;
			l__GameQueryUtil__6:setQueryIgnored(v9, true);
			if v9.Transparency == 0 then
				l__TweenService__7:Create(v9, TweenInfo.new(0.3), {
					Transparency = 0
				});
			end;
		end;
	end;
	u2("ObjectValue", {
		Name = "SheepData", 
		Value = p5, 
		Parent = v7
	});
	v7.Parent = p4.sheepModelFolder;
	l__CollectionService__8:AddTag(v7, "SheepModel");
	local u11 = u9.new();
	p5.AncestryChanged:Connect(function(p6, p7)
		if p7 == nil then
			u11:DoCleaning();
		end;
	end);
	u11:GiveTask(function()
		v7:Destroy();
	end);
	local u12 = u9.new();
	local u13 = p5:GetAttribute("SheepState");
	local function u14(p8)
		u12:DoCleaning();
		if p8 == l__SheepState__10.IDLE then
			u12 = p4:idleSheep(p5, v7);
			return;
		end;
		if p8 == l__SheepState__10.TAMED then
			u12 = p4:tameSheep(p5, v7, u13 ~= l__SheepState__10.TAMED);
		end;
	end;
	p5:GetAttributeChangedSignal("SheepState"):Connect(function(p9)
		u14(p5:GetAttribute("SheepState"));
	end);
	u14(p5:GetAttribute("SheepState"));
	return v7;
end;
local l__Players__15 = v3.Players;
local l__KnitClient__16 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__GameAnimationUtil__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v5.idleSheep(p10, p11, p12)
	local v10 = u9.new();
	local u19 = true;
	v10:GiveTask(function()
		u19 = false;
	end);
	p11.AncestryChanged:Connect(function(p13, p14)
		if p14 == nil then
			v10:DoCleaning();
		end;
	end);
	p12:SetPrimaryPartCFrame(CFrame.new(p11:GetAttribute("SheepIdlePosition")) * CFrame.Angles(0, p11:GetAttribute("RandomFloat") * math.pi * 2, 0));
	if l__Players__15.LocalPlayer.UserId ~= p11:GetAttribute("SheepOwnerUserId") then
		for v11, v12 in ipairs(p12:GetDescendants()) do
			if v12:IsA("BasePart") then
				v12.Transparency = 1;
			end;
		end;
	end;
	task.spawn(function()
		local v13 = 0;
		while true do
			local v14 = task.wait(0.2);
			if v14 ~= 0 and v14 == v14 and v14 then
				v14 = u19;
			end;
			if v14 == 0 then
				break;
			end;
			if v14 ~= v14 then
				break;
			end;
			if not v14 then
				break;
			end;
			local v15 = l__Players__15.LocalPlayer.Character;
			if v15 ~= nil then
				v15 = v15.PrimaryPart;
			end;
			if v15 and p12.PrimaryPart and (v15.Position - p12.PrimaryPart.Position).Magnitude <= 10 and not (tick() < v13 + 2) then
				v13 = tick();
				task.spawn(function()
					print("taming sheep!");
					l__KnitClient__16.Controllers.SheepHerderKitController:tameSheep(p12);
				end);
			end;		
		end;
	end);
	local v16 = p12.AnimationController.Animator:LoadAnimation((l__GameAnimationUtil__17.getAnimation(l__AnimationType__18.SHEEP_IDLE)));
	v16:Play();
	v10:GiveTask(function()
		v16:Stop();
		v16:Destroy();
	end);
	return v10;
end;
local l__SoundManager__20 = v2.SoundManager;
local l__RandomUtil__21 = v2.RandomUtil;
local l__GameSound__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__WatchCharacter__23 = v2.WatchCharacter;
local l__RunService__24 = v3.RunService;
function v5.tameSheep(p15, p16, p17, p18)
	local v17 = tick();
	local l__Position__18 = p17.PrimaryPart.Position;
	local v19 = p16:GetAttribute("SheepOwnerUserId") == l__Players__15.LocalPlayer.UserId;
	if p18 then
		local v20 = {};
		if v19 then
			local v21 = nil;
		else
			v21 = l__Position__18;
		end;
		v20.position = v21;
		if v19 then
			local v22 = nil;
		else
			v22 = p17.PrimaryPart;
		end;
		v20.parent = v22;
		l__SoundManager__20:playSound(l__RandomUtil__21.fromList(l__GameSound__22.SHEEP_TAME_1, l__GameSound__22.SHEEP_TAME_2, l__GameSound__22.SHEEP_TAME_3), v20);
		if v19 then
			l__GameAnimationUtil__17.playAnimation(l__Players__15.LocalPlayer, l__AnimationType__18.TAME_SHEEP);
		end;
	end;
	local v23 = u9.new();
	local u25 = true;
	v23:GiveTask(function()
		u25 = false;
	end);
	p16.AncestryChanged:Connect(function(p19, p20)
		if p20 == nil then
			v23:DoCleaning();
		end;
	end);
	local v24 = l__Players__15.LocalPlayer.Character;
	if v24 ~= nil then
		v24 = v24.PrimaryPart;
	end;
	local u26 = v24;
	v23:GiveTask(l__WatchCharacter__23(function(p21, p22, p23)
		if p21 ~= l__Players__15.LocalPlayer then
			return nil;
		end;
		if not p22.PrimaryPart then
			p22:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		u26 = p22.PrimaryPart;
	end));
	local u27 = p16:GetAttribute("SheepIndex");
	v23:GiveTask(p16:GetAttributeChangedSignal("SheepIndex"):Connect(function()
		u27 = p16:GetAttribute("SheepIndex");
	end));
	local u28 = 0;
	local u29 = l__Position__18.Y;
	local u30 = p16:GetAttribute("RandomFloat");
	v23:GiveTask(l__RunService__24.RenderStepped:Connect(function(p24)
		u28 = u28 + p24;
		if u26 == nil then
			return nil;
		end;
		local v25 = u27 % 2 == 0;
		if u27 == 0 then
			v25 = false;
		end;
		local v26 = Vector3.new(0, -0.5, 3);
		if u27 > 0 then
			if v25 then
				local v27 = 1;
			else
				v27 = -1;
			end;
			v26 = v26 + Vector3.new(math.floor((u27 + 1) / 2) * 2.1 * v27, 0, 0) + Vector3.new(0, 0, math.floor((u27 + 1) / 2) * 2.7);
		end;
		local v28 = u26.CFrame * v26;
		local v29 = RaycastParams.new();
		v29.CollisionGroup = "Players";
		local v30 = l__GameQueryUtil__6:raycast(v28 + Vector3.new(0, 9, 0), Vector3.new(0, -60, 0), v29);
		local v31 = v28.Y;
		local v32 = v30;
		if v32 ~= nil then
			v32 = v32.Position;
		end;
		if v32 then
			v31 = v30.Position.Y + 2;
		end;
		local v33 = v31 - u29;
		local v34 = math.max(math.abs(v33) / 3, 1);
		local v35 = Vector3.new(v28.X, u29 + math.clamp(v33, p24 * -40 * v34, p24 * 40 * v34), v28.Z);
		u29 = v35.Y;
		local v36 = v35 + Vector3.new(0, 0.8 * math.sin(u28 * 2 + math.pi * 2 * u30), 0);
		local v37 = CFrame.new(v36, v36 + u26.CFrame.LookVector);
		if tick() - v17 < 1 then
			v37 = CFrame.new(CFrame.new(l__Position__18, l__Position__18 + u26.CFrame.LookVector):Lerp(v37, (tick() - v17) / 1).Position, v37.Position);
		end;
		p17:SetPrimaryPartCFrame(v37);
	end));
	local v38 = p17.AnimationController.Animator:LoadAnimation((l__GameAnimationUtil__17.getAnimation(l__AnimationType__18.SHEEP_WALK)));
	v38:Play();
	v38:AdjustSpeed(0.5);
	v38.TimePosition = u30 * v38.Length;
	v23:GiveTask(function()
		v38:Stop();
		v38:Destroy();
	end);
	return v23;
end;
u1 = l__KnitClient__16.CreateController;
u1 = u1(v5.new());
return nil;
