-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BaseRelicController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__getRelicMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-meta").getRelicMeta;
function v3.constructor(p1, p2)
	l__KnitController__2.constructor(p1);
	p1.Name = "BaseRelicController";
	p1.teamIds = {};
	p1.relicMaid = u1.new();
	p1.relicType = p2;
	p1.relicMeta = l__getRelicMeta__2(p1.relicType);
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__RelicUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-util").RelicUtil;
function v3.KnitStart(p3)
	local l__matchState__4 = l__ClientStore__3:getState().Game.matchState;
	if l__matchState__4 == l__MatchState__4.PRE then
		l__default__5.Client:WaitFor("RemoteName"):expect():Connect(function(p4)
			if p3.relicType == p4.relic then
				p3.teamIds = p4.teamIds;
				if p3:onRelicTeam(l__Players__6.LocalPlayer) then
					p3:onActivated();
					l__ClientStore__3.changed:connect(function(p5, p6)
						local v5 = p5.Game.myTeam;
						if v5 ~= nil then
							v5 = v5.id;
						end;
						local v6 = p6.Game.myTeam;
						if v6 ~= nil then
							v6 = v6.id;
						end;
						if v5 ~= v6 then
							p3:deactivate();
						end;
					end);
				end;
			end;
		end);
	end;
	if l__matchState__4 == l__MatchState__4.RUNNING and (p3:onRelicTeam(l__Players__6.LocalPlayer) or l__RelicUtil__7:getActiveRelicForPlayer(l__Players__6.LocalPlayer) == p3.relicType) then
		p3:onActivated();
		l__ClientStore__3.changed:connect(function(p7, p8)
			local v7 = p7.Game.myTeam;
			if v7 ~= nil then
				v7 = v7.id;
			end;
			local v8 = p8.Game.myTeam;
			if v8 ~= nil then
				v8 = v8.id;
			end;
			if v7 ~= v8 then
				p3:deactivate();
			end;
		end);
	end;
end;
function v3.onRelicTeam(p9, p10)
	if #p9.teamIds <= 0 then
		return false;
	end;
	local u8 = p10:GetAttribute("Team");
	local v9, v10, v11 = ipairs(p9.teamIds);
	while true do
		v9(v10, v11);
		if not v9 then
			break;
		end;
		v11 = v9;
		if u8 == v10 then
			return true;
		end;	
	end;
	return false;
end;
return {
	BaseRelicController = v3
};
