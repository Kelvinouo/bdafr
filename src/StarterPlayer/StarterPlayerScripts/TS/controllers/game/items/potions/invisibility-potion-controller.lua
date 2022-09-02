-- Script Hash: 163201c7202452dc873d14809de2c571907a43cd626faa76333b4b2409721bffdcfc118bc9c7a1d12f3e921ffdf4c3f6
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "InvisibilityPotionController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "InvisibilityPotionController";
	p1.invisibilityMaids = {};
end;
local l__CollectionService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionService__2:GetInstanceAddedSignal("entity"):Connect(function(p3)
		p3:GetAttributeChangedSignal("Transparency"):Connect(function()
			local v5 = p3:GetAttribute("Transparency");
			if v5 == nil or not (v5 > 0) then
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
function v3.removeInvisibility(p5, p6)
	local v6 = p5.invisibilityMaids[p6];
	if v6 ~= nil then
		v6:DoCleaning();
	end;
	p5.invisibilityMaids[p6] = nil;
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.setTransparencyOfCharacter(p7, p8, p9)
	local v7 = u3.new();
	local v8 = {};
	local v9 = {};
	local v10, v11, v12 = ipairs(p8:GetDescendants());
	while true do
		local v13, v14 = v10(v11, v12);
		if not v13 then
			break;
		end;
		if not v14:IsA("BasePart") then
			if v14:IsA("Decal") and not v14:IsA("Texture") and v14 ~= p8.PrimaryPart then
				v8[v14] = v14.Transparency;
				v14.Transparency = p9;
			elseif v14:IsA("Beam") or v14:IsA("ParticleEmitter") then
				v9[v14] = v14.Enabled;
				v14.Enabled = false;
			end;
		elseif v14 ~= p8.PrimaryPart then
			v8[v14] = v14.Transparency;
			v14.Transparency = p9;
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
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
