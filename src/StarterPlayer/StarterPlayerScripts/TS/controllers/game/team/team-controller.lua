
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
local u2 = l__KnitController__2;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "TeamController";
	p1.teamNames = {};
	p1.teamDropdown = {
		map = {}
	};
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.KnitStart(p2)
	l__default__3.Client:Get("RemoteName"):Connect(function(p3)
		l__ClientStore__4:dispatch({
			type = "GameSetTeams", 
			teams = p3.teams
		});
		p2.teams = p3.teams;
	end);
	l__default__3.Client:Get("RemoteName"):SendToServer();
end;
function u1.getPlayerTeamMap(p4)
	local v5 = nil;
	if not p4.teams then
		return nil;
	end;
	local l__teams__6 = p4.teams;
	v5 = {};
	local function v7(p5, p6)
		local l__members__8 = p6.members;
		local function v9(p7)
			p5[p7.userId] = p6.name;
			return p5;
		end;
		for v10, v11 in pairs(l__members__8) do
			v9(v11, v10, l__members__8);
		end;
		return p5;
	end;
	for v12 = 1, #l__teams__6 do
		v5 = v7(v5, l__teams__6[v12], v12 - 1, l__teams__6);
	end;
	return local v13;
end;
function u1.getTeamNames(p8, p9)
	if #p8.teamNames ~= 0 then
		return p8.teamNames;
	end;
	if not p8.teams then
		return nil;
	end;
	local l__teams__14 = p8.teams;
	local function v15(p10)
		return p10.name;
	end;
	local v16 = table.create(#l__teams__14);
	for v17, v18 in ipairs(l__teams__14) do
		v16[v17] = v15(v18, v17 - 1, l__teams__14);
	end;
	table.sort(v16);
	p8.teamNames = v16;
	if p9 then
		table.insert(p8.teamNames, 1, "Spectator");
	end;
	return p8.teamNames;
end;
local l__ColorUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function u1.getTeamDropdown(p11, p12)
	local v19 = nil;
	if p11.teamDropdown.dropDownItems then
		return p11.teamDropdown;
	end;
	if not p11.teams then
		return nil;
	end;
	local l__teams__20 = p11.teams;
	v19 = {};
	local function v21(p13, p14)
		p13[p14.name] = {
			text = "<font color=\"" .. (l__ColorUtil__5.richTextColor(p14.color) .. "\">") .. p14.name .. "</font>", 
			value = p14.name
		};
		return p13;
	end;
	for v22 = 1, #l__teams__20 do
		v19 = v21(v19, l__teams__20[v22], v22 - 1, l__teams__20);
	end;
	p11.teamDropdown.map = local v23;
	local v24 = {};
	local v25 = #v24;
	for v26, v27 in pairs(p11.teamDropdown.map) do
		v25 = v25 + 1;
		v24[v25] = { v26, v27 };
	end;
	local v28 = u6.values(v24);
	local function v29(p15)
		return p15[2];
	end;
	local v30 = table.create(#v28);
	for v31, v32 in ipairs(v28) do
		v30[v31] = v29(v32, v31 - 1, v28);
	end;
	table.sort(v30, function(p16, p17)
		return p16.value < p17.value;
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
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	TeamController = u2
};
return u1;

