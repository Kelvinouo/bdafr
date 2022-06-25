-- Script Hash: 32333a84ed0e3fec73e13379f48faac1c8f3b9887a13ff890eb810bc41bb04efe877cf6fa8442b9c6148bd6abfe5bdb9
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "NametagController";
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
	p1.Name = "NametagController";
end;
local l__WatchCharacter__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__PlaceUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__EntityUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function u1.KnitStart(p2)
	l__WatchCharacter__3(function(p3, p4, p5)
		p5:GiveTask(p4:GetAttributeChangedSignal("Team"):Connect(function()
			p2:updateTeam(p3, p4);
		end));
		p2:updateTeam(p3, p4);
	end);
	if l__PlaceUtil__4.isLobbyServer() then
		l__ClientStore__5.changed:connect(function(p6, p7)
			if p6.Party.members ~= p7.Party.members or p6.Party.leader ~= p7.Party.leader then
				local v5 = { p7.Party.leader };
				local l__members__6 = p7.Party.members;
				table.move(l__members__6, 1, #l__members__6, #v5 + 1, v5);
				local function v7(p8)
					return table.find(p6.Party.members, p8) == nil;
				end;
				local v8 = {};
				local v9 = 0;
				for v10, v11 in ipairs(v5) do
					if v7(v11, v10 - 1, v5) == true then
						v9 = v9 + 1;
						v8[v9] = v11;
					end;
				end;
				local function v12(p9)
					return p9.userId;
				end;
				local v13 = table.create(#v8);
				for v14, v15 in ipairs(v8) do
					v13[v14] = v12(v15, v14 - 1, v8);
				end;
				local v16 = { p6.Party.leader };
				local l__members__17 = p6.Party.members;
				table.move(l__members__17, 1, #l__members__17, #v16 + 1, v16);
				local function v18(p10)
					return p10.userId;
				end;
				local v19 = table.create(#v16);
				for v20, v21 in ipairs(v16) do
					v19[v20] = v18(v21, v20 - 1, v16);
				end;
				v1.Promise.defer(function()
					for v22, v23 in ipairs(v13) do
						local v24 = l__Players__6:GetPlayerByUserId(v23);
						if v24 then
							local v25 = l__EntityUtil__7:getEntity(v24);
							if v25 ~= nil then
								v25:setNametag(v24.DisplayName);
							end;
						end;
					end;
					for v26, v27 in ipairs(v19) do
						local v28 = l__Players__6:GetPlayerByUserId(v27);
						if v28 then
							local v29 = l__EntityUtil__7:getEntity(v28);
							if v29 ~= nil then
								v29:setNametag("<font color=\"#55FF55\">" .. v28.DisplayName .. "</font>");
							end;
						end;
					end;
				end);
			end;
		end);
		l__WatchCharacter__3(function(p11, p12)
			local v30 = { l__ClientStore__5:getState().Party.leader };
			local l__members__31 = l__ClientStore__5:getState().Party.members;
			table.move(l__members__31, 1, #l__members__31, #v30 + 1, v30);
			local function v32(p13)
				return p13.userId;
			end;
			local v33 = table.create(#v30);
			for v34, v35 in ipairs(v30) do
				v33[v34] = v32(v35, v34 - 1, v30);
			end;
			if table.find(v33, p11.UserId) ~= nil then
				local v36 = l__EntityUtil__7:getEntity(p11);
				if v36 then
					v36:setNametag("<font color=\"#55FF55\">" .. p11.DisplayName .. "</font>");
				end;
			end;
		end);
	end;
end;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function u1.updateTeam(p14, p15, p16)
	if p15 == l__Players__6.LocalPlayer then
		for v37, v38 in ipairs(l__Players__6:GetPlayers()) do
			if v38.Character and v38 ~= l__Players__6.LocalPlayer then
				p14:updateTeam(v38, v38.Character);
			end;
		end;
	end;
	local v39 = p16:GetAttribute("Team");
	local v40 = l__Players__6.LocalPlayer.Character;
	if v40 ~= nil then
		v40 = v40:GetAttribute("Team");
	end;
	if v39 ~= "" and v39 then
		local l__teams__41 = l__ClientStore__5:getState().Game.teams;
		local function v42(p17)
			return p17.id == v39;
		end;
		local v43 = nil;
		for v44, v45 in ipairs(l__teams__41) do
			if v42(v45, v44 - 1, l__teams__41) == true then
				v43 = v45;
				break;
			end;
		end;
		local v46 = v43;
	else
		v46 = nil;
	end;
	if p15 == l__Players__6.LocalPlayer then
		if l__PlaceUtil__4.isLobbyServer() then
			local v47 = l__EntityUtil__7:getEntity(p15);
			if v47 ~= nil then
				v47:hideDisplayName();
			end;
			if v47 ~= nil then
				v47:centerNameTag();
			end;
		else
			local l__Nametag__48 = p16:WaitForChild("Head"):WaitForChild("Nametag");
			print("destroying nametag for player:", p15);
			l__Nametag__48.PlayerToHideFrom = l__Players__6.LocalPlayer;
		end;
	end;
	if l__PlaceUtil__4.isGameServer() and v46 then
		local l__TeamIndicator__49 = p16:WaitForChild("Head"):WaitForChild("Nametag"):WaitForChild("TeamIndicator");
		l__TeamIndicator__49.Visible = true;
		l__TeamIndicator__49.BackgroundColor3 = v46.color;
	end;
	if l__PlaceUtil__4.isGameServer() then
		local v50 = l__EntityUtil__7:getEntity(p15);
		if v50 then
			if v39 == v40 then
				local v51 = l__Theme__8.mcGreen;
			else
				v51 = Color3.fromRGB(240, 26, 26);
			end;
			v50:setNametag("<font color=\"#" .. v51:ToHex() .. "\">" .. p15.DisplayName .. "</font>");
			v50:setNametagBorderColor(v51);
		end;
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	NametagController = u2
};
return u1;
