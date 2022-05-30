-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "FrostedSnowballController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "FrostedSnowballController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__Maid__4 = v2.Maid;
local l__KnitClient__5 = v2.KnitClient;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v6 = p3.extra.projectileData;
		if v6 ~= nil then
			v6 = v6.projectileType;
		end;
		if v6 == "frosted_snowball" and p3.entityInstance == l__Players__3.LocalPlayer.Character then
			local v7 = l__Maid__4.new();
			v7:GiveTask(l__KnitClient__5.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = 0.5
			}));
			task.delay(1, function()
				v7:DoCleaning();
			end);
		end;
	end);
end;
u1 = l__KnitClient__5.CreateController;
u1 = u1(v4.new());
return nil;
