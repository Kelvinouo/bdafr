-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	name = "pirates pop down", 
	event = "Heartbeat"
};
local l__PirateSceneTimestamps__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local l__GameAnimationUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v2.func(p1, p2, p3)
	if p1.elapsedEventTime < l__PirateSceneTimestamps__1.BigExplosionHit + 3 then
		return nil;
	end;
	local function v3(p4, p5, p6, p7)
		local v4 = p2:get(p4);
		if v4 then
			if not (v4.Length * 0.95 < v4.TimePosition) then
				return;
			end;
		else
			local v5 = p2:get(p5);
			if v5 == nil then
				return nil;
			else
				local v6 = v5:FindFirstChildOfClass("AnimationController");
				if v6 == nil then
					return nil;
				else
					local v7 = v6:FindFirstChildOfClass("Animator");
					if v7 == nil then
						return nil;
					else
						v5:SetPrimaryPartCFrame((CFrame.new((CFrame.new((Vector3.new(63.645, 294.231, 239.281))) * CFrame.Angles(0, -0.5235987755982988, 0) * CFrame.new(-6 + 6 * p7, 0, 0)).Position)));
						p2:set(p4, l__GameAnimationUtil__2.playAnimation(v7, p6));
						return;
					end;
				end;
			end;
		end;
		v4.TimePosition = v4.Length * 0.95;
		v4:AdjustSpeed(0);
	end;
	v3("smokeTrack", "smokeModel", l__AnimationType__3.SMOKE_JUMP_DOWN, 3);
	v3("hannahTrack", "hannahModel", l__AnimationType__3.HANNAH_JUMP_DOWN, 2);
	v3("daveyTrack", "daveyModel", l__AnimationType__3.DAVEY_JUMP_DOWN, 1);
end;
return {
	PiratesPopDown = v2
};
