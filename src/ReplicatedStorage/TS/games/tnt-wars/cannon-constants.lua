-- Decompiled with the Synapse X Luau decompiler.

local l__ItemType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v2 = {};
local v3 = setmetatable({}, {
	__index = v2
});
v3.SUCCESS = 0;
v2[0] = "SUCCESS";
v3.FAILURE = 1;
v2[1] = "FAILURE";
return {
	TNTLoadResult = v3, 
	CANNON_COLLECTION_TAGS = {
		billboard = "BILLBOARD_TAG", 
		proximity = "PROXIMITY_TAG"
	}, 
	MANUAL_CANNON_CONFIG = {
		cannonType = l__ItemType__1.MANUAL_CANNON, 
		ammoType = l__ItemType__1.TNT, 
		ammoCapacity = 10, 
		ammoPerShot = 1, 
		durabilityPerShot = 2, 
		isAimable = true
	}, 
	AUTO_CANNON_CONFIG = {
		cannonType = l__ItemType__1.AUTO_CANNON, 
		ammoType = l__ItemType__1.TNT, 
		ammoCapacity = 25, 
		ammoPerShot = 1, 
		durabilityPerShot = 1, 
		isAimable = true, 
		autoFire = {
			ammoUsed = 1, 
			fireInterval = 1.5
		}
	}, 
	SPREAD_CANNON_CONFIG = {
		cannonType = l__ItemType__1.SPREAD_CANNON, 
		ammoType = l__ItemType__1.TNT, 
		ammoCapacity = 30, 
		ammoPerShot = 3, 
		durabilityPerShot = 3, 
		isAimable = true
	}
};
