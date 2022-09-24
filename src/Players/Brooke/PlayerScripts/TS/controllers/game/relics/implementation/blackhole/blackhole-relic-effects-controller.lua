-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BlackholeRelicEffectsController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "BlackholeRelicEffectsController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__2 = v3.Players;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__1.Client:WaitFor("RemoteName"):expect():Connect(function(p3)
		local u3 = p2:spawnBlackhole(p3.pos);
		local v7, v8, v9 = ipairs(p3.targets);
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			v9 = v7;
			p2:playEffect(v8, u3);
			if v8 == l__Players__2.LocalPlayer then
				p2:playLocalEffects(v8, u3);
			end;		
		end;
	end);
end;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__Workspace__5 = v3.Workspace;
local l__ModelUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__Linear__7 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__Debris__8 = v3.Debris;
function v5.spawnBlackhole(p4, p5)
	local v10 = l__ReplicatedStorage__4.Assets.Effects.BlackHole:Clone();
	v10:SetPrimaryPartCFrame(p5);
	v10.Parent = l__Workspace__5;
	l__ModelUtil__6.tweenModelSize(v10, 4, l__Linear__7, 5):andThen(function()
		l__ModelUtil__6.tweenModelSize(v10, 0.5, l__Linear__7, 0);
	end);
	l__Debris__8:AddItem(v10, 5);
	return v10;
end;
local l__KnitClient__9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__EntityUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__AnimationUtil__11 = v2.AnimationUtil;
local l__GameAnimationUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__TweenService__14 = v3.TweenService;
function v5.playEffect(p6, p7, p8)
	if not p8.PrimaryPart then
		return nil;
	end;
	local l__Character__11 = p7.Character;
	if not l__Character__11 or not l__Character__11.PrimaryPart then
		return nil;
	end;
	l__Character__11.Archivable = true;
	local v12 = l__Character__11:Clone();
	if not v12.PrimaryPart then
		return nil;
	end;
	l__KnitClient__9.Controllers.InvisibilityPotionController:setTransparencyOfCharacter(l__Character__11, 1);
	local v13 = l__EntityUtil__10:getEntity(p7);
	if v13 then
		local v14 = v13:getHandItemInstanceFromCharacter();
		if v14 then
			v14:Destroy();
		end;
	end;
	v12:SetPrimaryPartCFrame(l__Character__11:GetPrimaryPartCFrame());
	v12.PrimaryPart.CanCollide = false;
	v12.PrimaryPart.CanQuery = false;
	v12.PrimaryPart.Anchored = true;
	v12.Parent = l__Workspace__5;
	l__AnimationUtil__11.playAnimation(v12, l__GameAnimationUtil__12.getAssetId(l__AnimationType__13.BLACKHOLE_CONSUME), {
		looped = true
	});
	local v15 = l__TweenService__14:Create(v12.PrimaryPart, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
		CFrame = p8.PrimaryPart.CFrame
	});
	v15:Play();
	v15.Completed:Connect(function()
		v12:Destroy();
	end);
end;
local l__SoundManager__15 = v2.SoundManager;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u17 = Vector3.new(20, 75, 20);
function v5.playLocalEffects(p9, p10, p11)
	local l__Character__16 = p10.Character;
	if not l__Character__16 or not l__Character__16.PrimaryPart then
		return nil;
	end;
	l__Character__16.PrimaryPart.Anchored = true;
	l__SoundManager__15:playSound(l__GameSound__16.BLACKHOLE_END, {
		volumeMultiplier = 0.5
	});
	local l__CurrentCamera__17 = l__Workspace__5.CurrentCamera;
	if not l__CurrentCamera__17 then
		return nil;
	end;
	if not p11.PrimaryPart then
		return nil;
	end;
	l__CurrentCamera__17.CameraType = Enum.CameraType.Scriptable;
	l__TweenService__14:Create(l__CurrentCamera__17, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
		CFrame = CFrame.new(p11.PrimaryPart.Position + u17, p11.PrimaryPart.Position)
	}):Play();
	l__KnitClient__9.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -2, 0), {
		cycles = 3, 
		duration = 0.75
	});
	local l__CameraType__18 = l__CurrentCamera__17.CameraType;
	task.delay(5, function()
		l__CurrentCamera__17.CameraType = l__CameraType__18;
	end);
end;
local v18 = l__KnitClient__9.CreateController(v5.new());
return nil;
