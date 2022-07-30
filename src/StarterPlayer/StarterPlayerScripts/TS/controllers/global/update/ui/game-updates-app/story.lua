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
				title = "Luc\195\173a Kit + Void Realm Collapsed", 
				date = "6/24/2022", 
				body = "\240\159\151\161\239\184\143 <b>Spirit Assassin <font color=\"" .. (l__ColorUtil__2.richTextColor(l__Theme__3.mcYellow) .. "\">[NEW KIT]</font></b>\n") .. "Damage enemies to attract nearby spirits. Consume spirits to instantly teleport and gain an attack buff for a short duration.\n\n" .. ("<b>\240\159\142\190 Tennis Racket <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__3.mcYellow) .. "\">[NEW ITEM]</font></b>\n") .. "Smack explosive tennis balls at your enemies. Now available in all queues for 2 emeralds.\n\n" .. "<b>\226\154\153\239\184\143\240\159\151\186\239\184\143 Map Saves</b>\n" .. "\240\159\147\145 Support for updating map save files while keeping the same map join code! An update button now shows up below Map Save cards in the host panel.\n" .. "\240\159\145\165 Support for changing team spawn locations `/setteamspawn &lt;teamName&gt;`\n" .. "\240\159\146\142 Create & manage generators `/gen help`\n" .. "\240\159\155\146 Create & manage shops with `/shop help`\n" .. "\240\159\154\132 Improved speed of saving maps with lots of \226\128\156Default\226\128\157 map blocks\n" .. "\240\159\145\183\226\128\141\226\153\130\239\184\143 Fixed the rotation of shop npcs on saved maps\n\n" .. ("\240\159\150\138\239\184\143 <b>Creative Mode</b> <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__3.mcGreen) .. "\"><b>[NEW FEATURE]</b></font>\n") .. "This is the mode for map builders! Creative mode is exclusive to custom matches and can be set by hosts with the following commands\n" .. "- `/gm 1 &lt;playerName | @all | @team:teamName&gt;`\n" .. "- `/gm 1` to apply the Creative to yourself.\n" .. "- Game modes: (0 or \226\128\156pvp\226\128\157) & (1 or \226\128\156creative\226\128\157)\n\n" .. "Creative mode also comes with the following perks\n" .. "\240\159\142\146 Creative Inventory. Open your inventory regularly to access Creative Inventory.\n" .. "\240\159\148\168 Instantly break blocks with any tool\n" .. "\240\159\147\136 Placing blocks don\226\128\153t reduce block count\n" .. "\240\159\170\147 Access to easy edit wand\n\n" .. ("\240\159\170\147 <b>Easy Edit</b> <font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__3.mcGreen) .. "\"><b>[NEW FEATURE]</b></font> \n") .. "\240\159\150\138\239\184\143 Easy Edit Wand: Speeds up selecting block regions. This is activated with the <b>Wooden Axe</b> while in creative mode\n" .. "- Left Click a block to set Position 1\n" .. "- Right Click a block to set Position 2\n" .. "\240\159\155\176\239\184\143 Easy Edit Commands: Start with prefix `//`\n" .. "- `//help, //pos1, //pos2, //set &lt;blockType&gt;, //cut`\n" .. "- `//undo & //redo`\n\n" .. "\240\159\134\147\194\160<b>Free Kits of the Week</b>\n" .. ("\240\159\141\170 Gingerbread Man <b><font color=\"" .. l__ColorUtil__2.richTextColor(l__Theme__3.mcAqua) .. "\">(FIRST TIME FREE!)</font></b>\n") .. "\240\159\165\167 Baker\n\240\159\155\161\239\184\143 Shielder", 
				image = {
					assetId = "rbxassetid://10407168596", 
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
