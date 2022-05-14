-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BlockEngine__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__GamePlayerUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
l__BlockEngine__2:getBlockBreakableHook():connect(function(p1)
	if not p1.player then
		return nil;
	end;
	local v3 = l__GamePlayerUtil__1.getGamePlayer(p1.player):getTeamId();
	if v3 ~= "" and v3 then
		local v4 = l__BlockEngine__2:getStore():getBlockAt(p1.blockRef.blockPosition);
		if v4 and v4:GetAttribute("Team" .. v3 .. "NoBreak") == true then
			p1:setCancelled(true);
		end;
	end;
end);
return {};
