-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BoostPotionController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1, ...)
	l__KnitController__2.constructor(p1, ...);
	p1.Name = "BoostPotionController";
end;
local l__WatchCharacter__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__WatchCharacter__1(function(p3, p4)
		p4:GetAttributeChangedSignal("JumpBoost"):Connect(function()
			if p4:GetAttribute("JumpBoost") ~= nil then
				if l__Players__2.LocalPlayer == p3 then
					p2.jumpMaid = l__KnitClient__3.Controllers.JumpHeightController:getJumpModifier():addModifier({
						jumpHeightMultiplier = p4:GetAttribute("JumpBoost")
					});
					return;
				end;
			elseif l__Players__2.LocalPlayer == p3 and p2.jumpMaid then
				p2.jumpMaid:Destroy();
				p2.jumpMaid = nil;
			end;
		end);
		p4:GetAttributeChangedSignal("SpeedBoost"):Connect(function()
			if p4:GetAttribute("SpeedBoost") ~= nil then
				if l__Players__2.LocalPlayer == p3 then
					p2.speedMaid = l__KnitClient__3.Controllers.SprintController:getMovementStatusModifier():addModifier({
						blockSprint = true, 
						moveSpeedMultiplier = p4:GetAttribute("SpeedBoost")
					});
					return;
				end;
			elseif l__Players__2.LocalPlayer == p3 and p2.speedMaid then
				p2.speedMaid:Destroy();
				p2.speedMaid = nil;
			end;
		end);
	end);
end;
local v5 = l__KnitClient__3.CreateController(v3.new());
return nil;
