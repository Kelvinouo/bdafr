-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out);
local l__GreedyBlockHandler__3 = v2.GreedyBlockHandler;
local v4 = setmetatable({}, {
	__tostring = function()
		return "SmokeBlockHandler";
	end, 
	__index = l__GreedyBlockHandler__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__GreedyBlockHandler__3;
function v4.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
local l__BlockEngine__2 = v2.BlockEngine;
function v4.place(p2, p3, p4, p5)
	local v6 = u1.createNewInstance(p2, p4);
	v6.CanCollide = false;
	v6.CFrame = CFrame.new(l__BlockEngine__2:getWorldPosition(p3));
	v6:SetAttribute("IgnoreProjectileCollision", true);
	return v6;
end;
function v4.createFace(p6, p7, p8, p9)
	local v7 = u1.createFace(p6, p7, p8, p9);
	v7.Color3 = Color3.fromRGB(63, 63, 63);
	return v7;
end;
function v4.checkCulling(p10)

end;
u1 = {
	SmokeBlockHandler = v4
};
return l__GreedyBlockHandler__3;
