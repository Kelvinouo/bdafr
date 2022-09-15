-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "IceQueenBarController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__default__1 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "IceQueenBarController";
	p1.log = l__default__1.ForContext(script);
	p1.passiveMap = {};
end;
local l__WatchCharacter__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__WatchCharacter__2(function(p3, p4)
		local v5 = p4:GetAttribute("IceQueenStacks");
		if v5 ~= nil and v5 > 0 then
			p2:updateStacks(p4, v5);
		end;
		p4:GetAttributeChangedSignal("IceQueenStacks"):Connect(function()
			local v6 = p4:GetAttribute("IceQueenStacks");
			if v6 ~= nil then
				p2:updateStacks(p4, v6);
			end;
		end);
	end);
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u5 = v1.import(script, script.Parent, "ui", "ice-queen-passive-bar").IceQueenPassiveBarWrapper;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.updateStacks(p5, p6, p7)
	local v7 = nil;
	v7 = p5.passiveMap[p6];
	if p7 == 0 then
		if v7 then
			v7.maid:DoCleaning();
			p5.passiveMap[p6] = nil;
			return;
		else
			return;
		end;
	elseif not v7 then
		local v8, v9 = u3.createBinding(p7);
		local v10 = u4.new();
		local u7 = u3.mount(u3.createElement(u5, {
			adornee = p6.Head, 
			bar = v8
		}), l__Players__6.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
		v10:GiveTask(function()
			u3.unmount(u7);
		end);
		p6.AncestryChanged:Connect(function(p8, p9)
			if p9 == nil then
				v10:DoCleaning();
				p5.passiveMap[p6] = nil;
			end;
		end);
		p5.passiveMap[p6] = {
			bar = v8, 
			setBar = v9, 
			maid = v10
		};
		return;
	end;
	p5.log:Debug("Update ice queen bar to {bar}", p7);
	v7.setBar(p7);
	p5.passiveMap[p6] = {
		bar = v7.bar, 
		setBar = v7.setBar, 
		maid = v7.maid
	};
end;
local v11 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
