-- Script Hash: 0b9523e85ae174647eb2ba82bb0d90f0b33faaf68153632f28cd516f7e8eec25fbe867c213244e4308f44969167b5765
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "TabListController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__KnitController__3;
local l__tabListLayout__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ContentProvider__6 = v2.ContentProvider;
local l__TabListRank__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-ranks.dto").TabListRank;
local l__getTablistRankMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-rank-meta").getTablistRankMeta;
local l__Players__9 = v2.Players;
local l__ClientStore__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "TabListController";
	p1.tabListOpen = false;
	p1.starCreatorGroupId = 4199740;
	p1.easyGamesGroupId = 5774246;
	p1.kitImageIds = {};
	p1.players = {};
	p1.playerRanks = {};
	function p1.openTablist()
		if p1.tabListFrame then
			p1.tabListFrame.Position = UDim2.fromScale(l__tabListLayout__3.openedPositionX, l__tabListLayout__3.closedPositionY);
			p1.tabListOpen = true;
		end;
	end;
	function p1.closeTablist()
		if p1.tabListFrame then
			p1.tabListFrame.Position = UDim2.fromScale(l__tabListLayout__3.closedPositionX, l__tabListLayout__3.closedPositionY);
			p1.tabListOpen = false;
		end;
	end;
	function p1.toggleTablist()
		if p1.tabListOpen and p1.tabListFrame then
			p1.openTablist();
		elseif not p1.tabListOpen and p1.tabListFrame then
			p1.closeTablist();
		end;
		p1.tabListOpen = not p1.tabListOpen;
	end;
	function p1.setupPlayerCache(p2)
		local function v6(p3)
			local v7 = {};
			local v8 = #v7;
			for v9, v10 in pairs(p3.members) do
				v8 = v8 + 1;
				v7[v8] = { v9, v10 };
			end;
			local function v11(p4)
				local v12 = p4[1];
				local l__players__13 = p1.players;
				l__players__13[v12] = p3;
				return l__players__13[v12];
			end;
			local v14 = table.create(#v7);
			for v15, v16 in ipairs(v7) do
				v14[v15] = v11(v16, v15 - 1, v7);
			end;
			return v14;
		end;
		local v17 = table.create(#p2);
		for v18, v19 in ipairs(p2) do
			v17[v18] = v6(v19, v18 - 1, p2);
		end;
		return p1.players;
	end;
	function p1.preLoadKitAvatars(p5)
		v1.Promise.defer(function()
			local v20 = u4.values(p1.kitImageIds);
			local function v21(p6)
				return u5("ImageLabel", {
					Image = p6
				});
			end;
			local v22 = table.create(#v20);
			for v23, v24 in ipairs(v20) do
				v22[v23] = v21(v24, v23 - 1, v20);
			end;
			l__ContentProvider__6:PreloadAsync(v22);
		end);
	end;
	function p1.preLoadRankIcons(p7)
		v1.Promise.defer(function()
			local v25 = u4.values(l__TabListRank__7);
			local function v26(p8)
				local v27 = l__getTablistRankMeta__8(p8);
				local l__iconAssetId__28 = v27.iconAssetId;
				if l__iconAssetId__28 == "" or not l__iconAssetId__28 then
					return u5("ImageLabel", {});
				end;
				return u5("ImageLabel", {
					Image = v27.iconAssetId
				});
			end;
			local v29 = table.create(#v25);
			for v30, v31 in ipairs(v25) do
				v29[v30] = v26(v31, v30 - 1, v25);
			end;
			l__ContentProvider__6:PreloadAsync(v29);
		end);
	end;
	function p1.assignTabListRanks(p9)
		if #u4.keys(p1.players) == 0 then
			return nil;
		end;
		v1.Promise.defer(v1.async(function(p10, p11)
			local function v32(p12)
				local v33 = {};
				local v34 = #v33;
				for v35, v36 in pairs(p12.members) do
					v34 = v34 + 1;
					v33[v34] = { v35, v36 };
				end;
				local function v37(p13)
					local v38 = p13[1];
					if p1.playerRanks[v38] then
						return v1.Promise.new(function()

						end);
					end;
					return p1.isGameDeveloper((l__Players__9:GetPlayerByUserId(v38))):andThen(function(p14)
						if p14 then
							p1.playerRanks[v38] = l__TabListRank__7.DEVELOPER;
						end;
					end);
				end;
				local v39 = table.create(#v33);
				for v40, v41 in ipairs(v33) do
					v39[v40] = v37(v41, v40 - 1, v33);
				end;
				return v1.Promise.all(v39);
			end;
			local v42 = table.create(#p9);
			for v43, v44 in ipairs(p9) do
				v42[v43] = v32(v44, v43 - 1, p9);
			end;
			v1.Promise.all(v42):andThen(function()
				l__ClientStore__10:dispatch({
					type = "TabListSetRanksBulk", 
					ranks = p1.playerRanks
				});
			end);
		end));
	end;
	function p1.isStarCreator(p15)
		return v1.Promise.defer(function(p16)
			local v45 = p15;
			if v45 ~= nil then
				v45 = v45:IsInGroup(p1.starCreatorGroupId);
			end;
			if v45 then
				p16(true);
			end;
			p16(false);
		end);
	end;
	function p1.isGameDeveloper(p17)
		local u11 = l__getTablistRankMeta__8(l__TabListRank__7.DEVELOPER);
		return v1.Promise.defer(function(p18)
			local v46 = p17;
			if v46 ~= nil then
				v46 = v46:IsInGroup(p1.easyGamesGroupId);
			end;
			if v46 then
				local v47 = u11.rankInGroup;
				if v47 ~= nil then
					v47 = table.find(v47, (p17:GetRankInGroup(p1.easyGamesGroupId))) ~= nil;
				end;
				if v47 then
					p18(true);
				end;
			end;
			p18(false);
		end);
	end;
end;
local l__PlaceUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__default__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p19)
	if l__PlaceUtil__12.isLobbyServer() then
		return nil;
	end;
	l__default__13.Client:WaitFor("TeamsUpdateEvent"):expect():Connect(function(p20)
		l__ClientStore__10:dispatch({
			type = "TabListSetTeams", 
			teams = p20.teams
		});
		l__ClientStore__10:dispatch({
			type = "TabListSetPlayersTeamBulk", 
			playersTeam = p19.setupPlayerCache(p20.teams)
		});
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	TabListController = u2
};
return u1;
