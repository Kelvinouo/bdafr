-- Script Hash: 6d5bffb697eade26b6f359e7a5ceba0e46fedee44bd2404a9f9594056f99ab5802a38852a867b319d1a6a410d847c527
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "LegacyKitKnitController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = l__KnitController__2;
function v3.constructor(p1, p2)
	u1.constructor(p1);
	p1.kits = p2;
	p1.enabled = false;
end;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v3.KnitStart(p3)
	local function u3(p4)
		if p4.Bedwars.kit and table.find(p3.kits, p4.Bedwars.kit) ~= nil then
			if p3.enabled then
				return nil;
			else
				p3.enabled = true;
				v1.Promise.defer(function()
					p3:onKitEnabled();
				end);
				return nil;
			end;
		end;
		if not p3.enabled then
			return nil;
		end;
		p3.enabled = false;
		v1.Promise.defer(function()
			p3:onKitDisabled();
		end);
	end;
	l__ClientStore__2.changed:connect(function(p5, p6)
		if p5.Bedwars.kit ~= p6.Bedwars.kit then
			u3(p5);
		end;
	end);
	u3(l__ClientStore__2:getState());
end;
function v3.isEnabled(p7)
	return p7.enabled;
end;
function v3.getHandItem(p8)
	return p8.handItem;
end;
u1 = {
	LegacyKitKnitController = v3
};
return u1;
