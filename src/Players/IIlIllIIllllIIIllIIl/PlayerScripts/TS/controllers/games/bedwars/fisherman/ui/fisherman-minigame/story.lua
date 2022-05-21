-- Script Hash: f1bacbc2a3e6438655466238e1fed8e21fe9534e1b419c62c1925ccec129eec9706242acd0dfb4f507d62485ad38b53a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__FishermanMinigameApp__2 = v1.import(script, script.Parent, "fisherman-minigame-app").FishermanMinigameApp;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local u4 = l__CreateRoduxApp__1("FishermanMinigameApp", l__FishermanMinigameApp__2, {}, {}, {
		Parent = p1
	});
	return function()
		return u3.unmount(u4);
	end;
end;
