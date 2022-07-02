-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = setmetatable({}, {
	__tostring = function()
		return "KillEffect";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1, p2)
	p1.killerPlayer = p2;
	p1.playDefaultKillEffect = true;
end;
function v3.onKill(p3, p4, p5, p6)

end;
local l__Players__1 = v2.Players;
function v3.isLocalKiller(p7)
	return l__Players__1.LocalPlayer == p7.killerPlayer;
end;
function v3.setPlayDefaultKillEffect(p8, p9)
	p8.playDefaultKillEffect = p9;
end;
function v3.isPlayDefaultKillEffect(p10)
	return p10.playDefaultKillEffect;
end;
function v3.hideCharacter(p11, p12)
	for v5, v6 in ipairs((p12:GetDescendants())) do
		if v6:IsA("BasePart") then
			v6.Transparency = 1;
		elseif v6:IsA("Decal") then
			v6.Transparency = 1;
		elseif v6:IsA("BillboardGui") then
			v6:Destroy();
		end;
	end;
end;
function v3.anchorCharacter(p13, p14)
	for v7, v8 in ipairs((p14:GetDescendants())) do
		if v8:IsA("BasePart") then
			v8.Anchored = true;
		end;
	end;
end;
local l__TweenService__2 = v2.TweenService;
function v3.scaleModel(p15, p16, p17, p18)
	local l__PrimaryPart__9 = p16.PrimaryPart;
	local v10 = nil;
	for v11, v12 in ipairs(p16:GetDescendants()) do
		if v12:IsA("BasePart") then
			v10 = l__TweenService__2:Create(v12, p18, {
				CFrame = l__PrimaryPart__9.CFrame:Lerp(v12.CFrame, p17), 
				Size = v12.Size * p17
			});
			v10:Play();
		end;
	end;
	return v10;
end;
return {
	KillEffect = v3
};
