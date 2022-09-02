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
	local v5, v6, v7 = ipairs((p12:GetDescendants()));
	while true do
		v5(v6, v7);
		if not v5 then
			break;
		end;
		v7 = v5;
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
	local v8, v9, v10 = ipairs((p14:GetDescendants()));
	while true do
		v8(v9, v10);
		if not v8 then
			break;
		end;
		v10 = v8;
		if v9:IsA("BasePart") then
			v9.Anchored = true;
		end;	
	end;
end;
local l__TweenService__2 = v2.TweenService;
function v3.scaleModel(p15, p16, p17, p18)
	local l__PrimaryPart__11 = p16.PrimaryPart;
	local v12 = nil;
	local v13, v14, v15 = ipairs(p16:GetDescendants());
	while true do
		v13(v14, v15);
		if not v13 then
			break;
		end;
		v15 = v13;
		if v14:IsA("BasePart") then
			v12 = l__TweenService__2:Create(v14, p18, {
				CFrame = l__PrimaryPart__11.CFrame:Lerp(v14.CFrame, p17), 
				Size = v14.Size * p17
			});
			v12:Play();
		end;	
	end;
	return v12;
end;
return {
	KillEffect = v3
};
