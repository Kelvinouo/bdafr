
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "GamePlayer";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
local l__RunService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
function v2.constructor(p1, p2)
	p1.player = p2;
	if l__RunService__1:IsServer() then
		local v4 = p2:GetAttribute("CompletedSetup");
		if v4 == 0 or v4 ~= v4 or v4 == "" or not v4 then
			p2:SetAttribute("Spectator", false);
			p2:SetAttribute("CompletedSetup", true);
		end;
	end;
end;
function v2.getPlayer(p3)
	return p3.player;
end;
function v2.isInGame(p4)
	return not p4:isSpectator();
end;
function v2.isSpectator(p5)
	return p5.player:GetAttribute("Spectator") == true;
end;
function v2.setSpectator(p6, p7)
	p6.player:SetAttribute("Spectator", p7);
end;
function v2.getTeamId(p8)
	return p8.player:GetAttribute("Team");
end;
function v2.setTeamId(p9, p10)
	p9.player:SetAttribute("Team", p10);
end;
function v2.isReady(p11)
	return p11.player:GetAttribute("PlayerConnected") == true;
end;
return {
	GamePlayer = v2
};

