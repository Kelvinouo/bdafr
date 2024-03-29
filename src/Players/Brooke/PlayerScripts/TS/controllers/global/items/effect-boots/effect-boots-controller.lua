-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "EffectBootsController";
	p1.maid = u1.new();
end;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__KnitClient__4 = v2.KnitClient;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__ClientStore__2.changed:connect(function(p3, p4)
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
			local v10 = nil;
			local v11, v12, v13 = ipairs(l__armor__6);
			while true do
				v11(v12, v13);
				if not v11 then
					break;
				end;
				v13 = v11;
				local v14 = false;
				if v12 ~= "empty" then
					v14 = v12.itemType == p5;
				end;
				if v14 == true then
					v10 = v12;
					break;
				end;			
			end;
			return v10 ~= nil;
		end;
		if v9(l__ItemType__3.SPEED_BOOTS) then
			p2.speedModifier = l__KnitClient__4.Controllers.SprintController:getMovementStatusModifier():addModifier({
				blockSprint = true, 
				moveSpeedMultiplier = 2
			});
		end;
		if v9(l__ItemType__3.JUMP_BOOTS) then
			p2.jumpModifier = l__KnitClient__4.Controllers.JumpHeightController:getJumpModifier():addModifier({
				jumpHeightMultiplier = 2, 
				airJumps = 1
			});
		end;
	end);
end;
local v15 = v2.KnitClient.CreateController(v4.new());
return nil;
