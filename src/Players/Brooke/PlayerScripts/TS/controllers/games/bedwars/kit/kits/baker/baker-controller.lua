-- Script Hash: 211fbe67d9d3fb7c13eb2326fdca701131f08e60859df81545698cc18661ffb633793a484060ac435a88e4a68f7d7831
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BakerController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__KnitController__3;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "BakerController";
end;
function u1.enableSpeedBuff(p2, p3)

end;
function u1.disableSpeedBuff(p4, p5)
	local l__LeftFoot__6 = p5:FindFirstChild("LeftFoot");
	if l__LeftFoot__6 ~= nil then
		local l__SpeedPieBuffEmitter__7 = l__LeftFoot__6:FindFirstChild("SpeedPieBuffEmitter");
		if l__SpeedPieBuffEmitter__7 ~= nil then
			l__SpeedPieBuffEmitter__7:Destroy();
		end;
	end;
	local l__RightFoot__8 = p5:FindFirstChild("RightFoot");
	if l__RightFoot__8 ~= nil then
		local l__SpeedPieBuffEmitter__9 = l__RightFoot__8:FindFirstChild("SpeedPieBuffEmitter");
		if l__SpeedPieBuffEmitter__9 ~= nil then
			l__SpeedPieBuffEmitter__9:Destroy();
		end;
	end;
end;
local l__WatchCharacter__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__QueueType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
function u1.KnitStart(p6)
	l__WatchCharacter__3(function(p7, p8)
		local function u7()
			if p8:GetAttribute("SpeedPieBuff") == true then
				p6:enableSpeedBuff(p8);
				if p7 == l__Players__4.LocalPlayer then
					local v10 = {
						blockSprint = false
					};
					if l__ClientStore__5:getState().Game.queueType == l__QueueType__6.SURVIVAL then
						local v11 = 1.15;
					else
						v11 = 1.3;
					end;
					v10.moveSpeedMultiplier = v11;
					p6.pieSprintModifier = v10;
					l__KnitClient__2.Controllers.SprintController:getMovementStatusModifier():addModifier(p6.pieSprintModifier);
					return;
				end;
			else
				p6:disableSpeedBuff(p8);
				if p7 == l__Players__4.LocalPlayer and p6.pieSprintModifier then
					l__KnitClient__2.Controllers.SprintController:getMovementStatusModifier():removeModifier(p6.pieSprintModifier);
					p6.pieSprintModifier = nil;
				end;
			end;
		end;
		p8:GetAttributeChangedSignal("SpeedPieBuff"):Connect(function()
			u7();
		end);
		u7();
	end);
end;
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	BakerController = u2
};
return u1;
