
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util");
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "GrapplingHookGunHandler";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__HandKnitController__5;
local l__GrapplingHookFunctions__2 = v4.GrapplingHookFunctions;
local l__Maid__3 = v2.Maid;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "GrapplingHookGunHandler";
	p1.grapplingHook = {
		state = l__GrapplingHookFunctions__2.UNEQUIPPED
	};
	p1.maid = l__Maid__3.new();
	p1.transitMaid = l__Maid__3.new();
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SharedSyncEvents__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local l__Players__6 = v3.Players;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__4.Client:Get("FeMRsyok"):Connect(function(p3)
		p2.transitMaid:DoCleaning();
	end);
	l__SharedSyncEvents__5.HookFunctionSwapEvent:connect(function(p4)
		if p4.player ~= l__Players__6.LocalPlayer then
			return nil;
		end;
		p2.grapplingHook.state = p4.hookFunction;
	end);
end;
function v6.getHookState(p5)
	return p5.grapplingHook.state;
end;
function v6.setHookState(p6, p7)
	p6.grapplingHook.state = p7;
end;
local l__ItemType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v6.isRelevantItem(p8, p9)
	return p9.itemType == l__ItemType__7.GRAPPLING_HOOK;
end;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
function v6.onEnable(p10, p11, p12)
	p10.grapplingHook.state = l__GrapplingHookFunctions__2.HOOK_CHAMBERED;
	l__SharedSyncEvents__5.HookFunctionSwapEvent:fire(l__Players__6.LocalPlayer, l__GrapplingHookFunctions__2.HOOK_CHAMBERED);
	p10.maid:GiveTask(function()
		p10.grapplingHook.state = l__GrapplingHookFunctions__2.UNEQUIPPED;
		l__SharedSyncEvents__5.HookFunctionSwapEvent:fire(l__Players__6.LocalPlayer, l__GrapplingHookFunctions__2.UNEQUIPPED);
	end);
	p10:setupYield(function()
		local v8 = l__Maid__3.new();
		v8:GiveTask(l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__9.GRAPPLING_HOOK));
		return function()
			v8:DoCleaning();
		end;
	end);
	return nil;
end;
function v6.onDisable(p13)
	p13.maid:DoCleaning();
	return nil;
end;
local l__GameQueryUtil__10 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__Workspace__11 = v3.Workspace;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__KnitClient__13 = v2.KnitClient;
local l__SPEED__14 = v4.SPEED;
local l__RunService__15 = v3.RunService;
local l__FORCE_SCALAR__16 = v4.FORCE_SCALAR;
local l__FORCE_ADDITIVE__17 = v4.FORCE_ADDITIVE;
function v6.transit(p14, p15, p16, p17)
	if p15 ~= l__Players__6.LocalPlayer then
		return nil;
	end;
	local l__Character__9 = p15.Character;
	local v10 = p15.Character;
	if v10 ~= nil then
		v10 = v10:FindFirstChild("Humanoid");
	end;
	if not l__Character__9 or not v10 then
		return nil;
	end;
	local l__PrimaryPart__11 = l__Character__9.PrimaryPart;
	if l__PrimaryPart__11 == nil then
		return nil;
	end;
	if not l__GameQueryUtil__10:raycast(l__PrimaryPart__11.Position + Vector3.new(0, -5, 0), Vector3.new(0, -100, 0)) and v10:GetState() == Enum.HumanoidStateType.Freefall then
		l__Character__9.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, l__Workspace__11.Gravity / 2.4, 0);
	end;
	local l__Magnitude__12 = (p16 - l__Character__9.PrimaryPart.Position).Magnitude;
	local v13 = {
		Name = "LiftForce", 
		Force = Vector3.new(0, 0, 0), 
		Parent = v10.RootPart, 
		ApplyAtCenterOfMass = true, 
		RelativeTo = Enum.ActuatorRelativeTo.World
	};
	local v14 = v10.RootPart;
	if v14 ~= nil then
		v14 = v14:WaitForChild("RootRigAttachment");
	end;
	v13.Attachment0 = v14;
	local v15 = u12("VectorForce", v13);
	local v16 = l__KnitClient__13.Controllers.SprintController:getMovementStatusModifier():addModifier({
		constantSpeedMultiplier = l__SPEED__14
	});
	v10:ChangeState(Enum.HumanoidStateType.Freefall);
	local l__AssemblyMass__18 = l__PrimaryPart__11.AssemblyMass;
	l__RunService__15:BindToRenderStep("GrappleHook", Enum.RenderPriority.Last.Value, function()
		local v17 = p15.Character;
		if v17 ~= nil then
			v17 = v17.PrimaryPart;
			if v17 ~= nil then
				v17 = v17.Position;
			end;
		end;
		if v17 == nil then
			return nil;
		end;
		local l__Unit__18 = (p16 - v17).Unit;
		v10:Move(l__Unit__18, false);
		v15.Force = (l__Unit__18 * l__FORCE_SCALAR__16 + l__FORCE_ADDITIVE__17) * l__AssemblyMass__18;
	end);
	p14.transitMaid:GiveTask(function()
		l__RunService__15:UnbindFromRenderStep("GrappleHook");
		v15:Destroy();
		v16.Destroy();
		v10:ChangeState(Enum.HumanoidStateType.Landed);
	end);
end;
u1 = l__KnitClient__13.CreateController;
u1 = u1(v6.new());
return {
	GrapplingHookGunHandler = v6
};

