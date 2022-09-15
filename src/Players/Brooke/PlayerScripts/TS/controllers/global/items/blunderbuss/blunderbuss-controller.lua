-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BlunderbussController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.constructor(p1)
	l__HandKnitController__4.constructor(p1);
	p1.Name = "BlunderbussController";
	p1.maid = u1.new();
end;
function v5.KnitStart(p2)
	l__HandKnitController__4.KnitStart(p2);
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v5.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__2.BLUNDERBUSS;
end;
local l__UserInputService__3 = v3.UserInputService;
local l__HttpService__4 = v3.HttpService;
local l__ContextActionService__5 = v3.ContextActionService;
function v5.onEnable(p5, p6, p7)
	if l__UserInputService__3.TouchEnabled then
		p5.maid:GiveTask(l__UserInputService__3.TouchTapInWorld:Connect(function(p8, p9)
			if not p9 then
				p5:fire();
			end;
		end));
	end;
	local v7 = "shoot-blunderbuss:" .. l__HttpService__4:GenerateGUID(false);
	l__ContextActionService__5:BindAction(v7, function(p10, p11, p12)
		if p11 == Enum.UserInputState.Begin then
			p5:fire();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p5.maid:GiveTask(function()
		l__ContextActionService__5:UnbindAction(v7);
	end);
end;
function v5.onDisable(p13)
	p13.maid:DoCleaning();
end;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__getItemMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__Players__8 = v3.Players;
local l__GameQueryUtil__9 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__ProjectileHandler__10 = v1.import(script, script.Parent.Parent.Parent, "combat", "projectile", "projectile-handler").ProjectileHandler;
local l__KnitClient__11 = v2.KnitClient;
function v5.fire(p14)
	if l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown("blunderbuss-shot") then
		if l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown("blunderbuss-shot") < 0.2 then
			l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback("blunderbuss-shot", "callback", function()
				p14:fire();
			end);
		end;
		return nil;
	end;
	l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown("blunderbuss-shot", l__getItemMeta__7(l__ItemType__2.BLUNDERBUSS).projectileSource.fireDelaySec);
	local l__UnitRay__8 = l__Players__8.LocalPlayer:GetMouse().UnitRay;
	local v9 = l__GameQueryUtil__9:raycast(l__UnitRay__8.Origin, l__UnitRay__8.Direction * 600);
	local v10 = l__UnitRay__8.Origin + l__UnitRay__8.Direction * 100;
	if v9 then
		v10 = v9.Position;
	end;
	local v11 = l__ProjectileHandler__10.new(1, 1, "blunderbuss_bullet", nil, v10, Vector3.new(0, 2, 0));
	local v12 = p14:getHandItem();
	if not v12 then
		return nil;
	end;
	local v13 = l__getItemMeta__7(v12.itemType);
	if v13.projectileSource then
		l__KnitClient__11.Controllers.ProjectileController:launchProjectile(v12.tool.Name, nil, v11, v12.tool, v13.projectileSource, nil, l__ItemType__2.BLUNDERBUSS_BULLET);
	end;
end;
local v14 = v2.KnitClient.CreateController(v5.new());
return nil;
