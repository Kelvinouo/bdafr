-- Decompiled with the Synapse X Luau decompiler.

local l__ItemType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v2 = {};
local v3 = { {
		rage = 0, 
		item = l__ItemType__1.WOOD_SWORD
	}, {
		rage = 120, 
		item = l__ItemType__1.STONE_SWORD
	}, {
		rage = 350, 
		item = l__ItemType__1.IRON_SWORD
	}, {
		rage = 750, 
		item = l__ItemType__1.DIAMOND_SWORD
	}, {
		rage = 1300, 
		item = l__ItemType__1.RAGEBLADE
	} };
v2.SwordProgression = v3;
v2.FULL_RAGE = 1300;
local u1 = v3;
function v2.getSwordProgress(p1)
	if p1 == nil then
		return {
			prev = u1[1], 
			next = u1[2]
		};
	end;
	local v4 = p1:GetAttribute("BarbarianRageLevel");
	if v4 == nil then
		v4 = 0;
	end;
	local v5 = u1[1];
	local v6 = nil;
	local v7 = 0;
	local v8 = false;
	while true do
		if v8 then
			v7 = v7 + 1;
		else
			v8 = true;
		end;
		if not (v7 < #u1) then
			break;
		end;
		if not (u1[v7 + 1].rage <= v4) then
			v6 = u1[v7 + 1];
			break;
		end;
		v5 = u1[v7 + 1];	
	end;
	return {
		prev = v5, 
		next = v6
	};
end;
function v2.updateAppearance(p2, p3)
	local v9 = v2.FULL_RAGE <= p3;
	local v10, v11, v12 = ipairs(p2:GetDescendants());
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		v12 = v10;
		if v11.Name == "FullRageRed" and v11:IsA("BasePart") then
			if v9 then
				local v13 = Color3.fromRGB(255, 73, 73);
			else
				v13 = Color3.fromRGB(0, 0, 0);
			end;
			v11.Color = v13;
		elseif v11.Name == "FullRageEnabled" and (v11:IsA("ParticleEmitter") or v11:IsA("Trail")) then
			v11.Enabled = v9;
		end;	
	end;
end;
u1 = {
	BarbarianKit = v2
};
return u1;
