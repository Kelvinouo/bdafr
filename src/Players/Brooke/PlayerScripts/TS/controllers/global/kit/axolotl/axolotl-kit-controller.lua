-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__LegacyKitKnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "legacy-kit-controller").LegacyKitKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "AxolotlKitController";
	end, 
	__index = l__LegacyKitKnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__LegacyKitKnitController__2;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v3.constructor(p1)
	u1.constructor(p1, { l__BedwarsKit__2.AXOLOTL });
	p1.Name = "AxolotlKitController";
end;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ContentProvider__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContentProvider;
function v3.onKitEnabled(p3)
	local v5 = { "rbxassetid://7863780357", "rbxassetid://7863780231", "rbxassetid://7863779927", "rbxassetid://7863780097" };
	local v6 = table.create(#v5);
	for v7, v8 in ipairs(v5) do
		v6[v7] = u3("ImageLabel", {
			Image = v8
		});
	end;
	task.spawn(function()
		l__ContentProvider__4:PreloadAsync(v6);
	end);
end;
function v3.onKitDisabled(p4)

end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
