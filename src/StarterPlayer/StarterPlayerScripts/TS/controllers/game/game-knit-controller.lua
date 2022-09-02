-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "GameKnitController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.constructor(p1, p2)
	l__KnitController__2.constructor(p1);
	p1.gameTypes = p2;
	p1.Name = "GameKnitController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__getQueueMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
function v3.KnitStart(p3)
	local v4, v5 = l__KnitClient__1.Controllers.MatchController:getQueueType():await();
	if v4 and table.find(p3.gameTypes, l__getQueueMeta__2(v5).game) ~= nil then
		p3:onGameInit();
	end;
end;
function v3.onGameInit(p4)

end;
return {
	GameKnitController = v3
};
