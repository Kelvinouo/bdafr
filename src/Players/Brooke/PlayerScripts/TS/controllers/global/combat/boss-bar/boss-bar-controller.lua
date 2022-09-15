-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BossBarController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "BossBarController";
end;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
end;
local l__Flamework__1 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
function v3.mountBossBar(p3, p4, p5)
	p3:unmountBar();
	p3:updateHealth(p4, p5);
	l__Flamework__1.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__2.BOSS_BAR, {});
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v3.updateHealth(p6, p7, p8)
	if p7 < 0 then
		p7 = 0;
	end;
	if p8 ~= 0 and p8 == p8 and p8 then
		l__ClientStore__3:dispatch({
			type = "BedwarsUpdateBossBar", 
			health = p7, 
			maxHealth = p8
		});
		return;
	end;
	l__ClientStore__3:dispatch({
		type = "BedwarsUpdateBossBar", 
		health = p7
	});
	return nil;
end;
function v3.unmountBar(p9)
	l__Flamework__1.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__2.BOSS_BAR);
end;
local v5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
