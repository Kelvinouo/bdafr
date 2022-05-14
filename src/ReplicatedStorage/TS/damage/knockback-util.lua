-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local u1 = nil;
local u2 = nil;
function v2.applyKnockback(p1, p2, p3, p4)
	return u2(p1, p2, u1(p1, p3), p4);
end;
u1 = function(p5, p6)
	if not p6 then
		return Vector3.new(0, 0, 0);
	end;
	local v3 = p6;
	if v3 ~= nil then
		v3 = v3.X;
	end;
	local v4 = v3;
	if v4 == nil then
		v4 = 0;
	end;
	local v5 = p6;
	if v5 ~= nil then
		v5 = v5.Z;
	end;
	local v6 = v5;
	if v6 == nil then
		v6 = 0;
	end;
	local v7 = Vector3.new(p5.Position.X, 0, p5.Position.Z) - Vector3.new(v4, 0, v6);
	if v7.Magnitude == 0 then
		return Vector3.new(0, 0, 0);
	end;
	return v7.Unit;
end;
local u3 = nil;
function v2.calculateKnockbackVelocityRelative(p7, p8, p9, p10)
	return u3(u1(p7, p9), p8, p10);
end;
local u4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ConstantManager.registerConstants(script, {
	kbUpwardStrength = 10000, 
	kbDirectionStrength = 11750, 
	kbStandardMass = 300
});
u3 = function(p11, p12, p13)
	if p11.Magnitude == 0 then
		return Vector3.new(0, 0, 0);
	end;
	local v8 = p13;
	if v8 ~= nil then
		v8 = v8.vertical;
	end;
	local v9 = v8;
	if v9 == nil then
		v9 = 1;
	end;
	local v10 = p13;
	if v10 ~= nil then
		v10 = v10.horizontal;
	end;
	local v11 = v10;
	if v11 == nil then
		v11 = 1;
	end;
	local v12 = Vector3.new(0, u4.kbUpwardStrength * v9, 0);
	p11 = p11.Unit * (u4.kbDirectionStrength * v11);
	return (v12 + p11) * (p12 / u4.kbStandardMass);
end;
v2.calculateKnockbackVelocity = u3;
local function u5(p14)
	local v13 = p14:FindFirstChildWhichIsA("Humanoid");
	if v13 then
		return v13;
	end;
	if not p14.Parent then
		return nil;
	end;
	return u5(p14.Parent);
end;
u2 = function(p15, p16, p17, p18)
	if p17.Magnitude == 0 then
		return Vector3.new(0, 0, 0);
	end;
	local v14 = u3(p17, p16, p18);
	local v15 = u5(p15);
	if v15 then
		v15.PlatformStand = true;
		v1.Promise.delay(0):andThen(function()
			if v15.Parent then
				v15.PlatformStand = false;
			end;
		end);
	end;
	p15:ApplyImpulse(v14);
	return v14;
end;
v2.applyKnockbackDirection = u2;
return {
	KnockbackUtil = v2
};
