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
				local v7 = {};
				local v8 = 0;
				local v9, v10, v11 = ipairs(v5);
				while true do
					local v12, v13 = v9(v10, v11);
					if not v12 then
						break;
					end;
					if table.find(p6.Party.members, v13) == nil == true then
						v8 = v8 + 1;
						v7[v8] = v13;
					end;				
				end;
				local v14 = table.create(#v7);
				for v15, v16 in ipairs(v7) do
					v14[v15] = v16.userId;
				end;
				local v17 = { p6.Party.leader };
				local l__members__18 = p6.Party.members;
				table.move(l__members__18, 1, #l__members__18, #v17 + 1, v17);
				local v19 = table.create(#v17);
				for v20, v21 in ipairs(v17) do
					v19[v20] = v21.userId;
				end;
				v1.Promise.defer(function()
					for v22, v23 in ipairs(v14) do
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
		l__WatchCharacter__3(function(p8, p9)
			local v30 = { l__ClientStore__5:getState().Party.leader };
			local l__members__31 = l__ClientStore__5:getState().Party.members;
			table.move(l__members__31, 1, #l__members__31, #v30 + 1, v30);
			local v32 = table.create(#v30);
			for v33, v34 in ipairs(v30) do
				v32[v33] = v34.userId;
			end;
			if table.find(v32, p8.UserId) ~= nil then
				local v35 = l__EntityUtil__7:getEntity(p8);
				if v35 then
					v35:setNametag("<font color=\"#55FF55\">" .. p8.DisplayName .. "</font>");
				end;
			end;
		end);
	end;
end;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function u1.updateTeam(p10, p11, p12)
	if p11 == l__Players__6.LocalPlayer then
		for v36, v37 in ipairs(l__Players__6:GetPlayers()) do
			if v37.Character and v37 ~= l__Players__6.LocalPlayer then
				p10:updateTeam(v37, v37.Character);
			end;
		end;
	end;
	local v38 = p12:GetAttribute("Team");
	local v39 = l__Players__6.LocalPlayer.Character;
	if v39 ~= nil then
		v39 = v39:GetAttribute("Team");
	end;
	if v38 ~= "" and v38 then
		local v40 = nil;
		for v41, v42 in ipairs(l__ClientStore__5:getState().Game.teams) do
			if v42.id == v38 == true then
				v40 = v42;
				break;
			end;
		end;
		local v43 = v40;
	else
		v43 = nil;
	end;
	if p11 == l__Players__6.LocalPlayer then
		if l__PlaceUtil__4.isLobbyServer() then
			local v44 = l__EntityUtil__7:getEntity(p11);
			if v44 ~= nil then
				v44:hideDisplayName();
			end;
			if v44 ~= nil then
				v44:centerNameTag();
			end;
		else
			p12:WaitForChild("Head"):WaitForChild("Nametag").PlayerToHideFrom = l__Players__6.LocalPlayer;
		end;
	end;
	if l__PlaceUtil__4.isGameServer() and v43 then
		local l__TeamIndicator__45 = p12:WaitForChild("Head"):WaitForChild("Nametag"):WaitForChild("TeamIndicator");
		l__TeamIndicator__45.Visible = true;
		l__TeamIndicator__45.BackgroundColor3 = v43.color;
	end;
	if l__PlaceUtil__4.isGameServer() then
		local v46 = l__EntityUtil__7:getEntity(p11);
		if v46 then
			if v38 == v39 then
				local v47 = l__Theme__8.mcGreen;
			else
				v47 = Color3.fromRGB(240, 26, 26);
			end;
			v46:setNametag("<font color=\"#" .. v47:ToHex() .. "\">" .. p11.DisplayName .. "</font>");
			v46:setNametagBorderColor(v47);
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
