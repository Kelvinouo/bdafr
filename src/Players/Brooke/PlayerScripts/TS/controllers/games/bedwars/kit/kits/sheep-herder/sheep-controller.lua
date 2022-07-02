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
	p5:GetAttributeChangedSignal("SheepState"):Connect(function(p8)
		local v10 = p5:GetAttribute("SheepState");
		u12:DoCleaning();
		if v10 == l__SheepState__10.IDLE then
			u12 = p4:idleSheep(p5, v7);
			return;
		end;
		if v10 == l__SheepState__10.TAMED then
			u12 = p4:tameSheep(p5, v7, u13 ~= l__SheepState__10.TAMED);
		end;
	end);
	local v11 = p5:GetAttribute("SheepState");
	u12:DoCleaning();
	if v11 == l__SheepState__10.IDLE then
		u12 = p4:idleSheep(p5, v7);
	elseif v11 == l__SheepState__10.TAMED then
		u12 = p4:tameSheep(p5, v7, u13 ~= l__SheepState__10.TAMED);
	end;
	return v7;
end;
local l__Players__14 = v3.Players;
local l__KnitClient__15 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__GameAnimationUtil__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v5.idleSheep(p9, p10, p11)
	local v12 = u9.new();
	local u18 = true;
	v12:GiveTask(function()
		u18 = false;
	end);
	p10.AncestryChanged:Connect(function(p12, p13)
		if p13 == nil then
			v12:DoCleaning();
		end;
	end);
	p11:SetPrimaryPartCFrame(CFrame.new(p10:GetAttribute("SheepIdlePosition")) * CFrame.Angles(0, p10:GetAttribute("RandomFloat") * math.pi * 2, 0));
	if l__Players__14.LocalPlayer.UserId ~= p10:GetAttribute("SheepOwnerUserId") then
		for v13, v14 in ipairs(p11:GetDescendants()) do
			if v14:IsA("BasePart") then
				v14.Transparency = 1;
			end;
		end;
	end;
	task.spawn(function()
		local v15 = 0;
		while true do
			local v16 = task.wait(0.2);
			if v16 ~= 0 and v16 == v16 and v16 then
				v16 = u18;
			end;
			if v16 == 0 then
				break;
			end;
			if v16 ~= v16 then
				break;
			end;
			if not v16 then
				break;
			end;
			local v17 = l__Players__14.LocalPlayer.Character;
			if v17 ~= nil then
				v17 = v17.PrimaryPart;
			end;
			if v17 and p11.PrimaryPart and (v17.Position - p11.PrimaryPart.Position).Magnitude <= 10 and not (tick() < v15 + 2) then
				v15 = tick();
				task.spawn(function()
					print("taming sheep!");
					l__KnitClient__15.Controllers.SheepHerderKitController:tameSheep(p11);
				end);
			end;		
		end;
	end);
	local v18 = p11.AnimationController.Animator:LoadAnimation((l__GameAnimationUtil__16.getAnimation(l__AnimationType__17.SHEEP_IDLE)));
	v18:Play();
	v12:GiveTask(function()
		v18:Stop();
		v18:Destroy();
	end);
	return v12;
