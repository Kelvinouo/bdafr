-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BedwarsController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "BedwarsController";
	p1.players = {};
	p1.teams = {};
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ContentProvider__6 = v2.ContentProvider;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__default__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__9 = v2.Players;
function u1.KnitStart(p2)
	v1.Promise.defer(function()
		local v6 = { l__ItemType__2.WOOL_BLUE, l__ItemType__2.WOOL_RED, l__ItemType__2.WOOL_GREEN, l__ItemType__2.WOOL_YELLOW, l__ItemType__2.WOOD_PLANK_OAK, l__ItemType__2.STONE_BRICK, l__ItemType__2.TNT };
		local u10 = {};
		local function v7(p3)
			local v8 = l__getItemMeta__3(p3);
			table.insert(u10, (l__ItemUtil__4.createItemInstance(p3)));
			table.insert(u10, (u5("ImageLabel", {
				Image = v8.image
			})));
		end;
		local v9, v10, v11 = ipairs(v6);
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			v11 = v9;
			v7(v10, v9 - 1, v6);		
		end;
		l__ContentProvider__6:PreloadAsync(u10);
	end);
	l__ClientStore__7.changed:connect(function(p4, p5)
		if p4.Game.teams ~= p5.Game.teams then
			local v12, v13, v14 = ipairs(l__ClientStore__7:getState().Game.teams);
			while true do
				v12(v13, v14);
				if not v12 then
					break;
				end;
				if not p2.teams[v13.id] then
					l__ClientStore__7:dispatch({
						type = "BedwarsSetBedAlive", 
						teamId = v13.id, 
						alive = true
					});
					local v15 = p2.teams[v13.id];
				end;
				local l__members__16 = v13.members;
				local function v17(p6, p7)
					if not p2.players[p7] then
						l__ClientStore__7:dispatch({
							type = "BedwarsSetFinalDeaths", 
							userId = tonumber(p7), 
							dead = false
						});
						p2.players[p7] = p6;
					end;
				end;
				for v18, v19 in pairs(l__members__16) do
					v17(v19, v18, l__members__16);
				end;			
			end;
		end;
	end);
	local u11 = nil;
	l__default__8.Client:WaitFor("RemoteName"):andThen(function(p8)
		p8:Connect(function(p9)
			v1.Promise.defer(function()
				local v20 = l__Players__9:GetPlayerFromCharacter(p9.fromEntity);
				if v20 then
					l__ClientStore__7:dispatch({
						type = "BedwarsIncrementKills", 
						userId = v20.UserId
					});
				end;
				u11((l__Players__9:GetPlayerFromCharacter(p9.entityInstance)));
			end);
		end);
	end);
	l__default__8.Client:WaitFor("RemoteName"):expect():Connect(function(p10)
		l__ClientStore__7:dispatch({
			type = "BedwarsSetKits", 
			userId = p10.userId, 
			kit = p10.kit
		});
		l__ClientStore__7:dispatch({
			type = "BedwarsSetOtherUsingKitSkin", 
			userId = p10.userId, 
			usingKitSkin = p10.usingSkin
		});
	end);
	l__default__8.Client:WaitFor("RemoteName"):andThen(function(p11)
		for v21, v22 in pairs(p11:CallServer()) do
			l__ClientStore__7:dispatch({
				type = "BedwarsSetKits", 
				userId = tonumber(v21), 
				kit = v22.kit
			});
			l__ClientStore__7:dispatch({
				type = "BedwarsSetOtherUsingKitSkin", 
				userId = tonumber(v21), 
				usingKitSkin = v22.usingSkin
			});
		end;
	end);
	u11 = function(p12)
		if not p12 then
			return nil;
		end;
		local l__team__23 = l__ClientStore__7:getState().TabList.players[p12.UserId].team;
		if l__team__23 and not p2:getTeamBed(l__team__23.id) then
			l__ClientStore__7:dispatch({
				type = "BedwarsSetFinalDeaths", 
				userId = p12.UserId, 
				dead = true
			});
		end;
	end;
	l__default__8.Client:WaitFor("RemoteName"):andThen(function(p13)
		p13:Connect(function(p14)
			l__ClientStore__7:dispatch({
				type = "BedwarsSetBedAlive", 
				teamId = p14.brokenBedTeam.id, 
				alive = false
			});
			local v24 = {
				type = "BedwarsSetBedBreaks"
			};
			local v25 = p14.player;
			if v25 ~= nil then
				v25 = v25.UserId;
			end;
			v24.userId = v25;
			l__ClientStore__7:dispatch(v24);
		end);
	end);
	l__default__8.Client:WaitFor("RemoteName"):andThen(function(p15)
		p15:Connect(function(p16)
			l__ClientStore__7:dispatch({
				type = "BedwarsSetBedAliveSuddenDeath"
			});
		end);
	end);
end;
local l__CollectionService__12 = v2.CollectionService;
function u1.getTeamBed(p17, p18)
	local v26 = l__CollectionService__12:GetTagged("bed:" .. p18);
	if v26 ~= nil then
		v26 = v26[1];
	end;
	return v26;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	BedwarsController = u1
};
