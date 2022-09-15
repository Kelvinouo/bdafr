-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	name = "pirates ending cutscene", 
	event = "RenderStepped"
};
local l__PirateSceneTimestamps__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local l__Workspace__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
function v2.func(p1, p2, p3)
	if p1.elapsedEventTime < l__PirateSceneTimestamps__1.BigExplosionHit + 3 then
		return nil;
	end;
	local v3 = p2:get("hannahModel");
	if v3 == nil then
		return nil;
	end;
	l__Workspace__2.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
	l__Workspace__2.CurrentCamera.FieldOfView = 50;
	l__Workspace__2.CurrentCamera.CFrame = CFrame.lookAt(Vector3.new(10.451, 294, 323.074), v3.UpperTorso.Position + Vector3.new(0, 3, 0));
end;
return {
	PirateEndingCutscene = v2
};
