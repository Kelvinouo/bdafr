-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ExplosionType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
return {
	GuidedProjectileMeta = {
		guided_missile = {
			lifetime = 8, 
			guidedProjectileModel = "guided_missile", 
			explosionType = l__ExplosionType__2.GUIDED_MISSILE, 
			yAngleLimit = {
				lower = -0.8, 
				upper = 0.8
			}, 
			speed = 60, 
			flightRotation = Vector3.new(0, 0, 0), 
			cameraOffset = Vector3.new(0, 2, 8)
		}, 
		heat_seeking_rock = {
			lifetime = 10, 
			guidedProjectileModel = "heat_seeking_rock", 
			explosionType = l__ExplosionType__2.GUIDED_MISSILE, 
			yAngleLimit = {
				lower = -0.8, 
				upper = 0.8
			}, 
			speed = 60, 
			flightRotation = Vector3.new(0, 0, 0), 
			cameraOffset = Vector3.new(0, 8, 30), 
			fov = 120
		}, 
		drone = {
			lifetime = 500, 
			guidedProjectileModel = "drone", 
			explosionType = l__ExplosionType__2.GUIDED_MISSILE, 
			yAngleLimit = {
				lower = -0.8, 
				upper = 0.8
			}, 
			speed = 0, 
			cameraOffset = Vector3.new(0, 0, 0), 
			doNotSetVelocity = true, 
			persistent = true, 
			tags = { "Drone" }, 
			modelSpringSettings = "Instant", 
			dontShowCooldown = true, 
			dontDetonateOnEntityNearby = true, 
			observeExplosionTime = 0.6, 
			deploySound = l__GameSound__3.DRONE_DEPLOY, 
			loopSound = l__GameSound__3.DRONE_PROPELLER_LOOP
		}, 
		tnt_wars_drone = {
			lifetime = 500, 
			guidedProjectileModel = "tnt_wars_drone", 
			explosionType = l__ExplosionType__2.GUIDED_MISSILE, 
			yAngleLimit = {
				lower = -0.8, 
				upper = 0.8
			}, 
			speed = 0, 
			cameraOffset = Vector3.new(0, 0, 0), 
			doNotSetVelocity = true, 
			persistent = true, 
			tags = { "TNTWarsDrone" }, 
			modelSpringSettings = "Instant", 
			dontShowCooldown = true, 
			dontDetonateOnEntityNearby = true, 
			observeExplosionTime = 0.6, 
			deploySound = l__GameSound__3.DRONE_DEPLOY, 
			loopSound = l__GameSound__3.DRONE_PROPELLER_LOOP
		}
	}
};
