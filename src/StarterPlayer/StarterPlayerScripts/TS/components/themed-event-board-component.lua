-- Script Hash: 9880f45a51f00f03f00423d755ee0596f73aab250dc16a3590a887928b190c37db5864bddd08b1b67dffe23cb37b45cd
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "ThemedEventBoardComponent";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
function v2.constructor(p1, p2)
	l__KnitClient__1.Controllers.ThemedEventController:mountEventBoard(p2);
end;
function v2.Destroy(p3)

end;
v2.Tag = "ThemedEventBoard";
return v2;
