-- Script Hash: a7b1a7159dcdc8d16721ce43aa1d3269901c6351a44e63ca2b2893bb944a3509b803bfe151b7ea88809e5ac58cafe8a1
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
local u1 = v5;
function v6.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
local l__Players__2 = v4.Players;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__5 = v4.ReplicatedStorage;
local l__scaleModel__6 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__Workspace__7 = v4.Workspace;
local l__ModelUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__9 = v3.InOutExpo;
local l__GameQueryUtil__10 = v2.GameQueryUtil;
local l__KnitClient__11 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__CameraPerspective__12 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "first-person", "camera-perspective").CameraPerspective;
local l__RunService__13 = v4.RunService;
local l__default__14 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__OutExpo__15 = v3.OutExpo;
function v6.onApply(p2, p3, p4)
	local v8 = false;
	if p3 == l__Players__2.LocalPlayer.Character then
		v8 = l__Players__2.LocalPlayer.Character;
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
	l__SoundManager__3:playSound(l__GameSound__4.USE_SMOKE_CHARGE, v9);
	local v12 = l__ReplicatedStorage__5.Assets.Effects.AntiKnockbackBubble:Clone();
	v12:SetPrimaryPartCFrame(p3.HumanoidRootPart.CFrame);
	l__scaleModel__6(v12, 0.1);
	v12.Parent = l__Workspace__7;
	l__ModelUtil__8.tweenModelSize(v12, 0.2, l__InOutExpo__9, 10);
	for v13, v14 in ipairs(v12:GetChildren()) do
		if v14:IsA("BasePart") then
			l__GameQueryUtil__10:setQueryIgnored(v14, true);
		end;
	end;
	if v8 then
		p2:updateShieldTransparency(v12, l__KnitClient__11.Controllers.CameraPerspectiveController:getCameraPerspective());
		p2.maid:GiveTask(l__KnitClient__11.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p5)
			p2:updateShieldTransparency(v12, p5);
		end));
		p2.maid:GiveTask(l__KnitClient__11.Controllers.VignetteController:createVignette({
			particleEmitters = { l__ReplicatedStorage__5.Assets.Effects.AntiKnockbackVignette }, 
			shouldShow = function()
				return l__KnitClient__11.Controllers.CameraPerspectiveController:getCameraPerspective() == l__CameraPerspective__12.FIRST_PERSON;
			end
		}));
	end;
	local u16 = 0;
	p2.maid:GiveTask(l__RunService__13.Heartbeat:Connect(function(p6)
		u16 = u16 + p6;
		local l__HumanoidRootPart__15 = p3.HumanoidRootPart;
		if l__HumanoidRootPart__15 == nil then
			return nil;
		end;
		if v12.PrimaryPart == nil then
			l__default__14.Error("Shield effect has no primary part");
			return nil;
		end;
		v12:SetPrimaryPartCFrame(CFrame.new(l__HumanoidRootPart__15.Position) * CFrame.Angles(u16 * -0.6, u16 * 1.5, u16 * -0.6));
		v12.Shields.CFrame = CFrame.new(v12.Shields.Position) * CFrame.Angles(0, u16 * 2, 0);
	end));
	p2.maid:GiveTask(function()
		l__ModelUtil__8.tweenModelSize(v12, 0.15, l__OutExpo__15, 0):andThen(function()
			v12:Destroy();
		end);
	end);
end;
function v6.onRemove(p7, p8, p9)

end;
function v6.updateShieldTransparency(p10, p11, p12)
	if p12 == l__CameraPerspective__12.FIRST_PERSON then
		local v16 = 1;
	else
		v16 = 0;
	end;
	for v17, v18 in ipairs(p11:GetChildren()) do
		if v18:IsA("BasePart") then
			v18.LocalTransparencyModifier = v16;
		end;
	end;
end;
u1 = {
	NoKnockbackStatusEffectHandler = v6
};
return v5;
