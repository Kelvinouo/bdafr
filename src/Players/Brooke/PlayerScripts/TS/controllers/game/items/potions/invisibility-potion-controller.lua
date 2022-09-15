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
function v3.constructor(p1, ...)
	l__KnitController__2.constructor(p1, ...);
	p1.Name = "InvisibilityPotionController";
	p1.invisibilityMaids = {};
end;
local l__CollectionService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__CollectionService__1:GetInstanceAddedSignal("entity"):Connect(function(p3)
		p3:GetAttributeChangedSignal("Transparency"):Connect(function()
			local v5 = p3:GetAttribute("Transparency");
			if v5 == nil or not (v5 > 0) then
				p2:removeInvisibility(p3);
				return;
			end;
			p2.invisibilityMaids[p3] = p2:setTransparencyOfCharacter(p3, p3:GetAttribute("Transparency"));
		end);
	end);
	l__CollectionService__1:GetInstanceRemovedSignal("entity"):Connect(function(p4)
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
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.setTransparencyOfCharacter(p7, p8, p9)
	local v7 = u2.new();
	local v8 = {};
	local v9 = {};
	local v10, v11, v12 = ipairs(p8:GetDescendants());
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		if not v11:IsA("BasePart") then
			if v11:IsA("Decal") and not v11:IsA("Texture") and v11 ~= p8.PrimaryPart then
				v8[v11] = v11.Transparency;
				v11.Transparency = p9;
			elseif v11:IsA("Beam") or v11:IsA("ParticleEmitter") then
				v9[v11] = v11.Enabled;
				v11.Enabled = false;
			end;
		elseif v11 ~= p8.PrimaryPart then
			v8[v11] = v11.Transparency;
			v11.Transparency = p9;
		elseif v11:IsA("Beam") or v11:IsA("ParticleEmitter") then
			v9[v11] = v11.Enabled;
			v11.Enabled = false;
		end;	
	end;
	v7:GiveTask(function()
		for v13, v14 in pairs(v8) do
			v13.Transparency = v14;
		end;
		for v15, v16 in pairs(v9) do
			v15.Enabled = v16;
		end;
	end);
	return v7;
end;
local v17 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
