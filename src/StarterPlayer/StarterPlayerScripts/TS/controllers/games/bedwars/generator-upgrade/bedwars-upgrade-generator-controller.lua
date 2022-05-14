-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BedwarsUpgradeGeneratorController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__KnitController__3;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "BedwarsUpgradeGeneratorController";
end;
local l__DeviceUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
function u1.KnitStart(p2)
	l__KnitClient__2.Controllers.InteractionRegistryController:RegisterInteraction({
		interactionLabel = "Team Upgrades", 
		interactionObjectText = "Open", 
		interactionTag = "BedwarsTeamUpgrader", 
		instantActivation = true, 
		clickablePrompt = l__DeviceUtil__3.isMobileControls(), 
		onInteracted = function()
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__5.BEDWARS_UPGRADE_SHOP, {});
		end
	});
end;
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	BedwarsUpgradeGeneratorController = u2
};
return u1;
