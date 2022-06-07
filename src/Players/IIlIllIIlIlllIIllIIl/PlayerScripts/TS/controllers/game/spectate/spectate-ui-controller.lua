-- Script Hash: 70195d7d375b0568437f79fc86f2501fa0caf34f495f459bb215da8288044522a988bbfdf5d692f77cc7192a5d08c75e
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
local u2 = l__KnitController__2;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "SpectateUIController";
	p1.maid = u3.new();
end;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CreateRoduxApp__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__SpectateSelectorWrapper__6 = v1.import(script, script.Parent, "ui", "spectate-selector").SpectateSelectorWrapper;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
function u1.KnitStart(p2)
	l__ClientStore__4.changed:connect(function(p3, p4)
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
			local u8 = l__CreateRoduxApp__5("spectate-selector", l__SpectateSelectorWrapper__6);
			p2.maid:GiveTask(function()
				u7.unmount(u8);
			end);
		end);
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
