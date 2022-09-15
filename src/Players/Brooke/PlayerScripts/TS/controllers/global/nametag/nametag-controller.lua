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
function u1.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "NametagController";
end;
local l__WatchCharacter__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__PlaceUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__EntityUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function u1.KnitStart(p2)
	l__WatchCharacter__2(function(p3, p4, p5)
		p5:GiveTask(p4:GetAttributeChangedSignal("Team"):Connect(function()
			p2:updateTeam(p3, p4);
		end));
		p2:updateTeam(p3, p4);
	end);
	if l__PlaceUtil__3.isLobbyServer() then
		l__ClientStore__4.changed:connect(function(p6, p7)
			if p6.Party.members ~= p7.Party.members or p6.Party.leader ~= p7.Party.leader then
				local v5 = { p7.Party.leader };
				local l__members__6 = p7.Party.members;
				table.move(l__members__6, 1, #l__members__6, #v5 + 1, v5);
				local v7 = {};
				local v8 = 0;
				local v9, v10, v11 = ipairs(v5);
				while true do
					v9(v10, v11);
					if not v9 then
						break;
					end;
					if table.find(p6.Party.members, v10) == nil == true then
						v8 = v8 + 1;
						v7[v8] = v10;
					end;				
				end;
				local v12 = table.create(#v7);
				local v13, v14, v15 = ipairs(v7);
				while true do
					v13(v14, v15);
					if not v13 then
						break;
					end;
					v15 = v13;
					v12[v13] = v14.userId;				
				end;
				local v16 = { p6.Party.leader };
				local l__members__17 = p6.Party.members;
				table.move(l__members__17, 1, #l__members__17, #v16 + 1, v16);
				local v18 = table.create(#v16);
				local v19, v20, v21 = ipairs(v16);
				while true do
					v19(v20, v21);
					if not v19 then
						break;
					end;
					v21 = v19;
					v18[v19] = v20.userId;				
				end;
				v1.Promise.defer(function()
					local v22, v23, v24 = ipairs(v12);
					while true do
						v22(v23, v24);
						if not v22 then
							break;
						end;
						v24 = v22;
						local v25 = l__Players__5:GetPlayerByUserId(v23);
						if v25 then
							local v26 = l__EntityUtil__6:getEntity(v25);
							if v26 ~= nil then
								v26:setNametag(v25.DisplayName);
							end;
						end;					
					end;
					local v27, v28, v29 = ipairs(v18);
					while true do
						v27(v28, v29);
						if not v27 then
							break;
						end;
						v29 = v27;
						local v30 = l__Players__5:GetPlayerByUserId(v28);
						if v30 then
							local v31 = l__EntityUtil__6:getEntity(v30);
							if v31 ~= nil then
								v31:setNametag("<font color=\"#55FF55\">" .. v30.DisplayName .. "</font>");
							end;
						end;					
					end;
				end);
			end;
		end);
		l__WatchCharacter__2(function(p8, p9)
			local v32 = { l__ClientStore__4:getState().Party.leader };
			local l__members__33 = l__ClientStore__4:getState().Party.members;
			table.move(l__members__33, 1, #l__members__33, #v32 + 1, v32);
			local v34 = table.create(#v32);
			local v35, v36, v37 = ipairs(v32);
			while true do
				v35(v36, v37);
				if not v35 then
					break;
				end;
				v37 = v35;
				v34[v35] = v36.userId;			
			end;
			if table.find(v34, p8.UserId) ~= nil then
				local v38 = l__EntityUtil__6:getEntity(p8);
				if v38 then
					v38:setNametag("<font color=\"#55FF55\">" .. p8.DisplayName .. "</font>");
				end;
			end;
		end);
	end;
end;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function u1.updateTeam(p10, p11, p12)
	if p11 == l__Players__5.LocalPlayer then
		local v39, v40, v41 = ipairs(l__Players__5:GetPlayers());
		while true do
			v39(v40, v41);
			if not v39 then
				break;
			end;
			v41 = v39;
			if v40.Character and v40 ~= l__Players__5.LocalPlayer then
				p10:updateTeam(v40, v40.Character);
			end;		
		end;
	end;
	local v42 = p12:GetAttribute("Team");
	local v43 = l__Players__5.LocalPlayer.Character;
	if v43 ~= nil then
		v43 = v43:GetAttribute("Team");
	end;
	if v42 ~= "" and v42 then
		local v44 = nil;
		local v45, v46, v47 = ipairs(l__ClientStore__4:getState().Game.teams);
		while true do
			v45(v46, v47);
			if not v45 then
				break;
			end;
			v47 = v45;
			if v46.id == v42 == true then
				v44 = v46;
				break;
			end;		
		end;
		local v48 = v44;
	else
		v48 = nil;
	end;
	if p11 == l__Players__5.LocalPlayer then
		if l__PlaceUtil__3.isLobbyServer() then
			local v49 = l__EntityUtil__6:getEntity(p11);
			if v49 ~= nil then
				v49:hideDisplayName();
			end;
			if v49 ~= nil then
				v49:centerNameTag();
			end;
		else
			p12:WaitForChild("Head"):WaitForChild("Nametag").PlayerToHideFrom = l__Players__5.LocalPlayer;
		end;
	end;
	if l__PlaceUtil__3.isGameServer() and v48 then
		local l__TeamIndicator__50 = p12:WaitForChild("Head"):WaitForChild("Nametag"):WaitForChild("TeamIndicator");
		l__TeamIndicator__50.Visible = true;
		l__TeamIndicator__50.BackgroundColor3 = v48.color;
	end;
	if l__PlaceUtil__3.isGameServer() then
		local v51 = l__EntityUtil__6:getEntity(p11);
		if v51 then
			if v42 == v43 then
				local v52 = l__Theme__7.mcGreen;
			else
				v52 = Color3.fromRGB(240, 26, 26);
			end;
			v51:setNametag("<font color=\"#" .. v52:ToHex() .. "\">" .. p11.DisplayName .. "</font>");
			v51:setNametagBorderColor(v52);
		end;
	end;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	NametagController = u1
};
