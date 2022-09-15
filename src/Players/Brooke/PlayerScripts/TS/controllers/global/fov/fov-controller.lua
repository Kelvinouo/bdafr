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
local l__StatusModifier__1 = v2.StatusModifier;
local l__MathExtras__2 = v2.MathExtras;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "FovController";
	p1.fovMultiplier = 1;
	p1.fov = 80;
	p1.fovModifier = l__StatusModifier__1.new(function(p2)
		local v7 = 0;
		local v8, v9, v10 = ipairs(p2);
		while true do
			v8(v9, v10);
			if not v8 then
				break;
			end;
			v10 = v8;
			if v9.fovMultiplier ~= nil then
				v7 = v7 + l__MathExtras__2:getPercentFromMultiplier(v9.fovMultiplier);
			end;		
		end;
		p1.fovMultiplier = l__MathExtras__2:getMultiplierFromPercent(v7);
		p1:setFOV(l__ClientStore__3:getState().Settings.fov);
	end);
end;
local l__Players__4 = v3.Players;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v5.KnitStart(p3)
	l__KnitController__4.KnitStart(p3);
	l__Players__4.LocalPlayer.CharacterAdded:Connect(function()
		p3.fovModifier:clear();
	end);
	l__KnitClient__5.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p4)
		p3:setFOV(l__ClientStore__3:getState().Settings.fov);
	end);
	l__ClientStore__3.changed:connect(function(p5, p6)
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
local l__DeviceUtil__6 = v2.DeviceUtil;
local l__CameraPerspective__7 = v1.import(script, script.Parent.Parent, "first-person", "camera-perspective").CameraPerspective;
function v5.getBaseFOV(p10)
	local v11 = nil;
	v11 = l__KnitClient__5.Controllers.CameraPerspectiveController:getCameraPerspective();
	if l__DeviceUtil__6.isMobileControls() then
		if v11 == l__CameraPerspective__7.FIRST_PERSON then
			return l__ClientStore__3:getState().Settings.fov;
		else
			return l__ClientStore__3:getState().Settings.fov - 10;
		end;
	end;
	if v11 == l__CameraPerspective__7.FIRST_PERSON then
		return l__ClientStore__3:getState().Settings.fov;
	end;
	return l__ClientStore__3:getState().Settings.fov - 10;
end;
local l__Workspace__8 = v3.Workspace;
function v5.setFOV(p11, p12)
	local v12 = nil;
	v12 = l__KnitClient__5.Controllers.CameraPerspectiveController:getCameraPerspective();
	if l__DeviceUtil__6.isMobileControls() then
		if v12 ~= l__CameraPerspective__7.FIRST_PERSON then
			p12 = p12 - 10;
		end;
	elseif v12 == l__CameraPerspective__7.FIRST_PERSON then
		p12 = p12 + 0;
	else
		p12 = p12 - 10;
	end;
	l__Workspace__8.CurrentCamera.FieldOfView = p12 * p11.fovMultiplier;
	p11.fov = p12 * p11.fovMultiplier;
end;
local v13 = l__KnitClient__5.CreateController(v5.new());
return nil;
