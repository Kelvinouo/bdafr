-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__GameUpdateButtons__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "update", "game-update-meta").GameUpdateButtons;
local l__CreateRoduxApp__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__GameUpdatesCore__6 = v1.import(script, script.Parent, "game-updates-core").GameUpdatesCore;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	l__ClientStore__1:dispatch({
		type = "GameUpdatesSetAll", 
		updates = { {
				updateLogId = 24, 
				visible = true, 
				title = "Snow Cone Machine + Tier 3 Break Speed", 
				date = "6/24/2022", 
				body = "<font color=\"" .. (l__ColorUtil__2.richTextColor(l__Theme__3.mcYellow) .. "\"><b>\240\159\166\156 Become a Pirate!</b></font>\n") .. "Ahoy Mateys! You can now become a pirate for 20 Iron. Becoming a pirate unlocks 3 new exclusive items.\n" .. "\240\159\143\180\226\128\141\226\152\160\239\184\143 Pirate Flag: Periodically collects nearby dropped items\n" .. "\240\159\165\133 Pirate Telescope: Grants nearby allies enhanced projectiles\n" .. "\240\159\146\176 Pirate Shovel: Dig enemy blocks for treasure\n\n" .. "<b>\240\159\143\180\226\128\141\226\152\160\239\184\143 Pirate Event Shop</b>\n" .. "\240\159\143\183\239\184\143 3 New Titles\n" .. "\240\159\145\139 1 New Animated Emotes\n" .. "\240\159\145\139 2 New Image Emotes\n" .. "\240\159\151\161\239\184\143 1 New Kill Effect\n\n" .. "<b>\240\159\143\180\226\128\141\226\152\160\239\184\143 Pirate Event Missions Reset</b>\n" .. "Missions have been reset and will now be automatically issued on a daily/weekly schedule.\n" .. "- Daily missions reset every day at <b>3 PM PST</b>\n" .. "- Weekly missions reset every <b>FRIDAY</b> at <b>3 PM PST</b>\n" .. ("\240\159\151\161\239\184\143\194\160<b>Hannah</b> <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__3.mcYellow) .. "\">(REWORK!)</font>\n") .. "Hannah\226\128\153s has been slightly reworked to embrace her main mechanic: execute.\n" .. "- Hannah\226\128\153s base execute threshold increased (20% HP \226\134\146 25% HP)\n" .. "- Hannah can now chain executes. The kill threshold increases by 6% HP per consecutive execute up to 3 (43% HP) Execute combo decays after 8s without executing anyone.\n" .. "- Hannah\226\128\153s max HP reduced (100 HP \226\134\146 90 HP)\n\n" .. "\240\159\134\147 Free Kits of The Week\n" .. ("\226\155\179 Conqueror <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__3.mcYellow) .. "\"><b>(FIRST TIME FREE!)</b></font>\n") .. "\240\159\143\185 Archer\n\240\159\148\168 Builder\n\n\240\159\151\186\194\160<b>New Maps</b>\n- Added Canopy Sanctuary (squads + duos)\n- Added Clock Tower (squads)\n- Added Firehouse (squads)\n\n\240\159\148\167 <b>Balance Changes</b>\n\240\159\148\180\194\160Builder Nerf: Reinforced blocks are no longer blast proof (they still gain a lot of blast resistance)\n\240\159\148\180\194\160Spirit Catcher Nerf: Spirit cost increased (35 iron \226\134\146 40 iron)\n\240\159\148\180\194\160Zephyr Nerf: Wind orbs decay faster (65s \226\134\146 55s)\n\240\159\148\180\194\160Metal Detector Nerf: Reduced resource gain by 15%\n\240\159\148\180\194\160Conqueror Nerf: Heal Banner\226\128\153s healing per second reduced (10% \226\134\146 8%)\n\240\159\148\180\194\160Ares Nerf: Spear cost increased (30 iron \226\134\146 40 iron)\n\240\159\159\162\194\160Barbarian Buff: Unlock the stone & iron sword slightly faster\n\240\159\159\162\194\160Dino Tamer Buff: Dino cost reduced (40 iron \226\134\146 32 iron)\n\240\159\159\162\194\160Baker Buff: Speed Pie duration increased (1.5m \226\134\146 2m)\n\240\159\159\162\194\160Merchant Marco Buff: Start the game with 10 iron\n\240\159\159\162\194\160Farmer Cletus Buff: Melons now grow 15% faster\n\240\159\159\162\194\160Melody Buff: Guitar price reduced (20 iron \226\134\146 16 iron)\n\240\159\159\162\194\160Luc\195\173a Buff: Increased Pi\195\177ata resources 15% at all stages\n\240\159\159\162\194\160Reaper Buff: Soul healing increased (18 \226\134\146 22)\n\n\240\159\147\139 <b>Other Changes</b>\n- Removed Tennis Racquet + Balls from the shop\n- Fixed shop purchases bypassing stack size limits\n- Fixed Barbarian kit rage meter not increasing", 
				image = {
					assetId = "rbxassetid://10571325854", 
					aspectRatio = 1, 
					height = 150
				}, 
				new = true, 
				pinned = false
			}, {
				title = "\226\154\160\239\184\143 Clans have been wiped! \226\154\160\239\184\143", 
				date = "3/07/2022", 
				body = "\240\159\155\161\239\184\143 <b>CLAN WIPE</b>\nClans have been wiped. Make sure to make your new clan.\n\n\226\154\160\239\184\143 <b>All clan leaders before the wipe will be able to create a clan for free.</b> \226\154\160\239\184\143\n\n<b>Other Changes</b>\n- VIP Gamepass owners are now able to create clans for free.\n- All clan creates will be free after the first purchase. (Clan leaders that have already purchased a clan will benefit from this automatically)\n- To compensate for lost progress we're enabling 2x daily coin limit & 2x clan coins for 3 days.\n- Clans will be able to earn more than the daily coin limit! All members will earn coins at 10% the rate after the clan reaches the daily coin limit.", 
				image = {
					assetId = "", 
					aspectRatio = 1, 
					height = 0
				}, 
				new = true, 
				pinned = false
			}, {
				title = "100 Player Bed Royale! + Lucky Block Update", 
				date = "1/7/2021", 
				body = "\240\159\166\134 <b>Battle Ducks!</b>\nBattle Duck Spawn Eggs are available in the Item Shop for 2 emeralds. Ducks patrol an area and attack detected intruders.\n\n\240\159\145\145 <b>Juggernaut TDM</b>\nA new limited time mode has hit the rotation this week! Two teams of 30 battle for the most kills in 10 minutes.\nJuggernaut Airdrops are deployed every 2 minutes. Obtaining a Juggernaut Airdrop transforms you into a powerful Juggernaut.\n\n\240\159\143\174 <b>Lunar Vulcan (Limited Time Skin!)</b>\nThe Lunar Vulcan skin is now available! This limited time skin also includes a themed turret and tablet!\n\n\240\159\166\139 <b>Aery Changes</b>\n- Slightly reduced damage scaling\n- Anti spawn killing: there is now a 30 second cooldown for gaining stacks against the same player\n\n\240\159\134\147 <b>Free Kits of the Week</b>\n\240\159\148\168 Builder\n\240\159\146\165 Davey\n\240\159\144\174 Lassy\n\n\240\159\143\151\239\184\143 <b>Custom Match</b>\n- Players search bar\n- Force set a player\226\128\153s team\n- Set a player\226\128\153s max health\n- You can now pick the team to change the team generator multiplier speed for.\n- PvP enabled toggle\n- Lock server toggle\n- Server max player limit\n- Bed breaking enabled toggle\n- The default value of Team Overflow toggle has been changed from true \226\134\146 false\n- Team switching enabled toggle\n- Item limits toggle. Remove the item cap for items like the balloon.\n- Disable/Enable all purchasable items button\n- Added new commands:\n   - /tp (username or displayname)\n   - /tpall\n   - /tpbed &lt;team_bed&gt;\n   - Earlier this week: /spawn (item name) [amount]\n\n\240\159\151\146\239\184\143 <b>Other Changes</b>\n\240\159\142\134 Removed firework arrows\n\226\154\161 Tesla Trap: reduced max traps (4 \226\134\146 2)\n\240\159\146\172 Reworked nametags to increase game clarity\n\240\159\142\166 You now briefly spectate the player that killed you after dying\n\240\159\146\187 Vulcan: improved turret mobile controls\n\240\159\142\129 Fixed sounds not working for the gift kill effect\n\240\159\140\160 Spirit Catcher: released a new visual rework\n\240\159\143\133 Rank icons are now displayed above your head in the Lobby\n", 
				image = {
					assetId = "rbxassetid://8480101402", 
					aspectRatio = 1, 
					height = 150
				}, 
				new = true, 
				pinned = false
			}, {
				title = "New Maps + Double XP!", 
				date = "10/15/2021", 
				body = "This week is a little light as we are down to one week until the big Season 2 update.\n\n<b>\240\159\142\137 Double XP  Enabled!</b>\nThis is the final week you can grind out Battle Pass levels. Once Season 2 starts all Season 1 Battle Pass kits will become unobtainable.\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n- Barbarian\n- Melody\n- Baker\n\n<b>\240\159\148\165 Pyro Changes</b>\n- You now keep embers upon death (buff)\n- Significantly reduced cost of upgrades (buff)\n- Buffed fire damage\n- Brittle proc now has 20% armor penetration (buff)\n\n<b>\240\159\144\166 Raven Changes</b>\n- Increased raven tick damage (4 -> 6)\n- Increased raven armor penetration (60% -> 70%)\n\n<b>\240\159\141\128 Lucky Block Changes</b>\n- Added Charge Shield\n\n<b>\240\159\151\186\239\184\143 New Maps</b>\n- Launch (squads)\n- Observatory (squads)\n- Plaza (doubles)\n\n<b>\240\159\151\146\239\184\143 Other Changes</b>\n- Reduced leather armor cost (60 iron -> 50 iron)\n- Disabled chat sound in the lobby\n- Improved first person projectile aiming\n- Anticheat improvements\n- Bug fixes", 
				image = {
					assetId = "rbxassetid://7745109855", 
					aspectRatio = 1.7777777777777777, 
					height = 150
				}, 
				new = false, 
				pinned = false
			}, {
				title = "Lucky Block Update!", 
				date = "10/08/2021", 
				body = "<b>\226\156\168 Lucky Block LTM</b>\n- This week we're hosting a new limited time mode called Lucky Block.\n- Find and break randomly placed Lucky Blocks for crazy (and sometimes dangerous) rewards.\n- Have fun exploring all the new items exclusive to this mode!\n\n<b>\240\159\153\140 Free Kits of the Week</b>\n- Farmer Cletus\n- Builder\n- Lassy\n\n<b>\240\159\155\161\239\184\143 Custom Match Commands</b>\n- /disableKit (kit)\n- /announce [message]\n- /toggleSpawn (entity) (value)\n\n<b>Other Changes</b>\n- Nerfed dodo bird jump height, run speed and spawn rate", 
				image = {
					assetId = "rbxassetid://7681599456", 
					aspectRatio = 1, 
					height = 150
				}, 
				new = false, 
				pinned = false
			} }, 
		newestKit = l__GameUpdateButtons__4.newestKit, 
		newestKitBG = l__GameUpdateButtons__4.newestKitBG
	});
	local u8 = l__CreateRoduxApp__5("GameUpdates", l__GameUpdatesCore__6, {}, {}, {
		Parent = p1
	});
	return function()
		u7.unmount(u8);
	end;
end;
