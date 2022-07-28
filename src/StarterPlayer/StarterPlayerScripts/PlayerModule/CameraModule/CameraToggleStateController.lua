-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local l__UserInputService__2 = game:GetService("UserInputService");
local l__UserGameSettings__3 = UserSettings():GetService("UserGameSettings");
local v4 = require(script.Parent:WaitForChild("CameraInput"));
local v5 = require(script.Parent:WaitForChild("CameraUI"));
local v6 = require(script.Parent:WaitForChild("CameraUtils"));
local v7 = tick();
v5.setCameraModeToastEnabled(false);
local u1 = false;
local u2 = false;
local u3 = v7;
local u4 = false;
local u5 = false;
return function(p1)
	local v8 = v4.getTogglePan();
	if p1 and v8 ~= u1 then
		u2 = true;
	end;
	if u1 ~= v8 or tick() - u3 > 3 then
		local v9 = v8 and tick() - u3 < 3;
		v5.setCameraModeToastOpen(v9);
		if v8 then
			u2 = false;
		end;
		u3 = tick();
		u1 = v8;
	end;
	if p1 ~= u4 then
		if p1 then
			u5 = v4.getTogglePan();
			v4.setTogglePan(true);
		elseif not u2 then
			v4.setTogglePan(u5);
		end;
	end;
	if p1 then
		if v4.getTogglePan() then
			v6.setMouseIconOverride("rbxasset://textures/Cursors/CrossMouseIcon.png");
			v6.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
			v6.setRotationTypeOverride(Enum.RotationType.CameraRelative);
		else
			v6.restoreMouseIcon();
			v6.restoreMouseBehavior();
			v6.setRotationTypeOverride(Enum.RotationType.CameraRelative);
		end;
	elseif v4.getTogglePan() then
		v6.setMouseIconOverride("rbxasset://textures/Cursors/CrossMouseIcon.png");
		v6.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
		v6.setRotationTypeOverride(Enum.RotationType.MovementRelative);
	elseif v4.getHoldPan() then
		v6.restoreMouseIcon();
		v6.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition);
		v6.setRotationTypeOverride(Enum.RotationType.MovementRelative);
	else
		v6.restoreMouseIcon();
		v6.restoreMouseBehavior();
		v6.restoreRotationType();
	end;
	u4 = p1;
end;
