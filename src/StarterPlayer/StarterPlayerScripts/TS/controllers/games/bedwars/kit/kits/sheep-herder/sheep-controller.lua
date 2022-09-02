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
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__2 = v3.Workspace;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "SheepController";
	p1.sheepModelFolder = u1("Folder", {
		Name = "SheepModel", 
		Parent = l__Workspace__2
	});
end;
local l__WatchCollectionTag__3 = v2.WatchCollectionTag;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__WatchCollectionTag__3("SheepData", function(p3)
		p2:createSheepModel(p3);
	end);
end;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local l__TweenService__6 = v3.TweenService;
local l__CollectionService__7 = v3.CollectionService;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SheepState__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "sheep-herder", "sheep-state").SheepState;
function v5.createSheepModel(p4, p5)
	p5:WaitForChild("SheepModel");
	p5:WaitForChild("Owner");
	if p5.Parent == nil then
		return nil;
	end;
	local v7 = l__ReplicatedStorage__4.Assets.Misc.Sheep.Sheep1:Clone();
	v7.PrimaryPart.Anchored = true;
	local v8, v9, v10 = ipairs(v7:GetDescendants());
	while true do
		v8(v9, v10);
		if not v8 then
			break;
		end;
		v10 = v8;
		if v9:IsA("BasePart") then
			v9.CanCollide = false;
			l__GameQueryUtil__5:setQueryIgnored(v9, true);
			if v9.Transparency == 0 then
				l__TweenService__6:Create(v9, TweenInfo.new(0.3), {
					Transparency = 0
				});
			end;
		end;	
	end;
	u1("ObjectValue", {
		Name = "SheepData", 
		Value = p5, 
		Parent = v7
	});
	v7.Parent = p4.sheepModelFolder;
	l__CollectionService__7:AddTag(v7, "SheepModel");
	local u10 = u8.new();
	p5.AncestryChanged:Connect(function(p6, p7)
		if p7 == nil then
			u10:DoCleaning();
		end;
	end);
	u10:GiveTask(function()
		v7:Destroy();
	end);
	local u11 = u8.new();
	local u12 = p5:GetAttribute("SheepState");
	p5:GetAttributeChangedSignal("SheepState"):Connect(function(p8)
		local v11 = p5:GetAttribute("SheepState");
		u11:DoCleaning();
		if v11 == l__SheepState__9.IDLE then
			u11 = p4:idleSheep(p5, v7);
			return;
		end;
		if v11 == l__SheepState__9.TAMED then
			u11 = p4:tameSheep(p5, v7, u12 ~= l__SheepState__9.TAMED);
		end;
	end);
	local v12 = p5:GetAttribute("SheepState");
	u11:DoCleaning();
	if v12 == l__SheepState__9.IDLE then
		u11 = p4:idleSheep(p5, v7);
	elseif v12 == l__SheepState__9.TAMED then
		u11 = p4:tameSheep(p5, v7, u12 ~= l__SheepState__9.TAMED);
	end;
	return v7;
end;
local l__Players__13 = v3.Players;
local l__KnitClient__14 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__GameAnimationUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v5.idleSheep(p9, p10, p11)
	local v13 = u8.new();
	local u17 = true;
	v13:GiveTask(function()
		u17 = false;
	end);
	p10.AncestryChanged:Connect(function(p12, p13)
		if p13 == nil then
			v13:DoCleaning();
		end;
	end);
	p11:SetPrimaryPartCFrame(CFrame.new(p10:GetAttribute("SheepIdlePosition")) * CFrame.Angles(0, p10:GetAttribute("RandomFloat") * math.pi * 2, 0));
	if l__Players__13.LocalPlayer.UserId ~= p10:GetAttribute("SheepOwnerUserId") then
		local v14, v15, v16 = ipairs(p11:GetDescendants());
		while true do
			v14(v15, v16);
			if not v14 then
				break;
			end;
			v16 = v14;
			if v15:IsA("BasePart") then
				v15.Transparency = 1;
			end;		
		end;
	end;
	task.spawn(function()
		local v17 = 0;
		while true do
			local v18 = task.wait(0.2);
			if v18 ~= 0 and v18 == v18 and v18 then
				v18 = u17;
			end;
			if v18 == 0 then
				break;
			end;
			if v18 ~= v18 then
				break;
			end;
			if not v18 then
				break;
			end;
			local v19 = l__Players__13.LocalPlayer.Character;
			if v19 ~= nil then
				v19 = v19.PrimaryPart;
			end;
			if v19 and p11.PrimaryPart and (v19.Position - p11.PrimaryPart.Position).Magnitude <= 10 and not (tick() < v17 + 2) then
				v17 = tick();
				task.spawn(function()
					print("taming sheep!");
					l__KnitClient__14.Controllers.SheepHerderKitController:tameSheep(p11);
				end);
			end;		
		end;
	end);
	local v20 = p11.AnimationController.Animator:LoadAnimation((l__GameAnimationUtil__15.getAnimation(l__AnimationType__16.SHEEP_IDLE)));
	v20:Play();
	v13:GiveTask(function()
		v20:Stop();
		v20:Destroy();
	end);
	return v13;
