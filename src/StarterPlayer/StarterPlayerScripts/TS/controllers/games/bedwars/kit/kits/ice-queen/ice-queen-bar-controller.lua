
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "IceQueenBarController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local l__default__2 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "IceQueenBarController";
	p1.log = l__default__2.ForContext(script);
	p1.passiveMap = {};
end;
local l__WatchCharacter__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCharacter__3(function(p3, p4)
		local v6 = p4:GetAttribute("IceQueenStacks");
		if v6 ~= nil and v6 > 0 then
			p2:updateStacks(p4, v6);
		end;
		p4:GetAttributeChangedSignal("IceQueenStacks"):Connect(function()
			local v7 = p4:GetAttribute("IceQueenStacks");
			if v7 ~= nil then
				p2:updateStacks(p4, v7);
			end;
		end);
	end);
end;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Maid__5 = v2.Maid;
local u6 = v1.import(script, script.Parent, "ui", "ice-queen-passive-bar").IceQueenPassiveBarWrapper;
local l__Players__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v4.updateStacks(p5, p6, p7)
	local v8 = nil;
	v8 = p5.passiveMap[p6];
	if p7 == 0 then
		if v8 then
			v8.maid:DoCleaning();
			p5.passiveMap[p6] = nil;
			return;
		else
			return;
		end;
	elseif not v8 then
		local v9, v10 = u4.createBinding(p7);
		local v11 = l__Maid__5.new();
		local u8 = u4.mount(u4.createElement(u6, {
			adornee = p6.Head, 
			bar = v9
		}), l__Players__7.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
		v11:GiveTask(function()
			u4.unmount(u8);
		end);
		p6.AncestryChanged:Connect(function(p8, p9)
			if p9 == nil then
				v11:DoCleaning();
				p5.passiveMap[p6] = nil;
			end;
		end);
		p5.passiveMap[p6] = {
			bar = v9, 
			setBar = v10, 
			maid = v11
		};
		return;
	end;
	p5.log:Debug("Update ice queen bar to {bar}", p7);
	v8.setBar(p7);
	p5.passiveMap[p6] = {
		bar = v8.bar, 
		setBar = v8.setBar, 
		maid = v8.maid
	};
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;

