-- Script Hash: 8f68e5462b24ed8b2eaa541c134892f91ab37aa56384ba8ca03e1048eab5bfd66e7ad70203d3bdeee8be31e5922c5108
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	FLAMETHROWER_COOLDOWN_SEC = 5
};
local function u1(p1)
	local v3 = p1:GetDescendants();
	local function v4(p2)
		return p2:IsA("ParticleEmitter") or p2:IsA("Light");
	end;
	local v5 = {};
	local v6 = 0;
	for v7, v8 in ipairs(v3) do
		if v4(v8, v7 - 1, v3) == true then
			v6 = v6 + 1;
			v5[v6] = v8;
		end;
	end;
	return v5;
end;
function v2.getFireParticles(p3)
	local v9 = u1(p3);
	local function v10(p4)
		local v11 = p4:IsA("ParticleEmitter") and p4.Name == "FireParticle";
		return v11;
	end;
	local v12 = {};
	local v13 = 0;
	for v14, v15 in ipairs(v9) do
		if v10(v15, v14 - 1, v9) == true then
			v13 = v13 + 1;
			v12[v13] = v15;
		end;
	end;
	return v12;
end;
function v2.getSmokeParticles(p5)
	local v16 = u1(p5);
	local function v17(p6)
		local v18 = p6:IsA("ParticleEmitter") and p6.Name == "SmokeParticle";
		return v18;
	end;
	local v19 = {};
	local v20 = 0;
	for v21, v22 in ipairs(v16) do
		if v17(v22, v21 - 1, v16) == true then
			v20 = v20 + 1;
			v19[v20] = v22;
		end;
	end;
	return v19;
end;
function v2.getSparkleParticles(p7)
	local v23 = u1(p7);
	local function v24(p8)
		local v25 = p8:IsA("ParticleEmitter") and p8.Name == "SparkleParticle";
		return v25;
	end;
	local v26 = {};
	local v27 = 0;
	for v28, v29 in ipairs(v23) do
		if v24(v29, v28 - 1, v23) == true then
			v27 = v27 + 1;
			v26[v27] = v29;
		end;
	end;
	return v26;
end;
function v2.getLights(p9)
	local v30 = u1(p9);
	local function v31(p10)
		return p10:IsA("Light");
	end;
	local v32 = {};
	local v33 = 0;
	for v34, v35 in ipairs(v30) do
		if v31(v35, v34 - 1, v30) == true then
			v33 = v33 + 1;
			v32[v33] = v35;
		end;
	end;
	return v32;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__FlamethrowerUpgrade__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "flamethrower-upgrade").FlamethrowerUpgrade;
function v2.getUpgradesFromFlamethrower(p11)
	local v36 = {};
	for v37, v38 in ipairs(u2.values(l__FlamethrowerUpgrade__3)) do
		local v39 = p11:GetAttribute(v38);
		if v39 == nil then
			v39 = -1;
		end;
		v36[v38] = v39;
	end;
	return v36;
end;
local l__BedwarsShop__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
function v2.setEnabled(p12, p13)
	if not p12.Parent then
		return nil;
	end;
	local v40 = l__BedwarsShop__4.getUpgrade(l__BedwarsShop__4.FlamethrowerUpgrades, l__FlamethrowerUpgrade__3.RANGE);
	local v41 = 1;
	local v42 = p12:GetAttribute(l__FlamethrowerUpgrade__3.RANGE);
	if v42 ~= nil then
		local v43 = v40.tiers[v42 + 1].values[1];
		if v43 == nil then
			v43 = 0;
		end;
		v41 = 1 + v43 / 100;
	end;
	local v44 = v2.getSparkleParticles(p12);
	local function v45(p14)
		p14.Enabled = p13;
		return p14.Enabled;
	end;
	for v46, v47 in ipairs(v44) do
		v45(v47, v46 - 1, v44);
	end;
	local v48 = v2.getFireParticles(p12);
	local function v49(p15)
		p15.Enabled = p13;
		p15.Speed = NumberRange.new(25 * v41);
	end;
	for v50, v51 in ipairs(v48) do
		v49(v51, v50 - 1, v48);
	end;
	local v52 = v2.getSmokeParticles(p12);
	local function v53(p16)
		p16.Enabled = p13;
		p16.Speed = NumberRange.new(15 * v41);
	end;
	for v54, v55 in ipairs(v52) do
		v53(v55, v54 - 1, v52);
	end;
	local v56 = v2.getLights(p12);
	local function v57(p17)
		p17.Enabled = p13;
		return p17.Enabled;
	end;
	for v58, v59 in ipairs(v56) do
		v57(v59, v58 - 1, v56);
	end;
end;
local l__MapUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out).MapUtil;
function v2.setUpgrades(p18, p19)
	for v60, v61 in ipairs(l__MapUtil__5.keys(p19)) do
		p18:SetAttribute(v61, p19[v61]);
	end;
end;
return {
	PyroUtil = v2
};
