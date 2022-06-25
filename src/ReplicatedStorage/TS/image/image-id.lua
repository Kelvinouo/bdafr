-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BattlePassSeason__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-seasons").BattlePassSeason;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__TabListRank__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-ranks.dto").TabListRank;
local v5 = {};
for v6, v7 in pairs(v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ImageId) do
	v5[v6] = v7;
end;
v5.ATTACK_MOBILE = "rbxassetid://9214721575";
v5.BUILD_MOBILE = "rbxassetid://9214721352";
v5.SPRINT_OFF_MOBILE = "rbxassetid://9214720260";
v5.SPRINT_ON_MOBILE = "rbxassetid://9222808602";
v5.SHOOT_MOBILE = "rbxassetid://9214720541";
v5.UP_MOBILE = "rbxassetid://9214720847";
v5.DOWN_MOBILE = "rbxassetid://9215842213";
v5.EXPLODE_MOBILE = "rbxassetid://9215842040";
v5.CONSUME_MOBILE = "rbxassetid://9215515909";
v5.GUITAR_MOBILE = "rbxassetid://9215864239";
v5.SHIELD_ON_MOBILE = "rbxassetid://9215893299";
v5.SHIELD_OFF_MOBILE = "rbxassetid://9215893299";
v5.SWAP_MOBILE = "rbxassetid://9215909232";
v5.SATELITE = "rbxassetid://6685538693";
v5.WINDOW_CLOSE = "rbxassetid://6691699324";
v5.X = "rbxassetid://6693945013";
v5.MINIMIZE = "rbxassetid://6694162551";
v5.PLUS = "rbxassetid://6732084912";
v5.PIXEL = "rbxassetid://5607858133";
v5.PARTY = "rbxassetid://6732085077";
v5.BELL = "rbxassetid://6732084992";
v5.JOIN = "rbxassetid://6732248405";
v5.SHIELD = "rbxassetid://6822449354";
v5.ELLIPSIS = "rbxassetid://6765309820";
v5.WARNING = "rbxassetid://6768383834";
v5.ROBUX = "rbxassetid://6941793500";
v5.BANNER_HORIZONTAL = "rbxassetid://6949098458";
v5.BANNER_VERTICAL = "rbxassetid://6949098560";
v5.DIAMOND = "rbxassetid://7786216291";
v5.GEM = "rbxassetid://6949098635";
v5.HEART = "rbxassetid://6985378157";
v5.MOUSE = "rbxassetid://7095853343";
v5.TOUCH = "rbxassetid://7095853476";
v5.CHECK_SOLID = "rbxassetid://8839747245";
v5.CHECK_CIRCLE_SOLID = "rbxassetid://7250545901";
v5.CIRCLE_HOLLOW = "rbxassetid://7436160128";
v5.LOCK_SOLID = "rbxassetid://7273595412";
v5.UNLOCK_SOLID = "rbxassetid://7407078949";
v5.MISSION = "rbxassetid://7330421194";
v5.TICKET = "rbxassetid://7330421321";
v5.COIN = "rbxassetid://8854934638";
v5.SCROLL_SOLID = "rbxassetid://7341023383";
v5.BOX_OPEN_SLOID = "rbxassetid://7341023467";
v5.GIFTS_SOLID = "rbxassetid://7370934118";
v5.GIFT_RIBBON_DIAGONAL = "rbxassetid://7405503853";
v5.EXCLAMATION_TRIANGLE = "rbxassetid://7370991397";
v5.SEARCH_SOLID = "rbxassetid://7407312132";
v5.WIFI_SOLID = "rbxassetid://7436065911";
v5.THUMBS_UP_SOLID = "rbxassetid://7436065790";
v5.USERS_SOLID = "rbxassetid://7436065531";
v5.THUMB_TACK_SOLID = "rbxassetid://7646741530";
v5.LOADING_SPINNER = "rbxassetid://9001539269";
v5.POTION_ART = "rbxassetid://7797675569";
v5.ANVIL_ART = "rbxassetid://7797675825";
v5.GEM_SOLID = "rbxassetid://7806321222";
v5.POTION_SOLID = "rbxassetid://7806896312";
v5.HELMET_SOLID = "rbxassetid://7806896475";
v5.VOLUME_UP_SOLID = "rbxassetid://7807126823";
v5.VOLUME_MUTE_SOLID = "rbxassetid://7807126960";
v5.CARET_DOWN = "rbxassetid://7927244096";
v5.CARET_UP = "rbxassetid://7927320956";
v5.CROWN_SOLID = "rbxassetid://8930490563";
v5.SAFETY_HELMET_SOLID = "rbxassetid://8930638419";
v5.CLAN = "rbxassetid://9001539387";
v5.EYE_REGULAR = "rbxassetid://9130922235";
v5.VOID_ICON_SOLID = "rbxassetid://9867800971";
v5.TWITTER_SOLID = "rbxassetid://7436065687";
v5.DISCORD_SOLID = "rbxassetid://7436233304";
v5.TURRET_CROSSHAIR = "rbxassetid://7285486775";
v5.BOUNTY_HUNTER_MARKER = "rbxassetid://7384946021";
v5.HUD_TIMER_ICON = "rbxassetid://7133000856";
v5.HUD_KILLS_ICON = "rbxassetid://7133000785";
v5.HUD_BEDS_ICON = "rbxassetid://7133000927";
v5.HUD_BED_DESTROYED = "rbxassetid://7130178781";
v5.HUD_TEAM_BOX_STROKE = "rbxassetid://7128292989";
v5.HUD_MY_TEAM_BOX_STROKE = "rbxassetid://7133125049";
v5.HUD_SPRAY = "rbxassetid://7335838991";
v5.HUD_MOBILE_SHIFT_LOCK = "rbxassetid://7369762557";
v5.BattlePassIcons = {
	[l__BattlePassSeason__2.season1] = "rbxassetid://7343632287", 
	[l__BattlePassSeason__2.season2] = "rbxassetid://7813712527", 
	[l__BattlePassSeason__2.season3] = "rbxassetid://8273832966", 
	[l__BattlePassSeason__2.season4] = "rbxassetid://9135829842", 
	[l__BattlePassSeason__2.season5] = "rbxassetid://9866036528"
};
v5.SNARED = "rbxassetid://7796706734";
v5.TRAPPER_MARKED = "rbxassetid://7796835197";
v5.BedwarsKitAvatars = {
	[l__BedwarsKit__3.SHIELDER] = "rbxassetid://7159132091", 
	[l__BedwarsKit__3.DAVEY] = "rbxassetid://7159186886", 
	[l__BedwarsKit__3.MELODY] = "rbxassetid://7159186765", 
	[l__BedwarsKit__3.BUILDER] = "rbxassetid://7159187000", 
	[l__BedwarsKit__3.BARBARIAN] = "rbxassetid://7159187250", 
	[l__BedwarsKit__3.BAKER] = "rbxassetid://7159127181", 
	[l__BedwarsKit__3.ARCHER] = "rbxassetid://7159187461", 
	[l__BedwarsKit__3.FARMER_CLETUS] = "rbxassetid://7188988636", 
	[l__BedwarsKit__3.BIGMAN] = "rbxassetid://7159187132", 
	[l__BedwarsKit__3.COWGIRL] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.GRIM_REAPER] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.VULCAN] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.WIZARD] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.PYRO] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.RAVEN] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.BEEKEEPER] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.JADE] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.WARRIOR] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.BOUNTY_HUNTER] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.SPIRIT_CATCHER] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.ANGEL] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.AXOLOTL] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.TRAPPER] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.FISHERMAN] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.GHOST_CATCHER] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.OIL_MAN] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.SPEARMAN] = "rbxassetid://7193644599", 
	[l__BedwarsKit__3.TRIPLE_SHOT] = "rbxassetid://7193644599"
};
v5.TabListRankIcons = {
	[l__TabListRank__4.DEVELOPER] = "rbxassetid://7164593843", 
	[l__TabListRank__4.STAR_CREATOR] = "rbxassetid://7164593772"
};
v5.TabListMobileIcon = "rbxassetid://7195236490";
v5.BRONZE_RANK = "rbxassetid://7904293227";
v5.SILVER_RANK = "rbxassetid://7904292748";
v5.GOLD_RANK = "rbxassetid://7904293006";
v5.PLATINUM_RANK = "rbxassetid://7904292835";
v5.DIAMOND_RANK = "rbxassetid://7904293114";
v5.NIGHTMARE_RANK = "rbxassetid://7904292926";
v5.SHINING_SPINNER = "rbxassetid://7887563509";
v5.FISH_SOLID = "rbxassetid://7749336843";
v5.ENCHANTING_TABLE = "rbxassetid://8270942991";
v5.FIRE_ELEMENT = "rbxassetid://8268259203";
v5.STATIC_ELEMENT = "rbxassetid://8268259009";
v5.VOID_ELEMENT = "rbxassetid://8268258842";
v5.UPDRAFT_ELEMENT = "rbxassetid://8854922010";
v5.SHIELD_GEN_ELEMENT = "rbxassetid://8854928314";
v5.PLUNDER_ELEMENT = "rbxassetid://8854949993";
v5.ANTI_KB_ELEMENT = "rbxassetid://8854950139";
v5.RAPID_REGEN_ELEMENT = "rbxassetid://8860597490";
v5.CLINGY_ELEMENT = "rbxassetid://9618672088";
v5.CRITICAL_STRIKE_1_ELEMENT = "rbxassetid://9618674001";
v5.CRITICAL_STRIKE_2_ELEMENT = "rbxassetid://9618673817";
v5.CRITICAL_STRIKE_3_ELEMENT = "rbxassetid://9618671880";
v5.LIFE_STEAL_ELEMENT = "rbxassetid://9618696554";
v5.SURVIVAL_ANNOUNCEMENT_BACKGROUND = "rbxassetid://8602789875";
v5.VENDING_RING = "rbxassetid://9119512755";
v5.INDICATOR_ICON = "rbxassetid://9429977101";
v5.SKULL_ICON = "rbxassetid://9557802359";
v5.HAND_SCISSOR_ICON = "rbxassetid://9857436085";
v5.HAND_FIST_ICON = "rbxassetid://9857436202";
v5.HAND_STOP_ICON = "rbxassetid://9857436302";
v5.FIGHTER_KIT_ICON = "rbxassetid://10014000531";
v5.TANK_KIT_ICON = "rbxassetid://9964938168";
v5.DEFENDER_KIT_ICON = "rbxassetid://9964937994";
v5.MOVEMENT_KIT_ICON = "rbxassetid://9964937845";
v5.DESTROYER_KIT_ICON = "rbxassetid://9964937712";
v5.ECONOMY_KIT_ICON = "rbxassetid://9964937630";
v5.SUPPORT_KIT_ICON = "rbxassetid://9964937010";
return {
	BedwarsImageId = v5
};
