-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "FovController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local l__StatusModifier__2 = v2.StatusModifier;
local l__MathExtras__3 = v2.MathExtras;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "FovController";
	p1.fovMultiplier = 1;
	p1.fov = 80;
	p1.fovModifier = l__StatusModifier__2.new(function(p2)
		local v7 = 0;
		for v8, v9 in ipairs(p2) do
			if v9.fovMultiplier ~= nil then
				v7 = v7 + l__MathExtras__3:getPercentFromMultiplier(v9.fovMultiplier);
			end;
		end;
		p1.fovMultiplier = l__MathExtras__3:getMultiplierFromPercent(v7);
		p1:setFOV(l__ClientStore__4:getState().Settings.fov);
	end);
end;
local l__Players__5 = v3.Players;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v5.KnitStart(p3)
	u1.KnitStart(p3);
	l__Players__5.LocalPlayer.CharacterAdded:Connect(function()
		p3.fovModifier:clear();
	end);
	l__KnitClient__6.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p4)
		p3:setFOV(l__ClientStore__4:getState().Settings.fov);
	end);
	l__ClientStore__4.changed:connect(function(p5, p6)
		if p5.Settings.fov ~= p6.Settings.fov then
			p3:setFOV(p5.Settings.fov);
		end;
	end);
end;
function v5.addModifier(p7, p8)
	return p7.fovModifier:addModifier(p8);
end;
function v5.getFOV(p9)
	return p9.fov;
end;
local l__DeviceUtil__7 = v2.DeviceUtil;
local l__CameraPerspective__8 = v1.import(script, script.Parent.Parent, "first-person", "camera-perspective").CameraPerspective;
function v5.getBaseFOV(p10)
	local v10 = nil;
	v10 = l__KnitClient__6.Controllers.CameraPerspectiveController:getCameraPerspective();
	if l__DeviceUtil__7.isMobileControls() then
		if v10 == l__CameraPerspective__8.FIRST_PERSON then
			return l__ClientStore__4:getState().Settings.fov;
		else
			return l__ClientStore__4:getState().Settings.fov - 10;
		end;
	end;
	if v10 == l__CameraPerspective__8.FIRST_PERSON then
		return l__ClientStore__4:getState().Settings.fov;
	end;
	return l__ClientStore__4:getState().Settings.fov - 10;
end;
local l__Workspace__9 = v3.Workspace;
function v5.setFOV(p11, p12)
	local v11 = nil;
	v11 = l__KnitClient__6.Controllers.CameraPerspectiveController:getCameraPerspective();
	if l__DeviceUtil__7.isMobileControls() then
		if v11 ~= l__CameraPerspective__8.FIRST_PERSON then
			p12 = p12 - 10;
		end;
	elseif v11 == l__CameraPerspective__8.FIRST_PERSON then
		p12 = p12 + 0;
	else
		p12 = p12 - 10;
	end;
	l__Workspace__9.CurrentCamera.FieldOfView = p12 * p11.fovMultiplier;
	p11.fov = p12 * p11.fovMultiplier;
end;
u1 = l__KnitClient__6.CreateController;
u1 = u1(v5.new());
return nil;
