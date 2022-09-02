-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "GuidedProjectileSourceController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.constructor(p1, ...)
	l__HandKnitController__4.constructor(p1, ...);
	p1.maid = u1.new();
end;
function v5.KnitStart(p2)
	l__HandKnitController__4.KnitStart(p2);
end;
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__GuidedProjectileMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "guided-projectile", "guided-projectile-meta").GuidedProjectileMeta;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__default__5 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__ContextActionService__6 = v3.ContextActionService;
local l__DeviceUtil__7 = v2.DeviceUtil;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__9 = v2.MobileButton;
local l__BedwarsUI__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local l__Players__11 = v3.Players;
function v5.onEnable(p3, p4, p5)
	p3.maid:DoCleaning();
	if l__GuidedProjectileMeta__3[l__getItemMeta__2(p4.itemType).guidedProjectileSource.guidedProjectile].persistent ~= true then
		l__ContextActionService__6:BindAction("launch-guided-projectile", function(p6, p7, p8)
			if p7 == Enum.UserInputState.Begin then
				p3:launchProjectile(p4.itemType, p5);
			end;
		end, false, Enum.UserInputType.MouseButton1);
		p3.maid:GiveTask(function()
			l__ContextActionService__6:UnbindAction("launch-guided-projectile");
		end);
		if l__DeviceUtil__7.isMobileControls() then
			p3:setupYield(function()
				local u12 = u8.mount(u8.createElement("ScreenGui", {
					ResetOnSpawn = false
				}, { u8.createElement(l__MobileButton__9, {
						Image = "rbxassetid://6862310392", 
						Position = l__BedwarsUI__10:getActionMobileButtonPosition(), 
						OnClick = function()
							p3:launchProjectile(p4.itemType, p5);
						end
					}) }), l__Players__11.LocalPlayer:WaitForChild("PlayerGui"));
				return function()
					u8.unmount(u12);
				end;
			end);
		end;
		return;
	end;
	local v6 = l__KnitClient__4.Controllers.GuidedProjectileController:getCurrentGuidedProjectile();
	if v6 ~= nil then
		v6 = v6.enabled;
	end;
	if v6 == false then
		l__KnitClient__4.Controllers.GuidedProjectileController:enableGuidedProjectile();
	else
		l__default__5.Debug("Launching guided projectile");
		p3:launchProjectile(p4.itemType, p5);
	end;
	p3.maid:GiveTask(function()
		local v7 = l__KnitClient__4.Controllers.GuidedProjectileController:getCurrentGuidedProjectile();
		if v7 then
			v7.forces.antiGravity.Force = Vector3.new(0, 0, 0);
		end;
		l__KnitClient__4.Controllers.GuidedProjectileController:disableGuidedProjectile(0.5);
	end);
	return nil;
end;
function v5.onDisable(p9)
	p9.maid:DoCleaning();
end;
function v5.launchProjectile(p10, p11, p12)
	p10:onLaunch(p12);
	l__KnitClient__4.Controllers.GuidedProjectileController:launch(p11);
end;
return {
	GuidedProjectileSourceController = v5
};
