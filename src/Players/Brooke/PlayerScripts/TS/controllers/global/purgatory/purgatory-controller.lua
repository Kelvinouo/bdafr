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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "PurgatoryController";
end;
local l__CollectionService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
local l__EntityUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__CollectionService__1:GetInstanceAddedSignal("entity"):Connect(function(p3)
		p3:GetAttributeChangedSignal("IsInPurgatory"):Connect(function()
			local v5 = nil;
			v5 = l__EntityUtil__2:getEntity(p3);
			if p3:GetAttribute("IsInPurgatory") == true then
				p3:SetAttribute("Transparency", 1);
				if v5 == nil then
					return;
				end;
			else
				p3:SetAttribute("Transparency", nil);
				if v5 ~= nil then
					v5:showNametag();
				end;
				return;
			end;
			v5:hideNametag();
		end);
	end);
end;
local v6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