end;
local l__SoundManager__18 = v2.SoundManager;
local l__RandomUtil__19 = v2.RandomUtil;
local l__GameSound__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__WatchCharacter__21 = v2.WatchCharacter;
local l__RunService__22 = v3.RunService;
function v5.tameSheep(p14, p15, p16, p17)
	local v21 = tick();
	local l__Position__22 = p16.PrimaryPart.Position;
	local v23 = p15:GetAttribute("SheepOwnerUserId") == l__Players__13.LocalPlayer.UserId;
	if p17 then
		local v24 = {};
		if v23 then
			local v25 = nil;
		else
			v25 = l__Position__22;
		end;
		v24.position = v25;
		if v23 then
			local v26 = nil;
		else
			v26 = p16.PrimaryPart;
		end;
		v24.parent = v26;
		l__SoundManager__18:playSound(l__RandomUtil__19.fromList(l__GameSound__20.SHEEP_TAME_1, l__GameSound__20.SHEEP_TAME_2, l__GameSound__20.SHEEP_TAME_3), v24);
		if v23 then
			l__GameAnimationUtil__15.playAnimation(l__Players__13.LocalPlayer, l__AnimationType__16.TAME_SHEEP);
		end;
	end;
	local v27 = u8.new();
	local u23 = true;
	v27:GiveTask(function()
		u23 = false;
	end);
	p15.AncestryChanged:Connect(function(p18, p19)
		if p19 == nil then
			v27:DoCleaning();
		end;
	end);
	local v28 = l__Players__13.LocalPlayer.Character;
	if v28 ~= nil then
		v28 = v28.PrimaryPart;
	end;
	local u24 = v28;
	v27:GiveTask(l__WatchCharacter__21(function(p20, p21, p22)
		if p20 ~= l__Players__13.LocalPlayer then
			return nil;
		end;
		if not p21.PrimaryPart then
			p21:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		u24 = p21.PrimaryPart;
	end));
	local u25 = p15:GetAttribute("SheepIndex");
	v27:GiveTask(p15:GetAttributeChangedSignal("SheepIndex"):Connect(function()
		u25 = p15:GetAttribute("SheepIndex");
	end));
	local u26 = 0;
	local u27 = l__Position__22.Y;
	local u28 = p15:GetAttribute("RandomFloat");
	v27:GiveTask(l__RunService__22.RenderStepped:Connect(function(p23)
		u26 = u26 + p23;
		if u24 == nil then
			return nil;
		end;
		local v29 = u25 % 2 == 0;
		if u25 == 0 then
			v29 = false;
		end;
		local v30 = Vector3.new(0, -0.5, 3);
		if u25 > 0 then
			if v29 then
				local v31 = 1;
			else
				v31 = -1;
			end;
			v30 = v30 + Vector3.new(math.floor((u25 + 1) / 2) * 2.1 * v31, 0, 0) + Vector3.new(0, 0, math.floor((u25 + 1) / 2) * 2.7);
		end;
		local v32 = u24.CFrame * v30;
		local v33 = RaycastParams.new();
		v33.CollisionGroup = "Players";
		local v34 = l__GameQueryUtil__5:raycast(v32 + Vector3.new(0, 9, 0), Vector3.new(0, -60, 0), v33);
		local v35 = v32.Y;
		local v36 = v34;
		if v36 ~= nil then
			v36 = v36.Position;
		end;
		if v36 then
			v35 = v34.Position.Y + 2;
		end;
		local v37 = v35 - u27;
		local v38 = math.max(math.abs(v37) / 3, 1);
		local v39 = Vector3.new(v32.X, u27 + math.clamp(v37, p23 * -40 * v38, p23 * 40 * v38), v32.Z);
		u27 = v39.Y;
		local v40 = v39 + Vector3.new(0, 0.8 * math.sin(u26 * 2 + math.pi * 2 * u28), 0);
		local v41 = CFrame.new(v40, v40 + u24.CFrame.LookVector);
		if tick() - v21 < 1 then
			v41 = CFrame.new(CFrame.new(l__Position__22, l__Position__22 + u24.CFrame.LookVector):Lerp(v41, (tick() - v21) / 1).Position, v41.Position);
		end;
		p16:SetPrimaryPartCFrame(v41);
	end));
	local v42 = p16.AnimationController.Animator:LoadAnimation((l__GameAnimationUtil__15.getAnimation(l__AnimationType__16.SHEEP_WALK)));
	v42:Play();
	v42:AdjustSpeed(0.5);
	v42.TimePosition = u28 * v42.Length;
	v27:GiveTask(function()
		v42:Stop();
		v42:Destroy();
	end);
	return v27;
end;
local v43 = l__KnitClient__14.CreateController(v5.new());
return nil;
