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
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.constructor(p1)
	l__HandKnitController__4.constructor(p1);
	p1.Name = "InfernalShieldController";
	p1.infernalShieldState = l__default__1.Client:Get("RemoteName");
	p1.maid = u2.new();
	p1.raisedMaid = u2.new();
	p1.lastShieldRaised = 0;
end;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__5 = v3.Players;
function v5.KnitStart(p2)
	l__HandKnitController__4.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		p2:playEffects(p3.player);
	end);
	l__default__1.Client:OnEvent("RemoteName", function(p4)
		local v7 = {};
		if p4.deflector == l__Players__5.LocalPlayer then
			local v8 = nil;
		else
			v8 = p4.position;
		end;
		v7.position = v8;
		l__SoundManager__3:playSound(l__GameSound__4.SHIELD_BLOCKED, v7);
	end);
end;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v5.isRelevantItem(p5, p6)
	return p6.itemType == l__ItemType__6.INFERNAL_SHIELD;
end;
local l__UserInputService__7 = v3.UserInputService;
local l__ContextActionService__8 = v3.ContextActionService;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ShieldMobileUI__10 = v1.import(script, script.Parent, "shield-mobile-ui").ShieldMobileUI;
function v5.onEnable(p7, p8)
	if l__UserInputService__7.KeyboardEnabled or l__UserInputService__7.GamepadEnabled then
		l__ContextActionService__8:BindAction("infernal-shield-click", function(p9, p10, p11)
			if p10 == Enum.UserInputState.Begin then
				p7:raiseShield();
				return;
			end;
			if p10 == Enum.UserInputState.End then
				p7:lowerShield();
			end;
		end, false, Enum.UserInputType.MouseButton1);
		p7.maid:GiveTask(function()
			l__ContextActionService__8:UnbindAction("infernal-shield-click");
		end);
	end;
	if l__UserInputService__7.TouchEnabled then
		p7:setupYield(function()
			local u11 = u9.mount(u9.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u9.createElement(l__ShieldMobileUI__10, {
					OnChange = function(p12)
						if p12 then
							p7:raiseShield();
							return;
						end;
						p7:lowerShield();
					end
				}) }), l__Players__5.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u9.unmount(u11);
			end;
		end);
	end;
end;
function v5.onDisable(p13)
	p13:lowerShield();
	p13.maid:DoCleaning();
end;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__KnitClient__13 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__AnimationType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v5.raiseShield(p14)
	if os.clock() - p14.lastShieldRaised < 0.2 then
		return nil;
	end;
	p14.lastShieldRaised = os.clock();
	p14.infernalShieldState:SendToServer({
		raised = true
	});
	p14.raisedMaid:GiveTask(function()
		p14.infernalShieldState:SendToServer({
			raised = false
		});
	end);
	local v9 = u12("Animation", {
		AnimationId = "rbxassetid://7050488867"
	});
	local v10 = l__Players__5.LocalPlayer.Character;
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
		local u15 = l__KnitClient__13.Controllers.ViewmodelController:playAnimation(l__AnimationType__14.FP_SHIELD_USE, {
			looped = true
		});
		p14.raisedMaid:GiveTask(function()
			if u15 ~= nil then
				u15:Stop();
			end;
		end);
		p14.raisedMaid:GiveTask(l__KnitClient__13.Controllers.SprintController:getMovementStatusModifier():addModifier({
			moveSpeedMultiplier = 0.9
		}));
	end;
end;
function v5.lowerShield(p15)
	p15.raisedMaid:DoCleaning();
end;
local l__EntityUtil__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__17 = v3.ReplicatedStorage;
local l__scaleModel__18 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__Workspace__19 = v3.Workspace;
local l__GameQueryUtil__20 = v2.GameQueryUtil;
local l__ModelUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__22 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutExpo;
local l__RunService__23 = v3.RunService;
local l__default__24 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
function v5.playEffects(p16, p17)
	local v13 = l__EntityUtil__16:getEntity(p17);
	if v13 == nil then
		return nil;
	end;
	local v14 = u2.new();
	local v15 = l__ReplicatedStorage__17.Assets.Effects.InfernalShields:Clone();
	v15:SetPrimaryPartCFrame(v13:getInstance():GetPrimaryPartCFrame());
	l__scaleModel__18(v15, 0.06);
	v15.Parent = l__Workspace__19;
	local v16, v17, v18 = ipairs(v15:GetChildren());
	while true do
		v16(v17, v18);
		if not v16 then
			break;
		end;
		v18 = v16;
		if v17:IsA("BasePart") then
			l__GameQueryUtil__20:setQueryIgnored(v17, true);
		end;	
	end;
	l__ModelUtil__21.tweenModelSize(v15, 0, l__InOutExpo__22, 10);
	local u25 = 0;
	local u26 = l__RunService__23.Heartbeat:Connect(function(p18)
		v15.Shields.CFrame = (CFrame.new(v13:getInstance():GetPrimaryPartCFrame().Position) + Vector3.new(0, -0.25, 0)) * CFrame.Angles(0, u25 * 0.8, 0);
		if not p16:validPlayerConditions(v13) then
			v14:DoCleaning();
			return nil;
		end;
		u25 = u25 + p18;
		if v15.PrimaryPart ~= nil then
			return;
		end;
		l__default__24.Error("Shield effect has no primary part");
		return nil;
	end);
	v14:GiveTask(function()
		u26:Disconnect();
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
	local v19 = p20:getItemInHand();
	if v19 ~= nil then
		v19 = v19.Name;
	end;
	if v19 ~= l__ItemType__6.INFERNAL_SHIELD then
		return false;
	end;
	if p20:getInstance().PrimaryPart == nil then
		return false;
	end;
	return true;
end;
local v20 = l__KnitClient__13.CreateController(v5.new());
return nil;
