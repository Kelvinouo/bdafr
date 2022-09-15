-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = {
	name = "tie up players", 
	event = "Heartbeat", 
	priority = 0
};
local l__PirateSceneTimestamps__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local l__Players__2 = v2.Players;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "plasma").src);
local l__ReplicatedStorage__4 = v2.ReplicatedStorage;
local l__WeldUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v3.func(p1, p2, p3)
	if l__PirateSceneTimestamps__1.BigExplosionHit < p1.elapsedEventTime then
		local l__Character__4 = l__Players__2.LocalPlayer.Character;
		if l__Character__4 then
			l__Character__4.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
			l__Character__4.Humanoid.PlatformStand = true;
			u3.useEffect(function()
				l__Character__4.HumanoidRootPart:ApplyAngularImpulse(Vector3.new(math.random(-30, 30), math.random(-30, 30), math.random(-30, 30)) * l__Character__4.HumanoidRootPart.AssemblyMass);
				l__Players__2.LocalPlayer.CameraMaxZoomDistance = 25;
			end);
		end;
		local v5, v6, v7 = ipairs(l__Players__2:GetPlayers());
		while true do
			v5(v6, v7);
			if not v5 then
				break;
			end;
			v7 = v5;
			if v6.Character and not v6.Character:FindFirstChild("RopePart") then
				local v8 = l__ReplicatedStorage__4.Assets.Misc.LassoWrap:Clone();
				v8.Name = "RopePart";
				v8.Parent = v6.Character;
				local l__UpperTorso__9 = v6.Character:FindFirstChild("UpperTorso");
				if not l__UpperTorso__9 then
					return nil;
				end;
				v8.Rope.CFrame = l__UpperTorso__9.CFrame * CFrame.Angles(0, math.pi / 2, 0);
				l__WeldUtil__5:weldParts(v8.Rope, l__UpperTorso__9);
			end;		
		end;
	end;
end;
return {
	TieUpPlayers = v3
};
