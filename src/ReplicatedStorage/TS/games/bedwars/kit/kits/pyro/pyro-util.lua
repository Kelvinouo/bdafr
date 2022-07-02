-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	FLAMETHROWER_COOLDOWN_SEC = 5
};
local function u1(p1)
	local v3 = {};
	local v4 = 0;
	local v5, v6, v7 = ipairs((p1:GetDescendants()));
	while true do
		local v8, v9 = v5(v6, v7);
		if not v8 then
			break;
		end;
		if (v9:IsA("ParticleEmitter") or v9:IsA("Light")) == true then
			v4 = v4 + 1;
			v3[v4] = v9;
		end;	
	end;
	return v3;
end;
function v2.getFireParticles(p2)
	local v10 = {};
	local v11 = 0;
	local v12, v13, v14 = ipairs((u1(p2)));
	while true do
		local v15, v16 = v12(v13, v14);
		if not v15 then
			break;
		end;
		local v17 = v16:IsA("ParticleEmitter") and v16.Name == "FireParticle";
		if v17 == true then
			v11 = v11 + 1;
			v10[v11] = v16;
		end;	
	end;
	return v10;
end;
function v2.getSmokeParticles(p3)
	local v18 = {};
	local v19 = 0;
	local v20, v21, v22 = ipairs((u1(p3)));
	while true do
		local v23, v24 = v20(v21, v22);
		if not v23 then
			break;
		end;
		local v25 = v24:IsA("ParticleEmitter") and v24.Name == "SmokeParticle";
		if v25 == true then
			v19 = v19 + 1;
			v18[v19] = v24;
		end;	
	end;
	return v18;
end;
function v2.getSparkleParticles(p4)
	local v26 = {};
	local v27 = 0;
	local v28, v29, v30 = ipairs((u1(p4)));
	while true do
		local v31, v32 = v28(v29, v30);
		if not v31 then
			break;
		end;
		local v33 = v32:IsA("ParticleEmitter") and v32.Name == "SparkleParticle";
		if v33 == true then
			v27 = v27 + 1;
			v26[v27] = v32;
		end;	
	end;
	return v26;
end;
function v2.getLights(p5)
	local v34 = {};
	local v35 = 0;
	for v36, v37 in ipairs((u1(p5))) do
		if v37:IsA("Light") == true then
			v35 = v35 + 1;
			v34[v35] = v37;
		end;
	end;
	return v34;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__FlamethrowerUpgrade__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "flamethrower-upgrade").FlamethrowerUpgrade;
function v2.getUpgradesFromFlamethrower(p6)
	local v38 = {};
	for v39, v40 in ipairs(u2.values(l__FlamethrowerUpgrade__3)) do
		local v41 = p6:GetAttribute(v40);
		if v41 == nil then
			v41 = -1;
		end;
		v38[v40] = v41;
	end;
	return v38;
end;
local l__BedwarsShop__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
function v2.setEnabled(p7, p8)
	if not p7.Parent then
		return nil;
	end;
	local v42 = l__BedwarsShop__4.getUpgrade(l__BedwarsShop__4.FlamethrowerUpgrades, l__FlamethrowerUpgrade__3.RANGE);
	local v43 = 1;
	local v44 = p7:GetAttribute(l__FlamethrowerUpgrade__3.RANGE);
	if v44 ~= nil then
		local v45 = v42.tiers[v44 + 1].values[1];
		if v45 == nil then
			v45 = 0;
		end;
		v43 = 1 + v45 / 100;
	end;
	for v46, v47 in ipairs((v2.getSparkleParticles(p7))) do
		v47.Enabled = p8;
		local l__Enabled__48 = v47.Enabled;
	end;
	for v49, v50 in ipairs((v2.getFireParticles(p7))) do
		v50.Enabled = p8;
		v50.Speed = NumberRange.new(25 * v43);
	end;
	for v51, v52 in ipairs((v2.getSmokeParticles(p7))) do
		v52.Enabled = p8;
		v52.Speed = NumberRange.new(15 * v43);
	end;
	for v53, v54 in ipairs((v2.getLights(p7))) do
		v54.Enabled = p8;
		local l__Enabled__55 = v54.Enabled;
	end;
end;
local l__MapUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out).MapUtil;
function v2.setUpgrades(p9, p10)
	for v56, v57 in ipairs(l__MapUtil__5.keys(p10)) do
		p9:SetAttribute(v57, p10[v57]);
	end;
end;
return {
	PyroUtil = v2
};
