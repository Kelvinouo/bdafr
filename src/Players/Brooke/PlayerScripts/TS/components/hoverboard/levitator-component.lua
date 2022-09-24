-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = setmetatable({}, {
	__tostring = function()
		return "LevitatorComponent";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw");
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid");
local l__LocalPlayer__3 = v2.Players.LocalPlayer;
local l__Workspace__4 = v2.Workspace;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v3.constructor(p1, p2)
	p1.levitator = p2;
	p1.debugRay = u1.ray(Ray.new());
	p1.levitationPid = u2.new(0, 1000, 100, 7, 0);
	local v5 = p2.Parent;
	if v5 ~= nil then
		v5 = v5.Parent;
	end;
	if v5 ~= l__LocalPlayer__3.Character then
		return nil;
	end;
	local v6 = RaycastParams.new();
	v6.FilterDescendantsInstances = { l__Workspace__4:FindFirstChild("Map") };
	v6.FilterType = Enum.RaycastFilterType.Whitelist;
	p1.raycastParams = v6;
	p1.vectorForce = u5("VectorForce", {
		Parent = p2, 
		Attachment0 = u5("Attachment", {
			Parent = p2
		})
	});
	p1.levitationPid:Debug("LevitationPid", l__Workspace__4);
end;
function v3.SteppedUpdate(p3, p4)
	local v7 = p3.levitator.Position + Vector3.new(0, 0.1, 0);
	local v8 = Vector3.new(0, -4, 0);
	u1.updateRay(p3.debugRay, (Ray.new(v7, v8)));
	local v9 = l__Workspace__4:Raycast(v7, v8, p3.raycastParams);
	local v10 = 0;
	if v9 then
		v10 = p3.levitationPid:Calculate(p4, v9.Position.Y + 4, v7.Y);
	end;
	print(v10);
	p3.vectorForce.Force = Vector3.new(0, v10, 0);
end;
function v3.Destroy(p5)

end;
return v3;
