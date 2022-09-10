--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "GlitchShieldController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.constructor(p1)
	l__HandKnitController__5.constructor(p1);
	p1.Name = "GlitchShieldController";
	p1.infernalShieldState = l__default__1.Client:Get("RemoteName");
	p1.maid = u2.new();
	p1.raisedMaid = u2.new();
	p1.lastShieldRaised = 0;
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v6.isRelevantItem(p2, p3)
	return p3.itemType == l__ItemType__3.GLITCH_INFERNAL_SHIELD;
end;
local l__UserInputService__4 = v4.UserInputService;
local l__ContextActionService__5 = v4.ContextActionService;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ShieldMobileUI__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "shielder", "shield-mobile-ui").ShieldMobileUI;
local l__Players__8 = v4.Players;
function v6.onEnable(p4, p5, p6)
	if l__UserInputService__4.KeyboardEnabled or l__UserInputService__4.GamepadEnabled then
		l__ContextActionService__5:BindAction("glitch-infernal-shield-click", function(p7, p8, p9)
			if p8 == Enum.UserInputState.Begin then
				p4:raiseShield();
				return;
			end;
			if p8 == Enum.UserInputState.End then
				p4:lowerShield();
			end;
		end, false, Enum.UserInputType.MouseButton1);
		p4.maid:GiveTask(function()
			l__ContextActionService__5:UnbindAction("glitch-infernal-shield-click");
		end);
	end;
	if l__UserInputService__4.TouchEnabled then
		p4:setupYield(function()
			local u9 = u6.mount(u6.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u6.createElement(l__ShieldMobileUI__7, {
					OnChange = function(p10)
						if p10 then
							p4:raiseShield();
							return;
						end;
						p4:lowerShield();
					end
				}) }), l__Players__8.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u6.unmount(u9);
			end;
		end);
	end;
end;
function v6.onDisable(p11)
	p11:lowerShield();
	p11.maid:DoCleaning();
end;
local l__ReplicatedStorage__10 = v4.ReplicatedStorage;
local l__Workspace__11 = v4.Workspace;
local l__GameQueryUtil__12 = v2.GameQueryUtil;
local l__scalePart__13 = v3.scalePart;
local l__Debris__14 = v4.Debris;
local l__SoundManager__15 = v2.SoundManager;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v6.KnitStart(p12)
	l__HandKnitController__5.KnitStart(p12);
	l__default__1.Client:OnEvent("RemoteName", function(p13)
		p12:playEffects(p13.player);
	end);
	l__default__1.Client:OnEvent("RemoteName", function(p14)
		local v8 = l__ReplicatedStorage__10.Assets.Effects.GlitchExplosion:Clone();
		v8.Position = p14.position;
		v8.Parent = l__Workspace__11;
		l__GameQueryUtil__12:setQueryIgnored(v8, true);
		l__scalePart__13(v8, 0.2);
		local v9, v10, v11 = ipairs((v8:GetDescendants()));
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			v11 = v9;
			if v10:IsA("ParticleEmitter") then
				v10:Emit(30);
			end;		
		end;
		l__Debris__14:AddItem(v8, 1);
		local v12 = {};
		if p14.deflector == l__Players__8.LocalPlayer then
			local v13 = nil;
		else
			v13 = p14.position;
		end;
		v12.position = v13;
		l__SoundManager__15:playSound(l__GameSound__16.SHIELD_BLOCKED, v12);
	end);
end;
local u17 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__KnitClient__18 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__AnimationType__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v6.raiseShield(p15)
	if os.clock() - p15.lastShieldRaised < 0.2 then
		return nil;
	end;
	p15.lastShieldRaised = os.clock();
	p15.infernalShieldState:SendToServer({
		raised = true
	});
	p15.raisedMaid:GiveTask(function()
		p15.infernalShieldState:SendToServer({
			raised = false
		});
	end);
	local v14 = u17("Animation", {
		AnimationId = "rbxassetid://7050488867"
	});
	local v15 = l__Players__8.LocalPlayer.Character;
	if v15 ~= nil then
		v15 = v15:FindFirstChild("Humanoid");
	end;
	local v16 = v15;
	if v16 ~= nil then
		v16 = v16:FindFirstChild("Animator");
	end;
	if v15 and v16 then
		local v17 = v16:LoadAnimation(v14);
		v17.Looped = true;
		v17:Play();
		p15.raisedMaid:GiveTask(function()
			v17:Stop();
			v17:Destroy();
		end);
		local u20 = l__KnitClient__18.Controllers.ViewmodelController:playAnimation(l__AnimationType__19.FP_SHIELD_USE, {
			looped = true
		});
		p15.raisedMaid:GiveTask(function()
			if u20 ~= nil then
				u20:Stop();
			end;
		end);
		p15.raisedMaid:GiveTask(l__KnitClient__18.Controllers.SprintController:getMovementStatusModifier():addModifier({
			moveSpeedMultiplier = 0.9
		}));
	end;
end;
function v6.lowerShield(p16)
	p16.raisedMaid:DoCleaning();
end;
local l__EntityUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__scaleModel__22 = v3.scaleModel;
local l__ModelUtil__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__24 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutExpo;
local l__RunService__25 = v4.RunService;
local l__default__26 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
function v6.playEffects(p17, p18)
	local v18 = l__EntityUtil__21:getEntity(p18);
	if v18 == nil then
		return nil;
	end;
	local v19 = u2.new();
	local v20 = l__ReplicatedStorage__10.Assets.Effects.GlitchInfernalShields:Clone();
	v20:SetPrimaryPartCFrame(v18:getInstance():GetPrimaryPartCFrame());
	l__scaleModel__22(v20, 0.06);
	v20.Parent = l__Workspace__11;
	local v21, v22, v23 = ipairs(v20:GetChildren());
	while true do
		v21(v22, v23);
		if not v21 then
			break;
		end;
		v23 = v21;
		if v22:IsA("BasePart") then
			l__GameQueryUtil__12:setQueryIgnored(v22, true);
		end;	
	end;
	l__ModelUtil__23.tweenModelSize(v20, 0, l__InOutExpo__24, 10);
	local u27 = 0;
	local u28 = l__RunService__25.Heartbeat:Connect(function(p19)
		v20.Shields.CFrame = (CFrame.new(v18:getInstance():GetPrimaryPartCFrame().Position) + Vector3.new(0, -0.25, 0)) * CFrame.Angles(0, u27 * 0.8, 0);
		if not p17:validPlayerConditions(v18) then
			v19:DoCleaning();
			return nil;
		end;
		u27 = u27 + p19;
		if v20.PrimaryPart ~= nil then
			return;
		end;
		l__default__26.Error("Shield effect has no primary part");
		return nil;
	end);
	v19:GiveTask(function()
		u28:Disconnect();
		v20:Destroy();
	end);
end;
function v6.validPlayerConditions(p20, p21)
	if not p21:isAlive() then
		return false;
	end;
	if p21:getInstance():GetAttribute("GlitchShieldRaised") ~= true then
		return false;
	end;
	local v24 = p21:getItemInHand();
	if v24 ~= nil then
		v24 = v24.Name;
	end;
	if v24 ~= l__ItemType__3.GLITCH_INFERNAL_SHIELD then
		return false;
	end;
	if p21:getInstance().PrimaryPart == nil then
		return false;
	end;
	return true;
end;
local v25 = l__KnitClient__18.CreateController(v6.new());
return nil;
