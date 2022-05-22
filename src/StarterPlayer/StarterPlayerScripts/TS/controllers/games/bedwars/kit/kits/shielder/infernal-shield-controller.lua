-- Script Hash: 256fa41342b9343c2f8ac490dbf43ef986c42f53b3438e2af38a6aa87b11e7098391ebdf21c0d5576ddec048f7789198
--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "InfernalShieldController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__HandKnitController__5;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Maid__3 = v3.Maid;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "InfernalShieldController";
	p1.infernalShieldState = l__default__2.Client:Get("RemoteName");
	p1.maid = l__Maid__3.new();
	p1.raisedMaid = l__Maid__3.new();
end;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__6 = v4.Players;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		p2:playEffects(p3.player);
	end);
	l__default__2.Client:OnEvent("RemoteName", function(p4)
		local v8 = {};
		if p4.deflector == l__Players__6.LocalPlayer then
			local v9 = nil;
		else
			v9 = p4.position;
		end;
		v8.position = v9;
		l__SoundManager__4:playSound(l__GameSound__5.SHIELD_BLOCKED, v8);
	end);
end;
local l__ItemType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v6.isRelevantItem(p5, p6)
	return p6.itemType == l__ItemType__7.INFERNAL_SHIELD;
end;
local l__UserInputService__8 = v4.UserInputService;
local l__ContextActionService__9 = v4.ContextActionService;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ShieldMobileUI__11 = v1.import(script, script.Parent, "shield-mobile-ui").ShieldMobileUI;
function v6.onEnable(p7, p8)
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
function v6.onDisable(p13)
	p13:lowerShield();
	p13.maid:DoCleaning();
end;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__KnitClient__14 = v3.KnitClient;
local l__AnimationType__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v6.raiseShield(p14)
	p14.infernalShieldState:SendToServer({
		raised = true
	});
	p14.raisedMaid:GiveTask(function()
		p14.infernalShieldState:SendToServer({
			raised = false
		});
	end);
	local v10 = u13("Animation", {
		AnimationId = "rbxassetid://7050488867"
	});
	local v11 = l__Players__6.LocalPlayer.Character;
	if v11 ~= nil then
		v11 = v11:FindFirstChild("Humanoid");
	end;
	local v12 = v11;
	if v12 ~= nil then
		v12 = v12:FindFirstChild("Animator");
	end;
	if v11 and v12 then
		local v13 = v12:LoadAnimation(v10);
		v13.Looped = true;
		v13:Play();
		p14.raisedMaid:GiveTask(function()
			v13:Stop();
			v13:Destroy();
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
function v6.lowerShield(p15)
	p15.raisedMaid:DoCleaning();
end;
local l__EntityUtil__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__18 = v4.ReplicatedStorage;
local l__scaleModel__19 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__Workspace__20 = v4.Workspace;
local l__GameQueryUtil__21 = v2.GameQueryUtil;
local l__ModelUtil__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__23 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutExpo;
local l__RunService__24 = v4.RunService;
local l__default__25 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
function v6.playEffects(p16, p17)
	local v14 = l__EntityUtil__17:getEntity(p17);
	if v14 == nil then
		return nil;
	end;
	local v15 = l__Maid__3.new();
	local v16 = l__ReplicatedStorage__18.Assets.Effects.InfernalShields:Clone();
	v16:SetPrimaryPartCFrame(v14:getInstance():GetPrimaryPartCFrame());
	l__scaleModel__19(v16, 0.06);
	v16.Parent = l__Workspace__20;
	for v17, v18 in ipairs(v16:GetChildren()) do
		if v18:IsA("BasePart") then
			l__GameQueryUtil__21:setQueryIgnored(v18, true);
		end;
	end;
	l__ModelUtil__22.tweenModelSize(v16, 0, l__InOutExpo__23, 10);
	local u26 = 0;
	local u27 = l__RunService__24.Heartbeat:Connect(function(p18)
		v16.Shields.CFrame = (CFrame.new(v14:getInstance():GetPrimaryPartCFrame().Position) + Vector3.new(0, -0.25, 0)) * CFrame.Angles(0, u26 * 0.8, 0);
		if not p16:validPlayerConditions(v14) then
			v15:DoCleaning();
			return nil;
		end;
		u26 = u26 + p18;
		if v16.PrimaryPart ~= nil then
			return;
		end;
		l__default__25.Error("Shield effect has no primary part");
		return nil;
	end);
	v15:GiveTask(function()
		u27:Disconnect();
		v16:Destroy();
	end);
end;
function v6.validPlayerConditions(p19, p20)
	if not p20:isAlive() then
		return false;
	end;
	if p20:getInstance():GetAttribute("InfernalShieldRaised") ~= true then
		return false;
	end;
	local v19 = p20:getItemInHand();
	if v19 ~= nil then
		v19 = v19.Name;
	end;
	if v19 ~= l__ItemType__7.INFERNAL_SHIELD then
		return false;
	end;
	if p20:getInstance().PrimaryPart == nil then
		return false;
	end;
	return true;
end;
u1 = l__KnitClient__14.CreateController;
u1 = u1(v6.new());
return nil;
