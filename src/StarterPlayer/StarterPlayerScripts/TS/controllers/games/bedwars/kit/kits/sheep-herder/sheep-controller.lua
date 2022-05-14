-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "SheepController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__3 = v4.Workspace;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "SheepController";
	p1.sheepModelFolder = u2("Folder", {
		Name = "SheepModel", 
		Parent = l__Workspace__3
	});
end;
local l__WatchCollectionTag__4 = v2.WatchCollectionTag;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__4("SheepData", function(p3)
		p2:createSheepModel(p3);
	end);
end;
local l__ReplicatedStorage__5 = v4.ReplicatedStorage;
local l__GameQueryUtil__6 = v2.GameQueryUtil;
local l__TweenService__7 = v4.TweenService;
local l__CollectionService__8 = v4.CollectionService;
local l__Maid__9 = v3.Maid;
local l__SheepState__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "sheep-herder", "sheep-state").SheepState;
function v6.createSheepModel(p4, p5)
	p5:WaitForChild("SheepModel");
	p5:WaitForChild("Owner");
	if p5.Parent == nil then
		return nil;
	end;
	local v8 = l__ReplicatedStorage__5.Assets.Misc.Sheep.Sheep1:Clone();
	v8.PrimaryPart.Anchored = true;
	for v9, v10 in ipairs(v8:GetDescendants()) do
		if v10:IsA("BasePart") then
			v10.CanCollide = false;
			l__GameQueryUtil__6:setQueryIgnored(v10, true);
			if v10.Transparency == 0 then
				l__TweenService__7:Create(v10, TweenInfo.new(0.3), {
					Transparency = 0
				});
			end;
		end;
	end;
	u2("ObjectValue", {
		Name = "SheepData", 
		Value = p5, 
		Parent = v8
	});
	v8.Parent = p4.sheepModelFolder;
	l__CollectionService__8:AddTag(v8, "SheepModel");
	local u11 = l__Maid__9.new();
	p5.AncestryChanged:Connect(function(p6, p7)
		if p7 == nil then
			u11:DoCleaning();
		end;
	end);
	u11:GiveTask(function()
		v8:Destroy();
	end);
	local u12 = l__Maid__9.new();
	local u13 = p5:GetAttribute("SheepState");
	local function u14(p8)
		u12:DoCleaning();
		if p8 == l__SheepState__10.IDLE then
			u12 = p4:idleSheep(p5, v8);
			return;
		end;
		if p8 == l__SheepState__10.TAMED then
			u12 = p4:tameSheep(p5, v8, u13 ~= l__SheepState__10.TAMED);
		end;
	end;
	p5:GetAttributeChangedSignal("SheepState"):Connect(function(p9)
		u14(p5:GetAttribute("SheepState"));
	end);
	u14(p5:GetAttribute("SheepState"));
	return v8;
end;
local l__Players__15 = v4.Players;
local l__KnitClient__16 = v3.KnitClient;
local l__GameAnimationUtil__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v6.idleSheep(p10, p11, p12)
	local v11 = l__Maid__9.new();
	local u19 = true;
	v11:GiveTask(function()
		u19 = false;
	end);
	p11.AncestryChanged:Connect(function(p13, p14)
		if p14 == nil then
			v11:DoCleaning();
		end;
	end);
	p12:SetPrimaryPartCFrame(CFrame.new(p11:GetAttribute("SheepIdlePosition")) * CFrame.Angles(0, p11:GetAttribute("RandomFloat") * math.pi * 2, 0));
	if l__Players__15.LocalPlayer.UserId ~= p11:GetAttribute("SheepOwnerUserId") then
		for v12, v13 in ipairs(p12:GetDescendants()) do
			if v13:IsA("BasePart") then
				v13.Transparency = 1;
			end;
		end;
	end;
	task.spawn(function()
		local v14 = 0;
		while true do
			local v15 = task.wait(0.2);
			if v15 ~= 0 and v15 == v15 and v15 then
				v15 = u19;
			end;
			if v15 == 0 then
				break;
			end;
			if v15 ~= v15 then
				break;
			end;
			if not v15 then
				break;
			end;
			local v16 = l__Players__15.LocalPlayer.Character;
			if v16 ~= nil then
				v16 = v16.PrimaryPart;
			end;
			if v16 and p12.PrimaryPart and (v16.Position - p12.PrimaryPart.Position).Magnitude <= 10 and not (tick() < v14 + 2) then
				v14 = tick();
				task.spawn(function()
					print("taming sheep!");
					l__KnitClient__16.Controllers.SheepHerderKitController:tameSheep(p12);
				end);
			end;		
		end;
	end);
	local v17 = p12.AnimationController.Animator:LoadAnimation((l__GameAnimationUtil__17.getAnimation(l__AnimationType__18.SHEEP_IDLE)));
	v17:Play();
	v11:GiveTask(function()
		v17:Stop();
		v17:Destroy();
	end);
	return v11;
