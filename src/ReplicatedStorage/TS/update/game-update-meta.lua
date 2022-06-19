-- Script Hash: 9a8fc9e654b40234abb2ca2512bc1c90259e496cf18f3f58564d62f0ae8260a5b850ef4c403d1d8627010fa98151cb83
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BattlePassUtils__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__EmoteMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local l__EmoteType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
return {
	GameUpdateButtons = {
		newestKit = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit.DASHER, 
		newestKitBG = "rbxassetid://8795128315"
	}, 
	GameUpdateMeta = { {
			updateLogId = 38, 
			visible = true, 
			title = "Ranked Season 5 + Void Turret + New Game Countdown", 
			date = "6/17/2022", 
			body = "\240\159\140\145 <b>Void Turret (NEW ITEM!)</b>\nStep your bed defense up with the all new Void Turret! Place them down to shoot a powerful laser at nearby enemies. You can purchase Void Turrets for 3 Void Crystals in the Item Shop!\n\n\240\159\155\169\239\184\143 <b>Battle Royale.. (NEW GAME COUNTDOWN)</b>\n- Our new Battle Royale game is releasing next week! You can see a live countdown in the BedWars lobby!\n\n\240\159\143\134 <b>Ranked Season 5 Release</b>\nRanked Season 4 has come to a close and ranked rewards are now being distributed.\nAll ranks will receive an exclusive title to show off the rank they left off at and NIGHTMARE players will receive the limited Victorious Yuzi skin.\n- Fixed Nightmare players not receiving the NIGHTMARE exclusive emote\n- Fixed Nightmare rank display in lobby\n- Quitting a game early will now count as a loss\nWe\226\128\153ve changed our ranked restrictions. This will open ranked queue to more players while making it difficult for cheaters to join back once banned: \n- 100 wins minimum requirement or Paid player\n\n<b>\240\159\134\147 Free Kits of The Week</b>\n\240\159\146\128 Bounty Hunter <b>(FIRST TIME FREE)</b>\n\240\159\142\184 Melody\n\240\159\141\158 Baker\n\n<b>\226\154\153\239\184\143 Other Changes</b>\n\240\159\147\156 Fixed clan admins not being able to promote/demote members\n\240\159\140\145 Void Armor Cost: 16 \226\134\146 18 void crystals\n\240\159\140\145 Void Sword Cost: 8 \226\134\146 10 void crystals\n\240\159\140\145 Void monsters no longer count as a kill\n\240\159\143\133 Fixed INF damage display in post match stat cards\n\240\159\142\131 Fixed duping items with Jack kit and Clingy enchant", 
			image = {
				assetId = "rbxassetid://9942383051", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 37, 
			visible = true, 
			title = "Season 5 Battle Pass + The Void", 
			date = "6/10/2022", 
			body = "<b>Welcome to \226\155\177\239\184\143\240\159\140\180 Battle Pass Season 5!</b> \nSummer time has finally come to Bed Wars with a revamped summer themed lobby. We\226\128\153ve been extremely excited to release this update for you all and are even more excited for what we have in store for you all this Summer.\n\n\240\159\143\134\240\159\166\136 <b>Battle Pass Season 5</b>\nThe Battle Pass gives you access to tons of limited edition content! Owning the Battle Pass also gives a 20% experience bonus.\n\n\226\157\148 LV 5 Kit:  Coming Soon\n\240\159\146\176 LV 10 Kit: Merchant\n\240\159\166\150 LV 20 Kit: Dino tamer\n\226\157\148 LV 30 Kit: Coming Soon\n\226\173\144 LV 40 Kit: Star Collector\n\240\159\146\168 LV 50 Kit: Zephyr\n\240\159\146\165 3 kill effects\n\226\154\148\239\184\143 3 lobby gadgets\n\240\159\146\172 16 lobby titles\n\240\159\150\188\239\184\143 25 image emotes\n\240\159\146\131 3 animated emotes\n\n\240\159\140\145 <b>The Void</b> \nThis season introduces a new \226\128\156Out of This World\226\128\157 area named <b>The Void.</b> Defeat the creatures in this dimension to receive Void Crystals that will enable you to buy new items such as void armor, void sword, & void blocks.\n\n\226\154\148\239\184\143 <b>Ranked Season 5 (RESCHEDULED)</b>\nRanked reset has been rescheduled to next update as we\226\128\153ll be focusing on making major improvements and fixes to the current Ranked system.\nPlayers that reach Season 4 Nightmare by the 6/17 3pm PST will be rewarded with an exclusive <b>Victorious Yuzi</b> skin.\n\n\240\159\146\165 <b>Dynamic Explosions</b>\nExplosions have been reworked to dynamically interact with each block\226\128\153s blast resistance. Explosions are now larger and will quickly break through weak blocks like wool. Stronger blocks like wood and stone bricks will reduce the explosion radius.\n\n\240\159\147\139 <b>Post Game MVP Cards</b>\nNew to this season are post game mvp cards. Stick around after the match to see the top performers in your match based on offensive, support, and other stat types.\n\n\240\159\134\147 <b>Free Kits of the Week</b>\n\240\159\143\185 Archer\n\240\159\143\135 Lassy\n\240\159\146\163 Davey\n\n\240\159\151\186\239\184\143 <b>New Maps</b>\n\240\159\143\150\239\184\143 Beach (Doubles, Squads)\n\240\159\144\160 Reef (Doubles, Squads)\n\n\226\154\153\239\184\143 <b>Other Changes</b>\n\240\159\146\142 Diamond and Emeralds now have a highlight on them\n\240\159\148\141 Added a search bar to the locker\n\240\159\154\129 Vaulted Minicopter\n\240\159\141\179 Vaulted Frying Pan\n\240\159\146\163 Vaulted Landmine\n\226\154\153\239\184\143 Vaulted Zipline\n\240\159\154\128 Vaulted Guided Missile Launcher", 
			image = {
				assetId = "rbxassetid://9873207277", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 36, 
			visible = true, 
			title = "Balance Changes + Season 5 Countdown", 
			date = "6/03/2022", 
			body = "<b>\226\143\179 Season 5 Progress Update</b>\nWe\226\128\153re down to the final week until the Season 5 Summer release. This week\226\128\153s update is light while the entire team is focused on making Season 5 one of our biggest and most out of this world updates.\n\n<b>\240\159\148\165 TRIPLE XP WEEK \240\159\148\165</b>\nThis is the last week to grind for battle pass rewards. Enjoy triple xp as you work your way towards level 50!\n\n<b>\240\159\134\147 Free Kits of the Week</b>\n\226\173\144 Axolotl Amy\n\240\159\155\161\239\184\143 Infernal Shielder\n\240\159\148\168 Builder\n\n\240\159\140\153 <b>Nyx Buffs</b>\n- Midnight duration: (12 \226\134\146 14 seconds)\n- Reduce damage needed to charge ability (140 \226\134\146 120 dmg)\n- Increase armor penetration at max stacks (20% \226\134\146 25%)\n\n\226\154\153\239\184\143 <b>Other Changes</b>\n\240\159\146\142\194\160Buff diamond generator speed (25s \226\134\146 20s)\n\240\159\146\142\194\160Increase max diamond stack size (5 \226\134\146 6)\n\240\159\146\142\194\160Added Tier III damage upgrade (+50% damage)\n\240\159\148\167 Fix switching to default kit skins\n\240\159\146\168\194\160Fix a bug that could cause infinite zipline flight\n\226\154\161\239\184\143 Reduce lag caused by Tesla traps\n\240\159\146\165\194\160Fixed a bug that caused lobby servers to crash", 
			image = {
				assetId = "rbxassetid://9809498916", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 35, 
			visible = true, 
			title = "Capture The Flag + Cyber Skin + \240\159\142\130 1 Year Anniversary", 
			date = "5/27/2022", 
			body = "<b>\240\159\148\165 TRIPLE XP WEEKEND \240\159\148\165</b>\n\n\240\159\154\169 <b>Capture The Flag (NEW LTM)</b>\nGo for the enemy\226\128\153s flag while protecting your own in this new 12v12 gamemode! You can't capture the enemies flag unless you have control of you own. The first team to capture two flags wins!\n\n\240\159\142\130 <b>BedWars 1 Year Anniversary</b>\nWe\226\128\153ve hit the 1 year mark! We\226\128\153ve got some amazing updates lined up to make the 2nd year even crazier!\194\160\240\159\165\179  \n\n<b>\240\159\146\168\194\160Zipline Returns</b>\nThe Zipline has made it back into BedWars at a great discount!\n\n\240\159\142\167 <b>DJ Cyber Skin (NEW)</b>\nA new Cyber skin has been released for 799 Robux. DJ Cyber comes with a unique drone.\n\n<b>\240\159\134\147 Free Kits of the Week</b>\n\240\159\142\163 Fisherman <b>(First Time Free!)</b>\n\226\154\148\239\184\143 Barbarian\n\240\159\142\184 Melody\n\n<b>\226\154\153\239\184\143 Other Changes</b>\n\240\159\165\149\194\160Buffed Cletus\226\128\153 carrot seeds price (110 Iron \226\134\146 70 Iron)\n\240\159\146\168\194\160Zipline price reduced (3 Emeralds \226\134\146 60 Iron)\n\240\159\146\168\194\160Fixed bugs causing you to instantly eject from Zipline\n\240\159\146\168\194\160You now get 1 in-air jump after ejecting from Zipline\n\240\159\142\159\239\184\143 Mission xp buffed", 
			image = {
				assetId = "rbxassetid://9742721700", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 34, 
			visible = true, 
			title = "Lassy Rework + Vacuum Item + Clan Chat", 
			date = "5/20/2022", 
			body = "<b>\240\159\164\160 Lassy (REWORK!)</b>\nLassy now has a much more powerful lasso! She can pull enemies all the way to her. Additionally, her lasso now disables all movement abilities for 7 seconds (Jade, Void Regent & Yuzi).\n\n<b>\240\159\141\131 Vacuum (NEW Lucky Block Item!)</b>\nUse this new item to vacuum your enemies and shoot them away!\n\n<b>\240\159\143\176 Clan Chat</b> \nYou can now talk in real-time & leave messages for your clanmates!\n\n\240\159\142\174 <b>Game Modes (NEW Rotation)</b>\n- Skywars Doubles is back! (Replacing Skywars Squads)\n- Duels is back! (Replacing Gun game)\n\n <b>\240\159\134\147 Free Kits of the Week</b>\n\240\159\167\145\226\128\141\240\159\140\190 Farmer Cletus\n\240\159\167\145\226\128\141\240\159\141\179 Baker\n\240\159\146\165 Archer\n\n<b>\240\159\151\186\239\184\143 New Maps</b>\nSanctum (Doubles)\nSanctum (Squads)\n\n<b>\226\154\153\239\184\143 Other Changes</b>\n\240\159\154\145 Life Steal nerf max overheal shield: 25 \226\134\146 10\n\240\159\154\145 Life Steal nerf heal per second: 9 \226\134\146 4\n\240\159\164\150 Vending Machine emerald cost: 8 \226\134\146 6\n\240\159\164\150 Vending Machine loot pool: Dodo bird removed\n\240\159\144\187 Bear Claws swipe damage: 25 \226\134\146 45\n\240\159\148\165 Ember fix: Disable charging while using spin attack\n\240\159\148\165 Ember & Lumen: Fix stuck in charge weapon state", 
			image = {
				assetId = "rbxassetid://9679841448", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 33, 
			visible = true, 
			title = "Lumen & Ember Kit Bundle + Double XP Weekend", 
			date = "5/14/2022", 
			body = "\240\159\148\165\240\159\148\165\194\160<b>DOUBLE XP WEEKEND</b> \240\159\148\165\240\159\148\165\nEnjoy double battle pass experience Saturday-Sunday!\n\n\240\159\142\129 <b>Lumen & Ember Kit Bundle (\226\143\176 2 Week Sale)</b>\nThis limited time bundle is now available! This bundle comes with 2 limited edition titles & lobby gadgets.\nThe kits will become available in a different bundle for 799 Robux when this bundle goes away.\n\n\226\152\128\239\184\143\194\160<b>LUMEN (Kit)</b>\n- Charge the Sword of Light to shoot powerful waves at enemies! Hitting light waves OR killing Ember will upgrade your ability to shoot many powerful beams at once.\n\n\240\159\148\165\194\160<b>EMBER (Kit)</b>\n- Charge the Blade of Fire to ignite in a deadly spin! Striking enemies OR killing Lumen will upgrade your ability to a much more powerful spin.\n\n\240\159\143\183\239\184\143 <b>2 Limited Edition Titles</b>\n- <font color=\"rgb(140, 5, 56)\"><b>Infernal \240\159\148\165</b></font>\n- <font color=\"rgb(242, 209, 0)\"><b>Light \240\159\148\133</b></font>\n\n\240\159\143\183\239\184\143 <b>2 Limited Edition Lobby Gadgets</b>\n- Lumen\226\128\153s Light Sword\n- Ember\226\128\153s Infernal Saber"
		}, {
			updateLogId = 32, 
			visible = true, 
			title = "Enchant Update + Kit Bundle Countdown", 
			date = "5/13/2022", 
			body = "\240\159\142\129 <b>Kit Bundle Countdown (2 NEW kits!)</b>\n" .. ("A kit bundle with 2 NEW kits, 2 limited titles, & 2 limited lobby gadgets is releasing <font color=\"" .. v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil.richTextColor(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme.mcAqua) .. "\"><b>Saturday @ 1pm PDT</b></font>\n\n") .. "\240\159\140\159\194\160<b>Enchant Update (3 NEW enchants!)</b>\nThe enchant table is now updated with 3 new enchants, a rework on 2 existing enchants, and the removal of 4 enchants.\n\n\226\154\150\239\184\143 Enchants now cycle through before repeating, each research level is independent of such, and if you die, the cycle breaks, and you get reset back to being able to getting anything.\n\n\226\157\164\239\184\143\226\128\141\240\159\148\165\194\160<b>LIFE STEAL Enchant (NEW!)</b>\n- Dealing damage to enemies will heal you! You will over heal, putting additional health into your shield.\n\n\240\159\146\165\194\160<b>CRITICAL STRIKE Enchant (NEW!)</b>\n- When fighting you have a 25% chance of dealing 2x DAMAGE with a Critical Strike!\n\n\240\159\146\142\194\160<b>CLINGY Enchant (NEW!)</b>\n- When you die you save 4 random item stacks from being lost. You can now go for that crazy play!\n\n\226\152\160\239\184\143\194\160<b>EXECUTE Enchant (REWORK)</b>\n- \226\128\156Void\226\128\157 enchant is renamed to \226\128\156Execute\226\128\157 with new effects\n- Execute base damage increased: 6 \226\134\146 10\n- Execute damage per stack increased: 2 (max 10) \226\134\146 3 (max 15)\n\n\240\159\146\176\194\160<b>PLUNDER Enchant (REWORK)</b>\n- Plunder now prioritizes high value items (emeralds & diamonds)\n- Plunder cooldown decreased (5s \226\134\146 4s)\n- New effects\n\n\240\159\154\171\194\160<b>Removed Shield Gen, Rapid Regen, Anti-Knockback, & Updraft enchants</b>\n\n\240\159\134\147 <b>Free Kits of the Week</b>\n\240\159\146\168 Smoke (first time free)\n\240\159\155\160\239\184\143 Builder\n\240\159\146\165 Davey\n\n\226\154\150\239\184\143\194\160<b>Kit Balance Changes</b>\n\240\159\150\178\239\184\143 Cyber Kit nerf: Drone cost increased (15 Iron \226\134\146 50 Iron)\n\240\159\144\175 Yuzi: Now has a maximum of 4 dash charges. Each charge takes 10s to recharge.\n\240\159\144\175 Yuzi: Dash damage increased by 20%\n\n\240\159\148\167\194\160<b>Item Changes</b>\n\240\159\154\129 Minicopter buff: Health increased (200 \226\134\146 300)\n\240\159\154\129 Minicopter: Falling height needed to explode reduced (60 \226\134\146 40)\n\240\159\154\129 Minicopter: Explosion damage multiplier (2.5 \226\134\146 3)\n\240\159\154\129 Minicopter: You can now see a healthbar for your helicopter\n\226\154\161 Tesla Trap: Zap Radius (10 \226\134\146 14)\n\226\154\161 Tesla Trap: Damage per tick (4 \226\134\146 6)\n\226\154\161 Tesla Trap: Price (40 iron \226\134\146 50 iron\n\n\226\154\153\239\184\143\194\160<b>Other Changes</b>\n\240\159\151\186\239\184\143 Map images have been updated\n\240\159\140\180\194\160Season 5 BP release date scheduled\n\240\159\148\146 Vaulted: Ducks, Boba Blaster, & Tornado Launcher", 
			image = {
				assetId = "rbxassetid://9619946092", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 31, 
			visible = true, 
			title = "Minicopter + New Kit Countdown!", 
			date = "5/6/2022", 
			body = "\240\159\154\129\194\160<b>Minicopter (NEW vehicle!)</b>\nTake a friend for a flight in the brand new Minicopter, available in the Item Shop!\n\n\226\143\179 <b>New Kit Update Countdown!</b>\nThe level 40 Battle Pass Kit releases Saturday @ 11am PDT!\n\n\240\159\154\128\194\160<b>Guided Missile</b>\nGuided missiles are back in stock! Buy them at the Item Shop to knock Minicopters out of the sky!\n\n\240\159\134\147 <b>Free Kits of the Week</b>\n\226\154\148\239\184\143 Barbarian\n\240\159\142\184 Melody\n\240\159\143\185 Archer\n\n\240\159\151\186\239\184\143 <b>New Maps</b>\nGrotto (squads & duos)\n\240\159\140\178 Treetop (gun game)\n\240\159\142\141 Bamboo Garden (skywars)\n\240\159\170\168 Cistern (skywars)\n\240\159\140\177 Glade (skywars)\n\240\159\167\138 Tundra (skywars)\n\240\159\146\137\194\160Volatile (skywars)\n\240\159\146\128 Wasteland (skywars)\n\n\226\173\144\239\184\143 <b>Limited Mode Changes</b>\n\240\159\143\185\194\160 Added SkyWars Squads\n\240\159\148\171\194\160 Gun Game item order changed\n\n\240\159\151\146\194\160<b>Other Changes</b>\n\240\159\146\190\194\160Cyber Kit nerf: Drone HP reduced (60 \226\134\146 15)\n\240\159\140\149 Nyx: Fixed ability bar not displaying on first spawn\n\226\154\153\239\184\143 Customs: `/setTeam &lt;player | @all | @team:(team_name)&gt; &lt;team_name&gt;`\n\226\154\153\239\184\143 Customs: `/setHealth &lt;player | @all | @team:(color) | @s&gt; &lt;health&gt;`", 
			image = {
				assetId = "rbxassetid://9559971986", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 30, 
			visible = true, 
			title = "New Kit Countdown + Gun Game + Grappling Hook", 
			date = "4/29/2022", 
			body = "\226\143\179 <b>New Kit Countdown</b>\nThe newest BedWars kit releases Saturday @ 11am PDT! A countdown has been enabled in the Lobby to celebrate the release.\n\n\240\159\148\171 <b>Gun Game (NEW Limited Time Mode!)</b>\nRace against your enemies through a series of weapons in this new fast paced FFA mode. \nEach kill grants you a new weapon.  Be the first player to progress through all 15 weapons to win!\n\n\240\159\143\131 <b>Grappling Hook Gun (NEW Limited Time Item!)</b>\nThe grappling hook gun is now available in all queues for 4 emeralds. Use the grappling hook gun to quickly navigate the map!\n\n<b>\240\159\134\147 Free Kits of the Week</b>\n\240\159\152\135 Trinity\n\240\159\165\167 Baker\n\240\159\143\135 Lassy\n\n\240\159\151\186\239\184\143 <b>New Maps</b>\nCoast (squads + doubles)\n\n\240\159\151\146\239\184\143 <b>Other Changes</b>\n\240\159\146\165 Invisible Landmine cost increased from 40 \226\134\146 65 iron\n\240\159\146\165 Invisible Landmine now has a max placed limit of 6", 
			image = {
				assetId = "rbxassetid://9499872124", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 29, 
			visible = true, 
			title = "Infernal Shielder Rework + Landmines", 
			date = "4/22/2022", 
			body = "\240\159\148\165\240\159\148\165\194\160<b>DOUBLE XP WEEKEND</b> \240\159\148\165\240\159\148\165\n\n\240\159\155\161\194\160<b>Infernal Shielder Rework!</b>\nThe Infernal Shielder has been a low tier kit for too long. We\226\128\153ve redesigned his shield to fit into the meta better.\n- Shield completely reflects projectiles back towards the shooter\n- Removed slowness when holding shield\n- Removed melee damage protection\n\n\240\159\144\187\194\160 <b>Bear Claws</b>\nBear Claws are now obtainable from the Vending Machine!\n\n\240\159\146\163\194\160 <b>Invisible Landmine (limited time item!)</b>\nInvisible Landmines have been added to the Item Shop in all modes.\n\n\240\159\147\161\194\160<b>Ping System</b>\nYou can now ping your teammates! Press either [G] or [Middle Mouse] to place a ping. This feature is currently only available on PC and will be added to other devices soon.\n\n\240\159\167\145\226\128\141\240\159\140\190\194\160<b>Spirit Farmer Cletus Skin</b>\nA new Farmer Cletus skin is now available! \n\n\240\159\153\140\194\160 <b>Free Kits of the Week</b>\n\240\159\145\187 Gompy (first time free)\n\240\159\146\165 Davey\n\240\159\148\168 Builder\n\n\226\143\176\194\160<b>Limited Time Modes</b>\nThis week\226\128\153s limited time modes are <b>100 Player Bed Royale</b> and <b>30v30</b>!\n\n\240\159\151\186\194\160<b>Map Changes</b>\n\240\159\140\129\194\160Added Irongate (squads)\n\240\159\143\159\194\160Added Gorge (bed royale)\n\n\240\159\147\148\194\160<b>Other Changes</b>\n\226\154\161\239\184\143 Improved load times for faster joining\n\240\159\167\145\226\128\141\240\159\140\190\194\160Farmer Cletus: slightly increased harvest crop prompt range\n\240\159\155\145\194\160Reenabled inventory number keybinds\n\240\159\148\168 The ghost blocks glitch has been patched\n\240\159\140\139\240\159\146\128 Added Magma Block. The magma block instantly kills entities that touch it. Only breakable by hosts/cohosts", 
			image = {
				assetId = "rbxassetid://9439139793", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 28, 
			visible = true, 
			title = "Egg Hunt Event + Metal Detector Kit", 
			date = "4/15/2022", 
			body = "The Easter Update is live!\n\n\240\159\144\176 <b>Egg Hunt Event!</b>\nEaster Eggs have started spawning in all games! Collect eggs to unlock an exclusive badge, animated emote, and more. This event will last for a week.\n\n\240\159\147\161 <b>Metal Detector Kit</b>\nA new kit has been added to the Battle Pass: the Metal Detector. Use your metal detector to find treasure around the map.\n\n\226\154\148\239\184\143 <b>Disasters 30v30 + DUELS!</b>\nThis week\226\128\153s limited time modes are Disasters 30v30 and Duels!\n\n\240\159\144\135 <b>Easter Bunny Amy</b>\nA new Axolotl Amy skin has been added for purchase permanently. Axolotls have been replaced with Easter eggs!\n\n\240\159\153\140 <b>Free Kits of the Week</b>\n\240\159\143\185 Archer\n\240\159\142\184 Melody\n\240\159\167\145\226\128\141\240\159\141\179 Baker\n\n\240\159\151\186\239\184\143 <b>New Maps</b>\n\240\159\140\181 Windfalls (squads + doubles)\n\n\226\156\168 <b>New Lucky Block Items</b>\n\240\159\140\137 Portal Gun\n\240\159\147\161 Teleporter Block\n\n<b>\226\154\150\239\184\143 Balance Changes</b>\n\240\159\144\175\194\160Yuzi: can now purchase telepearls\n\240\159\148\168\194\160Jade: can now purchase telepearls\n\240\159\170\147\194\160Void Regent: can now purchase telepearls", 
			image = {
				assetId = "rbxassetid://9378436804", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 27, 
			visible = true, 
			title = "Natural Disasters + Free Beekeeper", 
			date = "4/8/2022", 
			body = "\240\159\148\165\194\160<b>Natural Disasters (Limited Time Mode!)</b>\nThe classic BedWars gamemode but with crazy natural disasters happening throughout the match!\n\n\240\159\140\170\239\184\143\194\160Tornadoes\n\240\159\140\160\194\160Meteors\n\240\159\140\167\239\184\143\194\160Toxic Rain\n\240\159\152\182\226\128\141\240\159\140\171\239\184\143\194\160Rising Void\n\nNote for custom matches: you can manually trigger a disaster by typing <i>/disaster &lt;\"meteors\" | \"void_rise\" | \"toxic_rain\" | \"tornado\"&gt;</i> \nExample: <i>/disaster meteors</i>\n\n\240\159\142\178 <b>Lucky Block 30v30</b>\n30v30 has been replaced by Lucky Block 30v30 for this week only!\n\n\240\159\145\168\226\128\141\240\159\141\179\194\160<b>Spirit Baker Skin</b>\nA new baker skin has been added to the Battle Pass! Unlock Spirit Baker at level 40!\n\n\240\159\134\147 <b>Free Kits of the Week</b>\n\240\159\144\157 Beekeeper (first time being free!)\n\226\154\148\239\184\143 Barbarian\n\240\159\144\142 Lassy\n\n<b>Balance Changes</b>\n\240\159\143\185\194\160Buffed arrow velocity (+25%)\n\240\159\144\175\194\160Yuzi: increased cost of Dao swords\n\240\159\148\168\194\160Jade: nerfed Hammer cooldown (5s \226\134\146 6s)\n\240\159\148\168\194\160Jade: reduced jump distance (-38%)\n\240\159\170\147\194\160Void Regent: nerfed Void Axe cooldown (5s \226\134\146 6s)\n\240\159\170\147\194\160Void Regent: nerfed Void Axe jump distance (-38%)\n\240\159\140\159\194\160Spirit Catcher: nerfed spirit damage (25 \226\134\146 17)\n\n<b>Other Changes</b>\n\240\159\148\168\194\160Jade: Added Hammer cooldown bar\n\240\159\141\140 Removed bananas\n\n<b>More on free Beekeeper</b>\nThis is the first time we\226\128\153ve added a Battle Pass kit to the free kit rotation. We weren't happy spending lots of time making great Battle Pass kits only for them to fade out of popularity over time. While we will never make Battle Pass kits purchasable again, we think periodically adding them into the free kit rotation is a good way to justify spending more time making great Battle Pass kits.", 
			image = {
				assetId = "rbxassetid://9313864255", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 26, 
			visible = true, 
			title = "Banana Wars", 
			date = "4/1/2022", 
			body = "\240\159\141\140 <b>Banana Wars</b>\nWe\226\128\153ve decided to completely shift our focus from beds to bananas.\n\226\154\148\239\184\143 Replaced swords with bananas\n\240\159\144\146 Added banana peels into the Item Shop\n\240\159\141\140 All characters are forced to wear banana costumes (for enhanced immersion)\n\240\159\142\168 Officially changed the game name to Banana Wars (please refer to this name going forward)\n\n\240\159\134\149 <b>New Items!</b>\n\240\159\141\179 Frying Pan - charge up a massive swing to deal huge amounts of knockback\n\240\159\140\170\239\184\143 Tornado Launcher - launch a tornado that can knockup and damage multiple enemies\nBoth of these items have been added to the Item Shop in all gamemodes!\n\n\240\159\142\184 <b>Rockstar Melody Skin</b>\nCheckout the new Rockstar Melody skin in the Lobby! This skin includes a special electric guitar with completely unique sounds.\n\n\240\159\153\140 <b>Free Kits of the Week</b>\n\240\159\167\145\226\128\141\240\159\141\179 Baker\n\240\159\145\183\226\128\141\226\153\128\239\184\143 Builder\n\240\159\146\165 Pirate Davey\n\n\240\159\144\138 <b>Crocowolf Nerfs</b>\n\240\159\143\131 1.6 \226\134\146 1.4 move speed multiplier\n\240\159\148\167 1.5 \226\134\146 1.4 knockback multiplier\n\n\240\159\151\146\239\184\143 <b>Other Changes</b>\n\240\159\142\184 Melody: you now heal yourself for 20% of heal given\n\226\155\148 Added block textures for the Bedrock block\n\240\159\141\181 Boba Blaster: buffed damage, attack speed, and explosion range\n\226\143\177\239\184\143 Vaulted the Stopwatch item\n\240\159\151\186\239\184\143 New SkyWars map: Bloom\n\240\159\143\185 Added projectile particle effects\n\240\159\147\179 Earlier this week: added lots of mobile control improvements\n\240\159\148\135 Emotes from other players are now muted around spawn locations\n\240\159\147\169 Custom match commands are now only enabled in public chat. An option to hide commands will come soon. This was added to prevent tournament and 1v1 abuse", 
			image = {
				assetId = "rbxassetid://9253968152", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 25, 
			visible = true, 
			title = "Boba Blaster + New Ranked Season", 
			date = "3/25/2022", 
			body = "<b>\240\159\141\185 Boba Blaster</b> (NEW ITEM!)\nA new ranged weapon is available from the Item Shop in all modes!\n\n<b>\240\159\143\134 Ranked Season 4</b>\nThe Ranked BETA Season is finally over and Season 4 is officially underway. This means all BETA Season ratings have been finalized and everyone gets a fresh start for Season 4.\nGoing forward, ranked seasons will be synced with Battle Pass seasons.\n\n<b>\240\159\145\145 Ranked Season Rewards</b>\nEveryone who finished the BETA Season as Nightmare has received special rewards!\n\226\154\148\239\184\143 Nightmare: Victorious Barbarian Skin\n\240\159\146\170 Nightmare: Victorious BETA Season Emote\n\226\156\168 All ranks: Lobby title for your final rank\nThese rewards will never be purchasable or obtainable ever again. Congratulations to everyone who made it to Nightmare!\n\n<b>\240\159\147\136 Nightmare Rank Changes</b>\nNightmare has been changed to only include the top 200 players on the ranked leaderboard. The list of Nightmare players is updated every few hours.  This means you can now go above 100RP in Diamond 4 and will only rankup to Nightmare once you\226\128\153re in the top 200.\n\n<b>\240\159\165\135 Nightmare Emote</b>\nA new Nightmare Emote has been added for all players who actively have the Nightmare rank. If your rank falls below Nightmare, you immediately lose access to the emote.\n\n<b>\240\159\151\146\239\184\143 Other Changes</b>\n\240\159\164\175 Lucky Block: Added Head Growth Potion (NEW ITEM!)\n\240\159\146\165 Added a damage hit effect\n\240\159\146\158 Renamed Rapid Regen to Rapid Heal\n\226\156\168 Moved Rapid Heal II and Shield Gen II into the basic research type\n\226\153\187\239\184\143 Removed Rapid Heal III, Shield Gen III, and Updraft II\n\240\159\167\177 Added spawnable Bedrock block to Custom Matches (only breakable by Hosts + Cohosts)\n\240\159\148\167 Fixed ranked issue where you\226\128\153d sometimes get an RP loss when winning the game\n\240\159\167\170 Alchemist: Fixed dupe glitch\n\240\159\142\136 Fixed balloons anticheat bugs\n", 
			image = {
				assetId = "rbxassetid://9194095668", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 24, 
			visible = true, 
			title = "Season 4 Battle Pass!", 
			date = "3/18/2022", 
			body = "\240\159\142\159\239\184\143 <b>Battle Pass Season 4</b>\n\240\159\140\152 Nyx Kit\n\240\159\144\138 Crocowolf Kit\n\240\159\144\145 Sheep Herder Kit\n\240\159\167\170 Alchemist Kit\n\226\140\155 2 more kits coming soon! \n\240\159\164\181 2 kit skins \n\240\159\146\165 3 kill effects\n\226\154\148\239\184\143 3 lobby gadgets\n\240\159\146\131 3 dance emotes (NEW!)\n\240\159\150\188\239\184\143 34 image emotes\n\240\159\146\172 21 lobby titles\n\n\240\159\143\170 <b>Vending Machines</b>\nDodo Co. has started airdropping Vending Machines in all BedWars matches. Purchase a random legendary item from a vending machine for 8 emeralds. The Vending Machine includes items that are impossible to obtain any other way! Vending Machine Airdrops arrive 9 minutes into the match.\n\nPossible item drops:\n\240\159\142\168 Paint blaster (NEW!)\n\240\159\165\149 Carrot cannon (NEW!)\n\240\159\144\166 Dodo bird\n\226\154\148\239\184\143 Twirl blade\n\n\226\156\168 New <b>Lucky Block Items</b>\n\240\159\144\162 Turtle shell\n\240\159\152\180 Sleep splash potion\n\n\240\159\153\140 <b>Free Kits of the Week</b>\n\240\159\143\185 Barbarian\n\240\159\142\184 Melody\n\240\159\146\165 Davey\n\n\240\159\151\186\239\184\143 <b>New Maps</b>\n\240\159\140\181 Western (squads + doubles)\n\240\159\147\161 Dome (squads)\n\240\159\143\159\239\184\143 Coliseum (squads)\n\240\159\140\139 Volcano (squads + doubles)\n\226\155\143\239\184\143 Quarry (squads)\n\n\240\159\151\146\239\184\143 <b>Other Changes</b>\n\240\159\144\166 Nerfed dodo bird jump height\n\240\159\149\138\239\184\143 Raven: fixed poison not preventing health regen\n\240\159\149\138\239\184\143 Raven: changed explode keybind from \226\128\156X\226\128\157 to left click\n\226\152\131\239\184\143 Frosty: removed slowness from snowballs\n\226\152\131\239\184\143 Frosty: buffed snowball spawn rate\n\240\159\148\167 Custom match command: /give &lt;player | \"@all\" | \"@team:\"(team_color)&gt; &lt;item&gt; &lt;amount&gt;", 
			image = {
				assetId = "rbxassetid://9072707575", 
				aspectRatio = 1, 
				height = 0
			}
		}, {
			updateLogId = 23, 
			visible = true, 
			title = "Season 4 Progress Update", 
			date = "3/11/2022", 
			body = "<b>\226\156\168 Season 4 Progress Update</b>\nWe\226\128\153re down to the final week until the big Season 4 release. This week\226\128\153s update is light while the entire team is focused on making Season 4 our biggest update yet!\n\n<b>\240\159\148\165 Triple XP Week!!</b>\nThis is the last week to grind for battle pass rewards. Enjoy triple xp as you work your way towards level 50!\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n\240\159\144\159 Axolotl Amy (first time being free!)\n\240\159\145\168\226\128\141\240\159\141\179 Baker\n\240\159\155\161\239\184\143 Infernal Shielder\n\n<b>\240\159\166\139 Academy Aery Skin (Limited Edition!)</b>\nA new limited edition skin is available! This skin is on sale for this week only.\n\226\154\148\239\184\143 Duels has replaced Infected as this week\226\128\153s LTM\n\240\159\151\186\239\184\143 New Duels map: Canyon\n\n<b>\240\159\144\175 Mobility Nerfs</b>\n- Yuzi, Jade, and Void Regent no longer have access to telepearls\n\n<b>\240\159\146\187 Vulcan Buffs</b>\n- Buffed turret damage (5 \226\134\146 8)\n- Buffed turret knockback (+20%)\n- Buffed turret max distance (+25%)\n\n<b>\240\159\151\146\239\184\143 Other Changes</b>\n\240\159\143\176 Buffed stone brick health (60 \226\134\146 75)\n\240\159\143\176 Reduced stone brick price (48 \226\134\146 40)\n\240\159\170\147 Reduced wood plank price (40 \226\134\146 34)\n\240\159\146\176 Removed the mechanic of 40% iron pool loss on death that we introduced 2 patches ago\n\240\159\145\169\226\128\141\240\159\148\167 New custom match command: /cohost all - grants cohost permissions to all players\n\240\159\145\169\226\128\141\240\159\148\167 New custom match command: /sethealthregen (player) (regen_amount) - sets health regen rate for a player\n\240\159\145\145 Clans tags now support the '_' underscore character.\n\240\159\145\145 Clans can now change the case of their clan tag in the management tab (ex: faze \226\134\146 FaZe)", 
			image = {
				assetId = "rbxassetid://9072707575", 
				aspectRatio = 1, 
				height = 0
			}
		}, {
			updateLogId = 22, 
			visible = true, 
			title = "\226\154\160\239\184\143 Clans have been wiped! \226\154\160\239\184\143", 
			date = "3/07/2022", 
			body = "\240\159\155\161\239\184\143 <b>CLAN WIPE</b>\nClans have been wiped. Make sure to make your new clan.\n\n\226\154\160\239\184\143 <b>All clan leaders before the wipe will be able to create a clan for free.</b> \226\154\160\239\184\143\n\n<b>Other Changes</b>\n- VIP Gamepass owners are now able to create clans for free.\n- All clan creates will be free after the first purchase. (Clan leaders that have already purchased a clan will benefit from this automatically)\n- To compensate for lost progress we're enabling 2x daily coin limit & 2x clan coins for 3 days.\n- Clans will be able to earn more than the daily coin limit! All members will earn coins at 10% the rate after the clan reaches the daily coin limit.", 
			image = {
				assetId = "", 
				aspectRatio = 1, 
				height = 0
			}
		}, {
			updateLogId = 20, 
			visible = true, 
			title = "Introducing Clans v1!", 
			date = "3/04/2022", 
			body = "\226\154\148\239\184\143 <b>Clans!</b>\nYou can now create your own clan on BedWars! Playing matches will earn clan coins. You can spend clan coins on clan upgrades, unlocks, and even kits!\n\n\240\159\142\136 <b>Balloon Fixes</b>\nWe fixed several issues with balloons this week. The infamous glitch that made you sink into the void should be resolved now. Also, telepearls will no longer hit balloons.\n\n\240\159\153\140 <b>Free Kits of the Week</b>\n\240\159\167\145\226\128\141\240\159\140\190 Farmer Cletus\n\240\159\143\185 Archer\n\240\159\148\168 Builder\n\n\240\159\140\160 <b>Lucky Block</b>\n\240\159\148\168 Added Mass Hammer\n\226\154\148\239\184\143 Added Double Edge Sword\n\n\240\159\151\186\239\184\143 <b>New Maps</b>\nWe\226\128\153re trialing a new map format this week. The Treehouse map has a large void gap with unbreakable ziplines to let you travel across.\n\240\159\140\179 Added Treehouse (squads)\n\226\155\143\239\184\143 Added Mineshaft (doubles)\n\240\159\142\136 Re-added Airship v2 (squads)\n\n\240\159\151\146\239\184\143 <b>Other Changes</b>\n\240\159\142\136 Fixed speed not properly calculating when deploying balloons while falling\n\240\159\155\161\239\184\143 Anticheat improvements\n\226\154\161 Performance improvements", 
			image = {
				assetId = "rbxassetid://9007256289", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 20, 
			visible = true, 
			title = "Miner Kit", 
			date = "2/25/2022", 
			body = "<b>\240\159\142\137 DOUBLE XP ENABLED OVER THE WEEKEND \240\159\142\137</b>\n\n\226\155\143\239\184\143 <b>Miner Kit!</b>\nThe Miner kit has been added to BedWars! Purchase the Miner Bundle to get this new kit with a unique limited edition skin. The kit will become available for direct purchase in 2 weeks when the bundle goes away.\n\nMiner Bundle includes:\n- Miner Kit\n- Space Miner skin (limited edition!)\n- 3 lobby titles\n\n\240\159\140\178 <b>Eldertree Buffs</b>\n\240\159\140\179 Increased orb spawn rate (13s \226\134\146 9s)\n\240\159\140\180 Increased health scaling ratio\n\240\159\142\132 Increased orbs at match start (3 \226\134\146 5)\n\n\240\159\146\142 <b>Team Generator Changes</b>\nWe\226\128\153re changing up the rushing meta this week with an update to team generators.\nYou now lose 40% of iron sitting on your generator upon death.\nThis will make failed rushes more punishing.\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n\240\159\164\160 Lassy\n\240\159\142\184 Melody\n\240\159\146\165 Davey\n\n <b>LTM Rotation</b>\n\240\159\167\159 Infected is back!\n\226\154\148\239\184\143 Duels has been removed\n\n\240\159\151\186\239\184\143 <b>Maps</b>\n\240\159\166\180 Citadel (squads)\n\240\159\166\180 Citadel (doubles)\n\n\240\159\151\146\239\184\143 <b>Other Changes</b>\n\226\158\149 Custom Matches: Added ability to promote players to cohost\n- Cohosts can use the host panel and admin commands\n\240\159\153\134 Damaging a clone no longer damages the real player\n\240\159\140\171\239\184\143 Added a smoke block placed limit to help with performance\n\240\159\144\155 Fixed a bug that allowed Aery to stack damage by killing herself\n\226\154\160\239\184\143 Kit items can no longer be dropped or put into chests\n\226\154\161 Performance improvements", 
			image = {
				assetId = "rbxassetid://8936489137", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 19, 
			visible = true, 
			title = "New Enchants", 
			date = "2/18/2022", 
			body = "\240\159\146\150 <b>Enchants Update</b>\nWe added 5 new enchants this week! Existing enchants also have some new balance changes. \n\n\240\159\155\161\239\184\143 New Enchant: Shield Gen\n\240\159\140\170\239\184\143 New Enchant: Updraft\n\240\159\146\176 New Enchant: Plunder\n\240\159\146\158 New Enchant: Rapid Regen\n\226\152\129\239\184\143 New Enchant: Anti Knockback\n\240\159\148\165 Fire Enchant changes: nerfed overall damage, buffed tier 1 duration\n\n\240\159\153\140 <b>Free Kits of the Week</b>\n\240\159\143\185 Archer\n\240\159\167\145\226\128\141\240\159\141\179 Baker\n\240\159\155\161\239\184\143 Shielder\n\n\240\159\151\186\239\184\143 <b>Maps</b>\n\240\159\142\136 Airship v2 (squads)\n\240\159\143\173 Factory v2 (squads)\n\226\152\160\239\184\143 Volatile: fixed bugs on skywars version\n\n\240\159\151\146\239\184\143 <b>Other Changes</b>\n\240\159\143\159\239\184\143 30v30 has replaced Bed Royale as this week\226\128\153s LTM\n\240\159\143\185 Added bow animations\n\240\159\155\161\239\184\143 Improved healthbar UI\n\240\159\141\130 Added a new anti-fall mechanic to mobile\n\240\159\146\147 Added health regen indicators\n\240\159\155\161\239\184\143 Added special damage sound when shield is active\n\240\159\167\153\226\128\141\226\153\130\239\184\143 Enchant Table: you can no longer get the same enchant type twice in a row\n\226\154\161 Performance improvements", 
			image = {
				assetId = "rbxassetid://8863124703", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 18, 
			visible = true, 
			title = "Lucky Block V3", 
			date = "2/11/2022", 
			body = "\226\156\168 <b>Lucky Block Additions</b>\nThis week\226\128\153s update focuses on an expansion to the Lucky Block mode!\nNew effects have been added, drop chances tweaked, and tons of new items are available:\n\n\240\159\140\170\239\184\143 Added Twirlblade\n\240\159\170\147 Added Battle Axe\n\240\159\170\130 Added Hanglider\n\240\159\166\134 Added Assassin Duck\n\226\154\148\239\184\143 Added Dao Sword\n\240\159\167\138 Added Ice Sword\n\240\159\141\140 Added Banana Peels\n\240\159\140\137 Added Auto bridge to the center of the map\n\226\152\129\239\184\143 Added Smoke Bomb\n\240\159\149\138\239\184\143 Added Ziplines\n\226\156\168 Added possibility to get a random enchant\n\240\159\145\162 Added Double Jump Boots\n\240\159\155\161\239\184\143 Added Forcefield\n\240\159\154\128 Added Heat Seeking Rock\n\240\159\166\152 Added Impulse Granade\n\226\157\164\239\184\143 Added chance to get +20 max hp\n\240\159\145\145 Added chance to get an armor upgrade\n\n\240\159\143\185 <b>Archer Buffs</b>\n- Decreased price of Tactical Crossbow (10 emerald \226\134\146 6)\n- Removed ability to buy regular crossbow since Tactical is cheaper now\n\n\226\154\148\239\184\143 <b>Barbarian Nerfs</b>\n- Increased amount of rage required for Iron Sword, Diamond Sword, and Rageblade\n\n\240\159\134\147 <b>Free Kits of the Week</b>\n\240\159\145\188 Trinity (first time being free!)\n\240\159\167\145\226\128\141\240\159\140\190 Farmer Cletus\n\240\159\142\184 Melody\n\n\240\159\151\186\239\184\143 <b>New Maps</b>\n\240\159\167\153\226\128\141\226\153\130\239\184\143 Mystic (squads + doubles/solos)\n\n<b>LTM Rotation</b>\n\240\159\143\159\239\184\143 100 Player Bed Royale Is back!\n\240\159\145\145 Juggernaut has been removed\n\n\240\159\151\146\239\184\143 <b>Other Changes</b>\n\240\159\144\175 The Lunar bundle is no longer for sale and the Yuzi kit is now available directly in the Kit Shop\n\240\159\144\178 Due to popular demand, the Lunar Vulcan skin sale has been extended until 2/15\n\240\159\148\168 Jade Hammer + Void Axe now play a first person animation on use\n\240\159\148\174 Command change: /tp &lt;target_players&gt; &lt;destination_player&gt; or /tp &lt;destination_player&gt;\n\240\159\148\174 Command change: /tpbed &lt;team_name&gt; --&gt; /tpbed red\n\226\154\161 Bug fixes", 
			image = {
				assetId = "rbxassetid://8795877418", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 17, 
			visible = true, 
			title = "Battle Ducks & Juggernaut TDM", 
			date = "2/4/2022", 
			body = "\240\159\166\134 <b>Battle Ducks!</b>\nBattle Duck Spawn Eggs are available in the Item Shop for 2 emeralds. Ducks patrol an area and attack detected intruders.\n\n\240\159\145\145 <b>Juggernaut TDM</b>\nA new limited time mode has hit the rotation this week! Two teams of 30 battle for the most kills in 10 minutes.\nJuggernaut Airdrops are deployed every 2 minutes. Obtaining a Juggernaut Airdrop transforms you into a powerful Juggernaut.\n\n\240\159\143\174 <b>Lunar Vulcan (Limited Time Skin!)</b>\nThe Lunar Vulcan skin is now available! This limited time skin also includes a themed turret and tablet!\n\n\240\159\166\139 <b>Aery Changes</b>\n- Slightly reduced damage scaling\n- Anti spawn killing: there is now a 30 second cooldown for gaining stacks against the same player\n\n\240\159\134\147 <b>Free Kits of the Week</b>\n\240\159\148\168 Builder\n\240\159\146\165 Davey\n\240\159\144\174 Lassy\n\n\240\159\143\151\239\184\143 <b>Custom Match</b>\n- Players search bar\n- Force set a player\226\128\153s team\n- Set a player\226\128\153s max health\n- You can now pick the team to change the team generator multiplier speed for.\n- PvP enabled toggle\n- Lock server toggle\n- Server max player limit\n- Bed breaking enabled toggle\n- The default value of Team Overflow toggle has been changed from true \226\134\146 false\n- Team switching enabled toggle\n- Item limits toggle. Remove the item cap for items like the balloon.\n- Disable/Enable all purchasable items button\n- Added new commands:\n   - /tp (username or displayname)\n   - /tpall\n   - /tpbed &lt;team_bed&gt;\n   - Earlier this week: /spawn (item name) [amount]\n\n\240\159\151\146\239\184\143 <b>Other Changes</b>\n\240\159\142\134 Removed firework arrows\n\226\154\161 Tesla Trap: reduced max traps (4 \226\134\146 2)\n\240\159\146\172 Reworked nametags to increase game clarity\n\240\159\142\166 You now briefly spectate the player that killed you after dying\n\240\159\146\187 Vulcan: improved turret mobile controls\n\240\159\142\129 Fixed sounds not working for the gift kill effect\n\240\159\140\160 Spirit Catcher: released a new visual rework\n\240\159\143\133 Rank icons are now displayed above your head in the Lobby\n", 
			image = {
				assetId = "rbxassetid://8731898376", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 16, 
			visible = true, 
			title = "Lunar New Year Event!", 
			date = "1/28/2022", 
			body = "\240\159\143\174 <b>Lunar New Year Update!</b> \240\159\143\174\nHey everyone, this week we have a very exciting update for the upcoming Lunar New Year celebrations. We reworked the main lobby and gave it a new theme.\n\n<b>Lunar New Year Bundle</b>\n\240\159\142\159\239\184\143 Unlocks the Yuzi Kit (This kit is not exclusive to the bundle and will be available for direct purchase on Friday, February 11th)\n\240\159\144\175 Limited Edition Year of the Tiger Yuzi Skin\n\240\159\151\161\239\184\143 1 New kill effect\n\240\159\152\186 4 New emotes\n\240\159\146\172 3 New lobby titles\n\n<b>New item: Firework Arrow</b>\n\240\159\142\134 The firework arrow is a new purchasable item from the shop. This arrow explodes on impact causing damage to anyone near it. We want to see fireworks everywhere!\n\n<b>LTM Rotation</b>\n\240\159\144\167 Survival LTM has been removed. The response to this mode has been incredible. Thank you to everyone who gave the mode a try \226\128\148 expect to see another Survival Event in the future!\n\226\154\148\239\184\143 Duels LTM is back!\n\n<b>Free Kits of the Week</b>\n\226\157\132\239\184\143 Freiya\n\226\154\148\239\184\143 Barbarian\n\240\159\167\145\226\128\141\240\159\141\179 Baker\n\n<b>Map Changes</b>\n\240\159\140\184 Added Oriental (Squads)\n\226\155\169\239\184\143 Added Shrine (Squads)\n\240\159\140\184 Added Oriental (Doubles)\n\226\155\169\239\184\143 Added Shrine (Doubles)\n\240\159\142\141 Added Bamboo Garden (SkyWars)\n\n<b>Other Changes</b>\n\240\159\155\160\239\184\143 New Custom Match Host UI for managing game settings\n\240\159\155\160\239\184\143 Custom Match: added nametag visibility setting (great for hide-and-seek!)\n\240\159\146\142 Custom Match: added separate generator multipliers for team, emerald, & diamond generators\n\240\159\147\161 Improved matchmaking\n\240\159\148\167 Fixed purchasing duplicate shop items with right-click\n\226\154\148\239\184\143 Fixed a bug where large amounts of knockback is applied to laggy players\n\240\159\146\165 Disabled mouse clicks on Pirate Davey proximity prompts\n", 
			image = {
				assetId = "rbxassetid://8666432622", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 15, 
			visible = true, 
			title = "Penguin Survival LTM", 
			date = "1/21/2022", 
			body = "\240\159\144\167 <b>Penguin Survival Mode</b>\nThe Penguins have gone rogue... They have made it clear we are no longer welcome in the Snow. \nFend off hoards of bed-destroying penguins in the new limited time mode: Penguin Survival. \nPlaying the Penguin Survival unlocks the <b>Pengu Fallen</b> emote. \nSurviving 10 minutes will unlock the exclusive <b>Pengu Disco Victory</b> emote and game badge. \nNote: Some kits don't function properly in this experimental mode. \n\n\240\159\147\156 <b>Missions</b>\nNew missions have been added! \n- Block breaking\n- Balloon popping\n- Arrow damage\n- Launching projectiles\n- Telepearl travelling\n- Spending resources\n- Repair enchantment table\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n\240\159\145\168\226\128\141\240\159\140\190 Farmer Cletus\n\240\159\146\165 Davey\n\240\159\142\184 Melody\n\n\240\159\151\146\239\184\143 <b>Other Changes</b>\n\240\159\143\185 Reduced damage + knockback when not fully charging bow\n\240\159\146\150 Emotes now work in the Lobby\n\240\159\167\153\226\128\141\226\153\130\239\184\143 Fixed a bug with wizard effects not being destroyed\n\226\154\161 Server performance improvements", 
			image = {
				assetId = "rbxassetid://8602926071", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 14, 
			visible = true, 
			title = "Smoke Kit + Vanessa Skin", 
			date = "1/14/2022", 
			body = "<b>New Kit: \226\152\129\239\184\143 Smoke</b>\nWe\226\128\153ve added the long-awaited level 25 battle pass kit: Smoke\nSmoke uses stealth to sneak attack players and hide in plain sight.\n\240\159\146\165 Buy a smoke bomb to temporarily disappear from sight, but beware you also can\226\128\153t interact with the map.\n\226\152\129\239\184\143 Purchase smoke blocks from the shop to obscure your location. Smoke blocks allow you to walk and shoot through but no one can see through.\n\n<b>New Skin: Demon Empress Vanessa</b>\n\240\159\152\136 You can now buy the all-new Demon Empress Vanessa Skin. This skin includes special bow and crossbow item skins.\n\n<b>NEW: Emotes</b>\n\226\157\151 Emotes are our new system for expressing yourself during the game\n\240\159\150\188\239\184\143 Emotes have replaced the old spray system. All your existing sprays have been converted into emotes.\n\240\159\146\153 This new system allows us to add many more cool emotes in the future and allows you to taunt your opponent more easily.\n\n<b>Free Kits of the Week</b>\n\240\159\134\147 Grim Reaper\n\240\159\134\147 Shielder\n\240\159\134\147 Builder\n\n<b>Balance Changes</b>\n\240\159\159\163 Reduced Telepearl price (2 emerald \226\134\146 1 emerald)\n\240\159\148\180 Reduced Fireball price (90 iron \226\134\146 75 iron)\n\n<b>Map Changes</b>\n\226\153\159\239\184\143 Added Checkmate (Squads)\n\240\159\142\150\239\184\143 Added Military Base (Squads)\n\240\159\144\159 Added Swamp (Squads)\n\240\159\141\173 Re-added Candyland (Squads)\n\240\159\144\159 Added Swamp (Doubles)\n\240\159\141\173 Re-added Candyland (Doubles)\n\n", 
			image = {
				assetId = "rbxassetid://8538119022", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 13, 
			visible = true, 
			title = "100 Player Bed Royale! + Lucky Block Update", 
			date = "1/7/2022", 
			body = "<b>\240\159\143\159\239\184\143 100 Player Bed Royale</b>\nThe Bed Royale LTM is back! Battle 25 enemy teams in this chaotic version of BedWars.\n- This update includes a new Bed Royale map: Mega Tundra \240\159\143\148\239\184\143\n\n<b>Lucky Block</b>\n\240\159\165\179 DOUBLES MODE!\n\240\159\143\185 New item: Golden Bow\n\226\154\148\239\184\143 New item: Golden Scythe\n\240\159\151\161\239\184\143 New item: Throwing knives\n\240\159\155\185 Added a hover board dismount button\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n\240\159\143\185 Archer\n\240\159\167\145\226\128\141\240\159\141\179 Baker\n\240\159\144\174 Lassy\n\n<b>Pirate Davey Changes</b>\n\240\159\146\165 You can now launch yourself out of cannons\n\240\159\155\160\239\184\143 Fixed a bug where you couldn\226\128\153t use cannons immediately before aiming them\n\n<b>Balance Changes</b>\n\240\159\149\175\239\184\143 Spirit Catcher: reduced spirit max stack size (10 \226\134\146 5)\n\240\159\148\177 Ares: reduced spear max stack size (10 \226\134\146 5)\n\n<b>\240\159\151\186\239\184\143 Map Changes</b>\n\240\159\143\148\239\184\143 Added Mega Tundra (Bed Royale)\n\240\159\143\153\239\184\143 Re-enabled Dome (Doubles)\n\n<b>Other Changes</b>\n\240\159\143\131\226\128\141\226\153\128\239\184\143 Added an \226\128\156auto bridge\226\128\157 button on mobile\n\240\159\148\138 Voice chat queue is back\n\240\159\142\174 Added an easy to use queue selector menu\n\240\159\155\160\239\184\143 Fixed crash exploits related to sprays and enchant tables\n", 
			image = {
				assetId = "rbxassetid://8480101402", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 12, 
			visible = true, 
			title = "Battle Pass Frosty Kit + Holiday Bundle", 
			date = "12/23/2021", 
			body = "<b>\240\159\142\129 Holiday Bundle</b>\nA limited edition holiday bundle is now available! The bundle contents will become unobtainable once it goes off sale.\n\n<b>\226\152\131\239\184\143 Frosty Kit</b>\nPassively create Frosted Snowballs for free. Frosted Snowballs are larger, faster and apply a slow.\n(Free Battle Pass level 40)\n\n<b>\226\154\148\239\184\143 Duels LTM</b>\nInfected has been replaced by Duels this week!\n\n<b>\240\159\134\147 Free Kits of the Week</b>\n\240\159\145\168\226\128\141\240\159\140\190 Farmer Cletus\n\240\159\142\184 Melody\n\240\159\148\168 Builder\n\n<b>\240\159\151\186\239\184\143 New Maps</b>\n\240\159\142\132 Christmas Duel (duels)\n\n<b>\240\159\151\146\239\184\143 Other Changes</b>\n\240\159\148\165 Nerfed fire enchant damage at all levels\n\226\154\161 Reduced volume of static proc sound\n", 
			image = {
				assetId = "rbxassetid://8327335808", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 11, 
			visible = true, 
			title = "Season 3 Battle Pass", 
			date = "12/17/2021", 
			body = "<b>\226\157\132\239\184\143 New Battle Pass</b>\nThis season's Battle Pass has TONS of new rewards for both free and paid players.\n\n<b>\226\154\148\239\184\143 New Battle Pass Kits</b>\n\240\159\166\139 Aery\n\240\159\142\133 Santa\n\240\159\140\168\239\184\143 Yeti\n\240\159\141\170 Gingerbread Man\n\226\143\179 TWO new kits coming soon\n\n<b>\240\159\147\150 Enchant Table</b>\nNEW: Enchant tables have been added to all maps. You can repair your team's Enchant Table for 8 diamonds. \nOnce repaired, you can research powerful enchants that amplify your combat in unique ways. \n\n<b>Current set of enchants:</b>\n\226\154\161 Static 1, 2, 3\n\240\159\148\165 Fire 1, 2, 3\n\240\159\142\134 Void 3\n\n<b>\240\159\143\159\239\184\143 Lobby Gadgets</b>\nThis season introduces a new lobby gadget system. There are four unique lobby gadgets you can collect through the Battle Pass.\n\n<b>\240\159\151\186\239\184\143 New Maps</b>\n\240\159\142\132 Christmas Square (squads)\n\240\159\143\166 Bank (squads)\n<b>\240\159\153\140 Free Kits of the Week</b>\n\226\154\148\239\184\143 Barbarian\n\240\159\143\185 Archer\n\240\159\167\145\226\128\141\240\159\141\179 Baker\n\n\240\159\140\168\239\184\143 Frost Site (infected)\n\n<b>\240\159\151\146\239\184\143 Other Changes</b>\n\240\159\146\137 Infected is back for this week! \n\240\159\146\160 Buffed Diamond Sword damage\n\240\159\150\140\239\184\143 Added 29 Sprays\n\240\159\146\165 Added 4 Kill Effects\n\240\159\148\150 Added 23 Lobby Titles\n\240\159\167\180 Removed the Brewing Stand from Item Shop (and all potions)\n\240\159\170\129 Removed Hang Gliders\n\240\159\154\128 Removed Guided Missile\n\240\159\165\150 Removed Knockback Baguette\n\226\154\148\239\184\143 Fixed iron boots being stronger than diamond boots\n\240\159\143\159\239\184\143 New holiday lobby\n\240\159\155\161\239\184\143 Tons of Anticheat changes (with more on the way!)\n\226\154\161 Bug fixes", 
			image = {
				assetId = l__BattlePassUtils__2.BATTLE_PASS_ICON, 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 10, 
			visible = true, 
			title = "Hang Glider + Triple XP", 
			date = "12/10/2021", 
			body = "This week is a little light as we prepare for the big Season 3 update next week.\n\n<b>\240\159\155\169\239\184\143 Hang Gliders</b>\nOur newest movement item is purchasable for 1 emerald in the Item Shop!\nThis is a limited time item and has been enabled in all modes.\n\n<b>\240\159\165\179 Triple XP</b>\nYou only have one week remaining to unlock Season 2 rewards! Now is the perfect time to grind with 3x XP.\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n\240\159\142\184 Melody\n\240\159\167\145\226\128\141\240\159\140\190 Farmer Cletus\n\240\159\144\174 Lassy\n\n<b>\240\159\151\186\239\184\143 Map Changes</b>\n\240\159\147\154 Added Highschool (squads)\n\n<b>\226\157\132\239\184\143 Freiya Changes</b>\nFreiya felt a little underwhelming after her initial release. To compensate, we're giving her slow ability a bigger impact.\n- Increased base slow length (0.8s -> 1.6s)\n- Increased amplified slow length (1s -> 2.5s)\n\n<b>\240\159\151\146\239\184\143 Other Changes</b>\n\240\159\148\165 Pyro's Flamethrower no longer works through walls\n\226\152\131\239\184\143 Reduced Snowball throw rate (max of 6 per second now)\n\240\159\154\128 Reduced Guided Missile knockback\n\240\159\148\168 Fixed mobile controls for Flamethrower, Raven, and Gompy", 
			image = {
				assetId = "rbxassetid://8219815048", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 9, 
			visible = true, 
			title = "Skywars + Freiya Kit + Chests", 
			date = "12/3/2021", 
			body = "<b>\240\159\167\138 Freiya Kit</b>\nDamage enemies to unlock your Frost passive. Once unlocked, dealing damage will apply stacks of Frost.\nAt four stacks Frost is consumed and slows the target. Emerald Sword is replaced by the Ice Sword which amplifies Frost.\n\n<b>\226\154\148\239\184\143 Skywars LTM</b>\nWe added a new Skywars LTM! This is an extremely fast paced, action packed gamemode.\n24 players (teams of 2). No kits. Lots of chests \240\159\147\166.\n\n<b>\240\159\147\166 Chests</b>\nChests are finally here! This has been the most popular feature suggestion for a long time. Every map now has a team chest and personal chest.\n\n<b>\226\157\132\239\184\143 Snowballs</b>\nSnowballs have been added to the shop in all queues. While doing only 1 damage, snowballs are useful for dealing knockback and popping balloons.\n\n\240\159\153\140 <b>Free Kits of the Week</b>\n\240\159\140\178 Eldertree\n\240\159\142\184 Baker\n\240\159\143\185 Archer\n\n<b>\240\159\151\146\239\184\143 Other Changes</b>\n\240\159\143\159\239\184\143 30v30 has replaced Duels for the week\n\240\159\148\138 Temporarily disabled voice chat queue (we'll be bringing it back later)\n\240\159\167\176 Added a 9th slot to hotbar\n\240\159\146\188 Inventory has been expanded to hold more slots\n\240\159\148\173 Potion effect indicators have been added to the top of screen\n\226\154\161 Bug fixes\n", 
			image = {
				assetId = "rbxassetid://8165357967", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 8, 
			visible = true, 
			title = "Lucky Block Airdrops + Duels", 
			date = "11/26/2021", 
			body = "<b>\240\159\170\130 Airdrop Lucky Blocks</b>\nA new type of Lucky Block has started airdropping from above. Securing an Airdrop Lucky Block yields ultra rare items.\n\n<b>\226\154\148\239\184\143 Duels LTM</b>\nDuels has replaced Infected as the active limited time mode for this week!\n\n<b>\226\156\168 DOUBLE XP WEEKEND</b>\nEnjoy double battle pass experience Friday-Sunday!\n\n<b>\240\159\151\186\239\184\143 New Maps</b>\n\240\159\140\181 Badlands\n\226\154\189 Football Field\n\240\159\143\153\239\184\143 City Park\n\240\159\140\136 Heaven\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n\240\159\151\161\239\184\143 Barbarian\n\240\159\143\180\226\128\141\226\152\160\239\184\143 Davey\n\240\159\148\168 Builder\n\n<b>\240\159\151\146\239\184\143 Other Changes</b>\n\226\154\161 Tesla Traps now take 6 seconds to charge up before doing damage\n\240\159\167\180 Active potion effects are now shown above player's heads\n\226\157\142 Added first person crosshair\n\240\159\143\131\226\128\141\226\153\128\239\184\143 First person walking animation\n\240\159\140\136 Map devs can now use colored glass", 
			image = {
				assetId = "rbxassetid://8105554657", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 8, 
			visible = true, 
			title = "Infection LTM + Guided Missile", 
			date = "11/19/2021", 
			body = "\240\159\154\128 <b>Guided Missile</b>\nThe brand new guided missile item can be purchased from the Item Shop for 1 emerald!\n*Guided Missile is disabled in ranked while we ensure it's balanced.\n\n\226\154\160\239\184\143 <b>Infection LTM</b>\nWe've added a new Limited Time Mode this week: Infection!\n\n\240\159\151\186\239\184\143 <b>New Maps</b>\n\240\159\155\162\239\184\143 Oil (duos + solos)\n\240\159\143\155\239\184\143 Arch (duos + solos)\n\240\159\143\173 Industry (infected)\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n\240\159\167\145\226\128\141\240\159\140\190 Farmer Cletus\n\240\159\142\184 Melody\n\240\159\143\185 Archer\n\n\240\159\151\146\239\184\143 <b>Other Changes</b>\n\240\159\143\185 Vanessa: increased triple shot charge time when using crossbow\n\226\156\168 Increased weekly mission xp\n\240\159\164\144 Removed zipline\n", 
			image = {
				assetId = "rbxassetid://8042947336", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 7, 
			visible = true, 
			title = "New Lucky Blocks + Kit Countdown", 
			date = "11/12/2021", 
			body = "<b>\240\159\165\179 New Lucky Block Items</b>\n\240\159\155\185 Hoverboard\n\240\159\140\140 Black hole\n\240\159\166\138 Steal ball\n\240\159\143\176 Pop up cage\n\240\159\144\159 Knockback fish\n\n<b>\226\140\155 New Kit Countdown</b>\nA new kit will be released tomorrow (Saturday) at 10am PST. A countdown has been enabled in the Lobby.\n\n<b>\240\159\148\138 Voice Chat Only Queue</b>\nWe've enabled a special voice chat only queue for the weekend! You're only able to join if you have voice chat enabled.\nEnable voice chat in your Roblox settings.\n\n<b>\240\159\148\168 Builder Kit Buffs</b>\n\240\159\146\165 Upgrading a block now gives blast protection\n\226\157\164\239\184\143 Buffed upgraded block max health\n\240\159\146\184 Slightly increased upgrade cost for non blast-proof blocks\n\n<b>\240\159\143\180\226\128\141\226\152\160\239\184\143 Pirate Davey Buffs</b>\n\240\159\146\165 TNT is now cheaper for Pirate Davey\n\240\159\148\171 Reduced price of cannon\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n\240\159\146\128 Grim Reaper\n\240\159\145\168\226\128\141\240\159\141\179 Baker\n\240\159\144\174 Lassy\n\n<b>\240\159\151\186\239\184\143 New Map:</b> GrandCentral (squads)\n", 
			image = {
				assetId = l__EmoteMeta__3[l__EmoteType__4.CUTE_GRIM_REAPER].image, 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 6, 
			visible = true, 
			title = "Balance Patch + Ranked Leaderboard", 
			date = "11/09/2021", 
			body = "<b>\240\159\142\153\239\184\143 Enabled Voice Chat</b>\nVoice Chat has been enabled! Verify your age in Roblox settings to gain access to Voice Chat\n\n<b>\240\159\148\167 Balance Patch</b>\n- Nerfed speed potion (2x speed -> 1.5x)\n- Reduced jump and speed potion duration (60s -> 45s)\n- Speed potions no longer influence balloon speed\n\n<b>\240\159\143\134 Ranked</b>\n- Added ranked leaderboard to Lobby\n- Added placement rank reveal animation\n- Fixed postgame screen ui for ranked queues\n- Fixed Nightmare rank display in lobby stat board\n\n<b>\240\159\151\146\239\184\143 Other Changes</b>\n- Increased First Person FOV\n- Disable party join notification in game servers\n- Increase ore generator team split distance\n- Changed barbarian rage bar color to stand out from health bar\n- Remove Maps: Savanna, Tea Time, Candyland\n\n<b>\240\159\155\161\239\184\143 Bug Fixes</b>\n- Patch exploit that let you break bed through defenses\n- Fix tesla traps sometimes targeting teammates", 
			image = {
				assetId = l__EmoteMeta__3[l__EmoteType__4.HAPPY_GOMPY].image, 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 5, 
			visible = true, 
			title = "Lucky Block v2 + Ranked Queue Beta", 
			date = "11/05/2021", 
			body = "<b>\240\159\165\179 Lucky Block</b>\n- Lucky Block is back with tons of new items! Expect regular updates to Lucky Block too!\n- There are too many changes to list -- you'll have to discover them yourself! \n\n<b>\226\154\148\239\184\143 Ranked Queue Beta</b>\nWe've added a new Ranked Queue with skilled matchmaking. Win games to rankup and compete against the best players in BedWars. \n\nThere are six ranks to climb through during the Beta Season:\n- Bronze\n- Silver\n- Gold\n- Platinum\n- Diamond\n- Nightmare\n\nThe Ranked Queue is limited to players with Robux only. This is an extra measure to stop cheaters from being able to make free alt accounts after they get banned. \n\nThis is a brand new system so there may be a few bugs early on. We will be monitoring very closely and shipping adjustments as needed. \n\n<b>\240\159\153\140 Free Kits of the Week</b>\n- \226\154\148\239\184\143 Barbarian\n- \240\159\155\161\239\184\143 Infernal Shielder\n- \240\159\148\168 Builder\n\n<b>\240\159\151\146\239\184\143 Other Changes</b>\n- \240\159\145\187 Gompy ghost damage changed (90 damage -> 60 damage with 40% armor penetration)\n- \240\159\148\177 Ares' spears now have a max stack size of 10\n- \240\159\148\174 Spirit catcher's spirits now have a max stack size of 10\n- \240\159\167\175 Pyro brittle fixed to not consume on tesla coil zap\n- \240\159\150\140\239\184\143 Updated some textures", 
			image = {
				assetId = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId.DIAMOND_RANK, 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 4, 
			visible = true, 
			title = "Axolotl Amy + Stopwatch", 
			date = "11/1/2021", 
			body = "<b>\226\156\168 Axolotl Amy Kit</b>\nUse your pet axolotls to empower yourself and nearby teammates with shields, increased attack damage, faster break speed and health regen.\n\n<b>\226\143\177\239\184\143 New Item: Stopwatch</b>\nTravel back in time with this new item! Available in all queues.\n\n<b>\240\159\150\140\239\184\143 New Textures!</b>\nWe revamped nearly every texture in the game! Some maps may look a little strange right now -- we'll be continuing to improve the textures and update each map over the next few weeks.\n\n<b>\240\159\148\138 Sound Improvements</b>\n- New kill sound\n- New wool sounds\n\n<b>\240\159\142\129 Free Kits of the Week</b>\n\240\159\167\153\226\128\141\226\153\130\239\184\143 Wizard\n\240\159\144\180 Lassy\n\240\159\142\184 Melody\n\n<b>\226\154\148\239\184\143 Trinity Kit Changes</b>\n- Passive healing now only triggers on close-range attacks\n- Reduced void form healing (15% -> 12%)\n\n<b>\226\157\140 Removed Dodo Birds</b>\nDodos have stopped appearing in regular matches. RIP beautiful bird \226\157\164\239\184\143\n\n<b>\240\159\151\186\239\184\143 New Maps</b>\n\240\159\140\178 Lumberyard (squads)\n\240\159\143\176 Fortress (30v30)", 
			image = {
				assetId = "rbxassetid://7873399587", 
				aspectRatio = 1, 
				height = 150
			}
		}, {
			updateLogId = 3, 
			visible = true, 
			title = "Season 2 + \240\159\142\131 Halloween!", 
			date = "10/23/2021", 
			body = "<b>Welcome to BedWars Season 2!!</b>\n\n<b>\240\159\141\172 Battle Pass Kits</b>\n- \226\154\148\239\184\143 Ares\n- \240\159\142\163 Fisherman\n- \240\159\151\161\239\184\143 Trapper\n- \240\159\142\131 Jack\n- \240\159\145\187 Gompy the Ghost Hunter\n\n<b>\240\159\151\146\239\184\143 Game Changes</b>\n- Added the \"Brewing Stand\" section to Item Shop. After unlocking with diamonds, this lets your team purchase potions\n- Added the \"Armory\" section to Item Shop. After unlocking with diamonds, this lets your team purchase high-tier weapons\n- Added mini + big shield potions\n- Added invisibility potion\n- Added speed potion\n- Added jump potion\n- Added diamond generator team upgrade\n- Reduced spawn rate of Dodo birds (no longer guaranteed to spawn every game)\n- Removed slime blocks\n\n<b>\226\156\168 Battle Pass Content\n</b>- 5 new kits\n- 21 new sprays\n- 24 new lobby titles\n- Expect some extra content being added throughout the next week\n\n<b>\240\159\153\140 Free Kits of the Week\n</b>- Archer\n- Infernal Shielder\n- Pirate Davey\n\n<b>\240\159\151\186\239\184\143 New Maps\n</b>- Pumpkin Patch (squads + doubles + solos)\n- Crypt (squads + doubles + solos)\n\n<b>\240\159\143\159\239\184\143 LTM Update\n</b>Lucky Block has been replaced by 30v30. Expect Lucky Block to make a return soon with some huge new updates :)\n\n<b>\240\159\145\187 Halloween Lobby\n</b>Enjoy the new event lobby for the next two weeks. There's lots to explore while enjoying the new background music!\n\n<b>\240\159\155\161\239\184\143 Ban Wave\n</b>We've enabled a new ban wave that permanently bans 20,342 cheaters. L8r nerds.", 
			image = {
				assetId = l__BattlePassUtils__2.BATTLE_PASS_ICON, 
				aspectRatio = 0.9358059914407989, 
				height = 150
			}
		}, {
			updateLogId = 2, 
			visible = true, 
			title = "New Maps + Double XP!", 
			date = "10/15/2021", 
			body = "This week is a little light as we are down to one week until the big Season 2 update.\n\n<b>\240\159\142\137 Double XP  Enabled!</b>\nThis is the final week you can grind out Battle Pass levels. Once Season 2 starts all Season 1 Battle Pass kits will become unobtainable.\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n- Barbarian\n- Melody\n- Baker\n\n<b>\240\159\148\165 Pyro Changes</b>\n- You now keep embers upon death (buff)\n- Significantly reduced cost of upgrades (buff)\n- Buffed fire damage\n- Brittle proc now has 20% armor penetration (buff)\n\n<b>\240\159\144\166 Raven Changes</b>\n- Increased raven tick damage (4 -> 6)\n- Increased raven armor penetration (60% -> 70%)\n\n<b>\240\159\141\128 Lucky Block Changes</b>\n- Added Charge Shield\n\n<b>\240\159\151\186\239\184\143 New Maps</b>\n- Launch (squads)\n- Observatory (squads)\n- Plaza (doubles)\n\n<b>\240\159\151\146\239\184\143 Other Changes</b>\n- Reduced leather armor cost (60 iron -> 50 iron)\n- Disabled chat sound in the lobby\n- Improved first person projectile aiming\n- Anticheat improvements\n- Bug fixes", 
			image = {
				assetId = "rbxassetid://7745109855", 
				aspectRatio = 1.7777777777777777, 
				height = 150
			}
		}, {
			updateLogId = 1, 
			visible = true, 
			title = "Lucky Block Update!", 
			date = "10/08/2021", 
			body = "<b>\226\156\168 Lucky Block LTM</b>\n- This week we're hosting a new limited time mode called Lucky Block.\n- Find and break randomly placed Lucky Blocks for crazy (and sometimes dangerous) rewards.\n- Have fun exploring all the new items exclusive to this mode!\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n- Farmer Cletus\n- Builder\n- Lassy\n\n<b>\240\159\155\161\239\184\143 Custom Match Commands</b>\n- /disableKit (kit)\n- /announce [message]\n- /toggleSpawn (entity) (value)\n\n<b>Other Changes</b>\n- Nerfed dodo bird jump height, run speed and spawn rate", 
			image = {
				assetId = "rbxassetid://7681599456", 
				aspectRatio = 1, 
				height = 150
			}
		} }
};
