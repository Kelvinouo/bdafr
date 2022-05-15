
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__SoundManager__3 = v2.SoundManager;
local v4 = {
	QUEUE_JOIN = "rbxassetid://6691735519", 
	QUEUE_MATCH_FOUND = "rbxassetid://6768247187", 
	UI_HOVER = "", 
	UI_CLICK = "rbxassetid://6732690176", 
	UI_OPEN = "rbxassetid://6732607930", 
	PARTY_INCOMING_INVITE = "rbxassetid://6732495464", 
	ERROR_NOTIFICATION = "rbxassetid://6732495464", 
	INFO_NOTIFICATION = "rbxassetid://6732495464", 
	PICKUP_ITEM_DROP = "rbxassetid://6768578304", 
	DROP_ITEM = "", 
	END_GAME = "rbxassetid://6246476959", 
	BEDWARS_UPGRADE_SUCCESS = "rbxassetid://6760677364", 
	BEDWARS_PURCHASE_ITEM = "rbxassetid://6760677364", 
	SWORD_SWING_1 = "rbxassetid://6760544639", 
	SWORD_SWING_2 = "rbxassetid://6760544595", 
	DAMAGE_1 = "rbxassetid://6765457325", 
	DAMAGE_2 = "rbxassetid://6765470975", 
	DAMAGE_3 = "rbxassetid://6765470941", 
	ARMOR_EQUIP = "rbxassetid://6760627839", 
	ARMOR_UNEQUIP = "rbxassetid://6760625788", 
	GRASS_BREAK = "rbxassetid://5282847153", 
	STONE_BREAK = "rbxassetid://6328287211", 
	WOOD_BREAK = "rbxassetid://4819966893", 
	WOOL_BREAK = "rbxassetid://7872623286", 
	WOOL_PLACE = "rbxassetid://7872623002", 
	GENERIC_BLOCK_PLACE = "rbxassetid://4842910664", 
	GENERIC_BLOCK_BREAK = "rbxassetid://4819966893", 
	TNT_EXPLODE_1 = "rbxassetid://7192313632", 
	TNT_HISS_1 = "rbxassetid://7192313423", 
	SLIME_BLOCK_PLACE = "rbxassetid://6857999119", 
	SLIME_BLOCK_BREAK = "rbxassetid://6857999170", 
	SLIME_BLOCK_HIT = "rbxassetid://6857999148", 
	SLIME_BLOCK_BOUNCE = "rbxassetid://6857999096", 
	BOW_FIRE = "rbxassetid://6866062104", 
	BOW_DRAW = "rbxassetid://6866062236", 
	ARROW_IMPACT = "", 
	ARROW_HIT = "rbxassetid://6866062188", 
	TELEPEARL_THROW = "rbxassetid://6866223756", 
	TELEPEARL_LAND = "rbxassetid://6866223798", 
	CROSSBOW_RELOAD = "rbxassetid://6869254094", 
	VOICE_1 = "rbxassetid://5283866929", 
	VOICE_2 = "rbxassetid://5283867710", 
	VOICE_HONK = "rbxassetid://5283872555", 
	CROP_HARVEST = "rbxassetid://4864122196", 
	CROP_PLANT_1 = "rbxassetid://5483943277", 
	CROP_PLANT_2 = "rbxassetid://5483943479", 
	CROP_PLANT_3 = "rbxassetid://5483943723", 
	FORTIFY_BLOCK = "rbxassetid://6955762535", 
	EAT_FOOD_1 = "rbxassetid://4968170636", 
	KILL = "rbxassetid://7872622733", 
	ZIPLINE_TRAVEL = "rbxassetid://7047882304", 
	ZIPLINE_LATCH = "rbxassetid://7047882233", 
	ZIPLINE_UNLATCH = "rbxassetid://7047882265", 
	SHIELD_BLOCKED = "rbxassetid://6955762535", 
	GUITAR_LOOP = "rbxassetid://7084168540", 
	GUITAR_HEAL_1 = "rbxassetid://7084168458", 
	GUITAR_LOOP_ROCKSTAR = "rbxassetid://9252967029", 
	GUITAR_HEAL_1_ROCKSTAR = "rbxassetid://9252449369", 
	CANNON_MOVE = "rbxassetid://7118668472", 
	CANNON_FIRE = "rbxassetid://7121064180", 
	BALLOON_INFLATE = "rbxassetid://7118657911", 
	BALLOON_POP = "rbxassetid://7118657873", 
	FIREBALL_THROW = "rbxassetid://7192289445", 
	FIREBALL_EXPLODE = "rbxassetid://6855723746", 
	LASSO_SWING = "rbxassetid://7192289504", 
	LASSO_THROW = "rbxassetid://7192289548", 
	LASSO_HIT = "rbxassetid://7192289603", 
	GRIM_REAPER_CONSUME = "rbxassetid://7225389554", 
	GRIM_REAPER_CHANNEL = "rbxassetid://7225389512", 
	TV_STATIC = "rbxassetid://7256209920", 
	TURRET_ON = "rbxassetid://7290176291", 
	TURRET_OFF = "rbxassetid://7290176380", 
	TURRET_ROTATE = "rbxassetid://7290176421", 
	TURRET_SHOOT = "rbxassetid://7290187805", 
	WIZARD_LIGHTNING_CAST = "rbxassetid://7262989886", 
	WIZARD_LIGHTNING_LAND = "rbxassetid://7263165647", 
	WIZARD_LIGHTNING_STRIKE = "rbxassetid://7263165347", 
	WIZARD_ORB_CAST = "rbxassetid://7263165448", 
	WIZARD_ORB_TRAVEL_LOOP = "rbxassetid://7263165579", 
	WIZARD_ORB_CONTACT_LOOP = "rbxassetid://7263165647", 
	BATTLE_PASS_PROGRESS_LEVEL_UP = "rbxassetid://7331597283", 
	BATTLE_PASS_PROGRESS_EXP_GAIN = "rbxassetid://7331597220", 
	FLAMETHROWER_USE = "rbxassetid://7310273125", 
	FLAMETHROWER_UPGRADE = "rbxassetid://7310273053", 
	BRITTLE_HIT = "rbxassetid://7310273179", 
	EXTINGUISH = "rbxassetid://7310273015", 
	RAVEN_SPACE_AMBIENT = "rbxassetid://7341443286", 
	RAVEN_WING_FLAP = "rbxassetid://7341443378", 
	RAVEN_CAW = "rbxassetid://7341443447", 
	JADE_HAMMER_THUD = "rbxassetid://7342299402", 
	STATUE = "rbxassetid://7344166851", 
	CONFETTI = "rbxassetid://7344278405", 
	HEART = "rbxassetid://7345120916", 
	SPRAY = "rbxassetid://7361499529", 
	BEEHIVE_PRODUCE = "rbxassetid://7378100183", 
	CATCH_BEE = "rbxassetid://7378100305", 
	DEPOSIT_BEE = "rbxassetid://7378100250", 
	BEE_NET_SWING = "rbxassetid://7378100350", 
	ASCEND = "rbxassetid://7378387334", 
	BED_ALARM = "rbxassetid://7396762708", 
	BED_BREAK = "rbxassetid://7872654878", 
	BOUNTY_CLAIMED = "rbxassetid://7396751941", 
	BOUNTY_ASSIGNED = "rbxassetid://7396752155", 
	BAGUETTE_SWING = "rbxassetid://7396760496", 
	BAGUETTE_HIT = "rbxassetid://7396760547", 
	TESLA_ZAP = "rbxassetid://7497477336", 
	SPIRIT_TRIGGERED = "rbxassetid://7498107251", 
	SPIRIT_EXPLODE = "rbxassetid://7498107327", 
	ANGEL_LIGHT_ORB_CREATE = "rbxassetid://7552134231", 
	ANGEL_LIGHT_ORB_HEAL = "rbxassetid://7552134868", 
	ANGEL_VOID_ORB_CREATE = "rbxassetid://7552135942", 
	ANGEL_VOID_ORB_HEAL = "rbxassetid://7552136927", 
	DODO_BIRD_JUMP = "rbxassetid://7618085391", 
	DODO_BIRD_DOUBLE_JUMP = "rbxassetid://7618085771", 
	DODO_BIRD_MOUNT = "rbxassetid://7618085486", 
	DODO_BIRD_DISMOUNT = "rbxassetid://7618085571", 
	DODO_BIRD_SQUAWK_1 = "rbxassetid://7618085870", 
	DODO_BIRD_SQUAWK_2 = "rbxassetid://7618085657", 
	SHIELD_CHARGE_START = "rbxassetid://7730842884", 
	SHIELD_CHARGE_LOOP = "rbxassetid://7730843006", 
	SHIELD_CHARGE_BASH = "rbxassetid://7730843142", 
	ROCKET_LAUNCHER_FIRE = "rbxassetid://7681584765", 
	ROCKET_LAUNCHER_FLYING_LOOP = "rbxassetid://7681584906", 
	SMOKE_GRENADE_POP = "rbxassetid://7681276062", 
	SMOKE_GRENADE_EMIT_LOOP = "rbxassetid://7681276135", 
	GOO_SPIT = "rbxassetid://7807271610", 
	GOO_SPLAT = "rbxassetid://7807272724", 
	GOO_EAT = "rbxassetid://7813484049", 
	LUCKY_BLOCK_BREAK = "rbxassetid://7682005357", 
	AXOLOTL_SWITCH_TARGETS = "rbxassetid://7344278405", 
	CHRISTMAS_MUSIC = "", 
	SUSPENSE_MUSIC = "", 
	LOBBY_MUSIC = "rbxassetid://9171719053", 
	SNAP_TRAP_SETUP = "rbxassetid://7796078515", 
	SNAP_TRAP_CLOSE = "rbxassetid://7796078695", 
	SNAP_TRAP_CONSUME_MARK = "rbxassetid://7796078825", 
	GHOST_VACUUM_SUCKING_LOOP = "rbxassetid://9171598223", 
	GHOST_VACUUM_SHOOT = "rbxassetid://7806060367", 
	GHOST_VACUUM_CATCH = "rbxassetid://7815151688", 
	FISHERMAN_GAME_START = "rbxassetid://7806060544", 
	FISHERMAN_GAME_PULLING_LOOP = "rbxassetid://7806060638", 
	FISHERMAN_GAME_PROGRESS_INCREASE = "rbxassetid://9171710961", 
	FISHERMAN_GAME_FISH_MOVE = "rbxassetid://7806060863", 
	FISHERMAN_GAME_LOOP = "rbxassetid://7806061057", 
	FISHING_ROD_CAST = "rbxassetid://7806060976", 
	FISHING_ROD_SPLASH = "rbxassetid://7806061193", 
	SPEAR_HIT = "rbxassetid://7807270398", 
	SPEAR_THROW = "rbxassetid://7813485044", 
	STOPWATCH_TICKING = "rbxassetid://7860137803", 
	STOPWATCH_REWINDING = "rbxassetid://7860138157", 
	STOPWATCH_ACTIVATED = "rbxassetid://7860209692", 
	PROMOTION_INDICATION = "rbxassetid://7909707175", 
	PROMOTION_RANKUP = "rbxassetid://7909708079", 
	PROMOTION_SHINE_LOOP = "rbxassetid://7909709031", 
	BONK = "rbxassetid://7892571931", 
	DANCE_PARTY = "http://www.roblox.com/asset/?id=1836004875", 
	CHARGE_TRIPLE_SHOT = "rbxassetid://7987032429", 
	INFECTED_INITIAL_SPREAD = "rbxassetid://8036984723", 
	INFECTED_HUMAN_DEATH = "rbxassetid://8034330141", 
	GUIDED_MISSILE_FIRE = "rbxassetid://8036073828", 
	GUIDED_MISSILE_LOOP = "rbxassetid://8036070568", 
	GUIDED_MISSILE_EXPLOSION = "rbxassetid://8036072738", 
	ICE_QUEEN_PROC = "rbxassetid://8163574368", 
	ICE_QUEEN_STRONG_PROC = "rbxassetid://8163535250", 
	ICE_QUEEN_PASSIVE_UNLOCKED = "rbxassetid://8163535387", 
	SNOWBALL_THROW = "rbxassetid://8165640372", 
	SNOWBALL_HIT = "rbxassetid://8165640209", 
	BURN_HIT = "rbxassetid://8276343179", 
	BURN_LOOP = "rbxassetid://8275931431", 
	STATIC_HIT = "rbxassetid://8241808045", 
	ENCHANT_VOID_HIT = "rbxassetid://8273797028", 
	ENCHANT_VOID_EXPLODE = "rbxassetid://8273794303", 
	ENCHANT_TABLE_REPAIR_HAMMER_1 = "rbxassetid://8273481631", 
	ENCHANT_TABLE_REPAIR_HAMMER_2 = "rbxassetid://8273480906", 
	ENCHANT_TABLE_REPAIR_HAMMER_3 = "rbxassetid://8273480780", 
	ENCHANT_TABLE_REPAIR_HAMMER_4 = "rbxassetid://8273481335", 
	ENCHANT_TABLE_REPAIRED = "rbxassetid://8273534704", 
	ENCHANT_TABLE_RESEARCH_IMPLODE = "rbxassetid://8273534704", 
	ENCHANT_TABLE_RESEARCH_CONSUME = "rbxassetid://8273481792", 
	MINER_STONE_HIT_1 = "rbxassetid://8933936733", 
	MINER_STONE_HIT_2 = "rbxassetid://8933936347", 
	MINER_STONE_HIT_3 = "rbxassetid://8933936547", 
	MINER_STONE_BREAK = "rbxassetid://8933936889", 
	SLIME_SQUISH = "rbxassetid://8260975919", 
	SLIME_SQUISH_2 = "rbxassetid://8261009998", 
	GLIDER_GLIDE = "rbxassetid://8200754399", 
	GLIDER_OPEN = "rbxassetid://8219991610", 
	YETI_ROAR = "rbxassetid://8254284524", 
	BREAK_FROZEN_BLOCK = "rbxassetid://8254285408", 
	HIT_FROZEN_BLOCK = "rbxassetid://8254285919", 
	AERY_BUTTERFLY_SPAWN = "rbxassetid://8273481496", 
	AERY_BUTTERFLY_CONSUME = "rbxassetid://8273481151", 
	SANTA_BELLS = "rbxassetid://6103879320", 
	VOID_AXE_LEAP = "rbxassetid://8326267308", 
	VOID_AXE_HIT = "rbxassetid://8326265343", 
	COFFIN_KILL_EFFECT = "rbxassetid://8326373813", 
	UFO_KILL_EFFECT = "rbxassetid://8326374659", 
	GIFT_KILL_EFFECT = "rbxassetid://8655533302", 
	USE_SMOKE_CHARGE = "rbxassetid://8538067991", 
	SMOKE_CHARGE_LOOP = "rbxassetid://8538076501", 
	EMOTE_OPEN = "rbxassetid://8537464850", 
	EMOTE_CLOSE = "", 
	FIREWORK_LAUNCH = "rbxassetid://8649937489", 
	FIREWORK_TRAIL = "rbxassetid://8649936900", 
	FIREWORK_EXPLODE_1 = "rbxassetid://8649937349", 
	FIREWORK_EXPLODE_2 = "rbxassetid://8649937042", 
	FIREWORK_EXPLODE_3 = "rbxassetid://8649937176", 
	FIREWORK_CRACKLE_1 = "rbxassetid://8649936790", 
	FIREWORK_CRACKLE_2 = "rbxassetid://8649937260", 
	FIREWORK_CRACKLE_3 = "rbxassetid://8649937420", 
	DAO_CHARGING = "rbxassetid://8665895823", 
	DAO_CHARGE_COMPLETE = "rbxassetid://8665896190", 
	DAO_DASH = "rbxassetid://8665895987", 
	DAO_SLASH = "rbxassetid://8666120434", 
	DUCK_FOOTSTEP_1 = "rbxassetid://8729236094", 
	DUCK_FOOTSTEP_2 = "rbxassetid://8729236594", 
	DUCK_FOOTSTEP_3 = "rbxassetid://8729236910", 
	DUCK_QUACK_1 = "rbxassetid://8729236389", 
	DUCK_QUACK_2 = "rbxassetid://8729235820", 
	DUCK_QUACK_3 = "rbxassetid://8729236801", 
	DUCK_ATTACK_1 = "rbxassetid://8729236235", 
	DUCK_ATTACK_2 = "rbxassetid://8729235974", 
	DUCK_JUMP = "rbxassetid://8729542639", 
	SHIELD_GEN_LOOP = "rbxassetid://8860774314", 
	TWIRLBLADE_SPIN = "rbxassetid://8795375602", 
	ROCK_CRUMBLE_1 = "rbxassetid://8935924467", 
	ROCK_CRUMBLE_2 = "rbxassetid://8935923862", 
	ROCK_CRUMBLE_3 = "rbxassetid://8935923000", 
	TURN_TO_STONE = "rbxassetid://8936954934", 
	MIDNIGHT_ACTIVATE = "rbxassetid://9113392412", 
	MIDNIGHT_FOLLOWING_TRAIL = "rbxassetid://9113392504", 
	PAINT_SHOTGUN_BLAST = "rbxassetid://9118382889", 
	MIDNIGHT_ATTACK_1 = "rbxassetid://9127204950", 
	MIDNIGHT_ATTACK_2 = "rbxassetid://9127204803", 
	MIDNIGHT_ATTACK_3 = "rbxassetid://9127204881", 
	MIDNIGHT_ATTACK_4 = "rbxassetid://9127204723", 
	MIDNIGHT_ATTACK_5 = "rbxassetid://9127204652", 
	CARROT_LAUNCHER_FIRE = "rbxassetid://9135893336", 
	CARROT_LAUNCHER_IMPACT = "rbxassetid://9133802299", 
	SHEEP_ALIEN_1 = "rbxassetid://9134471070", 
	SHEEP_ALIEN_2 = "rbxassetid://9134471180", 
	SHEEP_ALIEN_3 = "rbxassetid://9134470940", 
	VENDING_ROLL_TICK = "rbxassetid://9119698867", 
	VENDING_ROLL_PRIZE = "rbxassetid://9119698965", 
	SHEEP_TAME_1 = "rbxassetid://9126807354", 
	SHEEP_TAME_2 = "rbxassetid://9126807280", 
	SHEEP_TAME_3 = "rbxassetid://9126807457", 
	WHITE_RAVEN_FLYING_LOOP = "rbxassetid://9126354726", 
	WHITE_RAVEN_SNATCH = "rbxassetid://9126357529", 
	BEAST_ROAR = "rbxassetid://9134461127", 
	ROCKET_KILL_EFFECT = "rbxassetid://9134460981", 
	BOBA_IMPACT = "rbxassetid://9185484842", 
	BOBA_SHOOT = "rbxassetid://9185484755", 
	BEEPING = "rbxassetid://9186356426", 
	TORNADO_LAUNCHER_SHOOT = "rbxassetid://9252994838", 
	TORNADO_LOOP = "rbxassetid://9252994983", 
	FRYING_PAN_CHARGE = "rbxassetid://9252451221", 
	FRYING_PAN_HIT = "rbxassetid://9252450727", 
	DISASTER_TORNADO_LOOP = "rbxassetid://9312849004", 
	INVISIBLE_LANDMINE_BEEP_LOOP = "rbxassetid://9437490886", 
	INVISIBLE_LANDMINE_LONG_BEEP = "rbxassetid://9437491461", 
	INVISIBLE_LANDMINE_EXPLOSION = "rbxassetid://9437480761", 
	BEAR_CLAWS_SWIPE = "rbxassetid://9416877011", 
	BEAR_CLAWS_FLURRY = "rbxassetid://9416876954", 
	TELEPORT_ACTIVATION = "rbxassetid://9368744375", 
	METAL_DETECTOR_BEEP = "rbxassetid://9368399457", 
	LIGHT_SWORD_CHARGE = "rbxassetid://9611290322", 
	LIGHT_SWORD_ATTACK = "rbxassetid://9611290464", 
	INFERNAL_SWORD_CHARGE = "rbxassetid://9611290603", 
	INFERNAL_SWORD_ATTACK = "rbxassetid://9611290728", 
	PING = "rbxassetid://9437904399", 
	DRONE_DAMAGE_1 = "rbxassetid://9498221316", 
	DRONE_DAMAGE_2 = "rbxassetid://9498221645", 
	DRONE_DAMAGE_3 = "rbxassetid://9498221538", 
	DRONE_DEPLOY = "rbxassetid://9498221043", 
	DRONE_EXPLODE = "rbxassetid://9498221174", 
	DRONE_PROPELLER_LOOP = "rbxassetid://9498221434", 
	GRAPPLING_HOOK_FIRE = "rbxassetid://9499222342", 
	GRAPPLING_HOOK_EXTEND_LOOP = "rbxassetid://9499222471", 
	GRAPPLING_HOOK_RETRACT_LOOP = "rbxassetid://9499222226", 
	FLAG_DROP = "rbxassetid://9568654936", 
	FLAG_BUFF = "rbxassetid://9568654771", 
	MINICOPTER_LOOP = "rbxassetid://9559564305", 
	MINICOPTER_START = "rbxassetid://9559563967", 
	MINICOPTER_STOP = "rbxassetid://9559564102", 
	MINICOPTER_EXPLODE = "rbxassetid://9559563798", 
	MINICOPTER_DAMAGE_1 = "rbxassetid://9559564686", 
	MINICOPTER_DAMAGE_2 = "rbxassetid://9559564986", 
	MINICOPTER_DAMAGE_3 = "rbxassetid://9559564452", 
	MINICOPTER_BOUNCE_3 = "rbxassetid://9559564596", 
	LIFE_STEAL_HEAL = "rbxassetid://9614320012", 
	LIFE_STEAL_OVERHEAL = "rbxassetid://9614320049", 
	EXECUTE = "rbxassetid://9611290880", 
	CRITICAL_STRIKE = "rbxassetid://9620298037"
};
l__SoundManager__3:registerSound(v4.VENDING_ROLL_TICK, {
	preload = false
});
l__SoundManager__3:registerSound(v4.VENDING_ROLL_PRIZE, {
	preload = false
});
l__SoundManager__3:registerSound(v4.INVISIBLE_LANDMINE_EXPLOSION, {
	volume = 1
});
l__SoundManager__3:registerSound(v4.GUITAR_LOOP_ROCKSTAR, {
	preload = false
});
l__SoundManager__3:registerSound(v4.GUITAR_HEAL_1_ROCKSTAR, {
	preload = false, 
	volume = 0.2
});
l__SoundManager__3:registerSound(v4.SHEEP_TAME_1, {
	preload = false
});
l__SoundManager__3:registerSound(v4.SHEEP_TAME_2, {
	preload = false
});
l__SoundManager__3:registerSound(v4.SHEEP_TAME_3, {
	preload = false
});
l__SoundManager__3:registerSound(v4.SHIELD_GEN_LOOP, {
	preloadPriority = 1
});
l__SoundManager__3:registerSound(v4.FIREWORK_EXPLODE_1, {
	volume = 1.4
});
l__SoundManager__3:registerSound(v4.FIREWORK_EXPLODE_2, {
	volume = 1.4
});
l__SoundManager__3:registerSound(v4.FIREWORK_EXPLODE_3, {
	volume = 1.4
});
l__SoundManager__3:registerSound(v4.BURN_HIT, {
	volume = 0.1
});
l__SoundManager__3:registerSound(v4.STATIC_HIT, {
	volume = 0.5
});
l__SoundManager__3:registerSound(v4.USE_SMOKE_CHARGE, {
	volume = 0.3
});
l__SoundManager__3:registerSound(v4.WOOD_BREAK, {
	volume = 0.2
});
l__SoundManager__3:registerSound(v4.ENCHANT_TABLE_REPAIRED, {
	volume = 1.4
});
l__SoundManager__3:registerSound(v4.ENCHANT_TABLE_RESEARCH_IMPLODE, {
	volume = 1.4
});
l__SoundManager__3:registerSound(v4.AERY_BUTTERFLY_SPAWN, {
	volume = 1.4
});
l__SoundManager__3:registerSound(v4.DAMAGE_1, {
	volume = 1, 
	preloadPriority = 100
});
l__SoundManager__3:registerSound(v4.DAMAGE_2, {
	volume = 1, 
	preloadPriority = 100
});
l__SoundManager__3:registerSound(v4.DAMAGE_3, {
	volume = 1, 
	preloadPriority = 100
});
l__SoundManager__3:registerSound(v4.SWORD_SWING_1, {
	volume = 0.2, 
	preloadPriority = 100
});
l__SoundManager__3:registerSound(v4.SWORD_SWING_2, {
	volume = 0.2, 
	preloadPriority = 100
});
l__SoundManager__3:registerSound(v4.PICKUP_ITEM_DROP, {
	volume = 0.4
});
l__SoundManager__3:registerSound(v4.VOICE_1, {
	volume = 0.15
});
l__SoundManager__3:registerSound(v4.VOICE_2, {
	volume = 0.15
});
l__SoundManager__3:registerSound(v4.VOICE_HONK, {
	volume = 0.3
});
l__SoundManager__3:registerSound(v4.KILL, {
	volume = 0.5, 
	preloadPriority = 100
});
l__SoundManager__3:registerSound(v4.GUITAR_LOOP, {
	volume = 0.15
});
l__SoundManager__3:registerSound(v4.GUITAR_LOOP_ROCKSTAR, {
	volume = 0.15
});
l__SoundManager__3:registerSound(v4.GUITAR_HEAL_1, {
	volume = 0.25
});
l__SoundManager__3:registerSound(v4.GUITAR_HEAL_1_ROCKSTAR, {
	volume = 0.25
});
l__SoundManager__3:registerSound(v4.GRIM_REAPER_CHANNEL, {
	volume = 0.3
});
l__SoundManager__3:registerSound(v4.GRIM_REAPER_CONSUME, {
	volume = 0.8
});
l__SoundManager__3:registerSound(v4.TV_STATIC, {
	volume = 0.5
});
l__SoundManager__3:registerSound(v4.TURRET_SHOOT, {
	rollOffMaxDistance = 200
});
l__SoundManager__3:registerSound(v4.WIZARD_LIGHTNING_LAND, {
	volume = 0.8
});
l__SoundManager__3:registerSound(v4.RAVEN_SPACE_AMBIENT, {
	volume = 0.25
});
l__SoundManager__3:registerSound(v4.ANGEL_LIGHT_ORB_CREATE, {
	volume = 0.6
});
l__SoundManager__3:registerSound(v4.ANGEL_LIGHT_ORB_HEAL, {
	volume = 0.6
});
l__SoundManager__3:registerSound(v4.ANGEL_VOID_ORB_CREATE, {
	volume = 0.6
});
l__SoundManager__3:registerSound(v4.ANGEL_VOID_ORB_HEAL, {
	volume = 0.6
});
l__SoundManager__3:registerSound(v4.ROCKET_LAUNCHER_FIRE, {
	volume = 0.25
});
l__SoundManager__3:registerSound(v4.SMOKE_GRENADE_POP, {
	rollOffMaxDistance = 250
});
l__SoundManager__3:registerSound(v4.AXOLOTL_SWITCH_TARGETS, {
	rollOffMaxDistance = 80
});
l__SoundManager__3:registerSound(v4.SUSPENSE_MUSIC, {
	preload = false, 
	volume = 0.35
});
l__SoundManager__3:registerSound(v4.LOBBY_MUSIC, {
	preload = false, 
	volume = 0.3
});
l__SoundManager__3:registerSound(v4.FISHERMAN_GAME_PULLING_LOOP, {
	volume = 0.3
});
l__SoundManager__3:registerSound(v4.FISHERMAN_GAME_FISH_MOVE, {
	volume = 0.25
});
l__SoundManager__3:registerSound(v4.FISHERMAN_GAME_LOOP, {
	volume = 0.15
});
l__SoundManager__3:registerSound(v4.BED_BREAK, {
	volume = 0.4
});
l__SoundManager__3:registerSound(v4.SLIME_SQUISH, {
	volume = 2
});
l__SoundManager__3:registerSound(v4.SLIME_SQUISH_2, {
	volume = 5, 
	rollOffMaxDistance = 80
});
l__SoundManager__3:registerSound(v4.GLIDER_GLIDE, {
	volume = 1, 
	preloadPriority = 20
});
l__SoundManager__3:registerSound(v4.GLIDER_OPEN, {
	volume = 0.7, 
	preloadPriority = 20
});
l__SoundManager__3:registerSound(v4.SANTA_BELLS, {
	volume = 0.2, 
	preloadPriority = 20
});
l__SoundManager__3:registerSound(v4.MIDNIGHT_ACTIVATE);
l__SoundManager__3:registerSound(v4.MIDNIGHT_FOLLOWING_TRAIL);
l__SoundManager__3:registerSound(v4.PAINT_SHOTGUN_BLAST, {
	volume = 0.2, 
	preloadPriority = 20
});
l__SoundManager__3:registerSound(v4.METAL_DETECTOR_BEEP, {
	volume = 0.2
});
l__SoundManager__3:registerSound(v4.MINICOPTER_LOOP, {
	volume = 0.2
});
l__SoundManager__3:registerSound(v4.MINICOPTER_START, {
	volume = 0.4
});
l__SoundManager__3:registerSound(v4.MINICOPTER_STOP, {
	volume = 0.4
});
if not v2.DeviceUtil.isHoarceKat() then
	l__SoundManager__3:preload();
end;
return {
	GameSound = v4
};

