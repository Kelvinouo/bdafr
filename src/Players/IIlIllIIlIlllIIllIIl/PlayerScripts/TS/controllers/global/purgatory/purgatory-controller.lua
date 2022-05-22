-- Script Hash: 5d30cccaf4825848361eeaaab07a7880f4ddaaeee812703906761df206c6180338252d2bff7f17dc714a44722c1c5c8f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "PurgatoryController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "PurgatoryController";
end;
local l__CollectionService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionService__2:GetInstanceAddedSignal("entity"):Connect(function(p3)
		p3:GetAttributeChangedSignal("IsInPurgatory"):Connect(function()
			local v5 = nil;
			local v6 = nil;
			v5 = l__EntityUtil__3:getEntity(p3);
			if p3:GetAttribute("IsInPurgatory") == true then
				p3:SetAttribute("Transparency", 1);
				v6 = v5;
				if v6 == nil then
					return;
				end;
			else
				p3:SetAttribute("Transparency", nil);
				if v5 ~= nil then
					v5:showNametag();
				end;
				return;
			end;
			v6:hideNametag();
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
