-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__GameUpdateButtons__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "update", "game-update-meta").GameUpdateButtons;
local l__CreateRoduxApp__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__GameUpdatesCore__4 = v1.import(script, script.Parent, "game-updates-core").GameUpdatesCore;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	l__ClientStore__1:dispatch({
		type = "GameUpdatesSetAll", 
		updates = { {
				updateLogId = 24, 
				visible = true, 
				title = "Luc\195\173a Kit + Void Realm Collapsed", 
				date = "6/24/2022", 
				body = "\240\159\141\172\194\160<b>Luc\195\173a (NEW BP kit!)</b>\nLuc\195\173a is the new Lv. 5 premium Battlepass kit! Use the candy you get from damaging players to fill up your pi\195\177ata. When you're ready, smash it for lots of loot!\n\n\240\159\155\169\194\160<b>Battle Royale (NEW Easy.gg game!)</b>\nBattle Royale releases tomorrow, Saturday at 9 AM PST! Join from the BedWars lobby!\n\n\240\159\140\145 <b>Void Realm Collapsed</b>\nAll portals to the Void are closed for now. We may reopen the Void in the future with new items to build.\n\n\240\159\165\149\194\160<b>Carrot Cannon (ITEM!)</b>\nThe Carrot Cannon is back in the main game, but this time you can get it straight from the shopkeeper! Fire a barrage of carrots at your opponent\226\128\153s base for huge destruction!\n\n\240\159\155\161\239\184\143 <b>Moderation Improvements</b>\nWe\226\128\153ve been improving our moderation tools to find and ban cheaters in your matches faster. Over the next week, you should see fewer cheaters in your games, especially in ranked. We will continue to improve moderation as we invest more resources into our anti-cheat and tools.\n\n<b>\240\159\143\134 Ranked Queue Changes</b>\nUnlocking ranked through paid access has been removed, but players who already bought paid access will still have access.\nNew Ranked Restriction: 100 wins and Bed Wars account age of at least 7 days old\n\n\240\159\134\147 <b>Free Kits of the Week</b>\n\240\159\167\145\226\128\141\240\159\140\190 Farmer Cletus\n\240\159\148\168 Builder\n\240\159\146\165 Davey\n\n\226\154\153\239\184\143\194\160<b>Other Changes</b>\n\240\159\148\171\194\160Grappling Gun has been vaulted\n\240\159\146\172\194\160Added tooltips to items\n\240\159\147\148\194\160The action bar will now display your in-hand item\226\128\153s name\n\240\159\155\161\194\160The kit shop UI now includes kit class icons\n\226\154\161 Tesla trap damage nerf: 6 \226\134\146 4\n\226\154\161 Fixed inf tesla bypass from Void Portal\n\240\159\147\161 Fixed a dupe glitch with chests", 
				image = {
					assetId = "rbxassetid://10014214670", 
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
		newestKit = l__GameUpdateButtons__2.newestKit, 
		newestKitBG = l__GameUpdateButtons__2.newestKitBG
	});
	local u6 = l__CreateRoduxApp__3("GameUpdates", l__GameUpdatesCore__4, {}, {}, {
		Parent = p1
	});
	return function()
		u5.unmount(u6);
	end;
end;
