-- Script Hash: 9538dd8aeed54a2297c77b41a061ccfe890718eaf1314e308bf100f787a4a4be38ea8566b02a5768edde04a88f8f41de
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "GuidedProjectileSourceController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
local u1 = l__HandKnitController__5;
local l__Maid__2 = v3.Maid;
function v6.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.maid = l__Maid__2.new();
end;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__GuidedProjectileMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "guided-projectile", "guided-projectile-meta").GuidedProjectileMeta;
local l__KnitClient__5 = v3.KnitClient;
local l__default__6 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__ContextActionService__7 = v4.ContextActionService;
local l__DeviceUtil__8 = v2.DeviceUtil;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__10 = v2.MobileButton;
local l__BedwarsUI__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local l__Players__12 = v4.Players;
function v6.onEnable(p3, p4, p5)
	p3.maid:DoCleaning();
	if l__GuidedProjectileMeta__4[l__getItemMeta__3(p4.itemType).guidedProjectileSource.guidedProjectile].persistent ~= true then
		l__ContextActionService__7:BindAction("launch-guided-projectile", function(p6, p7, p8)
			if p7 == Enum.UserInputState.Begin then
				p3:launchProjectile(p4.itemType, p5);
			end;
		end, false, Enum.UserInputType.MouseButton1);
		p3.maid:GiveTask(function()
			l__ContextActionService__7:UnbindAction("launch-guided-projectile");
		end);
		if l__DeviceUtil__8.isMobileControls() then
			p3:setupYield(function()
				local u13 = u9.mount(u9.createElement("ScreenGui", {
					ResetOnSpawn = false
				}, { u9.createElement(l__MobileButton__10, {
						Image = "rbxassetid://6862310392", 
						Position = l__BedwarsUI__11:getActionMobileButtonPosition(), 
						OnClick = function()
							p3:launchProjectile(p4.itemType, p5);
						end
					}) }), l__Players__12.LocalPlayer:WaitForChild("PlayerGui"));
				return function()
					u9.unmount(u13);
				end;
			end);
		end;
		return;
	end;
	local v7 = l__KnitClient__5.Controllers.GuidedProjectileController:getCurrentGuidedProjectile();
	if v7 ~= nil then
		v7 = v7.enabled;
	end;
	if v7 == false then
		l__KnitClient__5.Controllers.GuidedProjectileController:enableGuidedProjectile();
	else
		l__default__6.Debug("Launching guided projectile");
		p3:launchProjectile(p4.itemType, p5);
	end;
	p3.maid:GiveTask(function()
		local v8 = l__KnitClient__5.Controllers.GuidedProjectileController:getCurrentGuidedProjectile();
		if v8 then
			v8.forces.antiGravity.Force = Vector3.new(0, 0, 0);
		end;
		l__KnitClient__5.Controllers.GuidedProjectileController:disableGuidedProjectile(0.5);
	end);
	return nil;
end;
function v6.onDisable(p9)
	p9.maid:DoCleaning();
end;
function v6.launchProjectile(p10, p11, p12)
	p10:onLaunch(p12);
	l__KnitClient__5.Controllers.GuidedProjectileController:launch(p11);
end;
u1 = {
	GuidedProjectileSourceController = v6
};
return u1;
