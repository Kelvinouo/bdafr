-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "StatusInfoListController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local l__Signal__1 = v2.Signal;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "StatusInfoListController";
	p1.isListSetup = false;
	p1.listSetupSignal = l__Signal__1.new();
	p1.listElementsQueue = {};
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StatusInfoList__3 = v1.import(script, script.Parent, "status-info-list").StatusInfoList;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	local v6 = {};
	function v6.SetupRef(p3)
		p2.list = p3;
		p2.isListSetup = true;
		p2.listSetupSignal:Fire(p3);
	end;
	p2.tree = u2.mount(u2.createElement(l__StatusInfoList__3, v6), l__Players__4.LocalPlayer:WaitForChild("PlayerGui"));
	p2.listSetupSignal:Connect(function(p4)
		local v7, v8, v9 = ipairs(p2.listElementsQueue);
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			v9 = v7;
			p2:addElement(v8.element, v8.position);		
		end;
	end);
end;
local l__Empty__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
function v4.addElement(p5, p6, p7, p8)
	if not p5.list then
		table.insert(p5.listElementsQueue, {
			element = p6, 
			position = p7
		});
		return nil;
	end;
	if p7 then
		local v10 = 0;
		if p7 == "Right" then
			v10 = #p5.list:GetChildren();
		end;
		if p7 == "Left" then
			v10 = 0;
			p5:shiftListLayoutOrder();
		end;
		local v11 = p8;
		if v11 == nil then
			v11 = "StatusInfoElement";
		end;
		p6 = u2.createFragment({
			[v11] = u2.createElement(l__Empty__5, {
				Size = UDim2.fromScale(1, 1), 
				LayoutOrder = v10
			}, { p6 })
		});
	end;
	return u2.mount(p6, p5.list);
end;
function v4.waitForSetupAddElement(p9, p10, p11, p12)
	if not p9.isListSetup then
		p9.listSetupSignal:Wait();
	end;
	return p9:addElement(p10, p11, p12);
end;
function v4.getList(p13)
	return p13.list;
end;
function v4.shiftListLayoutOrder(p14)
	local l__list__12 = p14.list;
	if l__list__12 ~= nil then
		local v13, v14, v15 = ipairs((l__list__12:GetChildren()));
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			if v14:IsA("GuiObject") then
				v14.LayoutOrder = v14.LayoutOrder + 1;
			end;		
		end;
	end;
end;
local v16 = v2.KnitClient.CreateController(v4.new());
return nil;
