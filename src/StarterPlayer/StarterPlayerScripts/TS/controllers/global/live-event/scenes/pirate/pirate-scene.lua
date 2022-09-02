-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateShipsBehavior__2 = v1.import(script, script.Parent, "shared-behaviors", "create-ships").CreateShipsBehavior;
local l__ManageAtmosphereBehavior__3 = v1.import(script, script.Parent, "shared-behaviors", "manage-atmosphere").ManageAtmosphereBehavior;
local l__BigExplosion__4 = v1.import(script, script, "big-explosion").BigExplosion;
local l__BigShipsShowUp__5 = v1.import(script, script, "big-ships-show-up").BigShipsShowUp;
local l__CannonsShootAtShip__6 = v1.import(script, script, "cannons-shoot-at-ship").CannonsShootAtShip;
local l__HouseExplodes__7 = v1.import(script, script, "house-explodes").HouseExplodes;
local l__MakeShipsRedOnHit__8 = v1.import(script, script, "make-ships-red-on-hit").MakeShipsRedOnHit;
local l__PickupCannonballs__9 = v1.import(script, script, "pickup-cannonballs").PickupCannonballs;
local l__PirateEndingCutscene__10 = v1.import(script, script, "pirate-ending-cutscene").PirateEndingCutscene;
local l__PirateMusic__11 = v1.import(script, script, "pirate-music").PirateMusic;
local l__PirateShipFireEffect__12 = v1.import(script, script, "pirate-ship-fire-effect").PirateShipFireEffect;
local l__PiratesPopDown__13 = v1.import(script, script, "pirates-pop-down").PiratesPopDown;
local v14 = v1.import(script, script, "receive-server-state").ReceiveServerStateBehavior;
local l__ShipPopsUpOnIsland__15 = v1.import(script, script, "ship-pops-up-on-island").ShipPopsUpOnIsland;
local l__ShipsFlyAwayBehavior__16 = v1.import(script, script, "ships-fly-away").ShipsFlyAwayBehavior;
local v17 = v1.import(script, script, "ships-reappear-at-front").ShipsReappearAtFrontBehavior;
local l__ShipsShootAtIsland__18 = v1.import(script, script, "ships-shoot-at-island").ShipsShootAtIsland;
local l__SpawnFireworks__19 = v1.import(script, script, "spawn-fireworks").SpawnFireworks;
local l__TieUpPlayers__20 = v1.import(script, script, "tie-up-players").TieUpPlayers;
local v21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system").Scene.new(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-config").pirateSceneConfig);
v21:registerBehaviorTable(v1.import(script, script.Parent, "shared-behaviors", "manage-ships").ManageShipsBehavior);
v21:registerBehaviorTable(l__ShipsFlyAwayBehavior__16);
v21:registerBehaviorTable(l__CreateShipsBehavior__2);
v21:registerBehaviorTable(l__ManageAtmosphereBehavior__3);
v21:registerBehaviorTable(v17);
v21:registerBehaviorTable(l__ShipsShootAtIsland__18);
v21:registerBehaviorTable(l__HouseExplodes__7);
v21:registerBehaviorTable(l__PickupCannonballs__9);
v21:registerBehaviorTable(l__CannonsShootAtShip__6);
v21:registerBehaviorTable(l__MakeShipsRedOnHit__8);
v21:registerBehaviorTable(l__SpawnFireworks__19);
v21:registerBehaviorTable(l__BigExplosion__4);
v21:registerBehaviorTable(l__BigShipsShowUp__5);
v21:registerBehaviorTable(l__TieUpPlayers__20);
v21:registerBehaviorTable(v14);
v21:registerBehaviorTable(l__PiratesPopDown__13);
v21:registerBehaviorTable(l__ShipPopsUpOnIsland__15);
v21:registerBehaviorTable(l__PirateEndingCutscene__10);
v21:registerBehaviorTable(l__PirateMusic__11);
v21:registerBehaviorTable(l__PirateShipFireEffect__12);
return {
	pirateScene = v21
};
