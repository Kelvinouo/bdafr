-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	FLAMETHROWER_COOLDOWN_SEC = 5
};
local u1 = function(p1)
	local v3 = {};
	local v4 = 0;
	local v5, v6, v7 = ipairs((p1:GetDescendants()));
	while true do
		v5(v6, v7);
		if not v5 then
			break;
		end;
		if (v6:IsA("ParticleEmitter") or v6:IsA("Light")) == true then
			v4 = v4 + 1;
			v3[v4] = v6;
		end;	
	end;
	return v3;
end;
function v2.getFireParticles(p2)
	local v8 = {};
	local v9 = 0;
	local v10, v11, v12 = ipairs((u1(p2)));
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		local v13 = v11:IsA("ParticleEmitter") and v11.Name == "FireParticle";
		if v13 == true then
			v9 = v9 + 1;
			v8[v9] = v11;
		end;	
	end;
	return v8;
end;
function v2.getSmokeParticles(p3)
	local v14 = {};
	local v15 = 0;
	local v16, v17, v18 = ipairs((u1(p3)));
	while true do
		v16(v17, v18);
		if not v16 then
			break;
		end;
		local v19 = v17:IsA("ParticleEmitter") and v17.Name == "SmokeParticle";
		if v19 == true then
			v15 = v15 + 1;
			v14[v15] = v17;
		end;	
	end;
	return v14;
end;
function v2.getSparkleParticles(p4)
	local v20 = {};
	local v21 = 0;
	local v22, v23, v24 = ipairs((u1(p4)));
	while true do
		v22(v23, v24);
		if not v22 then
			break;
		end;
		local v25 = v23:IsA("ParticleEmitter") and v23.Name == "SparkleParticle";
		if v25 == true then
			v21 = v21 + 1;
			v20[v21] = v23;
		end;	
	end;
	return v20;
end;
function v2.getLights(p5)
	local v26 = {};
	local v27 = 0;
	local v28, v29, v30 = ipairs((u1(p5)));
	while true do
		v28(v29, v30);
		if not v28 then
			break;
		end;
		v30 = v28;
		if v29:IsA("Light") == true then
			v27 = v27 + 1;
			v26[v27] = v29;
		end;	
	end;
	return v26;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__FlamethrowerUpgrade__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "flamethrower-upgrade").FlamethrowerUpgrade;
function v2.getUpgradesFromFlamethrower(p6)
	local v31 = {};
	local v32, v33, v34 = ipairs(u2.values(l__FlamethrowerUpgrade__3));
	while true do
		v32(v33, v34);
		if not v32 then
			break;
		end;
		v34 = v32;
		local v35 = p6:GetAttribute(v33);
		if v35 == nil then
			v35 = -1;
		end;
		v31[v33] = v35;	
	end;
	return v31;
end;
local l__BedwarsShop__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
function v2.setEnabled(p7, p8)
	if not p7.Parent then
		return nil;
	end;
	local v36 = l__BedwarsShop__4.getUpgrade(l__BedwarsShop__4.FlamethrowerUpgrades, l__FlamethrowerUpgrade__3.RANGE);
	local v37 = 1;
	local v38 = p7:GetAttribute(l__FlamethrowerUpgrade__3.RANGE);
	if v38 ~= nil then
		local v39 = v36.tiers[v38 + 1].values[1];
		if v39 == nil then
			v39 = 0;
		end;
		v37 = 1 + v39 / 100;
	end;
	local v40, v41, v42 = ipairs((v2.getSparkleParticles(p7)));
	while true do
		v40(v41, v42);
		if not v40 then
			break;
		end;
		v42 = v40;
		v41.Enabled = p8;
		local l__Enabled__43 = v41.Enabled;	
	end;
	local v44, v45, v46 = ipairs((v2.getFireParticles(p7)));
	while true do
		v44(v45, v46);
		if not v44 then
			break;
		end;
		v46 = v44;
		v45.Enabled = p8;
		v45.Speed = NumberRange.new(25 * v37);	
	end;
	local v47, v48, v49 = ipairs((v2.getSmokeParticles(p7)));
	while true do
		v47(v48, v49);
		if not v47 then
			break;
		end;
		v49 = v47;
		v48.Enabled = p8;
		v48.Speed = NumberRange.new(15 * v37);	
	end;
	local v50, v51, v52 = ipairs((v2.getLights(p7)));
	while true do
		v50(v51, v52);
		if not v50 then
			break;
		end;
		v52 = v50;
		v51.Enabled = p8;
		local l__Enabled__53 = v51.Enabled;	
	end;
end;
local l__MapUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out).MapUtil;
function v2.setUpgrades(p9, p10)
	local v54, v55, v56 = ipairs(l__MapUtil__5.keys(p10));
	while true do
		v54(v55, v56);
		if not v54 then
			break;
		end;
		v56 = v54;
		p9:SetAttribute(v55, p10[v55]);	
	end;
end;
u1 = {
	PyroUtil = v2
};
return u1;
