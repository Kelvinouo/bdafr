
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "InvisibilityPotionController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "InvisibilityPotionController";
	p1.invisibilityMaids = {};
end;
local l__WatchCharacter__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCharacter__2(function(p3, p4, p5)
		p4:GetAttributeChangedSignal("Transparency"):Connect(function()
			if p4:GetAttribute("Transparency") == nil then
				p2:removeInvisibility(p4);
				return;
			end;
			p2.invisibilityMaids[p4] = p2:setTransparencyOfCharacter(p4, p4:GetAttribute("Transparency"));
			p5:GiveTask(function()
				p2:removeInvisibility(p4);
			end);
		end);
	end);
end;
function v4.removeInvisibility(p6, p7)
	local v6 = p6.invisibilityMaids[p7];
	if v6 ~= nil then
		v6:DoCleaning();
	end;
	p6.invisibilityMaids[p7] = nil;
end;
local l__Maid__3 = v2.Maid;
function v4.setTransparencyOfCharacter(p8, p9, p10)
	local v7 = l__Maid__3.new();
	local v8 = {};
	local v9 = {};
	local v10, v11, v12 = ipairs(p9:GetDescendants());
	while true do
		local v13, v14 = v10(v11, v12);
		if not v13 then
			break;
		end;
		if (v14:IsA("BasePart") or v14:IsA("Decal")) and v14 ~= p9.PrimaryPart then
			v8[v14] = v14.Transparency;
			v14.Transparency = p10;
		elseif v14:IsA("Beam") or v14:IsA("ParticleEmitter") then
			v9[v14] = v14.Enabled;
			v14.Enabled = false;
		end;	
	end;
	v7:GiveTask(function()
		for v15, v16 in pairs(v8) do
			v15.Transparency = v16;
		end;
		for v17, v18 in pairs(v9) do
			v17.Enabled = v18;
		end;
	end);
	return v7;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;

