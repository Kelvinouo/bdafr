-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.SWORD_IDLE = 0;
v1[0] = "SWORD_IDLE";
v2.SWORD_SWING = 1;
v1[1] = "SWORD_SWING";
v2.SWORD_SWING_1 = 2;
v1[2] = "SWORD_SWING_1";
v2.SWORD_SWING_2 = 3;
v1[3] = "SWORD_SWING_2";
v2.SWORD_SWING_3 = 4;
v1[4] = "SWORD_SWING_3";
v2.PUNCH = 5;
v1[5] = "PUNCH";
v2.BUILDER_HAMMER_HIT = 6;
v1[6] = "BUILDER_HAMMER_HIT";
v2.EAT = 7;
v1[7] = "EAT";
v2.EQUIP_1 = 8;
v1[8] = "EQUIP_1";
v2.EQUIP_2 = 9;
v1[9] = "EQUIP_2";
v2.EQUIP_3 = 10;
v1[10] = "EQUIP_3";
v2.FP_HOLD = 11;
v1[11] = "FP_HOLD";
v2.FP_HOLD_SWORD = 12;
v1[12] = "FP_HOLD_SWORD";
v2.FP_EQUIP = 13;
v1[13] = "FP_EQUIP";
v2.FP_USE_ITEM = 14;
v1[14] = "FP_USE_ITEM";
v2.FP_SWING_SWORD = 15;
v1[15] = "FP_SWING_SWORD";
v2.FP_CROSSBOW_AIM = 16;
v1[16] = "FP_CROSSBOW_AIM";
v2.FP_CROSSBOW_FIRE = 17;
v1[17] = "FP_CROSSBOW_FIRE";
v2.FP_SHIELD_USE = 18;
v1[18] = "FP_SHIELD_USE";
v2.FP_WALK = 19;
v1[19] = "FP_WALK";
v2.GUITAR_PLAY = 20;
v1[20] = "GUITAR_PLAY";
v2.GUITAR_HEAL = 21;
v1[21] = "GUITAR_HEAL";
v2.LASSO_CHARGE = 22;
v1[22] = "LASSO_CHARGE";
v2.FP_LASSO_CHARGE = 23;
v1[23] = "FP_LASSO_CHARGE";
v2.GRIM_REAPER_CONSUME = 24;
v1[24] = "GRIM_REAPER_CONSUME";
v2.WIZARD_LIGHTNING_CAST = 25;
v1[25] = "WIZARD_LIGHTNING_CAST";
v2.WIZARD_BALL_CAST = 26;
v1[26] = "WIZARD_BALL_CAST";
v2.WIZARD_ABILITY_SWITCH = 27;
v1[27] = "WIZARD_ABILITY_SWITCH";
v2.USE_TABLET = 28;
v1[28] = "USE_TABLET";
v2.SPRAY = 29;
v1[29] = "SPRAY";
v2.FLAMETHROWER_IDLE = 30;
v1[30] = "FLAMETHROWER_IDLE";
v2.FLAMETHROWER_USE = 31;
v1[31] = "FLAMETHROWER_USE";
v2.FLAMETHROWER_UPGRADE = 32;
v1[32] = "FLAMETHROWER_UPGRADE";
v2.RAVEN_LOOP = 33;
v1[33] = "RAVEN_LOOP";
v2.RAVEN_SPAWN = 34;
v1[34] = "RAVEN_SPAWN";
v2.RAVEN_THROW = 35;
v1[35] = "RAVEN_THROW";
v2.BEE_FLAP = 36;
v1[36] = "BEE_FLAP";
v2.NET_CATCH = 37;
v1[37] = "NET_CATCH";
v2.RAVEN_HOLD = 38;
v1[38] = "RAVEN_HOLD";
v2.JADE_HAMMER_IDLE = 39;
v1[39] = "JADE_HAMMER_IDLE";
v2.JADE_HAMMER_SLAM = 40;
v1[40] = "JADE_HAMMER_SLAM";
v2.STATUE = 41;
v1[41] = "STATUE";
v2.ASCEND = 42;
v1[42] = "ASCEND";
v2.DODO_BIRD_IDLE = 43;
v1[43] = "DODO_BIRD_IDLE";
v2.DODO_BIRD_WALK = 44;
v1[44] = "DODO_BIRD_WALK";
v2.DODO_BIRD_JUMP = 45;
v1[45] = "DODO_BIRD_JUMP";
v2.DODO_BIRD_FALL = 46;
v1[46] = "DODO_BIRD_FALL";
v2.DODO_BIRD_FLUTTER = 47;
v1[47] = "DODO_BIRD_FLUTTER";
v2.DODO_BIRD_SQUAWK = 48;
v1[48] = "DODO_BIRD_SQUAWK";
v2.SIT_ON_DODO_BIRD = 49;
v1[49] = "SIT_ON_DODO_BIRD";
v2.CHARGE_SHIELD_CHARGE = 50;
v1[50] = "CHARGE_SHIELD_CHARGE";
v2.ROCKET_LAUNCHER_SHOT = 51;
v1[51] = "ROCKET_LAUNCHER_SHOT";
v2.ROCKET_LAUNCHER_RELOAD = 52;
v1[52] = "ROCKET_LAUNCHER_RELOAD";
v2.ROCKET_LAUNCHER_IDLE = 53;
v1[53] = "ROCKET_LAUNCHER_IDLE";
v2.GRENADE_THROW = 54;
v1[54] = "GRENADE_THROW";
v2.VACUUM_SUCK = 55;
v1[55] = "VACUUM_SUCK";
v2.VACUUM_STARTUP = 56;
v1[56] = "VACUUM_STARTUP";
v2.VACUUM_IDLE = 57;
v1[57] = "VACUUM_IDLE";
v2.VACUUM_GHOST_CAPTURED = 58;
v1[58] = "VACUUM_GHOST_CAPTURED";
v2.VACUUM_LAUNCH = 59;
v1[59] = "VACUUM_LAUNCH";
v2.AXOLOTL_IDLE = 60;
v1[60] = "AXOLOTL_IDLE";
v2.AXOLOTL_SWIM = 61;
v1[61] = "AXOLOTL_SWIM";
v2.AXOLOTL_ABILITY = 62;
v1[62] = "AXOLOTL_ABILITY";
v2.AXOLOTL_SPIN = 63;
v1[63] = "AXOLOTL_SPIN";
v2.AXOLOTL_REINDEER_IDLE = 64;
v1[64] = "AXOLOTL_REINDEER_IDLE";
v2.AXOLOTL_REINDEER_SWIM = 65;
v1[65] = "AXOLOTL_REINDEER_SWIM";
v2.AXOLOTL_REINDEER_ABILITY = 66;
v1[66] = "AXOLOTL_REINDEER_ABILITY";
v2.AXOLOTL_EASTER_IDLE = 67;
v1[67] = "AXOLOTL_EASTER_IDLE";
v2.AXOLOTL_EASTER_SWIM = 68;
v1[68] = "AXOLOTL_EASTER_SWIM";
v2.AXOLOTL_EASTER_ABILITY = 69;
v1[69] = "AXOLOTL_EASTER_ABILITY";
v2.SNAP_TRAP_SETUP = 70;
v1[70] = "SNAP_TRAP_SETUP";
v2.SNAP_TRAP_CLOSE = 71;
v1[71] = "SNAP_TRAP_CLOSE";
v2.TRAPPER_SLASH = 72;
v1[72] = "TRAPPER_SLASH";
v2.FISHING_ROD_CAST = 73;
v1[73] = "FISHING_ROD_CAST";
v2.FISHING_ROD_IDLE = 74;
v1[74] = "FISHING_ROD_IDLE";
v2.FISHING_ROD_PULLING = 75;
v1[75] = "FISHING_ROD_PULLING";
v2.FISHING_ROD_CATCH_FAIL = 76;
v1[76] = "FISHING_ROD_CATCH_FAIL";
v2.FISHING_ROD_CATCH_SUCCESS = 77;
v1[77] = "FISHING_ROD_CATCH_SUCCESS";
v2.GHOST_FLIP = 78;
v1[78] = "GHOST_FLIP";
v2.GHOST_IDLE = 79;
v1[79] = "GHOST_IDLE";
v2.GHOST_SPIN = 80;
v1[80] = "GHOST_SPIN";
v2.SPEAR_THROW = 81;
v1[81] = "SPEAR_THROW";
v2.SPEAR_IDLE = 82;
v1[82] = "SPEAR_IDLE";
v2.SPEAR_STARTUP = 83;
v1[83] = "SPEAR_STARTUP";
v2.OIL_EAT = 84;
v1[84] = "OIL_EAT";
v2.OIL_SPIT = 85;
v1[85] = "OIL_SPIT";
v2.HANG_GLIDER_HANG = 86;
v1[86] = "HANG_GLIDER_HANG";
v2.REPAIR_ENCHANT_TABLE = 87;
v1[87] = "REPAIR_ENCHANT_TABLE";
v2.YETI_ROAR = 88;
v1[88] = "YETI_ROAR";
v2.JELLY_SQUISH = 89;
v1[89] = "JELLY_SQUISH";
v2.ENCHANT_TABLE_LOOP = 90;
v1[90] = "ENCHANT_TABLE_LOOP";
v2.SCYTHE_IDLE = 91;
v1[91] = "SCYTHE_IDLE";
v2.SCYTHE_SWING = 92;
v1[92] = "SCYTHE_SWING";
v2.CHEST_OPEN = 93;
v1[93] = "CHEST_OPEN";
v2.NORMAL_PENGUIN_ATTACK = 94;
v1[94] = "NORMAL_PENGUIN_ATTACK";
v2.NORMAL_PENGUIN_IDLE = 95;
v1[95] = "NORMAL_PENGUIN_IDLE";
v2.NORMAL_PENGUIN_WALK = 96;
v1[96] = "NORMAL_PENGUIN_WALK";
v2.NORMAL_PENGUIN_JUMP = 97;
v1[97] = "NORMAL_PENGUIN_JUMP";
v2.TALL_PENGUIN_ATTACK = 98;
v1[98] = "TALL_PENGUIN_ATTACK";
v2.TALL_PENGUIN_IDLE = 99;
v1[99] = "TALL_PENGUIN_IDLE";
v2.TALL_PENGUIN_WALK = 100;
v1[100] = "TALL_PENGUIN_WALK";
v2.TALL_PENGUIN_JUMP = 101;
v1[101] = "TALL_PENGUIN_JUMP";
v2.BIG_PENGUIN_ATTACK = 102;
v1[102] = "BIG_PENGUIN_ATTACK";
v2.BIG_PENGUIN_IDLE = 103;
v1[103] = "BIG_PENGUIN_IDLE";
v2.BIG_PENGUIN_WALK = 104;
v1[104] = "BIG_PENGUIN_WALK";
v2.BIG_PENGUIN_JUMP = 105;
v1[105] = "BIG_PENGUIN_JUMP";
v2.DAO_CHARGE = 106;
v1[106] = "DAO_CHARGE";
v2.DAO_DASH = 107;
v1[107] = "DAO_DASH";
v2.DUCK_WALK = 108;
v1[108] = "DUCK_WALK";
v2.DUCK_IDLE = 109;
v1[109] = "DUCK_IDLE";
v2.DUCK_ATTACK = 110;
v1[110] = "DUCK_ATTACK";
v2.DUCK_JUMP = 111;
v1[111] = "DUCK_JUMP";
v2.DUCK_HONK = 112;
v1[112] = "DUCK_HONK";
v2.OPEN_CRATE = 113;
v1[113] = "OPEN_CRATE";
v2.TWIRLBLADE_ATTACK_1 = 114;
v1[114] = "TWIRLBLADE_ATTACK_1";
v2.TWIRLBLADE_ATTACK_2 = 115;
v1[115] = "TWIRLBLADE_ATTACK_2";
v2.TWIRLBLADE_ATTACK_SPIN = 116;
v1[116] = "TWIRLBLADE_ATTACK_SPIN";
v2.TWIRLBLADE_ATTACK_IDLE = 117;
v1[117] = "TWIRLBLADE_ATTACK_IDLE";
v2.FP_TWIRLBLADE_ATTACK_1 = 118;
v1[118] = "FP_TWIRLBLADE_ATTACK_1";
v2.FP_TWIRLBLADE_ATTACK_2 = 119;
v1[119] = "FP_TWIRLBLADE_ATTACK_2";
v2.FP_TWIRLBLADE_ATTACK_SPIN = 120;
v1[120] = "FP_TWIRLBLADE_ATTACK_SPIN";
v2.BOW_AIM = 121;
v1[121] = "BOW_AIM";
v2.BOW_FIRE = 122;
v1[122] = "BOW_FIRE";
v2.BOW_DRAW = 123;
v1[123] = "BOW_DRAW";
v2.CROSSBOW_AIM = 124;
v1[124] = "CROSSBOW_AIM";
v2.CROSSBOW_FIRE = 125;
v1[125] = "CROSSBOW_FIRE";
v2.MINER_MINE_STONE = 126;
v1[126] = "MINER_MINE_STONE";
v2.PAINT_SHOTGUN_SHOOT = 127;
v1[127] = "PAINT_SHOTGUN_SHOOT";
v2.PAINT_SHOTGUN_IDLE = 128;
v1[128] = "PAINT_SHOTGUN_IDLE";
v2.FP_PAINT_SHOTGUN_SHOOT = 129;
v1[129] = "FP_PAINT_SHOTGUN_SHOOT";
v2.FP_PAINT_SHOTGUN_IDLE = 130;
v1[130] = "FP_PAINT_SHOTGUN_IDLE";
v2.CARROT_CANNON_SHOOT = 131;
v1[131] = "CARROT_CANNON_SHOOT";
v2.CARROT_CANNON_IDLE = 132;
v1[132] = "CARROT_CANNON_IDLE";
v2.FP_CARROT_CANNON_SHOOT = 133;
v1[133] = "FP_CARROT_CANNON_SHOOT";
v2.FP_CARROT_CANNON_IDLE = 134;
v1[134] = "FP_CARROT_CANNON_IDLE";
v2.ROCK_OUT = 135;
v1[135] = "ROCK_OUT";
v2.PARTY_UP = 136;
v1[136] = "PARTY_UP";
v2.SIDE_TO_SIDE = 137;
v1[137] = "SIDE_TO_SIDE";
v2.SHEEP_WALK = 138;
v1[138] = "SHEEP_WALK";
v2.SHEEP_JUMP = 139;
v1[139] = "SHEEP_JUMP";
v2.SHEEP_IDLE = 140;
v1[140] = "SHEEP_IDLE";
v2.TAME_SHEEP = 141;
v1[141] = "TAME_SHEEP";
v2.NIGHTMARE_LOOP = 142;
v1[142] = "NIGHTMARE_LOOP";
v2.BOBA_BLASTER_IDLE = 143;
v1[143] = "BOBA_BLASTER_IDLE";
v2.BOBA_BLASTER_FIRE = 144;
v1[144] = "BOBA_BLASTER_FIRE";
v2.TORNADO_LAUNCHER_HOLD = 145;
v1[145] = "TORNADO_LAUNCHER_HOLD";
v2.TORNADO_LAUNCHER_SHOOT = 146;
v1[146] = "TORNADO_LAUNCHER_SHOOT";
v2.PAN_SWING = 147;
v1[147] = "PAN_SWING";
v2.PAN_CHARGE = 148;
v1[148] = "PAN_CHARGE";
v2.MELODY_ROCKSTAR_AD = 149;
v1[149] = "MELODY_ROCKSTAR_AD";
v2.SPIRIT_ASSASSIN_AD = 150;
v1[150] = "SPIRIT_ASSASSIN_AD";
v2.BEAR_CLAWS_SWIPE = 151;
v1[151] = "BEAR_CLAWS_SWIPE";
v2.BEAR_CLAWS_FLURRY = 152;
v1[152] = "BEAR_CLAWS_FLURRY";
v2.EASTER_BUNNY_EMOTE_PLAYER = 153;
v1[153] = "EASTER_BUNNY_EMOTE_PLAYER";
v2.EASTER_BUNNY_EMOTE_BUNNY = 154;
v1[154] = "EASTER_BUNNY_EMOTE_BUNNY";
v2.SHOVEL_DIG = 155;
v1[155] = "SHOVEL_DIG";
v2.INFERNO_SWORD_CHARGE = 156;
v1[156] = "INFERNO_SWORD_CHARGE";
v2.INFERNO_SWORD_SPIN = 157;
v1[157] = "INFERNO_SWORD_SPIN";
v2.HEAVENLY_SWORD_CHARGE = 158;
v1[158] = "HEAVENLY_SWORD_CHARGE";
v2.HEAVENLY_SWORD_SWING = 159;
v1[159] = "HEAVENLY_SWORD_SWING";
v2.FP_HEAVENLY_SWORD_SWING = 160;
v1[160] = "FP_HEAVENLY_SWORD_SWING";
v2.FP_INFERNO_SWORD_SPIN = 161;
v1[161] = "FP_INFERNO_SWORD_SPIN";
v2.FP_INFERNO_SWORD_CHARGE = 162;
v1[162] = "FP_INFERNO_SWORD_CHARGE";
v2.FP_HEAVENLY_SWORD_CHARGE = 163;
v1[163] = "FP_HEAVENLY_SWORD_CHARGE";
v2.PLAYER_VACUUM_SUCK = 164;
v1[164] = "PLAYER_VACUUM_SUCK";
v2.DINO_WALKING = 165;
v1[165] = "DINO_WALKING";
v2.DINO_FALLING = 166;
v1[166] = "DINO_FALLING";
v2.DINO_JUMP = 167;
v1[167] = "DINO_JUMP";
v2.DINO_HIT = 168;
v1[168] = "DINO_HIT";
v2.DINO_CHARGING = 169;
v1[169] = "DINO_CHARGING";
v2.DINO_IDLE = 170;
v1[170] = "DINO_IDLE";
v2.WIGGLE = 171;
v1[171] = "WIGGLE";
v2.ROCK_PAPER_SCISSORS = 172;
v1[172] = "ROCK_PAPER_SCISSORS";
v2.BEACH_VACATION = 173;
v1[173] = "BEACH_VACATION";
v2.STAR_IDLE = 174;
v1[174] = "STAR_IDLE";
v2.STAR_RANDOM_SPIN = 175;
v1[175] = "STAR_RANDOM_SPIN";
v2.STAR_ITEM_CONSUME = 176;
v1[176] = "STAR_ITEM_CONSUME";
v2.VOID_CRAB_BEAM_ATTACK = 177;
v1[177] = "VOID_CRAB_BEAM_ATTACK";
v2.VOID_CRAB_JUMP = 178;
v1[178] = "VOID_CRAB_JUMP";
v2.VOID_CRAB_LEFT_ATTACK = 179;
v1[179] = "VOID_CRAB_LEFT_ATTACK";
v2.VOID_CRAB_RIGHT_ATTACK = 180;
v1[180] = "VOID_CRAB_RIGHT_ATTACK";
v2.VOID_CRAB_ATTACKED = 181;
v1[181] = "VOID_CRAB_ATTACKED";
v2.VOID_CRAB_DEATH = 182;
v1[182] = "VOID_CRAB_DEATH";
v2.VOID_CRAB_EYE_MOVEMENT = 183;
v1[183] = "VOID_CRAB_EYE_MOVEMENT";
v2.VOID_CRAB_FALLING = 184;
v1[184] = "VOID_CRAB_FALLING";
v2.VOID_CRAB_IDLE = 185;
v1[185] = "VOID_CRAB_IDLE";
v2.VOID_CRAB_CLEANING = 186;
v1[186] = "VOID_CRAB_CLEANING";
v2.VOID_CRAB_MIDDLE_ATTACK = 187;
v1[187] = "VOID_CRAB_MIDDLE_ATTACK";
v2.VOID_CRAB_WALKING = 188;
v1[188] = "VOID_CRAB_WALKING";
v2.VOID_PORTAL_IDLE = 189;
v1[189] = "VOID_PORTAL_IDLE";
v2.VOID_PORTAL_EXCITED = 190;
v1[190] = "VOID_PORTAL_EXCITED";
v2.PENGUIN_ATTACK_2 = 191;
v1[191] = "PENGUIN_ATTACK_2";
v2.PENGUIN_WALK_2 = 192;
v1[192] = "PENGUIN_WALK_2";
v2.PENGUIN_IDLE_2 = 193;
v1[193] = "PENGUIN_IDLE_2";
v2.PENGUIN_JUMP_2 = 194;
v1[194] = "PENGUIN_JUMP_2";
v2.SNIPER_PENGUIN_SHOOT_2 = 195;
v1[195] = "SNIPER_PENGUIN_SHOOT_2";
v2.SNIPER_PENGUIN_WALKING_2 = 196;
v1[196] = "SNIPER_PENGUIN_WALKING_2";
v2.PINATA_IDLE_1 = 197;
v1[197] = "PINATA_IDLE_1";
v2.PINATA_IDLE_2 = 198;
v1[198] = "PINATA_IDLE_2";
v2.PINATA_IDLE_3 = 199;
v1[199] = "PINATA_IDLE_3";
v2.PINATA_HIT_1 = 200;
v1[200] = "PINATA_HIT_1";
v2.PINATA_HIT_2 = 201;
v1[201] = "PINATA_HIT_2";
v2.PINATA_FEED = 202;
v1[202] = "PINATA_FEED";
v2.DAGGER_CHARGE = 203;
v1[203] = "DAGGER_CHARGE";
v2.DAGGER_SLASH = 204;
v1[204] = "DAGGER_SLASH";
v2.FP_DAGGER_CHARGE = 205;
v1[205] = "FP_DAGGER_CHARGE";
v2.FP_DAGGER_SLASH = 206;
v1[206] = "FP_DAGGER_SLASH";
v2.TENNIS_RACKET_HIT = 207;
v1[207] = "TENNIS_RACKET_HIT";
v2.TENNIS_RACKET_IDLE = 208;
v1[208] = "TENNIS_RACKET_IDLE";
return {
	AnimationType = v2
};
