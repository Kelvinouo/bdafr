-- Script Hash: 966763382d1a0cad3d1be165fd80378c678da6645250a0fbcc86b5acef6dc5ff6a8b00e7337c0e0ed991909f2b036186
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
local u2 = l__KnitController__3;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "BedwarsController";
	p1.players = {};
	p1.teams = {};
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__getItemMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ContentProvider__7 = v2.ContentProvider;
local l__ClientStore__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__10 = v2.Players;
function u1.KnitStart(p2)
	v1.Promise.defer(function()
		local v6 = { l__ItemType__3.WOOL_BLUE, l__ItemType__3.WOOL_RED, l__ItemType__3.WOOL_GREEN, l__ItemType__3.WOOL_YELLOW, l__ItemType__3.WOOD_PLANK_OAK, l__ItemType__3.STONE_BRICK, l__ItemType__3.TNT };
		local u11 = {};
		local function v7(p3)
			local v8 = l__getItemMeta__4(p3);
			table.insert(u11, (l__ItemUtil__5.createItemInstance(p3)));
			table.insert(u11, (u6("ImageLabel", {
				Image = v8.image
			})));
		end;
		for v9, v10 in ipairs(v6) do
			v7(v10, v9 - 1, v6);
		end;
		l__ContentProvider__7:PreloadAsync(u11);
	end);
	l__ClientStore__8.changed:connect(function(p4, p5)
		if p4.Game.teams ~= p5.Game.teams then
			local v11, v12, v13 = ipairs(l__ClientStore__8:getState().Game.teams);
			while true do
				local v14, v15 = v11(v12, v13);
				if not v14 then
					break;
				end;
				if not p2.teams[v15.id] then
					l__ClientStore__8:dispatch({
						type = "BedwarsSetBedAlive", 
						teamId = v15.id, 
						alive = true
					});
					local v16 = p2.teams[v15.id];
				end;
				local l__members__17 = v15.members;
				local function v18(p6, p7)
					if not p2.players[p7] then
						l__ClientStore__8:dispatch({
							type = "BedwarsSetFinalDeaths", 
							userId = tonumber(p7), 
							dead = false
						});
						p2.players[p7] = p6;
					end;
				end;
				for v19, v20 in pairs(l__members__17) do
					v18(v20, v19, l__members__17);
				end;			
			end;
		end;
	end);
	local u12 = nil;
	l__default__9.Client:WaitFor("RemoteName"):andThen(function(p8)
		p8:Connect(function(p9)
			v1.Promise.defer(function()
				local v21 = l__Players__10:GetPlayerFromCharacter(p9.fromEntity);
				if v21 then
					l__ClientStore__8:dispatch({
						type = "BedwarsIncrementKills", 
						userId = v21.UserId
					});
				end;
				u12((l__Players__10:GetPlayerFromCharacter(p9.entityInstance)));
			end);
		end);
	end);
	l__default__9.Client:WaitFor("RemoteName"):expect():Connect(function(p10)
		l__ClientStore__8:dispatch({
			type = "BedwarsSetKits", 
			userId = p10.userId, 
			kit = p10.kit
		});
		l__ClientStore__8:dispatch({
			type = "BedwarsSetOtherUsingKitSkin", 
			userId = p10.userId, 
			usingKitSkin = p10.usingSkin
		});
	end);
	l__default__9.Client:WaitFor("RemoteName"):andThen(function(p11)
		for v22, v23 in pairs(p11:CallServer()) do
			l__ClientStore__8:dispatch({
				type = "BedwarsSetKits", 
				userId = tonumber(v22), 
				kit = v23.kit
			});
			l__ClientStore__8:dispatch({
				type = "BedwarsSetOtherUsingKitSkin", 
				userId = tonumber(v22), 
				usingKitSkin = v23.usingSkin
			});
		end;
	end);
	u12 = function(p12)
		if not p12 then
			return nil;
		end;
		local l__team__24 = l__ClientStore__8:getState().TabList.players[p12.UserId].team;
		if l__team__24 and not p2:getTeamBed(l__team__24.id) then
			l__ClientStore__8:dispatch({
				type = "BedwarsSetFinalDeaths", 
				userId = p12.UserId, 
				dead = true
			});
		end;
	end;
	l__default__9.Client:WaitFor("RemoteName"):andThen(function(p13)
		p13:Connect(function(p14)
			l__ClientStore__8:dispatch({
				type = "BedwarsSetBedAlive", 
				teamId = p14.brokenBedTeam.id, 
				alive = false
			});
			local v25 = {
				type = "BedwarsSetBedBreaks"
			};
			local v26 = p14.player;
			if v26 ~= nil then
				v26 = v26.UserId;
			end;
			v25.userId = v26;
			l__ClientStore__8:dispatch(v25);
		end);
	end);
	l__default__9.Client:WaitFor("RemoteName"):andThen(function(p15)
		p15:Connect(function(p16)
			l__ClientStore__8:dispatch({
				type = "BedwarsSetBedAliveSuddenDeath"
			});
		end);
	end);
end;
local l__CollectionService__13 = v2.CollectionService;
function u1.getTeamBed(p17, p18)
	local v27 = l__CollectionService__13:GetTagged("bed:" .. p18);
	if v27 ~= nil then
		v27 = v27[1];
	end;
	return v27;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	BedwarsController = u2
};
return u1;
