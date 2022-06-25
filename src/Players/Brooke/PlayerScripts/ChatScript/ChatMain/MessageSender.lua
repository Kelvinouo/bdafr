-- Script Hash: 7120acd0de2ff33dff538290e46d6a637a18b5a725403d2df91f3a1e6a1894249bc78198fc19e107d7648f5d3c943bb6
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__Parent__2 = script.Parent;
local v3 = {};
v3.__index = v3;
function v3.SendMessage(p1, p2, p3)
	p1.SayMessageRequest:FireServer(p2, p3);
end;
function v3.RegisterSayMessageFunction(p4, p5)
	p4.SayMessageRequest = p5;
end;
function v1.new()
	local v4 = setmetatable({}, v3);
	v4.SayMessageRequest = nil;
	return v4;
end;
return v1.new();
