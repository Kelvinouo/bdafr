-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "status-effect", "handlers", "client-status-effect-handler").ClientStatusEffectHandler;
local v6 = setmetatable({}, {
	__tostring = function()
		return "NoKnockbackStatusEffectHandler";
	end, 
	__index = v5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1, ...)
	v5.constructor(p1, ...);
end;
local l__Players__1 = v4.Players;
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__4 = v4.ReplicatedStorage;
local l__scaleModel__5 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__Workspace__6 = v4.Workspace;
local l__ModelUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__8 = v3.InOutExpo;
local l__GameQueryUtil__9 = v2.GameQueryUtil;
local l__KnitClient__10 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__CameraPerspective__11 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "first-person", "camera-perspective").CameraPerspective;
local l__RunService__12 = v4.RunService;
local l__default__13 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__OutExpo__14 = v3.OutExpo;
function v6.onApply(p2, p3, p4)
	local v8 = false;
	if p3 == l__Players__1.LocalPlayer.Character then
		v8 = l__Players__1.LocalPlayer.Character;
	end;
	local v9 = {};
	if v8 then
		local v10 = nil;
	else
		local v11 = p3.PrimaryPart;
		if v11 ~= nil then
			v11 = v11.Position;
		end;
		v10 = v11;
	end;
	v9.position = v10;
	l__SoundManager__2:playSound(l__GameSound__3.USE_SMOKE_CHARGE, v9);
	local v12 = l__ReplicatedStorage__4.Assets.Effects.AntiKnockbackBubble:Clone();
	v12:SetPrimaryPartCFrame(p3.HumanoidRootPart.CFrame);
	l__scaleModel__5(v12, 0.1);
	v12.Parent = l__Workspace__6;
	l__ModelUtil__7.tweenModelSize(v12, 0.2, l__InOutExpo__8, 10);
	local v13, v14, v15 = ipairs(v12:GetChildren());
	while true do
		v13(v14, v15);
		if not v13 then
			break;
		end;
		v15 = v13;
		if v14:IsA("BasePart") then
			l__GameQueryUtil__9:setQueryIgnored(v14, true);
		end;	
	end;
	if v8 then
		p2:updateShieldTransparency(v12, l__KnitClient__10.Controllers.CameraPerspectiveController:getCameraPerspective());
		p2.maid:GiveTask(l__KnitClient__10.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p5)
			p2:updateShieldTransparency(v12, p5);
		end));
		p2.maid:GiveTask(l__KnitClient__10.Controllers.VignetteController:createVignette({
			particleEmitters = { l__ReplicatedStorage__4.Assets.Effects.AntiKnockbackVignette }, 
			shouldShow = function()
				return l__KnitClient__10.Controllers.CameraPerspectiveController:getCameraPerspective() == l__CameraPerspective__11.FIRST_PERSON;
			end
		}));
	end;
	local u15 = 0;
	p2.maid:GiveTask(l__RunService__12.Heartbeat:Connect(function(p6)
		u15 = u15 + p6;
		local l__HumanoidRootPart__16 = p3.HumanoidRootPart;
		if l__HumanoidRootPart__16 == nil then
			return nil;
		end;
		if v12.PrimaryPart == nil then
			l__default__13.Error("Shield effect has no primary part");
			return nil;
		end;
		v12:SetPrimaryPartCFrame(CFrame.new(l__HumanoidRootPart__16.Position) * CFrame.Angles(u15 * -0.6, u15 * 1.5, u15 * -0.6));
		v12.Shields.CFrame = CFrame.new(v12.Shields.Position) * CFrame.Angles(0, u15 * 2, 0);
	end));
	p2.maid:GiveTask(function()
		l__ModelUtil__7.tweenModelSize(v12, 0.15, l__OutExpo__14, 0):andThen(function()
			v12:Destroy();
		end);
	end);
end;
function v6.onRemove(p7, p8, p9)

end;
function v6.updateShieldTransparency(p10, p11, p12)
	if p12 == l__CameraPerspective__11.FIRST_PERSON then
		local v17 = 1;
	else
		v17 = 0;
	end;
	local v18, v19, v20 = ipairs(p11:GetChildren());
	while true do
		v18(v19, v20);
		if not v18 then
			break;
		end;
		v20 = v18;
		if v19:IsA("BasePart") then
			v19.LocalTransparencyModifier = v17;
		end;	
	end;
end;
return {
	NoKnockbackStatusEffectHandler = v6
};
