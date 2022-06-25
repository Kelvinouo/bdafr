-- Script Hash: 2bded784593d5a4eeaf0b8d556864cd2db8a79ff5ba95104d0a89b37a0a7d9fe1299c96b4c5c45a4df6de3bd149c4ac6
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__LegacyKitKnitController__2 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "ShielderKitController";
	end, 
	__index = l__LegacyKitKnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__LegacyKitKnitController__2;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function u1.constructor(p1)
	u2.constructor(p1, { l__BedwarsKit__3.SHIELDER });
	p1.Name = "ShielderKitController";
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__ContentProvider__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContentProvider;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function u1.onKitEnabled(p3)
	v1.Promise.defer(function()
		l__ContentProvider__4:PreloadAsync({ u5("Animation", {
				AnimationId = "rbxassetid://7050488867"
			}) });
	end);
end;
function u1.onKitDisabled(p4)

end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ShielderKitController = u2
};
return u1;
