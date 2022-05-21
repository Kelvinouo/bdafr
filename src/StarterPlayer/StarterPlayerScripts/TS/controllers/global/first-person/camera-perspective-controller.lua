-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "CameraPerspectiveController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__KnitController__3;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "signal"));
local l__CameraPerspective__4 = v1.import(script, script.Parent, "camera-perspective").CameraPerspective;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "CameraPerspectiveController";
	p1.PerspectiveChanged = u3.new();
	p1.cachedCameraPerspective = l__CameraPerspective__4.THIRD_PERSON;
end;
local l__RunService__5 = v2.RunService;
function u1.KnitStart(p2)
	l__RunService__5:BindToRenderStep("perspective-check", Enum.RenderPriority.Camera.Value, function(p3)
		p2.cachedCameraPerspective = p2:calculateCameraPerspective();
		if p2.cachedCameraPerspective ~= p2.cachedCameraPerspective then
			p2.PerspectiveChanged:Fire(p2.cachedCameraPerspective);
		end;
	end);
end;
local l__Workspace__6 = v2.Workspace;
function u1.calculateCameraPerspective(p4)
	if not l__Workspace__6.CurrentCamera then
		return p4.cachedCameraPerspective;
	end;
	if (l__Workspace__6.CurrentCamera.CFrame.Position - l__Workspace__6.CurrentCamera.Focus.Position).Magnitude <= 1 then
		return l__CameraPerspective__4.FIRST_PERSON;
	end;
	return l__CameraPerspective__4.THIRD_PERSON;
end;
function u1.getCameraPerspective(p5)
	return p5.cachedCameraPerspective;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	CameraPerspectiveController = u2
};
return u1;
