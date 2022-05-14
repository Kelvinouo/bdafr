-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "PregameController";
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
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "PregameController";
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
function u1.KnitStart(p2)
	l__ClientStore__3.changed:connect(function(p3, p4)
		if p3.Game ~= p4.Game then
			if p3.Game.matchState ~= l__MatchState__4.PRE or p3.Game.customMatch ~= nil then
				print("unmounting countdown");
				p2:unmount();
				return;
			end;
		else
			return;
		end;
		print("mounting preagme countdown");
		p2:mount();
	end);
	local v5 = l__ClientStore__3:getState();
	if v5.Game.matchState == l__MatchState__4.PRE and v5.Game.customMatch == nil then
		p2:mount();
	end;
end;
local l__CreateRoduxApp__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__PregameCountdownWrapper__6 = v1.import(script, script.Parent, "ui", "pregame-countdown").PregameCountdownWrapper;
function u1.mount(p5)
	p5:unmount();
	p5.tree = l__CreateRoduxApp__5("PregameCountdown", l__PregameCountdownWrapper__6);
end;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
function u1.unmount(p6)
	if p6.tree then
		u7.unmount(p6.tree);
		p6.tree = nil;
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	PregameController = u2
};
return u1;
