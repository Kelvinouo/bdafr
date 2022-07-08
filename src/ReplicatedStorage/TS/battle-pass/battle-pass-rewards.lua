-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsKitSkin__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__EmoteType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__KillEffectType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local l__LobbyGadgetType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local l__TitleType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
return {
	BattlePassRewards = {
		season5 = { {
				paid = false, 
				level = 10, 
				kit = l__BedwarsKit__3.MERCHANT
			}, {
				paid = true, 
				level = 30, 
				kit = l__BedwarsKit__3.BATTERY
			}, {
				paid = false, 
				level = 40, 
				kit = l__BedwarsKit__3.STAR_COLLECTOR
			}, {
				paid = true, 
				level = 50, 
				kit = l__BedwarsKit__3.WIND_WALKER
			}, {
				paid = false, 
				level = 20, 
				kit = l__BedwarsKit__3.DINO_TAMER
			}, {
				paid = true, 
				level = 5, 
				kit = l__BedwarsKit__3.PINATA
			}, {
				paid = false, 
				level = 29, 
				killEffect = l__KillEffectType__5.BEACH_BALL
			}, {
				paid = true, 
				level = 47, 
				killEffect = l__KillEffectType__5.GLITCH
			}, {
				paid = true, 
				level = 5, 
				killEffect = l__KillEffectType__5.LIFE_RING
			}, {
				paid = true, 
				level = 35, 
				lobbyGadget = l__LobbyGadgetType__6.GRAPPLING_HOOK
			}, {
				paid = true, 
				level = 1, 
				lobbyGadget = l__LobbyGadgetType__6.VOID_SWORD
			}, {
				paid = false, 
				level = 15, 
				lobbyGadget = l__LobbyGadgetType__6.SCYTHE
			}, {
				paid = true, 
				level = 1, 
				emote = l__EmoteType__4.BEACH_VACATION
			}, {
				paid = false, 
				level = 25, 
				emote = l__EmoteType__4.WIGGLE
			}, {
				paid = false, 
				level = 45, 
				emote = l__EmoteType__4.ROCK_PAPER_SCISSORS
			}, {
				paid = true, 
				level = 1, 
				emote = l__EmoteType__4.VULCAN_OVERHEAT
			}, {
				paid = false, 
				level = 2, 
				emote = l__EmoteType__4.SMOKE_WAVE
			}, {
				paid = true, 
				level = 4, 
				emote = l__EmoteType__4.DINO_HAI
			}, {
				paid = false, 
				level = 5, 
				emote = l__EmoteType__4.JADE_IM_THE_BEST
			}, {
				paid = false, 
				level = 6, 
				emote = l__EmoteType__4.RAVEN_RIP
			}, {
				paid = true, 
				level = 8, 
				emote = l__EmoteType__4.FREIYA_HEARTS
			}, {
				paid = true, 
				level = 11, 
				emote = l__EmoteType__4.TESLA_DANGER
			}, {
				paid = false, 
				level = 13, 
				emote = l__EmoteType__4.CYBER_DAB
			}, {
				paid = true, 
				level = 16, 
				emote = l__EmoteType__4.CLETUS_TROLL
			}, {
				paid = false, 
				level = 18, 
				emote = l__EmoteType__4.BAKER_PROTECTION
			}, {
				paid = true, 
				level = 19, 
				emote = l__EmoteType__4.BAKER_PIECE_OF_CAKE
			}, {
				paid = true, 
				level = 20, 
				emote = l__EmoteType__4.DINO_RAWR
			}, {
				paid = true, 
				level = 21, 
				emote = l__EmoteType__4.SPIRIT_DUO_EZ
			}, {
				paid = false, 
				level = 23, 
				emote = l__EmoteType__4.MELODY_YOU_ROCK
			}, {
				paid = true, 
				level = 24, 
				emote = l__EmoteType__4.METAL_DETECTOR
			}, {
				paid = false, 
				level = 26, 
				emote = l__EmoteType__4.BARB_U_SHALL_NOT_PASS
			}, {
				paid = true, 
				level = 28, 
				emote = l__EmoteType__4.CYBER_MAD
			}, {
				paid = false, 
				level = 31, 
				emote = l__EmoteType__4.LV50_DUO_WOMBO_COMBO
			}, {
				paid = true, 
				level = 31, 
				emote = l__EmoteType__4.STAR_COLLECTOR_FUN
			}, {
				paid = true, 
				level = 32, 
				emote = l__EmoteType__4.REAPER_GOT_EM
			}, {
				paid = false, 
				level = 33, 
				emote = l__EmoteType__4.TIGER_WELL_PLAYED
			}, {
				paid = false, 
				level = 37, 
				emote = l__EmoteType__4.RAINING_GEMS
			}, {
				paid = true, 
				level = 39, 
				emote = l__EmoteType__4.BUILDER_HELP_PLS
			}, {
				paid = true, 
				level = 40, 
				emote = l__EmoteType__4.OH_MY_STARS
			}, {
				paid = false, 
				level = 43, 
				emote = l__EmoteType__4.CYBER_DEFENSE
			}, {
				paid = true, 
				level = 46, 
				emote = l__EmoteType__4.LUMEN_PAIN
			}, {
				paid = true, 
				level = 49, 
				emote = l__EmoteType__4.DINO_YIPEEE
			}, {
				paid = true, 
				level = 3, 
				title = l__TitleType__7.SUMMER
			}, {
				paid = true, 
				level = 7, 
				title = l__TitleType__7.DINOSAUR
			}, {
				paid = false, 
				level = 9, 
				title = l__TitleType__7.DEAL_OR_NO_DEAL
			}, {
				paid = false, 
				level = 12, 
				title = l__TitleType__7.SPECIALIST
			}, {
				paid = true, 
				level = 13, 
				title = l__TitleType__7.BEACH_EMOJI
			}, {
				paid = true, 
				level = 14, 
				title = l__TitleType__7.HARD_STUCK
			}, {
				paid = true, 
				level = 17, 
				title = l__TitleType__7.SUMMER_EMOJI
			}, {
				paid = false, 
				level = 22, 
				title = l__TitleType__7.BEACH_DAY
			}, {
				paid = true, 
				level = 27, 
				title = l__TitleType__7.BAITED
			}, {
				paid = false, 
				level = 34, 
				title = l__TitleType__7.VOID
			}, {
				paid = true, 
				level = 36, 
				title = l__TitleType__7.CHAD
			}, {
				paid = true, 
				level = 38, 
				title = l__TitleType__7.STAR
			}, {
				paid = true, 
				level = 41, 
				title = l__TitleType__7.SHARK
			}, {
				paid = false, 
				level = 42, 
				title = l__TitleType__7.HARD_CARRY
			}, {
				paid = true, 
				level = 44, 
				title = l__TitleType__7.TRADE_OFFER
			}, {
				paid = false, 
				level = 48, 
				title = l__TitleType__7.SUNGLASSES
			}, {
				paid = true, 
				level = 50, 
				title = l__TitleType__7.ZEPHYR
			} }, 
		season4 = { {
				paid = false, 
				level = 10, 
				kit = l__BedwarsKit__3.ALCHEMIST
			}, {
				paid = true, 
				level = 30, 
				kit = l__BedwarsKit__3.BEAST
			}, {
				paid = false, 
				level = 40, 
				kit = l__BedwarsKit__3.CONQUEROR
			}, {
				paid = true, 
				level = 50, 
				kit = l__BedwarsKit__3.MIDNIGHT
			}, {
				paid = false, 
				level = 20, 
				kit = l__BedwarsKit__3.SHEEP_HERDER
			}, {
				paid = true, 
				level = 5, 
				kit = l__BedwarsKit__3.METAL_DETECTOR
			}, {
				paid = false, 
				level = 12, 
				kitSkin = l__BedwarsKitSkin__2.FREIYA_TIGER_BRAWLER
			}, {
				paid = true, 
				level = 40, 
				kitSkin = l__BedwarsKitSkin__2.BAKER_SPIRIT
			}, {
				paid = false, 
				level = 29, 
				killEffect = l__KillEffectType__5.BIRD
			}, {
				paid = true, 
				level = 47, 
				killEffect = l__KillEffectType__5.ROCKET
			}, {
				paid = true, 
				level = 5, 
				killEffect = l__KillEffectType__5.BLACKHOLE
			}, {
				paid = true, 
				level = 35, 
				lobbyGadget = l__LobbyGadgetType__6.JADE_HAMMER
			}, {
				paid = true, 
				level = 1, 
				lobbyGadget = l__LobbyGadgetType__6.FREIYA_ICE_SWORD
			}, {
				paid = false, 
				level = 15, 
				lobbyGadget = l__LobbyGadgetType__6.RAVEN
			}, {
				paid = true, 
				level = 1, 
				emote = l__EmoteType__4.ROCK_OUT
			}, {
				paid = false, 
				level = 33, 
				emote = l__EmoteType__4.PARTY_UP
			}, {
				paid = false, 
				level = 45, 
				emote = l__EmoteType__4.SIDE_TO_SIDE
			}, {
				paid = false, 
				level = 25, 
				emote = l__EmoteType__4.BOUNTY_MAD
			}, {
				paid = true, 
				level = 1, 
				emote = l__EmoteType__4.YUZI_HYPE
			}, {
				paid = false, 
				level = 1, 
				emote = l__EmoteType__4.WARRIOR_UPDATE_DAY
			}, {
				paid = true, 
				level = 4, 
				emote = l__EmoteType__4.ACADEMY_AERY_GL
			}, {
				paid = true, 
				level = 1, 
				emote = l__EmoteType__4.ACADEMY_AERY_READ
			}, {
				paid = true, 
				level = 45, 
				emote = l__EmoteType__4.NICE
			}, {
				paid = true, 
				level = 30, 
				emote = l__EmoteType__4.SLAY
			}, {
				paid = true, 
				level = 21, 
				emote = l__EmoteType__4.AERY_PRO
			}, {
				paid = false, 
				level = 2, 
				emote = l__EmoteType__4.AERY_WINSTREAK
			}, {
				paid = false, 
				level = 43, 
				emote = l__EmoteType__4.AMY_NO
			}, {
				paid = false, 
				level = 37, 
				emote = l__EmoteType__4.ARCHER_THUMBS_DOWN
			}, {
				paid = true, 
				level = 49, 
				emote = l__EmoteType__4.BARBARIAN_ENRAGED
			}, {
				paid = false, 
				level = 5, 
				emote = l__EmoteType__4.BARBARIAN_WAVE
			}, {
				paid = true, 
				level = 6, 
				emote = l__EmoteType__4.BUILDER_SPEECHLESS
			}, {
				paid = true, 
				level = 3, 
				emote = l__EmoteType__4.CLAN_INVITE
			}, {
				paid = true, 
				level = 8, 
				emote = l__EmoteType__4.DE_VANESSA_SPEECHLESS
			}, {
				paid = true, 
				level = 11, 
				emote = l__EmoteType__4.DONT_RUSH_ME_PLS
			}, {
				paid = true, 
				level = 32, 
				emote = l__EmoteType__4.DUCK_CELEBRATION
			}, {
				paid = true, 
				level = 19, 
				emote = l__EmoteType__4.ELDER_TREE_INJURED
			}, {
				paid = true, 
				level = 18, 
				emote = l__EmoteType__4.FARMER_ANGRY
			}, {
				paid = true, 
				level = 24, 
				emote = l__EmoteType__4.FREIYA_SURPRISED
			}, {
				paid = false, 
				level = 23, 
				emote = l__EmoteType__4.GRIM_REAPER_GG
			}, {
				paid = false, 
				level = 26, 
				emote = l__EmoteType__4.GRIM_REAPER_STICKER
			}, {
				paid = true, 
				level = 27, 
				emote = l__EmoteType__4.JADE_GG
			}, {
				paid = true, 
				level = 28, 
				emote = l__EmoteType__4.JADE_HEART
			}, {
				paid = true, 
				level = 31, 
				emote = l__EmoteType__4.LASSY_CELEBRATION
			}, {
				paid = true, 
				level = 22, 
				emote = l__EmoteType__4.LASSY_GRAB
			}, {
				paid = true, 
				level = 16, 
				emote = l__EmoteType__4.MINER_UWU
			}, {
				paid = true, 
				level = 34, 
				emote = l__EmoteType__4.MINER_LAUGH
			}, {
				paid = false, 
				level = 48, 
				emote = l__EmoteType__4.SPACE_MINER_RAGE
			}, {
				paid = true, 
				level = 37, 
				emote = l__EmoteType__4.SPIRIT_CATACHER_LOL
			}, {
				paid = false, 
				level = 13, 
				emote = l__EmoteType__4.SPIRIT_TEAMWORK
			}, {
				paid = false, 
				level = 16, 
				emote = l__EmoteType__4.TO_BATTLE
			}, {
				paid = true, 
				level = 42, 
				emote = l__EmoteType__4.VULCAN_LOADING
			}, {
				paid = false, 
				level = 47, 
				title = l__TitleType__7.CRACKED
			}, {
				paid = true, 
				level = 44, 
				title = l__TitleType__7.DUCK
			}, {
				paid = true, 
				level = 14, 
				title = l__TitleType__7.SKYWARS_MAIN
			}, {
				paid = false, 
				level = 28, 
				title = l__TitleType__7.RABBIT
			}, {
				paid = true, 
				level = 39, 
				title = l__TitleType__7.RABBIT_EMOJI
			}, {
				paid = false, 
				level = 34, 
				title = l__TitleType__7.HAPPY_EASTER
			}, {
				paid = false, 
				level = 9, 
				title = l__TitleType__7.BLOSSOM
			}, {
				paid = true, 
				level = 2, 
				title = l__TitleType__7.FLOWERS_EMOJI
			}, {
				paid = false, 
				level = 6, 
				title = l__TitleType__7.BORK
			}, {
				paid = true, 
				level = 38, 
				title = l__TitleType__7.ARROW_MAGNET
			}, {
				paid = false, 
				level = 21, 
				title = l__TitleType__7.SPIRIT_SPAMMER
			}, {
				paid = true, 
				level = 23, 
				title = l__TitleType__7.EMOTIONAL_DAMAGE
			}, {
				paid = true, 
				level = 33, 
				title = l__TitleType__7.JUGGERNAUT
			}, {
				paid = true, 
				level = 17, 
				title = l__TitleType__7.ENCHANTER
			}, {
				paid = true, 
				level = 50, 
				title = l__TitleType__7.MIDNIGHT
			}, {
				paid = true, 
				level = 20, 
				title = l__TitleType__7.SHEEP_EMOJI
			}, {
				paid = true, 
				level = 36, 
				title = l__TitleType__7.POTTER
			}, {
				paid = false, 
				level = 50, 
				title = l__TitleType__7.BEAST
			}, {
				paid = true, 
				level = 46, 
				title = l__TitleType__7.EMPEROR
			}, {
				paid = false, 
				level = 41, 
				title = l__TitleType__7.BLOCK_CLUTCHER
			}, {
				paid = true, 
				level = 7, 
				title = l__TitleType__7.COMBO_MASTER
			} }, 
		season3 = { {
				paid = true, 
				level = 25, 
				kit = l__BedwarsKit__3.SMOKE
			}, {
				paid = false, 
				level = 40, 
				kit = l__BedwarsKit__3.FROSTY
			}, {
				paid = true, 
				level = 10, 
				kit = l__BedwarsKit__3.SANTA
			}, {
				paid = false, 
				level = 30, 
				kit = l__BedwarsKit__3.YETI
			}, {
				paid = true, 
				level = 50, 
				kit = l__BedwarsKit__3.AERY
			}, {
				paid = false, 
				level = 20, 
				kit = l__BedwarsKit__3.GINGERBREAD_MAN
			}, {
				paid = false, 
				level = 25, 
				killEffect = l__KillEffectType__5.BLIMP
			}, {
				paid = true, 
				level = 15, 
				killEffect = l__KillEffectType__5.JELLY
			}, {
				paid = true, 
				level = 33, 
				killEffect = l__KillEffectType__5.GIFT
			}, {
				paid = false, 
				level = 43, 
				killEffect = l__KillEffectType__5.SNOWMAN
			}, {
				paid = true, 
				level = 1, 
				lobbyGadget = l__LobbyGadgetType__6.SPEED_BOOTS
			}, {
				paid = false, 
				level = 35, 
				lobbyGadget = l__LobbyGadgetType__6.JUMP_BOOTS
			}, {
				paid = true, 
				level = 50, 
				lobbyGadget = l__LobbyGadgetType__6.SNOW_BALL
			}, {
				paid = true, 
				level = 20, 
				lobbyGadget = l__LobbyGadgetType__6.RAGEBLADE
			}, {
				paid = false, 
				level = 45, 
				emote = l__EmoteType__4.ANGRY_BUILDER
			}, {
				paid = false, 
				level = 6, 
				emote = l__EmoteType__4.ARCHER
			}, {
				paid = true, 
				level = 41, 
				emote = l__EmoteType__4.ARSON
			}, {
				paid = false, 
				level = 9, 
				emote = l__EmoteType__4.AXOLOTL_SLEEPING
			}, {
				paid = true, 
				level = 46, 
				emote = l__EmoteType__4.AXOLOTLS
			}, {
				paid = true, 
				level = 5, 
				emote = l__EmoteType__4.BAKER_THUMBS_UP
			}, {
				paid = true, 
				level = 14, 
				emote = l__EmoteType__4.BALLOONS
			}, {
				paid = false, 
				level = 13, 
				emote = l__EmoteType__4.BEE
			}, {
				paid = true, 
				level = 8, 
				emote = l__EmoteType__4.STOCKING
			}, {
				paid = false, 
				level = 1, 
				emote = l__EmoteType__4.CHRISTMAS_ROCKET
			}, {
				paid = true, 
				level = 11, 
				emote = l__EmoteType__4.DUO
			}, {
				paid = true, 
				level = 17, 
				emote = l__EmoteType__4.EMERALD_ARMOR
			}, {
				paid = true, 
				level = 24, 
				emote = l__EmoteType__4.FREIYA
			}, {
				paid = false, 
				level = 19, 
				emote = l__EmoteType__4.FREIYA_2
			}, {
				paid = true, 
				level = 3, 
				emote = l__EmoteType__4.FREIYA_SNOWMAN
			}, {
				paid = true, 
				level = 29, 
				emote = l__EmoteType__4.HEART
			}, {
				paid = true, 
				level = 2, 
				emote = l__EmoteType__4.LUCKY_GIFT
			}, {
				paid = true, 
				level = 34, 
				emote = l__EmoteType__4.PYRO_COAL
			}, {
				paid = true, 
				level = 36, 
				emote = l__EmoteType__4.RAVEN_SKETCH
			}, {
				paid = true, 
				level = 22, 
				emote = l__EmoteType__4.REAPER_GIFT
			}, {
				paid = true, 
				level = 40, 
				emote = l__EmoteType__4.SAD_GOMPY
			}, {
				paid = true, 
				level = 48, 
				emote = l__EmoteType__4.SELFIE
			}, {
				paid = true, 
				level = 18, 
				emote = l__EmoteType__4.BOO
			}, {
				paid = true, 
				level = 42, 
				emote = l__EmoteType__4.TEAMWORK
			}, {
				paid = true, 
				level = 26, 
				emote = l__EmoteType__4.WINSTREAK
			}, {
				paid = true, 
				level = 38, 
				emote = l__EmoteType__4.WORM_FARMER
			}, {
				paid = true, 
				level = 28, 
				emote = l__EmoteType__4.FREIYA_3
			}, {
				paid = true, 
				level = 44, 
				emote = l__EmoteType__4.ELDERTREE_GG
			}, {
				paid = false, 
				level = 7, 
				emote = l__EmoteType__4.CHRISTMAS_DODO
			}, {
				paid = false, 
				level = 32, 
				emote = l__EmoteType__4.CHRISTMAS_TREE
			}, {
				paid = false, 
				level = 49, 
				title = l__TitleType__7.SWAG
			}, {
				paid = false, 
				level = 50, 
				title = l__TitleType__7.CHRISTMAS_TREE
			}, {
				paid = true, 
				level = 23, 
				title = l__TitleType__7.SANTA_CLAUS
			}, {
				paid = true, 
				level = 16, 
				title = l__TitleType__7.SNOWMAN
			}, {
				paid = true, 
				level = 35, 
				title = l__TitleType__7.THUMBSUP
			}, {
				paid = false, 
				level = 47, 
				title = l__TitleType__7.RAD
			}, {
				paid = false, 
				level = 22, 
				title = l__TitleType__7.AYOO
			}, {
				paid = false, 
				level = 36, 
				title = l__TitleType__7.BING_BONG
			}, {
				paid = false, 
				level = 8, 
				title = l__TitleType__7.FROSTY
			}, {
				paid = false, 
				level = 15, 
				title = l__TitleType__7.SNOWFLAKE
			}, {
				paid = false, 
				level = 16, 
				title = l__TitleType__7.COLD
			}, {
				paid = false, 
				level = 27, 
				title = l__TitleType__7.BIGBRAIN
			}, {
				paid = false, 
				level = 42, 
				title = l__TitleType__7.CLUTCHGOD
			}, {
				paid = true, 
				level = 32, 
				title = l__TitleType__7.BOWMASTER
			}, {
				paid = false, 
				level = 28, 
				title = l__TitleType__7.MICCHECK
			}, {
				paid = false, 
				level = 45, 
				title = l__TitleType__7.LUCKY
			}, {
				paid = false, 
				level = 33, 
				title = l__TitleType__7.COZY
			}, {
				paid = false, 
				level = 37, 
				title = l__TitleType__7.DERP
			}, {
				paid = false, 
				level = 39, 
				title = l__TitleType__7.BEAR
			}, {
				paid = false, 
				level = 31, 
				title = l__TitleType__7.SWORD
			}, {
				paid = false, 
				level = 4, 
				title = l__TitleType__7.QUIRKY
			}, {
				paid = false, 
				level = 21, 
				title = l__TitleType__7.JACK_FROST
			}, {
				paid = false, 
				level = 12, 
				title = l__TitleType__7.ICE_QUEEN
			}, {
				paid = true, 
				level = 7, 
				title = l__TitleType__7.MERRY_CHRISTMAS
			} }, 
		season2 = { {
				paid = true, 
				level = 1, 
				emote = l__EmoteType__4.SPOOKY
			}, {
				paid = false, 
				level = 1, 
				title = l__TitleType__7.BOO
			}, {
				paid = true, 
				level = 2, 
				title = l__TitleType__7.TEAM_PLAYER
			}, {
				paid = true, 
				level = 3, 
				kit = l__BedwarsKit__3.TRAPPER
			}, {
				paid = false, 
				level = 4, 
				emote = l__EmoteType__4.SURRENDER
			}, {
				paid = true, 
				level = 5, 
				title = l__TitleType__7.UMM
			}, {
				paid = false, 
				level = 6, 
				emote = l__EmoteType__4.READY_UP
			}, {
				paid = true, 
				level = 7, 
				emote = l__EmoteType__4.VULCAN_ERROR
			}, {
				paid = false, 
				level = 8, 
				title = l__TitleType__7.OBSIDIAN_OP
			}, {
				paid = true, 
				level = 9, 
				emote = l__EmoteType__4.BEE_CUTE
			}, {
				paid = false, 
				level = 10, 
				emote = l__EmoteType__4.WAITING_ON_IRON
			}, {
				paid = true, 
				level = 11, 
				emote = l__EmoteType__4.REAPER_SMILE
			}, {
				paid = false, 
				level = 12, 
				title = l__TitleType__7.ZOMBIE
			}, {
				paid = true, 
				level = 13, 
				emote = l__EmoteType__4.ZOMBIE_BARBARIAN
			}, {
				paid = false, 
				level = 14, 
				title = l__TitleType__7.GAMER
			}, {
				paid = true, 
				level = 15, 
				emote = l__EmoteType__4.RAVEN_KNIFE
			}, {
				paid = false, 
				level = 16, 
				emote = l__EmoteType__4.BABY_DODO
			}, {
				paid = true, 
				level = 17, 
				title = l__TitleType__7.CAT_FACE_2
			}, {
				paid = false, 
				level = 18, 
				title = l__TitleType__7.SURFER
			}, {
				paid = true, 
				level = 19, 
				emote = l__EmoteType__4.HAPPY_GOMPY
			}, {
				paid = false, 
				level = 20, 
				kit = l__BedwarsKit__3.GHOST_CATCHER
			}, {
				paid = true, 
				level = 21, 
				emote = l__EmoteType__4.NO_BULLY
			}, {
				paid = false, 
				level = 22, 
				title = l__TitleType__7.RIP
			}, {
				paid = true, 
				level = 23, 
				title = l__TitleType__7.CRANK_90
			}, {
				paid = false, 
				level = 24, 
				emote = l__EmoteType__4.JADE_VAMPIRE
			}, {
				paid = true, 
				level = 25, 
				kit = l__BedwarsKit__3.FISHERMAN
			}, {
				paid = false, 
				level = 26, 
				title = l__TitleType__7.SUPER_STAR
			}, {
				paid = true, 
				level = 27, 
				emote = l__EmoteType__4.CONTROLLING_REAPER
			}, {
				paid = false, 
				level = 28, 
				title = l__TitleType__7.YOU_FR
			}, {
				paid = false, 
				level = 27, 
				title = l__TitleType__7.OKAY
			}, {
				paid = true, 
				level = 28, 
				title = l__TitleType__7.RICH
			}, {
				paid = false, 
				level = 29, 
				title = l__TitleType__7.HAUNTED
			}, {
				paid = true, 
				level = 30, 
				emote = l__EmoteType__4.RAVEN_FLOWER
			}, {
				paid = false, 
				level = 31, 
				emote = l__EmoteType__4.FISHERMAN
			}, {
				paid = true, 
				level = 32, 
				title = l__TitleType__7.WOOF
			}, {
				paid = false, 
				level = 33, 
				emote = l__EmoteType__4.BED_KING
			}, {
				paid = true, 
				level = 34, 
				title = l__TitleType__7.SHRUG
			}, {
				paid = true, 
				level = 35, 
				title = l__TitleType__7.EBOY
			}, {
				paid = true, 
				level = 36, 
				emote = l__EmoteType__4.VULCAN_GRAVE
			}, {
				paid = false, 
				level = 37, 
				title = l__TitleType__7.DODO
			}, {
				paid = true, 
				level = 38, 
				title = l__TitleType__7.EGIRL
			}, {
				paid = false, 
				level = 39, 
				title = l__TitleType__7.TRICK_OR_TREAT
			}, {
				paid = false, 
				level = 40, 
				kit = l__BedwarsKit__3.OIL_MAN
			}, {
				paid = true, 
				level = 41, 
				emote = l__EmoteType__4.BEEKEEPER_EMERALD
			}, {
				paid = false, 
				level = 42, 
				emote = l__EmoteType__4.BOUNTY_HUNTER
			}, {
				paid = true, 
				level = 43, 
				emote = l__EmoteType__4.HEADLESS_CLETUS
			}, {
				paid = false, 
				level = 44, 
				emote = l__EmoteType__4.ZOMBIE_MELODY
			}, {
				paid = true, 
				level = 45, 
				emote = l__EmoteType__4.BED_BREAKER
			}, {
				paid = false, 
				level = 46, 
				title = l__TitleType__7.XD
			}, {
				paid = true, 
				level = 47, 
				title = l__TitleType__7.GHOST
			}, {
				paid = false, 
				level = 48, 
				title = l__TitleType__7.GGANBU
			}, {
				paid = true, 
				level = 49, 
				title = l__TitleType__7.UWU
			}, {
				paid = true, 
				level = 50, 
				kit = l__BedwarsKit__3.SPEARMAN
			} }, 
		season1 = { {
				paid = true, 
				level = 1, 
				emote = l__EmoteType__4.CLETUS_CARROT
			}, {
				paid = false, 
				level = 1, 
				title = l__TitleType__7.UPDATE_HYPE
			}, {
				paid = true, 
				level = 2, 
				title = l__TitleType__7.BOT
			}, {
				paid = false, 
				level = 3, 
				emote = l__EmoteType__4.BUILDER_HAMMER
			}, {
				paid = true, 
				level = 4, 
				emote = l__EmoteType__4.MELODY_TUNES
			}, {
				paid = false, 
				level = 4, 
				title = l__TitleType__7.AGGRO
			}, {
				paid = false, 
				level = 5, 
				title = l__TitleType__7.ISLANDS_MAIN
			}, {
				paid = true, 
				level = 5, 
				killEffect = l__KillEffectType__5.EXPLODE
			}, {
				paid = true, 
				level = 6, 
				title = l__TitleType__7.INVITE_ME
			}, {
				paid = true, 
				level = 7, 
				emote = l__EmoteType__4.PIRATE_BALLOONS
			}, {
				paid = false, 
				level = 7, 
				title = l__TitleType__7.GOD_BRIDGER
			}, {
				paid = true, 
				level = 8, 
				title = l__TitleType__7.FARMER
			}, {
				paid = false, 
				level = 8, 
				title = l__TitleType__7.SNIPER
			}, {
				paid = true, 
				level = 9, 
				emote = l__EmoteType__4.LASSY_EMERALDS
			}, {
				paid = true, 
				level = 10, 
				kit = l__BedwarsKit__3.WARRIOR
			}, {
				paid = false, 
				level = 10, 
				title = l__TitleType__7.ONE_V_ONE_ME
			}, {
				paid = true, 
				level = 11, 
				emote = l__EmoteType__4.CHUNKY_ELDER_TREE
			}, {
				paid = true, 
				level = 12, 
				title = l__TitleType__7.SMILE
			}, {
				paid = false, 
				level = 13, 
				emote = l__EmoteType__4.ARCHER_CHEERS
			}, {
				paid = true, 
				level = 14, 
				emote = l__EmoteType__4.BUILDER_SPARKLE
			}, {
				paid = false, 
				level = 15, 
				killEffect = l__KillEffectType__5.HEART
			}, {
				paid = false, 
				level = 16, 
				kit = l__BedwarsKit__3.BOUNTY_HUNTER
			}, {
				paid = true, 
				level = 16, 
				emote = l__EmoteType__4.GRIM_REAPER_LANTERN
			}, {
				paid = false, 
				level = 17, 
				title = l__TitleType__7.WINNABLE
			}, {
				paid = false, 
				level = 18, 
				emote = l__EmoteType__4.ELDER_TREE
			}, {
				paid = true, 
				level = 19, 
				title = l__TitleType__7.EMERALD_HOARDER
			}, {
				paid = true, 
				level = 20, 
				kit = l__BedwarsKit__3.BEEKEEPER
			}, {
				paid = false, 
				level = 20, 
				emote = l__EmoteType__4.EMERALD_CHEST
			}, {
				paid = true, 
				level = 21, 
				title = l__TitleType__7.CAMPER
			}, {
				paid = false, 
				level = 22, 
				emote = l__EmoteType__4.LASSY_CAPTURE
			}, {
				paid = true, 
				level = 23, 
				emote = l__EmoteType__4.VULCAN_HEART
			}, {
				paid = true, 
				level = 24, 
				emote = l__EmoteType__4.MELODY_DIAMOND
			}, {
				paid = true, 
				level = 25, 
				killEffect = l__KillEffectType__5.STATUE
			}, {
				paid = false, 
				level = 25, 
				title = l__TitleType__7.EXTREME
			}, {
				paid = false, 
				level = 26, 
				emote = l__EmoteType__4.SHIELDER_CLAP
			}, {
				paid = true, 
				level = 27, 
				title = l__TitleType__7.BOW_SPAMMER
			}, {
				paid = true, 
				level = 28, 
				emote = l__EmoteType__4.VULCAN_GG
			}, {
				paid = false, 
				level = 28, 
				title = l__TitleType__7.DEFENDER
			}, {
				paid = true, 
				level = 29, 
				title = l__TitleType__7.RUSHER
			}, {
				paid = false, 
				level = 30, 
				kit = l__BedwarsKit__3.JADE
			}, {
				paid = true, 
				level = 30, 
				title = l__TitleType__7.SWEATY
			}, {
				paid = true, 
				level = 31, 
				title = l__TitleType__7.ANTI_BOW_SPAMMER
			}, {
				paid = true, 
				level = 32, 
				emote = l__EmoteType__4.BANANA_BARBARIAN
			}, {
				paid = false, 
				level = 32, 
				title = l__TitleType__7.LATE_GAME
			}, {
				paid = false, 
				level = 33, 
				title = l__TitleType__7.MLG
			}, {
				paid = true, 
				level = 34, 
				title = l__TitleType__7.TELEPEARLER
			}, {
				paid = true, 
				level = 35, 
				killEffect = l__KillEffectType__5.CONFETTI
			}, {
				paid = false, 
				level = 36, 
				title = l__TitleType__7.LFG
			}, {
				paid = true, 
				level = 37, 
				title = l__TitleType__7.EXPLOSIVES_EXPERT
			}, {
				paid = true, 
				level = 38, 
				emote = l__EmoteType__4.CUTE_GRIM_REAPER
			}, {
				paid = false, 
				level = 38, 
				title = l__TitleType__7.LONE_WOLF
			}, {
				paid = true, 
				level = 39, 
				title = l__TitleType__7.SUS
			}, {
				paid = false, 
				level = 40, 
				emote = l__EmoteType__4.VULCAN_LETS_GO
			}, {
				paid = true, 
				level = 40, 
				kit = l__BedwarsKit__3.RAVEN
			}, {
				paid = true, 
				level = 41, 
				emote = l__EmoteType__4.WINSTREAK_PLUS_ONE
			}, {
				paid = false, 
				level = 42, 
				title = l__TitleType__7.SUPER_CPS
			}, {
				paid = true, 
				level = 43, 
				emote = l__EmoteType__4.CRY_ABOUT_IT
			}, {
				paid = false, 
				level = 44, 
				title = l__TitleType__7.DEDICATED
			}, {
				paid = true, 
				level = 45, 
				killEffect = l__KillEffectType__5.ASCEND
			}, {
				paid = false, 
				level = 45, 
				kit = l__BedwarsKit__3.SPIRIT_CATCHER
			}, {
				paid = true, 
				level = 46, 
				title = l__TitleType__7.BUILT_DIFFERENT
			}, {
				paid = true, 
				level = 47, 
				title = l__TitleType__7.CAT_FACE
			}, {
				paid = false, 
				level = 47, 
				title = l__TitleType__7.OUTPLAYED
			}, {
				paid = true, 
				level = 48, 
				emote = l__EmoteType__4.WIZARD_READING_YOU
			}, {
				paid = false, 
				level = 48, 
				title = l__TitleType__7.EXTREME
			}, {
				paid = true, 
				level = 49, 
				title = l__TitleType__7.ONE_V_THIRTY
			}, {
				paid = true, 
				level = 50, 
				kit = l__BedwarsKit__3.PYRO
			}, {
				paid = false, 
				level = 50, 
				title = l__TitleType__7.SPICY
			} }
	}
};
