-- Script Hash: af7b76ee6bcbbe5823a4efaf837a5103efb63cce809bb36a9d052227e15bfc6095c57206d21e96e9ebd21fcf99f12fe6
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BLOCK_SIZE__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__ExplosionType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local u1 = {
	[l__ExplosionType__3.TNT] = {
		displayName = "TNT", 
		damageMultipler = 1, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		explodePower = 2, 
		explodeRadius = 3, 
		damageRadius = 8 * l__BLOCK_SIZE__2
	}, 
	[l__ExplosionType__3.FIREBALL] = {
		displayName = "Fireball", 
		damageMultipler = 0.5, 
		knockbackMultiplier = {
			horizontal = 1.75, 
			vertical = 1.5
		}, 
		explodePower = 4.6, 
		explodeRadius = 1, 
		explodeRays = 75, 
		damageRadius = 5.5 * l__BLOCK_SIZE__2
	}, 
	[l__ExplosionType__3.ROCKET_MISSILE] = {
		displayName = "Rocket Missile", 
		damageMultipler = 1.2, 
		knockbackMultiplier = {
			horizontal = 2, 
			vertical = 2.8
		}, 
		damageRadius = 6.5 * l__BLOCK_SIZE__2, 
		explodePower = 7
	}, 
	[l__ExplosionType__3.LUCKYBLOCK_TNT] = {
		displayName = "TNT", 
		damageMultipler = 1, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		explodePower = 3, 
		explodeRadius = 3, 
		explodeRays = 75, 
		damageRadius = 4 * l__BLOCK_SIZE__2
	}, 
	[l__ExplosionType__3.GUIDED_MISSILE] = {
		displayName = "Guided Missile", 
		damageMultipler = 0.7, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		explodePower = 4.6, 
		explodeRadius = 1, 
		explodeRays = 75, 
		damageRadius = 25
	}, 
	[l__ExplosionType__3.CARROT_ROCKET] = {
		displayName = "Carrot Rocket", 
		damageMultipler = 0.7, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		damageRadius = 15, 
		explodePower = 20
	}, 
	[l__ExplosionType__3.BOBA] = {
		displayName = "Boba", 
		knockbackMultiplier = {
			horizontal = 0, 
			vertical = 0
		}, 
		damageRadius = 5 * l__BLOCK_SIZE__2, 
		explodePower = 0
	}, 
	[l__ExplosionType__3.METEOR] = {
		displayName = "Meteor", 
		damageMultipler = 1, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		damageRadius = 8 * l__BLOCK_SIZE__2, 
		explodePower = 5
	}, 
	[l__ExplosionType__3.INVISIBLE_LANDMINE] = {
		displayName = "Invisible Landmine", 
		damageMultipler = 0.5, 
		damageType = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType.INVISIBLE_LANDMINE, 
		knockbackMultiplier = {
			horizontal = 1.5, 
			vertical = 4.5
		}, 
		damageRadius = 4 * l__BLOCK_SIZE__2, 
		explodePower = 2, 
		explodeRadius = 3
	}, 
	[l__ExplosionType__3.HELICOPTER] = {
		displayName = "Minicopter Explosion", 
		damageMultipler = 3, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		explodePower = 15, 
		explodeRays = 150, 
		damageRadius = 10 * l__BLOCK_SIZE__2
	}, 
	[l__ExplosionType__3.DINO_CHARGE] = {
		displayName = "Dino Charge", 
		damageMultipler = 1, 
		knockbackMultiplier = {
			horizontal = 2.25, 
			vertical = 2.5
		}, 
		damageRadius = 10 * l__BLOCK_SIZE__2, 
		explodePower = 20, 
		explodeRays = 150
	}
};
return {
	getExplosionMeta = function(p1)
		return u1[p1];
	end
};
