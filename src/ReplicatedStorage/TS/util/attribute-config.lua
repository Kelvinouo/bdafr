-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes");
local v2 = setmetatable({}, {
	__tostring = function()
		return "AttributeConfig";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
function v2.constructor(p1, p2, p3)
	p1.instance = p2;
	p1.Values = {};
	for v4, v5 in ipairs(p3) do
		p1:handleAttribute(v5);
	end;
end;
local l__GetAttribute__1 = v1.GetAttribute;
local u2 = v1.GetAttributeChangedSignal;
function v2.handleAttribute(p4, p5)
	p4.Values[p5.Name] = l__GetAttribute__1(p4.instance, p5);
	u2(p4.instance, p5, function(p6)
		p4.Values[p5.Name] = p6;
	end);
end;
return v2;
