-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "rodux").src);
local l__BedwarsReducer__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local l__GameReducer__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local l__AppReducer__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "app-reducer").AppReducer;
local l__RelicType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-type").RelicType;
local l__StudioQueueType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").StudioQueueType;
local l__MatchState__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StoreProvider__9 = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).StoreProvider;
local l__RelicVotingInterface__10 = v1.import(script, script.Parent, "relic-voting-interface").RelicVotingInterface;
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-util").RELIC_VOTE_END_SECS_BEFORE_START;
return function(p1)
	local v2 = {};
	local v3 = 0;
	local v4 = false;
	while true do
		if v4 then
			v3 = v3 + 1;
		else
			v4 = true;
		end;
		if not (v3 < 50) then
			break;
		end;
		table.insert(v2, 205430552);	
	end;
	local u12 = u1.Store.new(u1.combineReducers({
		Bedwars = l__BedwarsReducer__2, 
		Game = l__GameReducer__3, 
		App = l__AppReducer__4
	}), {
		Bedwars = {
			relic = {
				voteState = { {
						relic = l__RelicType__5.GLITCHED_ENCHANTING, 
						voterUserIds = { 225721992, 205430552, 205430552, 205430552, 225721992, 205430552, 205430552, 205430552 }, 
						votes = 8
					}, {
						relic = l__RelicType__5.BLOOD_DEAL, 
						voterUserIds = {}, 
						votes = 0
					}, {
						relic = l__RelicType__5.IRON_WILL, 
						voterUserIds = v2, 
						votes = #v2
					} }, 
				selectedRelic = nil
			}
		}, 
		Game = {
			queueType = l__StudioQueueType__6, 
			customMatch = {
				joinCode = "EZGG", 
				hostUserId = 1
			}, 
			matchState = l__MatchState__7.PRE
		}, 
		App = {
			showHotbarPartyControls = false
		}
	});
	task.delay(1000, function()
		u12:dispatch({
			type = "BedwarsSetRelicWon", 
			winningRelic = l__RelicType__5.IRON_WILL
		});
	end);
	local u13 = u8.mount(u8.createElement(l__StoreProvider__9, {
		store = u12
	}, { u8.createElement(l__RelicVotingInterface__10, {
			AppId = "RelicVotingInterface", 
			VoteEndTime = os.time() + 1000 - u11
		}) }), p1);
	return function()
		u8.unmount(u13);
	end;
end;
