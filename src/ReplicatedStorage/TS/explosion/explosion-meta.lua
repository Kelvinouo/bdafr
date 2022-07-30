-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BLOCK_SIZE__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__DamageType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local l__ExplosionType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local u1 = {
	[l__ExplosionType__4.TNT] = {
		displayName = "TNT", 
		damageMultiplier = 1, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		explodePower = 2, 
		explodeRadius = 3, 
		damageRadius = 8 * l__BLOCK_SIZE__2
	}, 
	[l__ExplosionType__4.FIREBALL] = {
		displayName = "Fireball", 
		damageMultiplier = 0.5, 
		knockbackMultiplier = {
			horizontal = 1.75, 
			vertical = 1.5
		}, 
		explodePower = 4.6, 
		explodeRadius = 1, 
		explodeRays = 75, 
		damageRadius = 5.5 * l__BLOCK_SIZE__2
	}, 
	[l__ExplosionType__4.ROCKET_MISSILE] = {
		displayName = "Rocket Missile", 
		damageMultiplier = 1.2, 
		knockbackMultiplier = {
			horizontal = 2, 
			vertical = 2.8
		}, 
		damageRadius = 6.5 * l__BLOCK_SIZE__2, 
		explodePower = 7
	}, 
	[l__ExplosionType__4.LUCKYBLOCK_TNT] = {
		displayName = "TNT", 
		damageMultiplier = 1, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		explodePower = 3, 
		explodeRadius = 3, 
		explodeRays = 75, 
		damageRadius = 4 * l__BLOCK_SIZE__2
	}, 
	[l__ExplosionType__4.GUIDED_MISSILE] = {
		displayName = "Guided Missile", 
		damageMultiplier = 0.7, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		explodePower = 4.6, 
		explodeRadius = 1, 
		explodeRays = 75, 
		damageRadius = 25
	}, 
	[l__ExplosionType__4.CARROT_ROCKET] = {
		displayName = "Carrot Rocket", 
		damageMultiplier = 0.7, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		damageRadius = 15, 
		explodePower = 20
	}, 
	[l__ExplosionType__4.BOBA] = {
		displayName = "Boba", 
		knockbackMultiplier = {
			horizontal = 0, 
			vertical = 0
		}, 
		damageRadius = 5 * l__BLOCK_SIZE__2, 
		explodePower = 0
	}, 
	[l__ExplosionType__4.METEOR] = {
		displayName = "Meteor", 
		damageMultiplier = 1, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		damageRadius = 8 * l__BLOCK_SIZE__2, 
		explodePower = 5
	}, 
	[l__ExplosionType__4.INVISIBLE_LANDMINE] = {
		displayName = "Invisible Landmine", 
		damageMultiplier = 0.5, 
		damageType = l__DamageType__3.INVISIBLE_LANDMINE, 
		knockbackMultiplier = {
			horizontal = 1.5, 
			vertical = 4.5
		}, 
		damageRadius = 4 * l__BLOCK_SIZE__2, 
		explodePower = 2, 
		explodeRadius = 3
	}, 
	[l__ExplosionType__4.HELICOPTER] = {
		displayName = "Minicopter Explosion", 
		damageMultiplier = 3, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		explodePower = 15, 
		explodeRays = 150, 
		damageRadius = 10 * l__BLOCK_SIZE__2
	}, 
	[l__ExplosionType__4.HELICOPTER_MISSILE] = {
		displayName = "Minicopter Missile", 
		damageMultiplier = 0.7, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		explodePower = 4.6, 
		explodeRadius = 1, 
		explodeRays = 75, 
		damageRadius = 25
	}, 
	[l__ExplosionType__4.DINO_CHARGE] = {
		displayName = "Dino Charge", 
		damageMultiplier = 1, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		damageRadius = 10 * l__BLOCK_SIZE__2, 
		explodePower = 20, 
		explodeRays = 150
	}, 
	[l__ExplosionType__4.PENGUIN] = {
		displayName = "Penguin Self-Destruct", 
		damageMultiplier = 0.5, 
		knockbackMultiplier = {
			horizontal = 0, 
			vertical = 0
		}, 
		explodePower = 3.2, 
		explodeRadius = 1, 
		explodeRays = 35, 
		damageRadius = 5.5 * l__BLOCK_SIZE__2
	}, 
	[l__ExplosionType__4.BOMBER_PENGUIN_EXPLOSION] = {
		displayName = "Penguin Self-Destruct", 
		damageMultiplier = 1, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		explodePower = 2, 
		explodeRadius = 3, 
		damageRadius = 8 * l__BLOCK_SIZE__2
	}, 
	[l__ExplosionType__4.KING_PENGUIN_EXPLOSION] = {
		displayName = "King Penguin", 
		damageMultiplier = 1, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		explodePower = 20, 
		explodeRadius = 10, 
		damageRadius = 10 * l__BLOCK_SIZE__2
	}, 
	[l__ExplosionType__4.TENNIS_BALL_EXPLOSION] = {
		displayName = "Tennis Ball", 
		damageType = l__DamageType__3.TENNIS_BALL, 
		damageMultiplier = 0.5, 
		knockbackMultiplier = {
			horizontal = 1.5, 
			vertical = 1.5
		}, 
		damageRadius = 4 * l__BLOCK_SIZE__2, 
		explodePower = 15
	}
};
return {
	getExplosionMeta = function(p1)
		return u1[p1];
	end
};
