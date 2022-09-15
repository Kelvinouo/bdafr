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
local l__tabListLayout__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ContentProvider__5 = v2.ContentProvider;
local l__TabListRank__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-ranks.dto").TabListRank;
local l__getTablistRankMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-rank-meta").getTablistRankMeta;
local l__Players__8 = v2.Players;
local l__ClientStore__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "TabListController";
	p1.tabListOpen = false;
	p1.starCreatorGroupId = 4199740;
	p1.easyGamesGroupId = 5774246;
	p1.kitImageIds = {};
	p1.players = {};
	p1.playerRanks = {};
	function p1.openTablist()
		if p1.tabListFrame then
			p1.tabListFrame.Position = UDim2.fromScale(l__tabListLayout__2.openedPositionX, l__tabListLayout__2.closedPositionY);
			p1.tabListOpen = true;
		end;
	end;
	function p1.closeTablist()
		if p1.tabListFrame then
			p1.tabListFrame.Position = UDim2.fromScale(l__tabListLayout__2.closedPositionX, l__tabListLayout__2.closedPositionY);
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
			local v12, v13, v14 = ipairs(v7);
			while true do
				v12(v13, v14);
				if not v12 then
					break;
				end;
				v14 = v12;
				local v15 = v13[1];
				local l__players__16 = p1.players;
				l__players__16[v15] = p3;
				v11[v12] = l__players__16[v15];			
			end;
			return v11;
		end;
		local v17 = table.create(#p2);
		local v18, v19, v20 = ipairs(p2);
		while true do
			v18(v19, v20);
			if not v18 then
				break;
			end;
			v20 = v18;
			v17[v18] = v6(v19, v18 - 1, p2);		
		end;
		return p1.players;
	end;
	function p1.preLoadKitAvatars(p4)
		v1.Promise.defer(function()
			local v21 = u3.values(p1.kitImageIds);
			local v22 = table.create(#v21);
			local v23, v24, v25 = ipairs(v21);
			while true do
				v23(v24, v25);
				if not v23 then
					break;
				end;
				v25 = v23;
				v22[v23] = u4("ImageLabel", {
					Image = v24
				});			
			end;
			l__ContentProvider__5:PreloadAsync(v22);
		end);
	end;
	function p1.preLoadRankIcons(p5)
		v1.Promise.defer(function()
			local v26 = u3.values(l__TabListRank__6);
			local function v27(p6)
				local v28 = l__getTablistRankMeta__7(p6);
				local l__iconAssetId__29 = v28.iconAssetId;
				if l__iconAssetId__29 == "" or not l__iconAssetId__29 then
					return u4("ImageLabel", {});
				end;
				return u4("ImageLabel", {
					Image = v28.iconAssetId
				});
			end;
			local v30 = table.create(#v26);
			local v31, v32, v33 = ipairs(v26);
			while true do
				v31(v32, v33);
				if not v31 then
					break;
				end;
				v33 = v31;
				v30[v31] = v27(v32, v31 - 1, v26);			
			end;
			l__ContentProvider__5:PreloadAsync(v30);
		end);
	end;
	function p1.assignTabListRanks(p7)
		if #u3.keys(p1.players) == 0 then
			return nil;
		end;
		v1.Promise.defer(v1.async(function(p8, p9)
			local function v34(p10)
				local v35 = {};
				local v36 = #v35;
				for v37, v38 in pairs(p10.members) do
					v36 = v36 + 1;
					v35[v36] = { v37, v38 };
				end;
				local function v39(p11)
					local v40 = p11[1];
					if p1.playerRanks[v40] then
						return v1.Promise.new(function()

						end);
					end;
					return p1.isGameDeveloper((l__Players__8:GetPlayerByUserId(v40))):andThen(function(p12)
						if p12 then
							p1.playerRanks[v40] = l__TabListRank__6.DEVELOPER;
						end;
					end);
				end;
				local v41 = table.create(#v35);
				local v42, v43, v44 = ipairs(v35);
				while true do
					v42(v43, v44);
					if not v42 then
						break;
					end;
					v44 = v42;
					v41[v42] = v39(v43, v42 - 1, v35);				
				end;
				return v1.Promise.all(v41);
			end;
			local v45 = table.create(#p7);
			local v46, v47, v48 = ipairs(p7);
			while true do
				v46(v47, v48);
				if not v46 then
					break;
				end;
				v48 = v46;
				v45[v46] = v34(v47, v46 - 1, p7);			
			end;
			v1.Promise.all(v45):andThen(function()
				l__ClientStore__9:dispatch({
					type = "TabListSetRanksBulk", 
					ranks = p1.playerRanks
				});
			end);
		end));
	end;
	function p1.isStarCreator(p13)
		return v1.Promise.defer(function(p14)
			local v49 = p13;
			if v49 ~= nil then
				v49 = v49:IsInGroup(p1.starCreatorGroupId);
			end;
			if v49 then
				p14(true);
			end;
			p14(false);
		end);
	end;
	function p1.isGameDeveloper(p15)
		local u10 = l__getTablistRankMeta__7(l__TabListRank__6.DEVELOPER);
		return v1.Promise.defer(function(p16)
			local v50 = p15;
			if v50 ~= nil then
				v50 = v50:IsInGroup(p1.easyGamesGroupId);
			end;
			if v50 then
				local v51 = u10.rankInGroup;
				if v51 ~= nil then
					v51 = table.find(v51, (p15:GetRankInGroup(p1.easyGamesGroupId))) ~= nil;
				end;
				if v51 then
					p16(true);
				end;
			end;
			p16(false);
		end);
	end;
end;
local l__PlaceUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__default__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p17)
	if l__PlaceUtil__11.isLobbyServer() then
		return nil;
	end;
	l__default__12.Client:WaitFor("RemoteName"):expect():Connect(function(p18)
		l__ClientStore__9:dispatch({
			type = "TabListSetTeams", 
			teams = p18.teams
		});
		l__ClientStore__9:dispatch({
			type = "TabListSetPlayersTeamBulk", 
			playersTeam = p17.setupPlayerCache(p18.teams)
		});
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	TabListController = u1
};
