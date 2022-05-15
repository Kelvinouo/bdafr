
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "EffectBootsController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local l__Maid__2 = v2.Maid;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "EffectBootsController";
	p1.maid = l__Maid__2.new();
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__KnitClient__5 = v2.KnitClient;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientStore__3.changed:connect(function(p3, p4)
		local l__armor__6 = p3.Inventory.observedInventory.inventory.armor;
		if p4.Inventory.observedInventory.inventory.armor == l__armor__6 then
			return nil;
		end;
		local l__speedModifier__7 = p2.speedModifier;
		if l__speedModifier__7 ~= nil then
			l__speedModifier__7:Destroy();
		end;
		local l__jumpModifier__8 = p2.jumpModifier;
		if l__jumpModifier__8 ~= nil then
			l__jumpModifier__8:Destroy();
		end;
		p2.maid:DoCleaning();
		local function v9(p5)
			local function v10(p6)
				local v11 = false;
				if p6 ~= "empty" then
					v11 = p6.itemType == p5;
				end;
				return v11;
			end;
			local v12 = nil;
			for v13, v14 in ipairs(l__armor__6) do
				if v10(v14, v13 - 1, l__armor__6) == true then
					v12 = v14;
					break;
				end;
			end;
			return v12 ~= nil;
		end;
		if v9(l__ItemType__4.SPEED_BOOTS) then
			p2.speedModifier = l__KnitClient__5.Controllers.SprintController:getMovementStatusModifier():addModifier({
				blockSprint = true, 
				moveSpeedMultiplier = 2
			});
		end;
		if v9(l__ItemType__4.JUMP_BOOTS) then
			p2.jumpModifier = l__KnitClient__5.Controllers.JumpHeightController:getJumpModifier():addModifier({
				jumpHeightMultiplier = 2, 
				airJumps = 1
			});
		end;
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;

