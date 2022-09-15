-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent, "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "HandKnitController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "Controller";
	p1.enabled = false;
	p1.enableSession = math.random();
	p1.sessionMaid = u1.new();
end;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent, "ui", "store").ClientStore;
function v3.KnitStart(p2)
	local function u3(p3)
		if not p3.Inventory.observedInventory.inventory.hand or not p2:isRelevantItem(p3.Inventory.observedInventory.inventory.hand) then
			p2.sessionMaid:DoCleaning();
			p2.enabled = false;
			p2.handItem = nil;
			p2.enableSession = -1;
			p2:onDisable();
			return;
		end;
		local v4 = {};
		for v5, v6 in pairs(p3.Inventory.observedInventory.inventory.hand) do
			v4[v5] = v6;
		end;
		if p2.enabled then
			p2.sessionMaid:DoCleaning();
			p2.enabled = false;
			p2.handItem = nil;
			p2.enableSession = -1;
			p2:onDisable();
		end;
		local v7 = os.clock();
		p2.enableSession = v7;
		p2.handItem = v4;
		p2.enabled = true;
		p2:onEnable(v4, function()
			return p2.enableSession == v7;
		end);
		return nil;
	end;
	l__ClientStore__2.changed:connect(function(p4, p5)
		if p4.Inventory.observedInventory.inventory.hand ~= p5.Inventory.observedInventory.inventory.hand then
			u3(p4);
		end;
	end);
	u3(l__ClientStore__2:getState());
end;
function v3.isInputMouseButton1Equivalent(p6, p7)
	local v8 = false;
	if not false then
		v8 = p7.UserInputType == Enum.UserInputType.MouseButton1;
	end;
	local v9 = v8;
	if not v8 then
		v9 = p7.UserInputType == Enum.UserInputType.Touch;
	end;
	local v10 = v9;
	if not v9 then
		v10 = p7.KeyCode == Enum.KeyCode.ButtonR2;
	end;
	return v10;
end;
function v3.setupYield(p8, p9)
	local l__enableSession__4 = p8.enableSession;
	task.spawn(function()
		local v11 = nil;
		v11 = p9();
		if p8.enableSession ~= l__enableSession__4 then
			v11();
			return;
		end;
		p8.sessionMaid:GiveTask(function()
			task.spawn(function()
				v11();
			end);
		end);
	end);
end;
function v3.isEnabled(p10)
	return p10.enabled;
end;
function v3.getHandItem(p11)
	return p11.handItem;
end;
return {
	HandKnitController = v3
};
