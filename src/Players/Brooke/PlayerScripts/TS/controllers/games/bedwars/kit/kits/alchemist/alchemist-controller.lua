-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "AlchemistController";
	end, 
	__index = v2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	v2.constructor(p1);
	p1.Name = "AlchemistController";
end;
function v3.KnitStart(p2)
	v2.KnitStart(p2);
end;
local l__CollectableEntityType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
function v3.validCollectableEntityTypes(p3)
	return { l__CollectableEntityType__1.ALCHEMIST_INGREDIENTS };
end;
local l__ReplicatedStorage__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ReplicatedStorage;
function v3.pickDisplayModel(p4, p5, p6)
	local v5 = p4:getRandomIngredient();
	return {
		repStorageModel = l__ReplicatedStorage__2:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild(v5), 
		collectionTag = p5, 
		proximityPrompt = {
			name = v5
		}
	};
end;
function v3.onWillRemoveEntity(p7, p8, p9, p10, p11)
	return nil;
end;
function v3.onCreatedEntity(p12, p13, p14, p15)
	p15:SetPrimaryPartCFrame(CFrame.new(p15:GetPrimaryPartCFrame().Position + Vector3.new(0, -1, 0)));
	return nil;
end;
function v3.getRandomIngredient(p16)
	local v6 = math.random(0, 2);
	if v6 == 0 then
		return "Flower";
	end;
	if v6 == 1 then
		return "Mushrooms";
	end;
	if v6 == 2 then
		return "Thorns";
	end;
	return "None";
end;
local v7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
