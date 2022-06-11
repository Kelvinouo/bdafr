-- Script Hash: 14cd56a8ff1137bff121cfcdd0c3724ef7306b8fc40611b216adc2a1eeed6f9307cbd57d9ff4da518862ed0bc6371033
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__getRankColor__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").getRankColor;
local l__RankTier__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-tier").RankTier;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TitleType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
return {
	LobbyTitleDefaults = {
		font = Enum.Font.LuckiestGuy, 
		backgroundTransparency = 1, 
		backgroundColor = Color3.fromRGB(0, 0, 0), 
		color = Color3.fromRGB(255, 255, 255)
	}, 
	TitleMeta = {
		[l__TitleType__6.NONE] = {
			name = "None", 
			text = ""
		}, 
		[l__TitleType__6.GIFTER] = {
			name = "Gifter", 
			text = "<b>GIFTER</b>", 
			font = Enum.Font.Roboto, 
			color = Color3.fromRGB(5, 255, 5)
		}, 
		[l__TitleType__6.RANK_BETA_BRONZE] = {
			name = "Ranked Beta Bronze", 
			text = "<b>Bronze (BETA Season)</b>", 
			font = Enum.Font.Roboto, 
			color = l__getRankColor__3(l__RankTier__4.BRONZE)
		}, 
		[l__TitleType__6.RANK_BETA_SILVER] = {
			name = "Ranked Beta Silver", 
			text = "<b>Silver (BETA Season)</b>", 
			font = Enum.Font.Roboto, 
			color = l__getRankColor__3(l__RankTier__4.SILVER)
		}, 
		[l__TitleType__6.RANK_BETA_GOLD] = {
			name = "Ranked Beta Gold", 
			text = "<b>Gold (BETA Season)</b>", 
			font = Enum.Font.Roboto, 
			color = l__getRankColor__3(l__RankTier__4.GOLD)
		}, 
		[l__TitleType__6.RANK_BETA_PLATINUM] = {
			name = "Ranked Beta Platinum", 
			text = "<b>Platinum (BETA Season)</b>", 
			font = Enum.Font.Roboto, 
			color = l__getRankColor__3(l__RankTier__4.PLATINUM)
		}, 
		[l__TitleType__6.RANK_BETA_DIAMOND] = {
			name = "Ranked Beta Diamond", 
			text = "<b>Diamond (BETA Season)</b>", 
			font = Enum.Font.Roboto, 
			color = l__getRankColor__3(l__RankTier__4.DIAMOND)
		}, 
		[l__TitleType__6.RANK_BETA_NIGHTMARE] = {
			name = "Ranked Beta Nightmare", 
			text = "<b>NIGHTMARE (BETA Season)</b>", 
			font = Enum.Font.Roboto, 
			color = l__ColorUtil__2.hexColor(16533162)
		}, 
		[l__TitleType__6.RANK_S4_BRONZE] = {
			name = "Ranked Season 4 Bronze", 
			text = "<b>Bronze (Season 4)</b>", 
			font = Enum.Font.Roboto, 
			color = l__getRankColor__3(l__RankTier__4.BRONZE)
		}, 
		[l__TitleType__6.RANK_S4_SILVER] = {
			name = "Ranked Season 4 Silver", 
			text = "<b>Silver (Season 4)</b>", 
			font = Enum.Font.Roboto, 
			color = l__getRankColor__3(l__RankTier__4.SILVER)
		}, 
		[l__TitleType__6.RANK_S4_GOLD] = {
			name = "Ranked Season 4 Gold", 
			text = "<b>Gold (Season 4)</b>", 
			font = Enum.Font.Roboto, 
			color = l__getRankColor__3(l__RankTier__4.GOLD)
		}, 
		[l__TitleType__6.RANK_S4_PLATINUM] = {
			name = "Ranked Season 4 Platinum", 
			text = "<b>Platinum (Season 4)</b>", 
			font = Enum.Font.Roboto, 
			color = l__getRankColor__3(l__RankTier__4.PLATINUM)
		}, 
		[l__TitleType__6.RANK_S4_DIAMOND] = {
			name = "Ranked Season 4 Diamond", 
			text = "<b>Diamond (Season 4)</b>", 
			font = Enum.Font.Roboto, 
			color = l__getRankColor__3(l__RankTier__4.DIAMOND)
		}, 
		[l__TitleType__6.RANK_S4_NIGHTMARE] = {
			name = "Ranked Season 4 Nightmare", 
			text = "<b>NIGHTMARE (Season 4)</b>", 
			font = Enum.Font.Roboto, 
			color = l__ColorUtil__2.hexColor(16533162)
		}, 
		[l__TitleType__6.MINERS_OF_THE_GALAXY] = {
			name = "Miners of the Galaxy", 
			text = "Miners of the Galaxy", 
			color = Color3.fromRGB(127, 17, 124)
		}, 
		[l__TitleType__6.PICKAXE] = {
			name = "Pickaxe", 
			text = "\240\159\146\142\226\155\143\239\184\143"
		}, 
		[l__TitleType__6.MINING_AWAY] = {
			name = "MINING AWAY!", 
			text = "MINING AWAY!"
		}, 
		[l__TitleType__6.YEAR_OF_THE_TIGER] = {
			name = "Year of the Tiger \240\159\144\175", 
			text = "Year of the Tiger \240\159\144\175", 
			color = l__Theme__5.mcGold
		}, 
		[l__TitleType__6.SPRING_FESTIVAL] = {
			name = "Spring Festival", 
			text = "Spring Festival"
		}, 
		[l__TitleType__6.LUNAR_NEW_YEAR] = {
			name = "Lunar New Year!", 
			text = "Lunar New Year!", 
			color = l__Theme__5.mcRed
		}, 
		[l__TitleType__6.Infernal] = {
			name = "Infernal", 
			text = "Infernal \240\159\148\165", 
			color = Color3.fromRGB(140, 5, 56)
		}, 
		[l__TitleType__6.LIGHT] = {
			name = "Light", 
			text = "Light \240\159\148\133", 
			color = Color3.fromRGB(242, 209, 0)
		}, 
		[l__TitleType__6.MLG] = {
			name = "MLG", 
			text = "<font color=\"#ffffff\"><b>MLG</b></font>", 
			backgroundTransparency = 1, 
			font = Enum.Font.LuckiestGuy
		}, 
		[l__TitleType__6.BED_BREAKER] = {
			name = "Bed Breaker", 
			text = "Bed Breaker"
		}, 
		[l__TitleType__6.EXPLOSIVES_EXPERT] = {
			name = "Explosives Expert", 
			text = "Explosives Expert"
		}, 
		[l__TitleType__6.TELEPEARLER] = {
			name = "Telepearler", 
			text = "Telepearler"
		}, 
		[l__TitleType__6.DEFENDER] = {
			name = "Defender", 
			text = "Defender"
		}, 
		[l__TitleType__6.RUSHER] = {
			name = "Rusher", 
			text = "Rusher"
		}, 
		[l__TitleType__6.BUILT_DIFFERENT] = {
			name = "Built Different", 
			text = "Built Different"
		}, 
		[l__TitleType__6.WINNABLE] = {
			name = "Winnable", 
			text = "Winnable"
		}, 
		[l__TitleType__6.BOT] = {
			name = "Bot", 
			text = "Bot"
		}, 
		[l__TitleType__6.FARMER] = {
			name = "Farmer", 
			text = "Farmer"
		}, 
		[l__TitleType__6.INVITE_ME] = {
			name = "Invite Me!", 
			text = "Invite Me!"
		}, 
		[l__TitleType__6.DEDICATED] = {
			name = "Dedicated", 
			text = "Dedicated"
		}, 
		[l__TitleType__6.ONE_V_THIRTY] = {
			name = "1v30", 
			text = "1v30"
		}, 
		[l__TitleType__6.EMERALD_HOARDER] = {
			name = "Emerald Hoarder", 
			text = "Emerald Hoarder"
		}, 
		[l__TitleType__6.BOW_SPAMMER] = {
			name = "Bow Spammer", 
			text = "Bow Spammer"
		}, 
		[l__TitleType__6.ANTI_BOW_SPAMMER] = {
			name = "Anti Bow Spammer", 
			text = "Anti Bow Spammer"
		}, 
		[l__TitleType__6.SUPER_CPS] = {
			name = "20 CPS", 
			text = "20 CPS"
		}, 
		[l__TitleType__6.SMILE] = {
			name = ":)", 
			text = ":)"
		}, 
		[l__TitleType__6.CAT_FACE] = {
			name = ":3", 
			text = ":3"
		}, 
		[l__TitleType__6.SUS] = {
			name = "Sus", 
			text = "Sus"
		}, 
		[l__TitleType__6.ONE_V_ONE_ME] = {
			name = "1v1 Me", 
			text = "1v1 Me"
		}, 
		[l__TitleType__6.UPDATE_HYPE] = {
			name = "Update Hype", 
			text = "Update Hype"
		}, 
		[l__TitleType__6.SWEATY] = {
			name = "Sweaty", 
			text = "Sweaty"
		}, 
		[l__TitleType__6.ISLANDS_MAIN] = {
			name = "Islands Main", 
			text = "Islands Main"
		}, 
		[l__TitleType__6.LFG] = {
			name = "LFG", 
			text = "LFG"
		}, 
		[l__TitleType__6.SPICY] = {
			name = "Spicy", 
			text = "Spicy"
		}, 
		[l__TitleType__6.AIMBOT] = {
			name = "Aimbot", 
			text = "Aimbot"
		}, 
		[l__TitleType__6.GOD_BRIDGER] = {
			name = "God Bridger", 
			text = "God Bridger"
		}, 
		[l__TitleType__6.LONE_WOLF] = {
			name = "Lone Wolf", 
			text = "Lone Wolf"
		}, 
		[l__TitleType__6.SNIPER] = {
			name = "Sniper", 
			text = "Sniper"
		}, 
		[l__TitleType__6.AGGRO] = {
			name = "Aggro", 
			text = "Aggro"
		}, 
		[l__TitleType__6.LATE_GAME] = {
			name = "Late Game", 
			text = "Late Game"
		}, 
		[l__TitleType__6.OUTPLAYED] = {
			name = "Outplayed", 
			text = "Outplayed"
		}, 
		[l__TitleType__6.CAMPER] = {
			name = "Camper", 
			text = "Camper"
		}, 
		[l__TitleType__6.EXTREME] = {
			name = "Extreme", 
			text = "Extreme"
		}, 
		[l__TitleType__6.ROCKET_SHIP] = {
			name = "\240\159\154\128", 
			text = "\240\159\154\128"
		}, 
		[l__TitleType__6.UMM] = {
			text = "Umm?"
		}, 
		[l__TitleType__6.OKAY] = {
			text = "Okayyy??"
		}, 
		[l__TitleType__6.CAT_FACE_2] = {
			text = "^._.^"
		}, 
		[l__TitleType__6.SPOOKY] = {
			text = "SpoOoky"
		}, 
		[l__TitleType__6.BOO] = {
			text = "Boo!"
		}, 
		[l__TitleType__6.XD] = {
			text = "xD"
		}, 
		[l__TitleType__6.RICH] = {
			text = "Rich"
		}, 
		[l__TitleType__6.SUPER_STAR] = {
			text = "Super Star"
		}, 
		[l__TitleType__6.GHOST] = {
			text = "\240\159\145\187"
		}, 
		[l__TitleType__6.RIP] = {
			text = "RIP"
		}, 
		[l__TitleType__6.HORROR] = {
			text = "Horror"
		}, 
		[l__TitleType__6.CRANK_90] = {
			text = "Crank 90"
		}, 
		[l__TitleType__6.TEAM_PLAYER] = {
			text = "Team Player"
		}, 
		[l__TitleType__6.HAUNTED] = {
			text = "Haunted"
		}, 
		[l__TitleType__6.WOOF] = {
			text = "Woof!"
		}, 
		[l__TitleType__6.YOU_FR] = {
			text = "You fr?"
		}, 
		[l__TitleType__6.OBSIDIAN_OP] = {
			text = "Obsidian OP"
		}, 
		[l__TitleType__6.TRICK_OR_TREAT] = {
			text = "Trick or Treat!"
		}, 
		[l__TitleType__6.ZOMBIE] = {
			text = "Zombie"
		}, 
		[l__TitleType__6.SURFER] = {
			text = "Surfer"
		}, 
		[l__TitleType__6.SHRUG] = {
			text = "\194\175\\_(\227\131\132)_/\194\175"
		}, 
		[l__TitleType__6.GGANBU] = {
			text = "Gganbu"
		}, 
		[l__TitleType__6.UWU] = {
			text = "uwu"
		}, 
		[l__TitleType__6.GAMER] = {
			text = "Gamer"
		}, 
		[l__TitleType__6.DODO] = {
			text = "Dodo"
		}, 
		[l__TitleType__6.EBOY] = {
			text = "Eboy"
		}, 
		[l__TitleType__6.EGIRL] = {
			text = "Egirl"
		}, 
		[l__TitleType__6.SWAG] = {
			text = "Swag"
		}, 
		[l__TitleType__6.CHRISTMAS_TREE] = {
			text = "\240\159\142\132"
		}, 
		[l__TitleType__6.SANTA_CLAUS] = {
			text = "\240\159\142\133"
		}, 
		[l__TitleType__6.SNOWMAN] = {
			text = "\226\155\132"
		}, 
		[l__TitleType__6.THUMBSUP] = {
			text = "\240\159\145\141"
		}, 
		[l__TitleType__6.RAD] = {
			text = "\240\159\164\170\240\159\164\153\240\159\143\188"
		}, 
		[l__TitleType__6.AYOO] = {
			text = "Ayoo?"
		}, 
		[l__TitleType__6.BING_BONG] = {
			text = "BING BONG"
		}, 
		[l__TitleType__6.FROSTY] = {
			text = "Frosty"
		}, 
		[l__TitleType__6.SNOWFLAKE] = {
			text = "Snowflake"
		}, 
		[l__TitleType__6.COLD] = {
			text = "Cold"
		}, 
		[l__TitleType__6.BIGBRAIN] = {
			text = "Big Brain"
		}, 
		[l__TitleType__6.CLUTCHGOD] = {
			text = "Clutch God"
		}, 
		[l__TitleType__6.BOWMASTER] = {
			text = "Bow Master"
		}, 
		[l__TitleType__6.MICCHECK] = {
			text = "Mic Check"
		}, 
		[l__TitleType__6.LUCKY] = {
			text = "Lucky"
		}, 
		[l__TitleType__6.COZY] = {
			text = "Cozy"
		}, 
		[l__TitleType__6.DERP] = {
			text = "Derp"
		}, 
		[l__TitleType__6.BEAR] = {
			text = "\202\149\226\128\162\204\129\225\180\165\226\128\162\204\128\202\148\227\129\163"
		}, 
		[l__TitleType__6.SWORD] = {
			text = "\226\154\148\239\184\143"
		}, 
		[l__TitleType__6.QUIRKY] = {
			text = "Quirky"
		}, 
		[l__TitleType__6.JACK_FROST] = {
			text = "Jack Frost"
		}, 
		[l__TitleType__6.ICE_QUEEN] = {
			text = "Ice Queen"
		}, 
		[l__TitleType__6.MERRY_CHRISTMAS] = {
			text = "Merry Christmas"
		}, 
		[l__TitleType__6.CRACKED] = {
			text = "Cracked"
		}, 
		[l__TitleType__6.DUCK] = {
			text = "Duck"
		}, 
		[l__TitleType__6.SKYWARS_MAIN] = {
			text = "Skywars Main"
		}, 
		[l__TitleType__6.RABBIT] = {
			text = "Rabbit"
		}, 
		[l__TitleType__6.RABBIT_EMOJI] = {
			text = "\240\159\144\135"
		}, 
		[l__TitleType__6.HAPPY_EASTER] = {
			text = "Happy Easter"
		}, 
		[l__TitleType__6.BLOSSOM] = {
			text = "Blossom"
		}, 
		[l__TitleType__6.FLOWERS_EMOJI] = {
			text = "\240\159\140\188\240\159\140\183\240\159\140\187"
		}, 
		[l__TitleType__6.BORK] = {
			text = "BORK"
		}, 
		[l__TitleType__6.ARROW_MAGNET] = {
			text = "Arrow Magnet"
		}, 
		[l__TitleType__6.SPIRIT_SPAMMER] = {
			text = "Spirit Spammer"
		}, 
		[l__TitleType__6.EMOTIONAL_DAMAGE] = {
			text = "EMOTIONAL DAMAGE"
		}, 
		[l__TitleType__6.JUGGERNAUT] = {
			text = "JUGGERNAUT"
		}, 
		[l__TitleType__6.ENCHANTER] = {
			text = "Enchanter"
		}, 
		[l__TitleType__6.MIDNIGHT] = {
			text = "Mid<font color=\"" .. l__ColorUtil__2.richTextColor(l__ColorUtil__2.BLACK) .. "\">night</font>"
		}, 
		[l__TitleType__6.SHEEP_EMOJI] = {
			text = "\240\159\144\145"
		}, 
		[l__TitleType__6.POTTER] = {
			text = "Potter"
		}, 
		[l__TitleType__6.BEAST] = {
			text = "Beast"
		}, 
		[l__TitleType__6.EMPEROR] = {
			text = "Emperor"
		}, 
		[l__TitleType__6.BLOCK_CLUTCHER] = {
			text = "Block Clutcher"
		}, 
		[l__TitleType__6.COMBO_MASTER] = {
			text = "Combo Master"
		}, 
		[l__TitleType__6.SUMMER] = {
			text = "Summer"
		}, 
		[l__TitleType__6.BEACH_DAY] = {
			text = "Beach Day"
		}, 
		[l__TitleType__6.SUMMER_EMOJI] = {
			text = "\240\159\140\158\240\159\140\138\240\159\140\180"
		}, 
		[l__TitleType__6.BEACH_EMOJI] = {
			text = "\240\159\143\150\239\184\143"
		}, 
		[l__TitleType__6.VOID] = {
			text = "<font color=\"" .. l__ColorUtil__2.richTextColor(Color3.fromRGB(121, 36, 199)) .. "\">Void</font>"
		}, 
		[l__TitleType__6.COOKING] = {
			text = "Cooking"
		}, 
		[l__TitleType__6.CHAD] = {
			text = "Chad"
		}, 
		[l__TitleType__6.UNLUCKY] = {
			text = "Unlucky"
		}, 
		[l__TitleType__6.STAR] = {
			text = "<font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__5.mcYellow) .. "\">\226\173\144 Star</font>"
		}, 
		[l__TitleType__6.BAITED] = {
			text = "Baited"
		}, 
		[l__TitleType__6.HARD_CARRY] = {
			text = "Hard Carry"
		}, 
		[l__TitleType__6.HARD_STUCK] = {
			text = "Hard Stuck"
		}, 
		[l__TitleType__6.DINOSAUR] = {
			text = "DINOSAUR"
		}, 
		[l__TitleType__6.TRADE_OFFER] = {
			text = "\226\154\160\239\184\143 Trade Offer \226\154\160\239\184\143"
		}, 
		[l__TitleType__6.DEAL_OR_NO_DEAL] = {
			text = "Deal or no Deal"
		}, 
		[l__TitleType__6.SPECIALIST] = {
			text = "Specialist"
		}, 
		[l__TitleType__6.ZEPHYR] = {
			text = "<stroke color=\"" .. l__ColorUtil__2.richTextColor(Color3.fromRGB(56, 56, 56)) .. "\"><b><font face=\"GothamBold\">Zephyr</font></b></stroke>"
		}, 
		[l__TitleType__6.SUNGLASSES] = {
			text = "B)"
		}, 
		[l__TitleType__6.SHARK] = {
			text = "Shark"
		}, 
		[l__TitleType__6.VERIFIED] = {
			name = "Verified", 
			text = "Verified", 
			color = Color3.fromRGB(71, 214, 255)
		}, 
		[l__TitleType__6.EASTER_EVENT_2022] = {
			name = "Easter Event", 
			text = "\240\159\165\154\240\159\144\176 <font color=\"#9DF8DF\">Happy</font> <font color=\"#FCC370\">Easter</font> <font color=\"#FDCEDD\">2022</font>"
		}
	}
};
