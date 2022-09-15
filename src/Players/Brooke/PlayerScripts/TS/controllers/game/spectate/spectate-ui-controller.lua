-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "SpectateUIController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "SpectateUIController";
	p1.maid = u2.new();
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CreateRoduxApp__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__SpectateSelectorWrapper__5 = v1.import(script, script.Parent, "ui", "spectate-selector").SpectateSelectorWrapper;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
function u1.KnitStart(p2)
	l__ClientStore__3.changed:connect(function(p3, p4)
		if p3.Game.spectating ~= p4.Game.spectating then
			if not p3.Game.spectating then
				v1.Promise.defer(function()
					p2.maid:DoCleaning();
				end);
				return;
			end;
		else
			return;
		end;
		v1.Promise.defer(function()
			local u7 = l__CreateRoduxApp__4("spectate-selector", l__SpectateSelectorWrapper__5);
			p2.maid:GiveTask(function()
				u6.unmount(u7);
			end);
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
