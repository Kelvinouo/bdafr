-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "BlacksmithComponent";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__RandomUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).RandomUtil;
function v2.constructor(p1, p2)
	p1.sounds = { "rbxassetid://6878374361", "rbxassetid://6878374328", "rbxassetid://6878374407" };
	local v4 = p2:WaitForChild("blacksmith"):WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u1("Animation", {
		AnimationId = "rbxassetid://6898063256"
	}));
	v4.Looped = true;
	v4:Play();
	v4:GetMarkerReachedSignal("SwordHit"):Connect(function()
		local v5 = u1("Sound", {
			SoundId = l__RandomUtil__2.fromList(unpack(p1.sounds)), 
			RollOffMinDistance = 20, 
			RollOffMaxDistance = 40, 
			Volume = 0.06, 
			Playing = true, 
			Parent = p2
		});
		v5.Ended:Connect(function()
			return v5:Destroy();
		end);
	end);
end;
function v2.Destroy(p3)

end;
v2.Tag = "Blacksmith";
return v2;
