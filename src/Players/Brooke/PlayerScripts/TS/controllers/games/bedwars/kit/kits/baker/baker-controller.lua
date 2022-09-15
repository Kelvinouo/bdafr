-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BakerController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "BakerController";
end;
function u1.enableSpeedBuff(p2, p3)

end;
function u1.disableSpeedBuff(p4, p5)
	local l__LeftFoot__5 = p5:FindFirstChild("LeftFoot");
	if l__LeftFoot__5 ~= nil then
		local l__SpeedPieBuffEmitter__6 = l__LeftFoot__5:FindFirstChild("SpeedPieBuffEmitter");
		if l__SpeedPieBuffEmitter__6 ~= nil then
			l__SpeedPieBuffEmitter__6:Destroy();
		end;
	end;
	local l__RightFoot__7 = p5:FindFirstChild("RightFoot");
	if l__RightFoot__7 ~= nil then
		local l__SpeedPieBuffEmitter__8 = l__RightFoot__7:FindFirstChild("SpeedPieBuffEmitter");
		if l__SpeedPieBuffEmitter__8 ~= nil then
			l__SpeedPieBuffEmitter__8:Destroy();
		end;
	end;
end;
local l__WatchCharacter__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__QueueType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function u1.KnitStart(p6)
	l__WatchCharacter__2(function(p7, p8)
		local function u7()
			if p8:GetAttribute("SpeedPieBuff") == true then
				p6:enableSpeedBuff(p8);
				if p7 == l__Players__3.LocalPlayer then
					local v9 = {
						blockSprint = false
					};
					if l__ClientStore__4:getState().Game.queueType == l__QueueType__5.SURVIVAL then
						local v10 = 1.15;
					else
						v10 = 1.3;
					end;
					v9.moveSpeedMultiplier = v10;
					p6.pieSprintModifier = v9;
					l__KnitClient__6.Controllers.SprintController:getMovementStatusModifier():addModifier(p6.pieSprintModifier);
					return;
				end;
			else
				p6:disableSpeedBuff(p8);
				if p7 == l__Players__3.LocalPlayer and p6.pieSprintModifier then
					l__KnitClient__6.Controllers.SprintController:getMovementStatusModifier():removeModifier(p6.pieSprintModifier);
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
u1 = l__KnitClient__6.CreateController;
u1 = u1(u1.new());
return {
	BakerController = u1
};
