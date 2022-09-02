-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateShipsBehavior__2 = v1.import(script, script.Parent, "shared-behaviors", "create-ships").CreateShipsBehavior;
local l__ManageAtmosphereBehavior__3 = v1.import(script, script.Parent, "shared-behaviors", "manage-atmosphere").ManageAtmosphereBehavior;
local l__MoveShipsBehavior__4 = v1.import(script, script, "move-ships").MoveShipsBehavior;
local l__ShipsFireTntBehavior__5 = v1.import(script, script, "behaviors", "ships-fire-tnt").ShipsFireTntBehavior;
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system").Scene.new(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-buildup-scene-config").pirateBuildupSceneConfig);
v6:registerBehaviorTable(v1.import(script, script.Parent, "shared-behaviors", "manage-ships").ManageShipsBehavior);
v6:registerBehaviorTable(l__MoveShipsBehavior__4);
v6:registerBehaviorTable(l__CreateShipsBehavior__2);
v6:registerBehaviorTable(l__ManageAtmosphereBehavior__3);
v6:registerBehaviorTable(l__ShipsFireTntBehavior__5);
return {
	pirateBuildupScene = v6
};
