--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "InfernalShieldController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__HandKnitController__4;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "InfernalShieldController";
	p1.infernalShieldState = l__default__2.Client:Get("RemoteName");
	p1.maid = u3.new();
	p1.raisedMaid = u3.new();
end;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__6 = v3.Players;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		p2:playEffects(p3.player);
	end);
	l__default__2.Client:OnEvent("RemoteName", function(p4)
		local v7 = {};
		if p4.deflector == l__Players__6.LocalPlayer then
			local v8 = nil;
		else
			v8 = p4.position;
		end;
		v7.position = v8;
		l__SoundManager__4:playSound(l__GameSound__5.SHIELD_BLOCKED, v7);
	end);
end;
local l__ItemType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v5.isRelevantItem(p5, p6)
	return p6.itemType == l__ItemType__7.INFERNAL_SHIELD;
end;
local l__UserInputService__8 = v3.UserInputService;
local l__ContextActionService__9 = v3.ContextActionService;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ShieldMobileUI__11 = v1.import(script, script.Parent, "shield-mobile-ui").ShieldMobileUI;
function v5.onEnable(p7, p8)
	if l__UserInputService__8.KeyboardEnabled or l__UserInputService__8.GamepadEnabled then
		l__ContextActionService__9:BindAction("infernal-shield-click", function(p9, p10, p11)
			if p10 == Enum.UserInputState.Begin then
				p7:raiseShield();
				return;
			end;
			if p10 == Enum.UserInputState.End then
				p7:lowerShield();
			end;
		end, false, Enum.UserInputType.MouseButton1);
		p7.maid:GiveTask(function()
			l__ContextActionService__9:UnbindAction("infernal-shield-click");
		end);
	end;
	if l__UserInputService__8.TouchEnabled then
		p7:setupYield(function()
			local u12 = u10.mount(u10.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u10.createElement(l__ShieldMobileUI__11, {
					OnChange = function(p12)
						if p12 then
							p7:raiseShield();
							return;
						end;
						p7:lowerShield();
					end
				}) }), l__Players__6.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u10.unmount(u12);
			end;
		end);
	end;
end;
function v5.onDisable(p13)
	p13:lowerShield();
	p13.maid:DoCleaning();
end;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__KnitClient__14 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__AnimationType__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v5.raiseShield(p14)
	p14.infernalShieldState:SendToServer({
		raised = true
	});
	p14.raisedMaid:GiveTask(function()
		p14.infernalShieldState:SendToServer({
			raised = false
		});
	end);
	local v9 = u13("Animation", {
		AnimationId = "rbxassetid://7050488867"
	});
	local v10 = l__Players__6.LocalPlayer.Character;
	if v10 ~= nil then
		v10 = v10:FindFirstChild("Humanoid");
	end;
	local v11 = v10;
	if v11 ~= nil then
		v11 = v11:FindFirstChild("Animator");
	end;
	if v10 and v11 then
		local v12 = v11:LoadAnimation(v9);
		v12.Looped = true;
		v12:Play();
		p14.raisedMaid:GiveTask(function()
			v12:Stop();
			v12:Destroy();
		end);
		local u16 = l__KnitClient__14.Controllers.ViewmodelController:playAnimation(l__AnimationType__15.FP_SHIELD_USE, {
			looped = true
		});
		p14.raisedMaid:GiveTask(function()
			if u16 ~= nil then
				u16:Stop();
			end;
		end);
		p14.raisedMaid:GiveTask(l__KnitClient__14.Controllers.SprintController:getMovementStatusModifier():addModifier({
			moveSpeedMultiplier = 0.9
		}));
	end;
end;
function v5.lowerShield(p15)
	p15.raisedMaid:DoCleaning();
end;
local l__EntityUtil__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__18 = v3.ReplicatedStorage;
local l__scaleModel__19 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__Workspace__20 = v3.Workspace;
local l__GameQueryUtil__21 = v2.GameQueryUtil;
local l__ModelUtil__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__23 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutExpo;
local l__RunService__24 = v3.RunService;
local l__default__25 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
function v5.playEffects(p16, p17)
	local v13 = l__EntityUtil__17:getEntity(p17);
	if v13 == nil then
		return nil;
	end;
	local v14 = u3.new();
	local v15 = l__ReplicatedStorage__18.Assets.Effects.InfernalShields:Clone();
	v15:SetPrimaryPartCFrame(v13:getInstance():GetPrimaryPartCFrame());
	l__scaleModel__19(v15, 0.06);
	v15.Parent = l__Workspace__20;
	for v16, v17 in ipairs(v15:GetChildren()) do
		if v17:IsA("BasePart") then
			l__GameQueryUtil__21:setQueryIgnored(v17, true);
		end;
	end;
	l__ModelUtil__22.tweenModelSize(v15, 0, l__InOutExpo__23, 10);
	local u26 = 0;
	local u27 = l__RunService__24.Heartbeat:Connect(function(p18)
		v15.Shields.CFrame = (CFrame.new(v13:getInstance():GetPrimaryPartCFrame().Position) + Vector3.new(0, -0.25, 0)) * CFrame.Angles(0, u26 * 0.8, 0);
		if not p16:validPlayerConditions(v13) then
			v14:DoCleaning();
			return nil;
		end;
		u26 = u26 + p18;
		if v15.PrimaryPart ~= nil then
			return;
		end;
		l__default__25.Error("Shield effect has no primary part");
		return nil;
	end);
	v14:GiveTask(function()
		u27:Disconnect();
		v15:Destroy();
	end);
end;
function v5.validPlayerConditions(p19, p20)
	if not p20:isAlive() then
		return false;
	end;
	if p20:getInstance():GetAttribute("InfernalShieldRaised") ~= true then
		return false;
	end;
	local v18 = p20:getItemInHand();
	if v18 ~= nil then
		v18 = v18.Name;
	end;
	if v18 ~= l__ItemType__7.INFERNAL_SHIELD then
		return false;
	end;
	if p20:getInstance().PrimaryPart == nil then
		return false;
	end;
	return true;
end;
u1 = l__KnitClient__14.CreateController;
u1 = u1(v5.new());
return nil;
