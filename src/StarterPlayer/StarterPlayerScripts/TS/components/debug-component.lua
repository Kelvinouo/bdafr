-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "DebugPartComponent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
local l__IS_DEV__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "shared-constants").IS_DEV;
function v1.constructor(p1, p2)
	if not p2:IsA("BasePart") then
		error("Any instance with DebugPart tag must be a BasePart");
	end;
	p2.CanCollide = false;
	if l__IS_DEV__1 then
		local v3 = 0.5;
	else
		v3 = 1;
	end;
	p2.Transparency = v3;
end;
function v1.Destroy(p3)

end;
v1.Tag = "DebugPart";
return v1;