end;
local l__SoundManager__19 = v2.SoundManager;
local l__RandomUtil__20 = v2.RandomUtil;
local l__GameSound__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__WatchCharacter__22 = v2.WatchCharacter;
local l__RunService__23 = v3.RunService;
function v5.tameSheep(p14, p15, p16, p17)
	local v19 = tick();
	local l__Position__20 = p16.PrimaryPart.Position;
	local v21 = p15:GetAttribute("SheepOwnerUserId") == l__Players__14.LocalPlayer.UserId;
	if p17 then
		local v22 = {};
		if v21 then
			local v23 = nil;
		else
			v23 = l__Position__20;
		end;
		v22.position = v23;
		if v21 then
			local v24 = nil;
		else
			v24 = p16.PrimaryPart;
		end;
		v22.parent = v24;
		l__SoundManager__19:playSound(l__RandomUtil__20.fromList(l__GameSound__21.SHEEP_TAME_1, l__GameSound__21.SHEEP_TAME_2, l__GameSound__21.SHEEP_TAME_3), v22);
		if v21 then
			l__GameAnimationUtil__16.playAnimation(l__Players__14.LocalPlayer, l__AnimationType__17.TAME_SHEEP);
		end;
	end;
	local v25 = u9.new();
	local u24 = true;
	v25:GiveTask(function()
		u24 = false;
	end);
	p15.AncestryChanged:Connect(function(p18, p19)
		if p19 == nil then
			v25:DoCleaning();
		end;
	end);
	local v26 = l__Players__14.LocalPlayer.Character;
	if v26 ~= nil then
		v26 = v26.PrimaryPart;
	end;
	local u25 = v26;
	v25:GiveTask(l__WatchCharacter__22(function(p20, p21, p22)
		if p20 ~= l__Players__14.LocalPlayer then
			return nil;
		end;
		if not p21.PrimaryPart then
			p21:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		u25 = p21.PrimaryPart;
	end));
	local u26 = p15:GetAttribute("SheepIndex");
	v25:GiveTask(p15:GetAttributeChangedSignal("SheepIndex"):Connect(function()
		u26 = p15:GetAttribute("SheepIndex");
	end));
	local u27 = 0;
	local u28 = l__Position__20.Y;
	local u29 = p15:GetAttribute("RandomFloat");
	v25:GiveTask(l__RunService__23.RenderStepped:Connect(function(p23)
		u27 = u27 + p23;
		if u25 == nil then
			return nil;
		end;
		local v27 = u26 % 2 == 0;
		if u26 == 0 then
			v27 = false;
		end;
		local v28 = Vector3.new(0, -0.5, 3);
		if u26 > 0 then
			if v27 then
				local v29 = 1;
			else
				v29 = -1;
			end;
			v28 = v28 + Vector3.new(math.floor((u26 + 1) / 2) * 2.1 * v29, 0, 0) + Vector3.new(0, 0, math.floor((u26 + 1) / 2) * 2.7);
		end;
		local v30 = u25.CFrame * v28;
		local v31 = RaycastParams.new();
		v31.CollisionGroup = "Players";
		local v32 = l__GameQueryUtil__6:raycast(v30 + Vector3.new(0, 9, 0), Vector3.new(0, -60, 0), v31);
		local v33 = v30.Y;
		local v34 = v32;
		if v34 ~= nil then
			v34 = v34.Position;
		end;
		if v34 then
			v33 = v32.Position.Y + 2;
		end;
		local v35 = v33 - u28;
		local v36 = math.max(math.abs(v35) / 3, 1);
		local v37 = Vector3.new(v30.X, u28 + math.clamp(v35, p23 * -40 * v36, p23 * 40 * v36), v30.Z);
		u28 = v37.Y;
		local v38 = v37 + Vector3.new(0, 0.8 * math.sin(u27 * 2 + math.pi * 2 * u29), 0);
		local v39 = CFrame.new(v38, v38 + u25.CFrame.LookVector);
		if tick() - v19 < 1 then
			v39 = CFrame.new(CFrame.new(l__Position__20, l__Position__20 + u25.CFrame.LookVector):Lerp(v39, (tick() - v19) / 1).Position, v39.Position);
		end;
		p16:SetPrimaryPartCFrame(v39);
	end));
	local v40 = p16.AnimationController.Animator:LoadAnimation((l__GameAnimationUtil__16.getAnimation(l__AnimationType__17.SHEEP_WALK)));
	v40:Play();
	v40:AdjustSpeed(0.5);
	v40.TimePosition = u29 * v40.Length;
	v25:GiveTask(function()
		v40:Stop();
		v40:Destroy();
	end);
	return v25;
end;
u1 = l__KnitClient__15.CreateController;
u1 = u1(v5.new());
return nil;
