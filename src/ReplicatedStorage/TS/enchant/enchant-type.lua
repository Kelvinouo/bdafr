
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.FIRE_1 = "fire_1";
v1.fire_1 = "FIRE_1";
v2.FIRE_2 = "fire_2";
v1.fire_2 = "FIRE_2";
v2.FIRE_3 = "fire_3";
v1.fire_3 = "FIRE_3";
v2.STATIC_1 = "static_1";
v1.static_1 = "STATIC_1";
v2.STATIC_2 = "static_2";
v1.static_2 = "STATIC_2";
v2.STATIC_3 = "static_3";
v1.static_3 = "STATIC_3";
v2.EXECUTE_3 = "execute_3";
v1.execute_3 = "EXECUTE_3";
v2.SHIELD_GEN_1 = "shield_gen_1";
v1.shield_gen_1 = "SHIELD_GEN_1";
v2.SHIELD_GEN_2 = "shield_gen_2";
v1.shield_gen_2 = "SHIELD_GEN_2";
v2.SHIELD_GEN_3 = "shield_gen_3";
v1.shield_gen_3 = "SHIELD_GEN_3";
v2.RAPID_REGEN_1 = "rapid_regen_1";
v1.rapid_regen_1 = "RAPID_REGEN_1";
v2.RAPID_REGEN_2 = "rapid_regen_2";
v1.rapid_regen_2 = "RAPID_REGEN_2";
v2.RAPID_REGEN_3 = "rapid_regen_3";
v1.rapid_regen_3 = "RAPID_REGEN_3";
v2.PLUNDER_2 = "plunder_2";
v1.plunder_2 = "PLUNDER_2";
v2.ANTI_KNOCKBACK_2 = "anti_knockback_2";
v1.anti_knockback_2 = "ANTI_KNOCKBACK_2";
v2.UPDRAFT_2 = "updraft_2";
v1.updraft_2 = "UPDRAFT_2";
v2.CLINGY_2 = "clingy_2";
v1.clingy_2 = "CLINGY_2";
v2.CRITICAL_STRIKE_1 = "critical_strike_1";
v1.critical_strike_1 = "CRITICAL_STRIKE_1";
v2.CRITICAL_STRIKE_2 = "critical_strike_2";
v1.critical_strike_2 = "CRITICAL_STRIKE_2";
v2.CRITICAL_STRIKE_3 = "critical_strike_3";
v1.critical_strike_3 = "CRITICAL_STRIKE_3";
v2.LIFE_STEAL_2 = "life_steal_2";
v1.life_steal_2 = "LIFE_STEAL_2";
local v3 = {};
local v4 = setmetatable({}, {
	__index = v3
});
v4.FIRE = 0;
v3[0] = "FIRE";
v4.STATIC = 1;
v3[1] = "STATIC";
v4.EXECUTE = 2;
v3[2] = "EXECUTE";
v4.SHIELD_GEN = 3;
v3[3] = "SHIELD_GEN";
v4.RAPID_REGEN = 4;
v3[4] = "RAPID_REGEN";
v4.PLUNDER = 5;
v3[5] = "PLUNDER";
v4.ANTI_KNOCKBACK = 6;
v3[6] = "ANTI_KNOCKBACK";
v4.UPDRAFT = 7;
v3[7] = "UPDRAFT";
v4.CLINGY = 8;
v3[8] = "CLINGY";
v4.CRITICAL = 9;
v3[9] = "CRITICAL";
v4.LIFE_STEAL = 10;
v3[10] = "LIFE_STEAL";
local v5 = {};
local v6 = setmetatable({}, {
	__index = v5
});
v6.BASIC = 0;
v5[0] = "BASIC";
v6.ADVANCED = 1;
v5[1] = "ADVANCED";
return {
	EnchantType = v2, 
	EnchantElement = v4, 
	EnchantResearchType = v6
};

