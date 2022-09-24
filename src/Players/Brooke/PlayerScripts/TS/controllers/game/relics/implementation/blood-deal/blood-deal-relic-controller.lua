-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BaseRelicController__2 = v1.import(script, script.Parent.Parent.Parent, "base-relic-controller").BaseRelicController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BloodDealRelicController";
	end, 
	__index = l__BaseRelicController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__RelicType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-type").RelicType;
function v3.constructor(p1)
	l__BaseRelicController__2.constructor(p1, l__RelicType__1.BLOOD_DEAL);
	p1.Name = "BloodDealRelicController";
end;
function v3.onActivated(p2)

end;
function v3.deactivate(p3)

end;
local v5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return {
	BloodDealRelicController = v3
};
