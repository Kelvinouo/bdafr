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
	local v5 = p12:GetDescendants();
	local function v6(p13)
		if p13:IsA("BasePart") then
			p13.Transparency = 1;
			return;
		end;
		if p13:IsA("Decal") then
			p13.Transparency = 1;
			return;
		end;
		if p13:IsA("BillboardGui") then
			p13:Destroy();
		end;
	end;
	for v7, v8 in ipairs(v5) do
		v6(v8, v7 - 1, v5);
	end;
end;
function v3.anchorCharacter(p14, p15)
	local v9 = p15:GetDescendants();
	local function v10(p16)
		if p16:IsA("BasePart") then
			p16.Anchored = true;
		end;
	end;
	for v11, v12 in ipairs(v9) do
		v10(v12, v11 - 1, v9);
	end;
end;
local l__TweenService__2 = v2.TweenService;
function v3.scaleModel(p17, p18, p19, p20)
	local l__PrimaryPart__13 = p18.PrimaryPart;
	local v14 = nil;
	for v15, v16 in ipairs(p18:GetDescendants()) do
		if v16:IsA("BasePart") then
			v14 = l__TweenService__2:Create(v16, p20, {
				CFrame = l__PrimaryPart__13.CFrame:Lerp(v16.CFrame, p19), 
				Size = v16.Size * p19
			});
			v14:Play();
		end;
	end;
	return v14;
end;
return {
	KillEffect = v3
};
