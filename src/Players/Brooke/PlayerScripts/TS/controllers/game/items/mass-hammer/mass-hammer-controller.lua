-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local l__MASS_HAMMER__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId.MASS_HAMMER;
local v6 = setmetatable({}, {
	__tostring = function()
		return "MassHammerController";
	end, 
	__index = l__HandKnitController__4
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.constructor(p1)
	l__HandKnitController__4.constructor(p1);
	p1.Name = "MassHammerController";
	p1.maid = u1.new();
	p1.cooldownHasEnded = true;
	p1.hasWeapon = false;
end;
local l__RunService__2 = v3.RunService;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ActionButton__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ActionButton;
local l__ContextActionService__6 = v3.ContextActionService;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__8 = v3.Players;
function v6.KnitStart(p2)
	l__HandKnitController__4.KnitStart(p2);
	l__RunService__2.Heartbeat:Connect(function()
		if p2.cooldownHasEnded ~= true or p2.hasWeapon ~= true then
			if p2.useAbilityMaid then
				p2.useAbilityMaid:DoCleaning();
				p2.useAbilityMaid = nil;
			end;
			return;
		end;
		if p2.useAbilityMaid ~= nil then
			return nil;
		end;
		p2.useAbilityMaid = u1.new();
		p2.useAbilityMaid:GiveTask((l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(l__ActionButton__5, {
			actionName = "use-mass_hammer", 
			interactionKey = Enum.KeyCode.F, 
			gamepadInteractionKey = Enum.KeyCode.ButtonB, 
			onActivated = function()
				p2:activateAbility();
			end, 
			text = "Mass Hammer"
		}))));
		p2.useAbilityMaid:GiveTask(function()
			l__ContextActionService__6:UnbindAction("use-mass_hammer");
		end);
	end);
	l__default__7.Client:OnEvent("RemoteName", function(p3)
		if not l__Players__8.LocalPlayer.Character then
			return nil;
		end;
		p2:speedScale(l__Players__8.LocalPlayer.Character, p3.speed);
	end);
	l__default__7.Client:OnEvent("RemoteName", function()
		p2.cooldownHasEnded = true;
	end);
	l__default__7.Client:OnEvent("RemoteName", function()
		p2:cleanUpDuty();
		p2.cooldownHasEnded = false;
	end);
end;
function v6.activateAbility(p4)
	p4.cooldownHasEnded = false;
	l__default__7.Client:Get("RemoteName"):SendToServer();
end;
local l__ItemType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v6.isRelevantItem(p5, p6)
	return p6.itemType == l__ItemType__9.MASS_HAMMER;
end;
function v6.onEnable(p7, p8, p9)
	p7.hasWeapon = true;
end;
function v6.onDisable(p10)
	p10.hasWeapon = false;
	p10.maid:DoCleaning();
	p10:cleanUpDuty();
end;
local l__KnitClient__10 = v2.KnitClient;
function v6.speedScale(p11, p12, p13)
	local l__Humanoid__8 = p12:WaitForChild("Humanoid");
	p11.maid:DoCleaning();
	if l__Humanoid__8 then
		p11.maid:GiveTask(l__KnitClient__10.Controllers.SprintController:getMovementStatusModifier():addModifier({
			moveSpeedMultiplier = p13
		}));
	end;
end;
function v6.cleanUpDuty(p14)
	if p14.useAbilityMaid then
		p14.useAbilityMaid:DoCleaning();
		p14.useAbilityMaid = nil;
	end;
end;
local v9 = v2.KnitClient.CreateController(v6.new());
return nil;
