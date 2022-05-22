-- Script Hash: 13307d013d081f54b6a4b49dbe5f333afccad78e1e3b538793733a14ca274705037b620397d498d5b1d935acf3c170a2
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "BedwarsUI";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
function v2.constructor(p1)

end;
local l__DeviceUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
function v2.getActionBarPosition(p2)
	if l__DeviceUtil__1.isSmallScreen() then
		return UDim2.fromScale(0.5, 0.74);
	end;
	return UDim2.fromScale(0.48, 0.85);
end;
function v2.getTopBarPosition(p3)
	return UDim2.fromScale(0.5, 0.02);
end;
function v2.getActionMobileButtonPosition(p4)
	if not l__DeviceUtil__1.isSmallScreen() then
		return UDim2.fromScale(0.82, 0.47);
	end;
	return UDim2.fromScale(0.84, 0.42);
end;
function v2.getSwordButtonPosition(p5)
	if not l__DeviceUtil__1.isSmallScreen() then
		return UDim2.fromScale(0.78, 0.66);
	end;
	return UDim2.fromScale(0.82, 0.66);
end;
function v2.getBuildButtonPosition(p6)
	if not l__DeviceUtil__1.isSmallScreen() then
		return UDim2.fromScale(0.95, 0.57);
	end;
	return UDim2.fromScale(0.95, 0.5);
end;
return {
	BedwarsUI = v2
};
