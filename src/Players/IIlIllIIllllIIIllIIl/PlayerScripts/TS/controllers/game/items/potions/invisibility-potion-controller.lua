-- Script Hash: d311b956d98dd5da3fdf9275c5d6da0ec5c08e9ea0a347f5c63e6843caffef773dac9eb021de39ed402bc130072204df
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
local l__CollectionService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionService__2:GetInstanceAddedSignal("entity"):Connect(function(p3)
		p3:GetAttributeChangedSignal("Transparency"):Connect(function()
			local v6 = p3:GetAttribute("Transparency");
			if v6 == nil or not (v6 > 0) then
				p2:removeInvisibility(p3);
				return;
			end;
			p2.invisibilityMaids[p3] = p2:setTransparencyOfCharacter(p3, p3:GetAttribute("Transparency"));
		end);
	end);
	l__CollectionService__2:GetInstanceRemovedSignal("entity"):Connect(function(p4)
		p2:removeInvisibility(p4);
	end);
end;
function v4.removeInvisibility(p5, p6)
	local v7 = p5.invisibilityMaids[p6];
	if v7 ~= nil then
		v7:DoCleaning();
	end;
	p5.invisibilityMaids[p6] = nil;
end;
local l__Maid__3 = v2.Maid;
function v4.setTransparencyOfCharacter(p7, p8, p9)
	local v8 = l__Maid__3.new();
	local v9 = {};
	local v10 = {};
	local v11, v12, v13 = ipairs(p8:GetDescendants());
	while true do
		local v14, v15 = v11(v12, v13);
		if not v14 then
			break;
		end;
		if not v15:IsA("BasePart") then
			if v15:IsA("Decal") and not v15:IsA("Texture") and v15 ~= p8.PrimaryPart then
				v9[v15] = v15.Transparency;
				v15.Transparency = p9;
			elseif v15:IsA("Beam") or v15:IsA("ParticleEmitter") then
				v10[v15] = v15.Enabled;
				v15.Enabled = false;
			end;
		elseif v15 ~= p8.PrimaryPart then
			v9[v15] = v15.Transparency;
			v15.Transparency = p9;
		elseif v15:IsA("Beam") or v15:IsA("ParticleEmitter") then
			v10[v15] = v15.Enabled;
			v15.Enabled = false;
		end;	
	end;
	v8:GiveTask(function()
		for v16, v17 in pairs(v9) do
			v16.Transparency = v17;
		end;
		for v18, v19 in pairs(v10) do
			v18.Enabled = v19;
		end;
	end);
	return v8;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
