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
			local v11 = table.create(#v7);
			for v12, v13 in ipairs(v7) do
				local v14 = v13[1];
				local l__players__15 = p1.players;
				l__players__15[v14] = p3;
				v11[v12] = l__players__15[v14];
			end;
			return v11;
		end;
		local v16 = table.create(#p2);
		for v17, v18 in ipairs(p2) do
			v16[v17] = v6(v18, v17 - 1, p2);
		end;
		return p1.players;
	end;
	function p1.preLoadKitAvatars(p4)
		v1.Promise.defer(function()
			local v19 = u4.values(p1.kitImageIds);
			local v20 = table.create(#v19);
			for v21, v22 in ipairs(v19) do
				v20[v21] = u5("ImageLabel", {
					Image = v22
				});
			end;
			l__ContentProvider__6:PreloadAsync(v20);
		end);
	end;
	function p1.preLoadRankIcons(p5)
		v1.Promise.defer(function()
			local v23 = u4.values(l__TabListRank__7);
			local function v24(p6)
				local v25 = l__getTablistRankMeta__8(p6);
				local l__iconAssetId__26 = v25.iconAssetId;
				if l__iconAssetId__26 == "" or not l__iconAssetId__26 then
					return u5("ImageLabel", {});
				end;
				return u5("ImageLabel", {
					Image = v25.iconAssetId
				});
			end;
			local v27 = table.create(#v23);
			for v28, v29 in ipairs(v23) do
				v27[v28] = v24(v29, v28 - 1, v23);
			end;
			l__ContentProvider__6:PreloadAsync(v27);
		end);
	end;
	function p1.assignTabListRanks(p7)
		if #u4.keys(p1.players) == 0 then
			return nil;
		end;
		v1.Promise.defer(v1.async(function(p8, p9)
			local function v30(p10)
				local v31 = {};
				local v32 = #v31;
				for v33, v34 in pairs(p10.members) do
					v32 = v32 + 1;
					v31[v32] = { v33, v34 };
				end;
				local function v35(p11)
					local v36 = p11[1];
					if p1.playerRanks[v36] then
						return v1.Promise.new(function()

						end);
					end;
					return p1.isGameDeveloper((l__Players__9:GetPlayerByUserId(v36))):andThen(function(p12)
						if p12 then
							p1.playerRanks[v36] = l__TabListRank__7.DEVELOPER;
						end;
					end);
				end;
				local v37 = table.create(#v31);
				for v38, v39 in ipairs(v31) do
					v37[v38] = v35(v39, v38 - 1, v31);
				end;
				return v1.Promise.all(v37);
			end;
			local v40 = table.create(#p7);
			for v41, v42 in ipairs(p7) do
				v40[v41] = v30(v42, v41 - 1, p7);
			end;
			v1.Promise.all(v40):andThen(function()
				l__ClientStore__10:dispatch({
					type = "TabListSetRanksBulk", 
					ranks = p1.playerRanks
				});
			end);
		end));
	end;
	function p1.isStarCreator(p13)
		return v1.Promise.defer(function(p14)
			local v43 = p13;
			if v43 ~= nil then
				v43 = v43:IsInGroup(p1.starCreatorGroupId);
			end;
			if v43 then
				p14(true);
			end;
			p14(false);
		end);
	end;
	function p1.isGameDeveloper(p15)
		local u11 = l__getTablistRankMeta__8(l__TabListRank__7.DEVELOPER);
		return v1.Promise.defer(function(p16)
			local v44 = p15;
			if v44 ~= nil then
				v44 = v44:IsInGroup(p1.easyGamesGroupId);
			end;
			if v44 then
				local v45 = u11.rankInGroup;
				if v45 ~= nil then
					v45 = table.find(v45, (p15:GetRankInGroup(p1.easyGamesGroupId))) ~= nil;
				end;
				if v45 then
					p16(true);
				end;
			end;
			p16(false);
		end);
	end;
end;
local l__PlaceUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__default__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p17)
	if l__PlaceUtil__12.isLobbyServer() then
		return nil;
	end;
	l__default__13.Client:WaitFor("RemoteName"):expect():Connect(function(p18)
		l__ClientStore__10:dispatch({
			type = "TabListSetTeams", 
			teams = p18.teams
		});
		l__ClientStore__10:dispatch({
			type = "TabListSetPlayersTeamBulk", 
			playersTeam = p17.setupPlayerCache(p18.teams)
		});
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	TabListController = u2
};
return u1;
