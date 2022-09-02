-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "MissionsController";
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
	p1.Name = "MissionsController";
end;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.getMissionData(p3)
	local l__missionData__5 = p3.missionData;
	if l__missionData__5 then
		return v1.Promise.new(function(p4)
			p4(l__missionData__5);
		end);
	end;
	local v6 = l__default__1.Client:Get("RemoteName"):CallServerAsync();
	v6:andThen(function(p5)
		p3.missionData = p5;
	end);
	return v6;
end;
local v7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
