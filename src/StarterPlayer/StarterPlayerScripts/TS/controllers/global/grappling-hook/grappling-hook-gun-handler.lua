-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util");
local v5 = setmetatable({}, {
	__tostring = function()
		return "GrapplingHookGunHandler";
	end, 
	__index = l__HandKnitController__3
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local l__GrapplingHookFunctions__1 = v4.GrapplingHookFunctions;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.constructor(p1)
	l__HandKnitController__3.constructor(p1);
	p1.Name = "GrapplingHookGunHandler";
	p1.grapplingHook = {
		state = l__GrapplingHookFunctions__1.UNEQUIPPED
	};
	p1.maid = u2.new();
	p1.transitMaid = u2.new();
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SharedSyncEvents__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local l__Players__5 = v2.Players;
function v5.KnitStart(p2)
	l__HandKnitController__3.KnitStart(p2);
	l__default__3.Client:Get("RemoteName"):Connect(function(p3)
		p2.transitMaid:DoCleaning();
	end);
	l__SharedSyncEvents__4.HookFunctionSwapEvent:connect(function(p4)
		if p4.player ~= l__Players__5.LocalPlayer then
			return nil;
		end;
		p2.grapplingHook.state = p4.hookFunction;
	end);
end;
function v5.getHookState(p5)
	return p5.grapplingHook.state;
end;
function v5.setHookState(p6, p7)
	p6.grapplingHook.state = p7;
end;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v5.isRelevantItem(p8, p9)
	return p9.itemType == l__ItemType__6.GRAPPLING_HOOK;
end;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
function v5.onEnable(p10, p11, p12)
	p10.grapplingHook.state = l__GrapplingHookFunctions__1.HOOK_CHAMBERED;
	l__SharedSyncEvents__4.HookFunctionSwapEvent:fire(l__Players__5.LocalPlayer, l__GrapplingHookFunctions__1.HOOK_CHAMBERED);
	p10.maid:GiveTask(function()
		p10.grapplingHook.state = l__GrapplingHookFunctions__1.UNEQUIPPED;
		l__SharedSyncEvents__4.HookFunctionSwapEvent:fire(l__Players__5.LocalPlayer, l__GrapplingHookFunctions__1.UNEQUIPPED);
	end);
	p10:setupYield(function()
		local v7 = u2.new();
		v7:GiveTask(l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__8.GRAPPLING_HOOK));
		return function()
			v7:DoCleaning();
		end;
	end);
	return nil;
end;
function v5.onDisable(p13)
	p13.maid:DoCleaning();
	return nil;
end;
local l__GameQueryUtil__9 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__Workspace__10 = v2.Workspace;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__KnitClient__12 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__SPEED__13 = v4.SPEED;
local l__RunService__14 = v2.RunService;
local l__FORCE_SCALAR__15 = v4.FORCE_SCALAR;
local l__FORCE_ADDITIVE__16 = v4.FORCE_ADDITIVE;
function v5.transit(p14, p15, p16, p17)
	if p15 ~= l__Players__5.LocalPlayer then
		return nil;
	end;
	local l__Character__8 = p15.Character;
	local v9 = p15.Character;
	if v9 ~= nil then
		v9 = v9:FindFirstChild("Humanoid");
	end;
	if not l__Character__8 or not v9 then
		return nil;
	end;
	local l__PrimaryPart__10 = l__Character__8.PrimaryPart;
	if l__PrimaryPart__10 == nil then
		return nil;
	end;
	if not l__GameQueryUtil__9:raycast(l__PrimaryPart__10.Position + Vector3.new(0, -5, 0), Vector3.new(0, -100, 0)) and v9:GetState() == Enum.HumanoidStateType.Freefall then
		l__Character__8.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, l__Workspace__10.Gravity / 2.4, 0);
	end;
	local l__Magnitude__11 = (p16 - l__Character__8.PrimaryPart.Position).Magnitude;
	local v12 = {
		Name = "LiftForce", 
		Force = Vector3.new(0, 0, 0), 
		Parent = v9.RootPart, 
		ApplyAtCenterOfMass = true, 
		RelativeTo = Enum.ActuatorRelativeTo.World
	};
	local v13 = v9.RootPart;
	if v13 ~= nil then
		v13 = v13:WaitForChild("RootRigAttachment");
	end;
	v12.Attachment0 = v13;
	local v14 = u11("VectorForce", v12);
	local v15 = l__KnitClient__12.Controllers.SprintController:getMovementStatusModifier():addModifier({
		constantSpeedMultiplier = l__SPEED__13
	});
	v9:ChangeState(Enum.HumanoidStateType.Freefall);
	local l__AssemblyMass__17 = l__PrimaryPart__10.AssemblyMass;
	l__RunService__14:BindToRenderStep("GrappleHook", Enum.RenderPriority.Last.Value, function()
		local v16 = p15.Character;
		if v16 ~= nil then
			v16 = v16.PrimaryPart;
			if v16 ~= nil then
				v16 = v16.Position;
			end;
		end;
		if v16 == nil then
			return nil;
		end;
		local l__Unit__17 = (p16 - v16).Unit;
		v9:Move(l__Unit__17, false);
		v14.Force = (l__Unit__17 * l__FORCE_SCALAR__15 + l__FORCE_ADDITIVE__16) * l__AssemblyMass__17;
	end);
	p14.transitMaid:GiveTask(function()
		l__RunService__14:UnbindFromRenderStep("GrappleHook");
		v14:Destroy();
		v15.Destroy();
		v9:ChangeState(Enum.HumanoidStateType.Landed);
	end);
end;
local v18 = l__KnitClient__12.CreateController(v5.new());
return {
	GrapplingHookGunHandler = v5
};
