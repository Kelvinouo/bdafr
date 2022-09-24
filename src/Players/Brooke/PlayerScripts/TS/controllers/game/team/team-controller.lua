-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "TeamController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "TeamController";
	p1.teamNames = {};
	p1.teamDropdown = {
		map = {}
	};
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.KnitStart(p2)
	l__default__2.Client:Get("RemoteName"):Connect(function(p3)
		l__ClientStore__3:dispatch({
			type = "GameSetTeams", 
			teams = p3.teams
		});
		p2.teams = p3.teams;
	end);
	l__default__2.Client:Get("RemoteName"):SendToServer();
end;
function u1.getPlayerTeam(p4, p5)
	if not p4.teams then
		return nil;
	end;
	local v5, v6, v7 = ipairs(p4.teams);
	while true do
		v5(v6, v7);
		if not v5 then
			break;
		end;
		v7 = v5;
		if v6.members[tostring(p5.UserId)] ~= nil == true then
			return v6;
		end;	
	end;
	return nil;
end;
function u1.getPlayerTeamNameMap(p6)
	local v8 = nil;
	if not p6.teams then
		return nil;
	end;
	local l__teams__9 = p6.teams;
	local function v10(p7, p8)
		for v11, v12 in pairs(p8.members) do
			p7[v12.userId] = p8.name;
		end;
		return p7;
	end;
	v8 = {};
	for v13 = 1, #l__teams__9 do
		v8 = v10(v8, l__teams__9[v13], v13 - 1, l__teams__9);
	end;
	return local v14;
end;
function u1.getTeamNames(p9, p10)
	if #p9.teamNames ~= 0 then
		return p9.teamNames;
	end;
	if not p9.teams then
		return nil;
	end;
	local l__teams__15 = p9.teams;
	local v16 = table.create(#l__teams__15);
	local v17, v18, v19 = ipairs(l__teams__15);
	while true do
		v17(v18, v19);
		if not v17 then
			break;
		end;
		v19 = v17;
		v16[v17] = v18.name;	
	end;
	table.sort(v16);
	p9.teamNames = v16;
	if p10 then
		table.insert(p9.teamNames, 1, "Spectator");
	end;
	return p9.teamNames;
end;
local l__ColorUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function u1.getTeamDropdown(p11, p12)
	local v20 = nil;
	if p11.teamDropdown.dropDownItems then
		return p11.teamDropdown;
	end;
	if not p11.teams then
		return nil;
	end;
	local l__teams__21 = p11.teams;
	v20 = {};
	for v22 = 1, #l__teams__21 do
		local v23 = l__teams__21[v22];
		v20[v23.name] = {
			text = "<font color=\"" .. (l__ColorUtil__4.richTextColor(v23.color) .. "\">") .. v23.name .. "</font>", 
			value = v23.name
		};
		v20 = v20;
	end;
	p11.teamDropdown.map = local v24;
	local v25 = {};
	local v26 = #v25;
	for v27, v28 in pairs(p11.teamDropdown.map) do
		v26 = v26 + 1;
		v25[v26] = { v27, v28 };
	end;
	local v29 = u5.values(v25);
	local v30 = table.create(#v29);
	local v31, v32, v33 = ipairs(v29);
	while true do
		v31(v32, v33);
		if not v31 then
			break;
		end;
		v33 = v31;
		v30[v31] = v32[2];	
	end;
	table.sort(v30, function(p13, p14)
		return p13.value < p14.value;
	end);
	p11.teamDropdown.dropDownItems = v30;
	if p12 then
		p11.teamDropdown.map.Spectator = {
			text = "Spectator", 
			value = "Spectator"
		};
		table.insert(p11.teamDropdown.dropDownItems, 1, {
			text = "Spectator", 
			value = "Spectator"
		});
	end;
	return p11.teamDropdown;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	TeamController = u1
};
