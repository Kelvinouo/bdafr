-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "FrostedSnowballController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "FrostedSnowballController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v5 = p3.extra.projectileData;
		if v5 ~= nil then
			v5 = v5.projectileType;
		end;
		if v5 == "frosted_snowball" and p3.entityInstance == l__Players__3.LocalPlayer.Character then
			local v6 = u4.new();
			v6:GiveTask(l__KnitClient__5.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = 0.5
			}));
			task.delay(1, function()
				v6:DoCleaning();
			end);
		end;
	end);
end;
u1 = l__KnitClient__5.CreateController;
u1 = u1(v3.new());
return nil;
