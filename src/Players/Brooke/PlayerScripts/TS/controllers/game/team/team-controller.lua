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
		for v8, v9 in pairs(p6.members) do
			p5[v9.userId] = p6.name;
		end;
		return p5;
	end;
	for v10 = 1, #l__teams__6 do
		v5 = v7(v5, l__teams__6[v10], v10 - 1, l__teams__6);
	end;
	return local v11;
end;
function u1.getTeamNames(p7, p8)
	if #p7.teamNames ~= 0 then
		return p7.teamNames;
	end;
	if not p7.teams then
		return nil;
	end;
	local l__teams__12 = p7.teams;
	local v13 = table.create(#l__teams__12);
	for v14, v15 in ipairs(l__teams__12) do
		v13[v14] = v15.name;
	end;
	table.sort(v13);
	p7.teamNames = v13;
	if p8 then
		table.insert(p7.teamNames, 1, "Spectator");
	end;
	return p7.teamNames;
end;
local l__ColorUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function u1.getTeamDropdown(p9, p10)
	local v16 = nil;
	if p9.teamDropdown.dropDownItems then
		return p9.teamDropdown;
	end;
	if not p9.teams then
		return nil;
	end;
	local l__teams__17 = p9.teams;
	v16 = {};
	for v18 = 1, #l__teams__17 do
		local v19 = l__teams__17[v18];
		v16[v19.name] = {
			text = "<font color=\"" .. (l__ColorUtil__5.richTextColor(v19.color) .. "\">") .. v19.name .. "</font>", 
			value = v19.name
		};
		v16 = v16;
	end;
	p9.teamDropdown.map = local v20;
	local v21 = {};
	local v22 = #v21;
	for v23, v24 in pairs(p9.teamDropdown.map) do
		v22 = v22 + 1;
		v21[v22] = { v23, v24 };
	end;
	local v25 = u6.values(v21);
	local v26 = table.create(#v25);
	for v27, v28 in ipairs(v25) do
		v26[v27] = v28[2];
	end;
	table.sort(v26, function(p11, p12)
		return p11.value < p12.value;
	end);
	p9.teamDropdown.dropDownItems = v26;
	if p10 then
		p9.teamDropdown.map.Spectator = {
			text = "Spectator", 
			value = "Spectator"
		};
		table.insert(p9.teamDropdown.dropDownItems, 1, {
			text = "Spectator", 
			value = "Spectator"
		});
	end;
	return p9.teamDropdown;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	TeamController = u2
};
return u1;