end;
local l__SoundManager__20 = v2.SoundManager;
local l__RandomUtil__21 = v2.RandomUtil;
local l__GameSound__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__WatchCharacter__23 = v2.WatchCharacter;
local l__RunService__24 = v4.RunService;
function v6.tameSheep(p15, p16, p17, p18)
	local v18 = tick();
	local l__Position__19 = p17.PrimaryPart.Position;
	local v20 = p16:GetAttribute("SheepOwnerUserId") == l__Players__15.LocalPlayer.UserId;
	if p18 then
		local v21 = {};
		if v20 then
			local v22 = nil;
		else
			v22 = l__Position__19;
		end;
		v21.position = v22;
		if v20 then
			local v23 = nil;
		else
			v23 = p17.PrimaryPart;
		end;
		v21.parent = v23;
		l__SoundManager__20:playSound(l__RandomUtil__21.fromList(l__GameSound__22.SHEEP_TAME_1, l__GameSound__22.SHEEP_TAME_2, l__GameSound__22.SHEEP_TAME_3), v21);
		if v20 then
			l__GameAnimationUtil__17.playAnimation(l__Players__15.LocalPlayer, l__AnimationType__18.TAME_SHEEP);
		end;
	end;
	local v24 = l__Maid__9.new();
	local u25 = true;
	v24:GiveTask(function()
		u25 = false;
	end);
	p16.AncestryChanged:Connect(function(p19, p20)
		if p20 == nil then
			v24:DoCleaning();
		end;
	end);
	local v25 = l__Players__15.LocalPlayer.Character;
	if v25 ~= nil then
		v25 = v25.PrimaryPart;
	end;
	local u26 = v25;
	v24:GiveTask(l__WatchCharacter__23(function(p21, p22, p23)
		if p21 ~= l__Players__15.LocalPlayer then
			return nil;
		end;
		if not p22.PrimaryPart then
			p22:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		u26 = p22.PrimaryPart;
	end));
	local u27 = p16:GetAttribute("SheepIndex");
	v24:GiveTask(p16:GetAttributeChangedSignal("SheepIndex"):Connect(function()
		u27 = p16:GetAttribute("SheepIndex");
	end));
	local u28 = 0;
	local u29 = l__Position__19.Y;
	local u30 = p16:GetAttribute("RandomFloat");
	v24:GiveTask(l__RunService__24.RenderStepped:Connect(function(p24)
		u28 = u28 + p24;
		if u26 == nil then
			return nil;
		end;
		local v26 = u27 % 2 == 0;
		if u27 == 0 then
			v26 = false;
		end;
		local v27 = Vector3.new(0, -0.5, 3);
		if u27 > 0 then
			if v26 then
				local v28 = 1;
			else
				v28 = -1;
			end;
			v27 = v27 + Vector3.new(math.floor((u27 + 1) / 2) * 2.1 * v28, 0, 0) + Vector3.new(0, 0, math.floor((u27 + 1) / 2) * 2.7);
		end;
		local v29 = u26.CFrame * v27;
		local v30 = RaycastParams.new();
		v30.CollisionGroup = "Players";
		local v31 = l__GameQueryUtil__6:raycast(v29 + Vector3.new(0, 9, 0), Vector3.new(0, -60, 0), v30);
		local v32 = v29.Y;
		local v33 = v31;
		if v33 ~= nil then
			v33 = v33.Position;
		end;
		if v33 then
			v32 = v31.Position.Y + 2;
		end;
		local v34 = v32 - u29;
		local v35 = math.max(math.abs(v34) / 3, 1);
		local v36 = Vector3.new(v29.X, u29 + math.clamp(v34, p24 * -40 * v35, p24 * 40 * v35), v29.Z);
		u29 = v36.Y;
		local v37 = v36 + Vector3.new(0, 0.8 * math.sin(u28 * 2 + math.pi * 2 * u30), 0);
		local v38 = CFrame.new(v37, v37 + u26.CFrame.LookVector);
		if tick() - v18 < 1 then
			v38 = CFrame.new(CFrame.new(l__Position__19, l__Position__19 + u26.CFrame.LookVector):Lerp(v38, (tick() - v18) / 1).Position, v38.Position);
		end;
		p17:SetPrimaryPartCFrame(v38);
	end));
	local v39 = p17.AnimationController.Animator:LoadAnimation((l__GameAnimationUtil__17.getAnimation(l__AnimationType__18.SHEEP_WALK)));
	v39:Play();
	v39:AdjustSpeed(0.5);
	v39.TimePosition = u30 * v39.Length;
	v24:GiveTask(function()
		v39:Stop();
		v39:Destroy();
	end);
	return v24;
end;
u1 = l__KnitClient__16.CreateController;
u1 = u1(v6.new());
return nil;
