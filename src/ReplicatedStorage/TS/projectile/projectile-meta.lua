-- Decompiled with the Synapse X Luau decompiler.

local l__GameSound__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
return {
	ProjectileMeta = {
		arrow = {
			launchVelocity = 240, 
			gravitationalAcceleration = 35, 
			lifetimeSec = 2.8, 
			predictionLifetimeSec = 2, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			combat = {
				damage = 20
			}, 
			knockbackMultiplier = {
				horizontal = 0.95
			}, 
			impactSound = { l__GameSound__1.ARROW_IMPACT }, 
			impactParticles = "default"
		}, 
		firework_arrow = {
			launchVelocity = 300, 
			gravitationalAcceleration = 35, 
			lifetimeSec = 2.8, 
			predictionLifetimeSec = 2, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			combat = {
				damage = 16
			}, 
			knockbackMultiplier = {
				horizontal = 0.95
			}, 
			impactSound = { l__GameSound__1.ARROW_IMPACT }, 
			fireworkExplosion = {
				damage = 12, 
				radius = 12
			}
		}, 
		golden_arrow = {
			launchVelocity = 320, 
			gravitationalAcceleration = 35, 
			lifetimeSec = 2, 
			predictionLifetimeSec = 1.1, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			combat = {
				damage = 30
			}, 
			knockbackMultiplier = {
				horizontal = 1.2
			}, 
			impactSound = { l__GameSound__1.ARROW_IMPACT }, 
			projectileModel = "golden_arrow"
		}, 
		crossbow_arrow = {
			launchVelocity = 400, 
			gravitationalAcceleration = 35, 
			lifetimeSec = 2, 
			predictionLifetimeSec = 1.1, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			combat = {
				damage = 45, 
				armorMultiplier = 0.9
			}, 
			knockbackMultiplier = {
				horizontal = 1.1
			}, 
			impactSound = { l__GameSound__1.ARROW_IMPACT }, 
			projectileModel = "arrow", 
			impactParticles = "default"
		}, 
		crossbow_firework_arrow = {
			launchVelocity = 400, 
			gravitationalAcceleration = 35, 
			lifetimeSec = 2, 
			predictionLifetimeSec = 1.1, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			combat = {
				damage = 38, 
				armorMultiplier = 0.9
			}, 
			knockbackMultiplier = {
				horizontal = 1.1
			}, 
			impactSound = { l__GameSound__1.ARROW_IMPACT }, 
			projectileModel = "firework_arrow", 
			fireworkExplosion = {
				damage = 12, 
				radius = 12
			}
		}, 
		tactical_crossbow_arrow = {
			launchVelocity = 500, 
			gravitationalAcceleration = 35, 
			lifetimeSec = 2, 
			predictionLifetimeSec = 1.1, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			combat = {
				damage = 50, 
				armorMultiplier = 0.9
			}, 
			knockbackMultiplier = {
				horizontal = 1.15
			}, 
			impactSound = { l__GameSound__1.ARROW_IMPACT }, 
			projectileModel = "arrow"
		}, 
		tactical_crossbow_firework_arrow = {
			launchVelocity = 500, 
			gravitationalAcceleration = 35, 
			lifetimeSec = 2, 
			predictionLifetimeSec = 1.1, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			combat = {
				damage = 44, 
				armorMultiplier = 0.9
			}, 
			knockbackMultiplier = {
				horizontal = 1.15
			}, 
			impactSound = { l__GameSound__1.ARROW_IMPACT }, 
			projectileModel = "firework_arrow", 
			fireworkExplosion = {
				damage = 12, 
				radius = 12
			}
		}, 
		telepearl = {
			launchVelocity = 120, 
			gravitationalAcceleration = 70, 
			flightRotation = Vector3.new(0, math.pi / 2, 0), 
			impactParticles = "default"
		}, 
		zipline = {
			launchVelocity = 140, 
			gravitationalAcceleration = 65, 
			lifetimeSec = 2.8, 
			predictionLifetimeSec = 2, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			impactSound = { l__GameSound__1.FORTIFY_BLOCK }, 
			projectileModel = "arrow"
		}, 
		fireball = {
			launchVelocity = 68, 
			gravitationalAcceleration = 0
		}, 
		lasso = {
			launchVelocity = 160, 
			gravitationalAcceleration = 135, 
			predictionLifetimeSec = 0.8, 
			lifetimeSec = 0.8, 
			flightRotation = Vector3.new(0, 0, 0), 
			hitscanRegionMultiplier = 2.5, 
			wallHitscanRegionMultiplier = 0.75, 
			returnDistance = 65
		}, 
		lightning_strike = {
			launchVelocity = 120, 
			gravitationalAcceleration = 50, 
			flightRotation = Vector3.new(0, math.pi / 2, 0), 
			impactSound = { l__GameSound__1.WIZARD_LIGHTNING_LAND }
		}, 
		electric_orb = {
			launchVelocity = 20, 
			gravitationalAcceleration = 0, 
			lifetimeSec = 3, 
			playerCollisionDisabled = true, 
			collisionDisabled = true
		}, 
		turretBullet = {
			launchVelocity = 200, 
			gravitationalAcceleration = 10, 
			predictionLifetimeSec = 1, 
			lifetimeSec = 1, 
			combat = {
				damage = 8
			}, 
			knockbackMultiplier = {
				horizontal = 1.2
			}, 
			impactSound = { l__GameSound__1.ARROW_IMPACT }
		}, 
		deploy_spirit = {
			launchVelocity = 120, 
			gravitationalAcceleration = 120, 
			flightRotation = Vector3.new(0, math.pi / 2, 0)
		}, 
		rocket_launcher_missile = {
			launchVelocity = 125, 
			gravitationalAcceleration = 0.1, 
			flightRotation = Vector3.new(0, -math.pi / 2, 0), 
			combat = {
				damage = 50
			}, 
			knockbackMultiplier = {
				horizontal = 1.6
			}, 
			impactSound = { l__GameSound__1.TNT_EXPLODE_1 }
		}, 
		impulse_grenade = {
			launchVelocity = 60, 
			gravitationalAcceleration = 50
		}, 
		smoke_grenade = {
			launchVelocity = 60, 
			gravitationalAcceleration = 50, 
			impactSound = { l__GameSound__1.ARROW_IMPACT }
		}, 
		stun_grenade = {
			launchVelocity = 120, 
			gravitationalAcceleration = 60, 
			impactSound = { l__GameSound__1.ARROW_IMPACT }
		}, 
		sleep_splash_potion = {
			launchVelocity = 70, 
			gravitationalAcceleration = 90
		}, 
		poison_splash_potion = {
			launchVelocity = 70, 
			gravitationalAcceleration = 90
		}, 
		heal_splash_potion = {
			launchVelocity = 70, 
			gravitationalAcceleration = 90
		}, 
		large_rock = {
			launchVelocity = 140, 
			gravitationalAcceleration = 65, 
			lifetimeSec = 2.8, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			impactSound = { l__GameSound__1.ARROW_IMPACT }, 
			hitscanRegionMultiplier = 10, 
			combat = {
				damage = 50
			}, 
			knockbackMultiplier = {
				horizontal = 3
			}, 
			projectileModel = "large_rock_projectile"
		}, 
		throwable_bridge = {
			launchVelocity = 140, 
			gravitationalAcceleration = 65, 
			lifetimeSec = 2.8, 
			predictionLifetimeSec = 2, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			impactSound = { l__GameSound__1.FORTIFY_BLOCK }, 
			projectileModel = "arrow"
		}, 
		swap_ball = {
			launchVelocity = 140, 
			gravitationalAcceleration = 65, 
			lifetimeSec = 2.8, 
			predictionLifetimeSec = 2, 
			flightRotation = Vector3.new(0, math.pi, 0)
		}, 
		banana_peel = {
			launchVelocity = 120, 
			gravitationalAcceleration = 120, 
			flightRotation = Vector3.new(0, math.pi / 2, 0)
		}, 
		fisherman_bobber = {
			launchVelocity = 25, 
			gravitationalAcceleration = 30, 
			flightRotation = Vector3.new(math.pi / 2, math.pi / 2, math.pi / 2), 
			useServerModel = true, 
			allowPlayerNetworkOwnership = true, 
			lifetimeSec = 60, 
			predictionLifetimeSec = 0.8
		}, 
		ghost = {
			launchVelocity = 70, 
			gravitationalAcceleration = 0, 
			lifetimeSec = 3, 
			predictionLifetimeSec = 1.75, 
			combat = {
				damage = 60, 
				armorMultiplier = 0.6
			}, 
			knockbackMultiplier = {
				horizontal = 2.8
			}, 
			hitscanRegionMultiplier = 2
		}, 
		spear = {
			launchVelocity = 120, 
			gravitationalAcceleration = 30, 
			lifetimeSec = 4, 
			flightRotation = Vector3.new(0, math.pi / 2, 0), 
			impactSound = { l__GameSound__1.FORTIFY_BLOCK }, 
			projectileModel = "spear"
		}, 
		oil_projectile = {
			launchVelocity = 140, 
			gravitationalAcceleration = 65, 
			lifetimeSec = 2.8, 
			predictionLifetimeSec = 2, 
			flightRotation = Vector3.new(-math.pi / 2, 0, math.pi / 2), 
			projectileModel = "oil_projectile"
		}, 
		snowball = {
			launchVelocity = 240, 
			gravitationalAcceleration = 35, 
			lifetimeSec = 2.8, 
			predictionLifetimeSec = 2, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			combat = {
				damage = 1
			}, 
			knockbackMultiplier = {
				horizontal = 0.7
			}, 
			impactSound = { l__GameSound__1.SNOWBALL_HIT }
		}, 
		frosted_snowball = {
			launchVelocity = 270, 
			gravitationalAcceleration = 35, 
			lifetimeSec = 2.8, 
			predictionLifetimeSec = 2, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			combat = {
				damage = 5, 
				armorMultiplier = 0.9
			}, 
			knockbackMultiplier = {
				horizontal = 0.7
			}, 
			impactSound = { l__GameSound__1.SNOWBALL_HIT }
		}, 
		black_hole_bomb = {
			launchVelocity = 120, 
			gravitationalAcceleration = 120, 
			flightRotation = Vector3.new(0, math.pi / 2, 0), 
			projectileModel = "arrow"
		}, 
		popup_cube = {
			launchVelocity = 120, 
			gravitationalAcceleration = 120, 
			flightRotation = Vector3.new(0, math.pi / 2, 0)
		}, 
		robbery_ball = {
			launchVelocity = 140, 
			gravitationalAcceleration = 65, 
			lifetimeSec = 2.8, 
			combat = {
				damage = 5
			}, 
			predictionLifetimeSec = 2, 
			flightRotation = Vector3.new(0, math.pi, 0)
		}, 
		santa_bomb = {
			launchVelocity = 60, 
			gravitationalAcceleration = 50
		}, 
		throwing_knife = {
			launchVelocity = 170, 
			gravitationalAcceleration = 35, 
			lifetimeSec = 2.8, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			impactSound = { l__GameSound__1.ARROW_IMPACT }, 
			combat = {
				damage = 10
			}, 
			knockbackMultiplier = {
				horizontal = 0.2
			}, 
			projectileModel = "throwing_knife"
		}, 
		tornado_missile = {
			launchVelocity = 35, 
			lifetimeSec = 2, 
			keepProjectileOnHit = true, 
			gravitationalAcceleration = 0, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			combat = {
				damage = 15, 
				armorMultiplier = 0.9
			}, 
			knockbackMultiplier = {
				vertical = 2
			}, 
			noArc = true, 
			projectileModel = "tornado_missile"
		}, 
		sword_wave = {
			launchVelocity = 80, 
			lifetimeSec = 0.75, 
			gravitationalAcceleration = 0, 
			flightRotation = Vector3.new(-math.pi / 2, 0, math.pi * math.random()), 
			hitscanRegionMultiplier = 1.8, 
			wallHitscanRegionMultiplier = 0.5, 
			combat = {
				damage = 12, 
				armorMultiplier = 0.2, 
				noApplyDamageCooldown = true, 
				ignoreDamageCooldown = true
			}, 
			knockbackMultiplier = {
				horizontal = 0.2, 
				vertical = 0.2
			}, 
			noArc = true, 
			projectileModel = "sword_wave"
		}, 
		sword_wave1 = {
			launchVelocity = 80, 
			lifetimeSec = 1, 
			hitscanRegionMultiplier = 3, 
			wallHitscanRegionMultiplier = 0.5, 
			gravitationalAcceleration = 0, 
			flightRotation = Vector3.new(0, 0, 0), 
			combat = {
				damage = 34, 
				armorMultiplier = 0.2, 
				noApplyDamageCooldown = true, 
				ignoreDamageCooldown = true
			}, 
			noArc = true, 
			projectileModel = "sword_wave1"
		}, 
		carrot_rocket = {
			launchVelocity = 120, 
			gravitationalAcceleration = 50, 
			predictionLifetimeSec = 2, 
			flightRotation = Vector3.new(0, math.pi / 2, 0), 
			orbit = {
				timeTillMaxOrbit = 1, 
				radius = 1
			}
		}, 
		boba_pearl = {
			launchVelocity = 180, 
			gravitationalAcceleration = 90, 
			flightRotation = Vector3.new(-math.pi / 2, 0, 0), 
			impactSound = { l__GameSound__1.BOBA_IMPACT }
		}, 
		portal_projectile = {
			launchVelocity = 45, 
			gravitationalAcceleration = 0, 
			flightRotation = Vector3.new(-math.pi / 2, -math.pi / 2, -math.pi / 2), 
			lifetimeSec = 2
		}, 
		grappling_hook_projectile = {
			launchVelocity = 140, 
			gravitationalAcceleration = 0, 
			lifetimeSec = 0.9, 
			predictionLifetimeSec = 2, 
			flightRotation = Vector3.new(math.pi, math.pi / 2, 0), 
			combat = {
				damage = 25
			}, 
			knockbackMultiplier = {
				horizontal = 0.95
			}, 
			impactSound = { l__GameSound__1.ARROW_IMPACT }, 
			impactParticles = "default", 
			returnDistance = 75
		}, 
		penguin_sniper_shot = {
			launchVelocity = 800, 
			gravitationalAcceleration = 0, 
			lifetimeSec = 2, 
			predictionLifetimeSec = 1.1, 
			flightRotation = Vector3.new(0, 0, 0), 
			hitscanRegionMultiplier = 2, 
			combat = {
				damage = 75, 
				armorMultiplier = 0.3
			}, 
			knockbackMultiplier = {
				horizontal = 1.1
			}, 
			impactSound = { l__GameSound__1.ARROW_IMPACT }, 
			projectileModel = "carrot_rocket", 
			impactParticles = "default"
		}, 
		sticky_firework = {
			launchVelocity = 120, 
			gravitationalAcceleration = 70, 
			flightRotation = Vector3.new(0, math.pi / 2, 0), 
			combat = {
				damage = 1, 
				noApplyDamageCooldown = true, 
				ignoreDamageTakenCooldown = true, 
				ignoreArmor = true
			}
		}, 
		dizzy_toad = {
			launchVelocity = 120, 
			gravitationalAcceleration = 70, 
			flightRotation = Vector3.new(0, 0, 0), 
			combat = {
				damage = 1, 
				noApplyDamageCooldown = true, 
				ignoreDamageTakenCooldown = true, 
				ignoreArmor = true
			}
		}
	}
};
