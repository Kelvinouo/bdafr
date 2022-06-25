-- Script Hash: 683e0a8d6acfa08e44ef88338b7b21d22f0c69def2b06be9ef01c1ccd4b31c6d7008a77fda4361d7028f87fc72ef07b4
-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local l__UserInputService__2 = game:GetService("UserInputService");
local l__UserGameSettings__3 = UserSettings():GetService("UserGameSettings");
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserCameraToggleDontSetMouseIconEveryFrame");
end);
local v6 = v4 or v5;
local v7, v8 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserCameraToggleDontSetMouseBehaviorOrRotationTypeEveryFrame");
end);
local v9 = v7 or v8;
local v10 = nil;
if not v6 then
	local v11 = l__Players__1.LocalPlayer;
	if not v11 then
		l__Players__1:GetPropertyChangedSignal("LocalPlayer"):Wait();
		v11 = l__Players__1.LocalPlayer;
	end;
	v10 = v11:GetMouse();
end;
local v12 = require(script.Parent:WaitForChild("CameraInput"));
local v13 = require(script.Parent:WaitForChild("CameraUI"));
if v6 or v9 then
	local v14 = require(script.Parent:WaitForChild("CameraUtils"));
else
	v14 = nil;
end;
local v15 = tick();
v13.setCameraModeToastEnabled(false);
local u1 = false;
local u2 = false;
local u3 = v15;
local u4 = false;
local u5 = false;
return function(p1)
	local v16 = v12.getTogglePan();
	if p1 and v16 ~= u1 then
		u2 = true;
	end;
	if u1 ~= v16 or tick() - u3 > 3 then
		local v17 = v16 and tick() - u3 < 3;
		v13.setCameraModeToastOpen(v17);
		if v16 then
			u2 = false;
		end;
		u3 = tick();
		u1 = v16;
	end;
	if p1 ~= u4 then
		if p1 then
			u5 = v12.getTogglePan();
			v12.setTogglePan(true);
		elseif not u2 then
			v12.setTogglePan(u5);
		end;
	end;
	if p1 then
		if v12.getTogglePan() then
			if v6 then
				v14.setMouseIconOverride("rbxasset://textures/Cursors/CrossMouseIcon.png");
			else
				v10.Icon = "rbxasset://textures/Cursors/CrossMouseIcon.png";
			end;
			if v9 then
				v14.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
				v14.setRotationTypeOverride(Enum.RotationType.CameraRelative);
			else
				l__UserInputService__2.MouseBehavior = Enum.MouseBehavior.LockCenter;
				l__UserGameSettings__3.RotationType = Enum.RotationType.CameraRelative;
			end;
		else
			if v6 then
				v14.restoreMouseIcon();
			else
				v10.Icon = "";
			end;
			if v9 then
				v14.restoreMouseBehavior();
				v14.setRotationTypeOverride(Enum.RotationType.CameraRelative);
			else
				l__UserInputService__2.MouseBehavior = Enum.MouseBehavior.Default;
				l__UserGameSettings__3.RotationType = Enum.RotationType.CameraRelative;
			end;
		end;
	elseif v12.getTogglePan() then
		if v6 then
			v14.setMouseIconOverride("rbxasset://textures/Cursors/CrossMouseIcon.png");
		else
			v10.Icon = "rbxasset://textures/Cursors/CrossMouseIcon.png";
		end;
		if v9 then
			v14.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
			v14.setRotationTypeOverride(Enum.RotationType.MovementRelative);
		else
			l__UserInputService__2.MouseBehavior = Enum.MouseBehavior.LockCenter;
			l__UserGameSettings__3.RotationType = Enum.RotationType.MovementRelative;
		end;
	elseif v12.getHoldPan() then
		if v6 then
			v14.restoreMouseIcon();
		else
			v10.Icon = "";
		end;
		if v9 then
			v14.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition);
			v14.setRotationTypeOverride(Enum.RotationType.MovementRelative);
		else
			l__UserInputService__2.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition;
			l__UserGameSettings__3.RotationType = Enum.RotationType.MovementRelative;
		end;
	else
		if v6 then
			v14.restoreMouseIcon();
		else
			v10.Icon = "";
		end;
		if v9 then
			v14.restoreMouseBehavior();
			v14.restoreRotationType();
		else
			l__UserInputService__2.MouseBehavior = Enum.MouseBehavior.Default;
			l__UserGameSettings__3.RotationType = Enum.RotationType.MovementRelative;
		end;
	end;
	u4 = p1;
end;
