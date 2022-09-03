-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__AnimationType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__getEmoteAsset__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset;
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type");
local l__EmoteDisplayType__5 = v4.EmoteDisplayType;
local l__EmoteType__6 = v4.EmoteType;
return {
	EmoteMeta = {
		[l__EmoteType__6.BED_BREAK] = {
			name = "Bed Break", 
			image = "rbxassetid://7336098864", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.LUNAR_TIGER_BUILDER] = {
			name = "Lunar Tiger Builder", 
			image = "rbxassetid://8661722623", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.VULCAN_LANTERN] = {
			name = "Vulcan Lanterns", 
			image = "rbxassetid://8665895935", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.RED_ENVELOPE] = {
			name = "Red Envelope", 
			image = "rbxassetid://8665788222", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.LNY_2022] = {
			name = "LNY 2022", 
			image = "rbxassetid://8665896822", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.PENGUIN_FALL] = {
			name = "Penguin Fall", 
			image = "rbxassetid://8598813534", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.PENGUIN_DISCO] = {
			name = "Penguin Disco", 
			image = "rbxassetid://8605003980", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.CLETUS_CARROT] = {
			name = "Cletus Carrot", 
			image = "rbxassetid://7244029172", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.WIZARD_READING_YOU] = {
			name = "Wizard Reading You", 
			image = "rbxassetid://7336095637", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.WINSTREAK_PLUS_ONE] = {
			name = "Winstreak +1", 
			image = "rbxassetid://7336095844", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.VULCAN_LETS_GO] = {
			name = "Vulcan Let's Go!", 
			image = "rbxassetid://7336096035", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.VULCAN_HEART] = {
			name = "Vulcan Love", 
			image = "rbxassetid://7336096303", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.VULCAN_GG] = {
			name = "Vulcan GG", 
			image = "rbxassetid://7336096512", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.SHIELDER_CLAP] = {
			name = "Shielder Clap", 
			image = "rbxassetid://7336096676", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.PIRATE_BALLOONS] = {
			name = "Balloon Expert", 
			image = "rbxassetid://7336096806", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.MELODY_TUNES] = {
			name = "Melody Tunes", 
			image = "rbxassetid://7336096914", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.MELODY_DIAMOND] = {
			name = "Diamond Lover", 
			image = "rbxassetid://7346354284", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.CRY_ABOUT_IT] = {
			name = "Cry About It", 
			image = "rbxassetid://7336097326", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.LASSY_EMERALDS] = {
			name = "Emerald Collector", 
			image = "rbxassetid://7336097554", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.LASSY_CAPTURE] = {
			name = "Roped", 
			image = "rbxassetid://7336097697", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.GRIM_REAPER_LANTERN] = {
			name = "Grim Reaper Lantern", 
			image = "rbxassetid://7336097765", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.EMERALD_CHEST] = {
			name = "Emerald Chest", 
			image = "rbxassetid://7336097972", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.ELDER_TREE] = {
			name = "Eldertree", 
			image = "rbxassetid://7336098084", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.CUTE_GRIM_REAPER] = {
			name = "Adorable Grim Reaper", 
			image = "rbxassetid://7336098199", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.CHUNKY_ELDER_TREE] = {
			name = "Chonky Eldertree", 
			image = "rbxassetid://7336098364", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BUILDER_SPARKLE] = {
			name = "Builder Sparkle", 
			image = "rbxassetid://7336098452", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BUILDER_HAMMER] = {
			name = "Builder Hammer", 
			image = "rbxassetid://7336098606", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BANANA_BARBARIAN] = {
			name = "Banana Barbarian", 
			image = "rbxassetid://7336099010", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.ARCHER_CHEERS] = {
			name = "Cheers!", 
			image = "rbxassetid://7336099175", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BABY_DODO] = {
			name = "Baby Dodo", 
			image = "rbxassetid://7804181940", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BED_BREAKER] = {
			name = "Bed Breaker", 
			image = "rbxassetid://7804181847", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BED_KING] = {
			name = "Bed Camper", 
			image = "rbxassetid://7804181673", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BEE_CUTE] = {
			name = "Bee Cute", 
			image = "rbxassetid://7804181490", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BEEKEEPER_EMERALD] = {
			name = "Beemerald", 
			image = "rbxassetid://7804181315", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BOUNTY_HUNTER] = {
			name = "On the Move", 
			image = "rbxassetid://7804181091", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.CONTROLLING_REAPER] = {
			name = "Controlling Reaper", 
			image = "rbxassetid://7804180870", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.DEAD_BAKER] = {
			name = "Dead Baker", 
			image = "rbxassetid://7804180714", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.HEADLESS_CLETUS] = {
			name = "Headless Cletus", 
			image = "rbxassetid://7804180489", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.JADE_VAMPIRE] = {
			name = "Vampire Jade", 
			image = "rbxassetid://7804180318", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.NO_BULLY] = {
			name = "No Bully", 
			image = "rbxassetid://7804180194", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.RAVEN_FLOWER] = {
			name = "Raven's Flower", 
			image = "rbxassetid://7804180067", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.RAVEN_KNIFE] = {
			name = "Knifed up Raven", 
			image = "rbxassetid://7804179857", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.READY_UP] = {
			name = "Ready Up!", 
			image = "rbxassetid://7804179628", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.REAPER_SMILE] = {
			name = "Reaper Smile", 
			image = "rbxassetid://7804179416", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.SPOOKY] = {
			name = "Spooky", 
			image = "rbxassetid://7804179196", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.SURRENDER] = {
			name = "Surrender", 
			image = "rbxassetid://7804178936", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.VULCAN_ERROR] = {
			name = "Vulcan Error", 
			image = "rbxassetid://7804178661", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.VULCAN_GRAVE] = {
			name = "Vulcan Grave", 
			image = "rbxassetid://7804178441", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.WAITING_ON_IRON] = {
			name = "Waiting on Iron", 
			image = "rbxassetid://7804178221", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.ZOMBIE_MELODY] = {
			name = "Zombie Melody", 
			image = "rbxassetid://7804177994", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.ZOMBIE_BARBARIAN] = {
			name = "Zombie Barbarian", 
			image = "rbxassetid://7813486576", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.HAPPY_GOMPY] = {
			name = "Happy Gompy", 
			image = "rbxassetid://7941918004", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.FISHERMAN] = {
			name = "Fisherman", 
			image = "rbxassetid://7941918308", 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.ANGRY_BUILDER] = {
			name = "Angry Builder", 
			image = l__getEmoteAsset__3(l__EmoteType__6.ANGRY_BUILDER), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.ARCHER] = {
			name = "Archer", 
			image = l__getEmoteAsset__3(l__EmoteType__6.ARCHER), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.ARSON] = {
			name = "Arson", 
			image = l__getEmoteAsset__3(l__EmoteType__6.ARSON), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.AXOLOTL_SLEEPING] = {
			name = "Axolotl Sleeping", 
			image = l__getEmoteAsset__3(l__EmoteType__6.AXOLOTL_SLEEPING), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.AXOLOTLS] = {
			name = "Axolotls", 
			image = l__getEmoteAsset__3(l__EmoteType__6.AXOLOTLS), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BAKER_THUMBS_UP] = {
			name = "Baker Thumbs Up", 
			image = l__getEmoteAsset__3(l__EmoteType__6.BAKER_THUMBS_UP), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BALLOONS] = {
			name = "Balloons", 
			image = l__getEmoteAsset__3(l__EmoteType__6.BALLOONS), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BEE] = {
			name = "Bee", 
			image = l__getEmoteAsset__3(l__EmoteType__6.BEE), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BOO] = {
			name = "Boo", 
			image = l__getEmoteAsset__3(l__EmoteType__6.BOO), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.CHRISTMAS_ROCKET] = {
			name = "Christmas Rocket", 
			image = l__getEmoteAsset__3(l__EmoteType__6.CHRISTMAS_ROCKET), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.DUO] = {
			name = "Duo", 
			image = l__getEmoteAsset__3(l__EmoteType__6.DUO), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.EMERALD_ARMOR] = {
			name = "Emerald Armor", 
			image = l__getEmoteAsset__3(l__EmoteType__6.EMERALD_ARMOR), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.FREIYA] = {
			name = "Freiya Smile", 
			image = l__getEmoteAsset__3(l__EmoteType__6.FREIYA), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.FREIYA_2] = {
			name = "Freiya Hoodie", 
			image = l__getEmoteAsset__3(l__EmoteType__6.FREIYA_2), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.FREIYA_SNOWMAN] = {
			name = "Freiya Snowman", 
			image = l__getEmoteAsset__3(l__EmoteType__6.FREIYA_SNOWMAN), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.HEART] = {
			name = "Ghosty Love", 
			image = l__getEmoteAsset__3(l__EmoteType__6.HEART), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.LUCKY_GIFT] = {
			name = "Lucky Gift", 
			image = l__getEmoteAsset__3(l__EmoteType__6.LUCKY_GIFT), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.PYRO_COAL] = {
			name = "Pyro Coal", 
			image = l__getEmoteAsset__3(l__EmoteType__6.PYRO_COAL), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.RAVEN_SKETCH] = {
			name = "Raven Sketch", 
			image = l__getEmoteAsset__3(l__EmoteType__6.RAVEN_SKETCH), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.REAPER_GIFT] = {
			name = "Reaper Gift", 
			image = l__getEmoteAsset__3(l__EmoteType__6.REAPER_GIFT), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.SAD_GOMPY] = {
			name = "Sad Gompy", 
			image = l__getEmoteAsset__3(l__EmoteType__6.SAD_GOMPY), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.SELFIE] = {
			name = "Christmas Selfie", 
			image = l__getEmoteAsset__3(l__EmoteType__6.SELFIE), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.STOCKING] = {
			name = "Stocking", 
			image = l__getEmoteAsset__3(l__EmoteType__6.STOCKING), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.TEAMWORK] = {
			name = "Teamwork", 
			image = l__getEmoteAsset__3(l__EmoteType__6.TEAMWORK), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.WINSTREAK] = {
			name = "Winstreak", 
			image = l__getEmoteAsset__3(l__EmoteType__6.WINSTREAK), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.WORM_FARMER] = {
			name = "Worm Farmer", 
			image = l__getEmoteAsset__3(l__EmoteType__6.WORM_FARMER), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.ELDERTREE_GG] = {
			name = "Eldertree GG", 
			image = l__getEmoteAsset__3(l__EmoteType__6.ELDERTREE_GG), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.FREIYA_3] = {
			name = "Freiya Snowflake", 
			image = l__getEmoteAsset__3(l__EmoteType__6.FREIYA_3), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.FREIYA_3] = {
			name = "Freiya Snowflake", 
			image = l__getEmoteAsset__3(l__EmoteType__6.FREIYA_3), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.FREIYA_3] = {
			name = "Freiya Snowflake", 
			image = l__getEmoteAsset__3(l__EmoteType__6.FREIYA_3), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.CHRISTMAS_TREE] = {
			name = "Christmas Tree", 
			image = l__getEmoteAsset__3(l__EmoteType__6.CHRISTMAS_TREE), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.CHRISTMAS_DODO] = {
			name = "Christmas Dodo", 
			image = l__getEmoteAsset__3(l__EmoteType__6.CHRISTMAS_DODO), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.ROCK_OUT] = {
			name = "Rock Out", 
			animation = {
				type = l__AnimationType__2.ROCK_OUT, 
				looped = true
			}, 
			soundsOnBegin = { {
					sound = "rbxassetid://1837546019", 
					looped = true
				} }
		}, 
		[l__EmoteType__6.PARTY_UP] = {
			name = "Party Up", 
			animation = {
				type = l__AnimationType__2.PARTY_UP, 
				looped = true
			}, 
			soundsOnBegin = { {
					sound = "rbxassetid://9040055917", 
					looped = true
				} }
		}, 
		[l__EmoteType__6.SIDE_TO_SIDE] = {
			name = "Side to Side", 
			animation = {
				type = l__AnimationType__2.SIDE_TO_SIDE, 
				looped = true
			}, 
			soundsOnBegin = { {
					sound = "rbxassetid://1846890625", 
					looped = true
				} }
		}, 
		[l__EmoteType__6.ACADEMY_AERY_GL] = {
			name = "Aery Good Luck", 
			image = l__getEmoteAsset__3(l__EmoteType__6.ACADEMY_AERY_GL), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.ACADEMY_AERY_READ] = {
			name = "Aery Read", 
			image = l__getEmoteAsset__3(l__EmoteType__6.ACADEMY_AERY_READ), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.AERY_KILLER_INSTINCT] = {
			name = "Killer Instinct Aery", 
			image = l__getEmoteAsset__3(l__EmoteType__6.CHRISTMAS_DODO), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.AERY_PRO] = {
			name = "Pro Aery", 
			image = l__getEmoteAsset__3(l__EmoteType__6.AERY_PRO), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.AERY_WINSTREAK] = {
			name = "Aery Winstreak", 
			image = l__getEmoteAsset__3(l__EmoteType__6.AERY_WINSTREAK), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.AMY_NO] = {
			name = "No", 
			image = l__getEmoteAsset__3(l__EmoteType__6.AMY_NO), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.ARCHER_THUMBS_DOWN] = {
			name = "Thumbs Down", 
			image = l__getEmoteAsset__3(l__EmoteType__6.ARCHER_THUMBS_DOWN), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BARBARIAN_ENRAGED] = {
			name = "Rage", 
			image = l__getEmoteAsset__3(l__EmoteType__6.BARBARIAN_ENRAGED), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BARBARIAN_WAVE] = {
			name = "Wave", 
			image = l__getEmoteAsset__3(l__EmoteType__6.BARBARIAN_WAVE), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BUILDER_SPEECHLESS] = {
			name = "Builder Speechless", 
			image = l__getEmoteAsset__3(l__EmoteType__6.BUILDER_SPEECHLESS), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.CLAN_INVITE] = {
			name = "Clan Invite", 
			image = l__getEmoteAsset__3(l__EmoteType__6.CLAN_INVITE), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.DE_VANESSA_SPEECHLESS] = {
			name = "Vanessa Speechless", 
			image = l__getEmoteAsset__3(l__EmoteType__6.DE_VANESSA_SPEECHLESS), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.DONT_RUSH_ME_PLS] = {
			name = "Don't Rush Me Pls", 
			image = l__getEmoteAsset__3(l__EmoteType__6.DONT_RUSH_ME_PLS), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.DUCK_CELEBRATION] = {
			name = "Duck Celebration", 
			image = l__getEmoteAsset__3(l__EmoteType__6.DUCK_CELEBRATION), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.ELDER_TREE_INJURED] = {
			name = "Injured", 
			image = l__getEmoteAsset__3(l__EmoteType__6.ELDER_TREE_INJURED), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.FARMER_ANGRY] = {
			name = "Ouchies", 
			image = l__getEmoteAsset__3(l__EmoteType__6.FARMER_ANGRY), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.FREIYA_SURPRISED] = {
			name = "Surprised Freiya", 
			image = l__getEmoteAsset__3(l__EmoteType__6.FREIYA_SURPRISED), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.GRIM_REAPER_GG] = {
			name = "Grim Reaper GG", 
			image = l__getEmoteAsset__3(l__EmoteType__6.GRIM_REAPER_GG), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.GRIM_REAPER_STICKER] = {
			name = "Grim Reaper Sticker", 
			image = l__getEmoteAsset__3(l__EmoteType__6.GRIM_REAPER_STICKER), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.JADE_GG] = {
			name = "Jade GG", 
			image = l__getEmoteAsset__3(l__EmoteType__6.JADE_GG), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.JADE_HEART] = {
			name = "Jade Heart", 
			image = l__getEmoteAsset__3(l__EmoteType__6.JADE_HEART), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.LASSY_CELEBRATION] = {
			name = "Celebration!", 
			image = l__getEmoteAsset__3(l__EmoteType__6.LASSY_CELEBRATION), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.LASSY_GRAB] = {
			name = "Grab", 
			image = l__getEmoteAsset__3(l__EmoteType__6.LASSY_GRAB), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.MINER_UWU] = {
			name = "Miner UWU", 
			image = l__getEmoteAsset__3(l__EmoteType__6.MINER_UWU), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.MINER_LAUGH] = {
			name = "Miner HAHA!", 
			image = l__getEmoteAsset__3(l__EmoteType__6.MINER_LAUGH), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.SPACE_MINER_RAGE] = {
			name = "Miner Rage", 
			image = l__getEmoteAsset__3(l__EmoteType__6.SPACE_MINER_RAGE), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.SPIRIT_CATACHER_LOL] = {
			name = "LOL", 
			image = l__getEmoteAsset__3(l__EmoteType__6.SPIRIT_CATACHER_LOL), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.SPIRIT_TEAMWORK] = {
			name = "Spirit Teamwork", 
			image = l__getEmoteAsset__3(l__EmoteType__6.SPIRIT_TEAMWORK), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.TO_BATTLE] = {
			name = "To Battle!", 
			image = l__getEmoteAsset__3(l__EmoteType__6.TO_BATTLE), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.VULCAN_LOADING] = {
			name = "Loading...", 
			image = l__getEmoteAsset__3(l__EmoteType__6.VULCAN_LOADING), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.WARRIOR_UPDATE_DAY] = {
			name = "Update Hype", 
			image = l__getEmoteAsset__3(l__EmoteType__6.WARRIOR_UPDATE_DAY), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.YUZI_HYPE] = {
			name = "Hype", 
			image = l__getEmoteAsset__3(l__EmoteType__6.YUZI_HYPE), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.NICE] = {
			name = "Nice", 
			image = l__getEmoteAsset__3(l__EmoteType__6.NICE), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.SLAY] = {
			name = "Slay", 
			image = l__getEmoteAsset__3(l__EmoteType__6.SLAY), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.BOUNTY_MAD] = {
			name = "Bounty Hunter Mad", 
			image = l__getEmoteAsset__3(l__EmoteType__6.BOUNTY_MAD), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.NIGHTMARE_1] = {
			name = "Nightmare", 
			animation = {
				type = l__AnimationType__2.NIGHTMARE_LOOP, 
				looped = true
			}, 
			soundsOnBegin = { {
					sound = "rbxassetid://9188182911", 
					looped = true
				} }
		}, 
		[l__EmoteType__6.VICTORIOUS_BETA] = {
			name = "Victorious BETA", 
			image = l__getEmoteAsset__3(l__EmoteType__6.VICTORIOUS_BETA), 
			emoteDisplayType = l__EmoteDisplayType__5.IMAGE_DEFAULT
		}, 
		[l__EmoteType__6.EASTER_BUNNY] = {
			name = "Easter Bunny", 
			animation = {
				type = l__AnimationType__2.EASTER_BUNNY_EMOTE_PLAYER, 
				looped = false, 
				noAutoPlayAnimation = true
			}
		}, 
		[l__EmoteType__6.BEACH_VACATION] = {
			name = "Beach Vacation", 
			animation = {
				type = l__AnimationType__2.BEACH_VACATION, 
				looped = true
			}
		}, 
		[l__EmoteType__6.WIGGLE] = {
			name = "Wiggle", 
			animation = {
				type = l__AnimationType__2.WIGGLE, 
				looped = true
			}
		}, 
		[l__EmoteType__6.ROCK_PAPER_SCISSORS] = {
			name = "Rock Paper Scissors", 
			animation = {
				type = l__AnimationType__2.ROCK_PAPER_SCISSORS, 
				looped = false
			}
		}, 
		[l__EmoteType__6.COIN_TOSS] = {
			name = "Coin Toss", 
			animation = {
				type = l__AnimationType__2.COIN_TOSS, 
				looped = false
			}
		}, 
		[l__EmoteType__6.BAKER_PIECE_OF_CAKE] = {
			name = "Piece of Cake", 
			image = l__getEmoteAsset__3(l__EmoteType__6.BAKER_PIECE_OF_CAKE)
		}, 
		[l__EmoteType__6.BAKER_PROTECTION] = {
			name = "Item Protection", 
			image = l__getEmoteAsset__3(l__EmoteType__6.BAKER_PROTECTION)
		}, 
		[l__EmoteType__6.BARB_U_SHALL_NOT_PASS] = {
			name = "U Shall Not Pass", 
			image = l__getEmoteAsset__3(l__EmoteType__6.BARB_U_SHALL_NOT_PASS)
		}, 
		[l__EmoteType__6.BUILDER_HELP_PLS] = {
			name = "Builder Needs Help", 
			image = l__getEmoteAsset__3(l__EmoteType__6.BUILDER_HELP_PLS)
		}, 
		[l__EmoteType__6.CLETUS_TROLL] = {
			name = "Cletus Troll", 
			image = l__getEmoteAsset__3(l__EmoteType__6.CLETUS_TROLL)
		}, 
		[l__EmoteType__6.CYBER_DAB] = {
			name = "Cyber Dab", 
			image = l__getEmoteAsset__3(l__EmoteType__6.CYBER_DAB)
		}, 
		[l__EmoteType__6.TIGER_WELL_PLAYED] = {
			name = "Well Played", 
			image = l__getEmoteAsset__3(l__EmoteType__6.TIGER_WELL_PLAYED)
		}, 
		[l__EmoteType__6.CYBER_DEFENSE] = {
			name = "Vulcan Defense", 
			image = l__getEmoteAsset__3(l__EmoteType__6.CYBER_DEFENSE)
		}, 
		[l__EmoteType__6.CYBER_MAD] = {
			name = "Cyber Mad", 
			image = l__getEmoteAsset__3(l__EmoteType__6.CYBER_MAD)
		}, 
		[l__EmoteType__6.CYBER_OVERHEAT] = {
			name = "Vulcan Overheat", 
			image = l__getEmoteAsset__3(l__EmoteType__6.VULCAN_OVERHEAT), 
			disabled = true
		}, 
		[l__EmoteType__6.VULCAN_OVERHEAT] = {
			name = "Vulcan Overheat", 
			image = l__getEmoteAsset__3(l__EmoteType__6.VULCAN_OVERHEAT)
		}, 
		[l__EmoteType__6.DINO_HAI] = {
			name = "Dino Hai", 
			image = l__getEmoteAsset__3(l__EmoteType__6.DINO_HAI)
		}, 
		[l__EmoteType__6.DINO_RAWR] = {
			name = "Dino Rawr", 
			image = l__getEmoteAsset__3(l__EmoteType__6.DINO_RAWR)
		}, 
		[l__EmoteType__6.DINO_YIPEEE] = {
			name = "Dino Yipeee", 
			image = l__getEmoteAsset__3(l__EmoteType__6.DINO_YIPEEE)
		}, 
		[l__EmoteType__6.FREIYA_BEG] = {
			name = "Freiya Hearts", 
			image = l__getEmoteAsset__3(l__EmoteType__6.FREIYA_HEARTS), 
			disabled = true
		}, 
		[l__EmoteType__6.FREIYA_HEARTS] = {
			name = "Freiya Hearts", 
			image = l__getEmoteAsset__3(l__EmoteType__6.FREIYA_HEARTS)
		}, 
		[l__EmoteType__6.LUMEN_PAIN] = {
			name = "Lumen Pain", 
			image = l__getEmoteAsset__3(l__EmoteType__6.LUMEN_PAIN)
		}, 
		[l__EmoteType__6.MELODY_YOU_ROCK] = {
			name = "Melody You Rock", 
			image = l__getEmoteAsset__3(l__EmoteType__6.MELODY_YOU_ROCK)
		}, 
		[l__EmoteType__6.METAL_DETECTOR] = {
			name = "Metal Detector", 
			image = l__getEmoteAsset__3(l__EmoteType__6.METAL_DETECTOR)
		}, 
		[l__EmoteType__6.OH_MY_STARS] = {
			name = "Oh My Stars!", 
			image = l__getEmoteAsset__3(l__EmoteType__6.OH_MY_STARS)
		}, 
		[l__EmoteType__6.RAINING_GEMS] = {
			name = "Raining Gems", 
			image = l__getEmoteAsset__3(l__EmoteType__6.RAINING_GEMS)
		}, 
		[l__EmoteType__6.RAVEN_RIP] = {
			name = "Raven RIP", 
			image = l__getEmoteAsset__3(l__EmoteType__6.RAVEN_RIP)
		}, 
		[l__EmoteType__6.REAPER_GOT_EM] = {
			name = "Reaper Got Em", 
			image = l__getEmoteAsset__3(l__EmoteType__6.REAPER_GOT_EM)
		}, 
		[l__EmoteType__6.SMOKE_WAVE] = {
			name = "Smoke Wave", 
			image = l__getEmoteAsset__3(l__EmoteType__6.SMOKE_WAVE)
		}, 
		[l__EmoteType__6.STAR_COLLECTOR_FUN] = {
			name = "Star Collector Fun", 
			image = l__getEmoteAsset__3(l__EmoteType__6.STAR_COLLECTOR_FUN)
		}, 
		[l__EmoteType__6.TESLA_DANGER] = {
			name = "Tesla Danger Sign", 
			image = l__getEmoteAsset__3(l__EmoteType__6.TESLA_DANGER)
		}, 
		[l__EmoteType__6.JADE_IM_THE_BEST] = {
			name = "Jade Im The Best", 
			image = l__getEmoteAsset__3(l__EmoteType__6.JADE_IM_THE_BEST)
		}, 
		[l__EmoteType__6.LV50_DUO_WOMBO_COMBO] = {
			name = "Lv50 Wombo Combo", 
			image = l__getEmoteAsset__3(l__EmoteType__6.LV50_DUO_WOMBO_COMBO)
		}, 
		[l__EmoteType__6.SPIRIT_DUO_EZ] = {
			name = "Spirit Duo EZ", 
			image = l__getEmoteAsset__3(l__EmoteType__6.SPIRIT_DUO_EZ)
		}, 
		[l__EmoteType__6.PENGUIN_PUNCH] = {
			name = "Penguin Punch", 
			image = "rbxassetid://10321183674"
		}, 
		[l__EmoteType__6.PENGUIN_DEAL_WITH_IT] = {
			name = "Penguin Deal With It", 
			image = "rbxassetid://10321184569"
		}, 
		[l__EmoteType__6.PENGUIN_KING_TROPHY] = {
			name = "Penguin King Trophy", 
			image = "rbxassetid://10321184147"
		}, 
		[l__EmoteType__6.HANNAH_GHOST_MOMENT] = {
			name = "Hannah Ghost Moment", 
			image = "rbxassetid://10736278063"
		}, 
		[l__EmoteType__6.HANNAH_SORRY_NOT] = {
			name = "Hannah Sorry Not Sorry", 
			image = "rbxassetid://10736277001"
		}, 
		[l__EmoteType__6.SMOKE_AGAIN] = {
			name = "Smoke Again!", 
			image = "rbxassetid://10736276378"
		}, 
		[l__EmoteType__6.ZEPHYR_BEGONE] = {
			name = "Zephyr Begone", 
			image = "rbxassetid://10753604126"
		}, 
		[l__EmoteType__6.ZEPHYR_GOING_FAST] = {
			name = "Zephyr Going FAST", 
			image = "rbxassetid://10736275314"
		}, 
		[l__EmoteType__6.SEARCHING_FAR_AWAY] = {
			name = "Searching Far Away", 
			animation = {
				type = l__AnimationType__2.SEARCHING_FAR_AWAY, 
				looped = true
			}
		}, 
		[l__EmoteType__6.PIRATES_GOODBYE] = {
			name = "Pirates Goodbye", 
			animation = {
				type = l__AnimationType__2.PIRATES_GOODBYE, 
				looped = false
			}
		}, 
		[l__EmoteType__6.HANNAH_GHOSTED] = {
			name = "Hannah Ghosted", 
			image = "rbxassetid://10736277594"
		}, 
		[l__EmoteType__6.HANNAH_FEAR] = {
			name = "Hannah Fear", 
			image = "rbxassetid://10736279082"
		}, 
		[l__EmoteType__6.HANNAH_FIRED_UP] = {
			name = "Hannah Fired Up", 
			image = "rbxassetid://10759063729"
		}, 
		[l__EmoteType__6.SMOKE_DUDE] = {
			name = "Smoke Dude...", 
			image = "rbxassetid://10753603855"
		}, 
		[l__EmoteType__6.GHOST_DAVEY] = {
			name = "Ghost Davey", 
			image = "rbxassetid://10753604326"
		}
	}
};
