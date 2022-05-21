-- Script Hash: 155b41209a71e2a8e0ec750b9f40f985cc03b1fac5e255345b88235828c0dbed4cdde158fa6c15ffa31ab7ba3b61cf20
-- Decompiled with the Synapse X Luau decompiler.

local l__EmoteHandler__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local v2 = setmetatable({}, {
	__tostring = function()
		return "BaseEmoteHandler";
	end, 
	__index = l__EmoteHandler__1
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
local u1 = l__EmoteHandler__1;
function v2.constructor(p1, ...)
	u1.constructor(p1, ...);
end;
function v2.onEnable(p2, p3, p4, p5)

end;
function v2.onDisable(p6, p7, p8, p9)

end;
u1 = {
	BaseEmoteHandler = v2
};
return l__EmoteHandler__1;
