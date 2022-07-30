-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__AnimationType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__BLOCK_SIZE__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__MonsterType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
return {
	SurvivalMonsterDefinitions = {
		[l__MonsterType__4.NORMAL_PENGUIN] = {
			modelName = "NormalPenguin", 
			animations = {
				walk = l__AnimationType__2.PENGUIN_WALK_2, 
				jump = l__AnimationType__2.PENGUIN_JUMP_2, 
				idle = l__AnimationType__2.PENGUIN_IDLE_2, 
				attack = l__AnimationType__2.PENGUIN_ATTACK_2
			}, 
			health = 100, 
			damage = 10, 
			spawnsAtTimeInWave = 0, 
			spawnsAtWave = 0, 
			blockDamage = 5, 
			range = 3.8 * l__BLOCK_SIZE__3, 
			hitbox = Vector3.new(3, 3, 3)
		}, 
		[l__MonsterType__4.BIG_PENGUIN] = {
			modelName = "BigPenguin", 
			animations = {
				walk = l__AnimationType__2.PENGUIN_WALK_2, 
				jump = l__AnimationType__2.PENGUIN_JUMP_2, 
				idle = l__AnimationType__2.PENGUIN_IDLE_2, 
				attack = l__AnimationType__2.PENGUIN_ATTACK_2
			}, 
			health = 200, 
			damage = 20, 
			spawnsAtTimeInWave = 0, 
			spawnsAtWave = 7, 
			blockDamage = 10, 
			range = 10 * l__BLOCK_SIZE__3, 
			hitbox = Vector3.new(7, 7, 7)
		}, 
		[l__MonsterType__4.TALL_PENGUIN] = {
			modelName = "TallPenguin", 
			animations = {
				walk = l__AnimationType__2.PENGUIN_WALK_2, 
				jump = l__AnimationType__2.PENGUIN_JUMP_2, 
				idle = l__AnimationType__2.PENGUIN_IDLE_2, 
				attack = l__AnimationType__2.PENGUIN_ATTACK_2
			}, 
			health = 150, 
			damage = 15, 
			spawnsAtTimeInWave = 0, 
			spawnsAtWave = 2, 
			blockDamage = 10, 
			range = 4 * l__BLOCK_SIZE__3, 
			hitbox = Vector3.new(4, 4, 4)
		}, 
		[l__MonsterType__4.BABY_PENGUIN] = {
			modelName = "BabyPenguin", 
			animations = {
				walk = l__AnimationType__2.PENGUIN_WALK_2, 
				jump = l__AnimationType__2.PENGUIN_JUMP_2, 
				idle = l__AnimationType__2.PENGUIN_IDLE_2, 
				attack = l__AnimationType__2.PENGUIN_ATTACK_2
			}, 
			health = 120, 
			damage = 34, 
			spawnsAtTimeInWave = 0, 
			spawnsAtWave = 8, 
			blockDamage = 100, 
			range = 4.2 * l__BLOCK_SIZE__3, 
			hitbox = Vector3.new(1, 1, 1)
		}, 
		[l__MonsterType__4.BOMBER_PENGUIN] = {
			modelName = "BomberPenguin", 
			animations = {
				walk = l__AnimationType__2.PENGUIN_WALK_2, 
				jump = l__AnimationType__2.PENGUIN_JUMP_2, 
				idle = l__AnimationType__2.PENGUIN_IDLE_2, 
				attack = l__AnimationType__2.PENGUIN_ATTACK_2
			}, 
			health = 300, 
			damage = 18, 
			spawnsAtTimeInWave = 0, 
			spawnsAtWave = 4, 
			blockDamage = 10, 
			range = 3.8 * l__BLOCK_SIZE__3, 
			hitbox = Vector3.new(3, 3, 3)
		}, 
		[l__MonsterType__4.KING_PENGUIN] = {
			modelName = "KingPenguin", 
			animations = {
				walk = l__AnimationType__2.PENGUIN_WALK_2, 
				jump = l__AnimationType__2.PENGUIN_JUMP_2, 
				idle = l__AnimationType__2.PENGUIN_IDLE_2, 
				attack = l__AnimationType__2.PENGUIN_ATTACK_2
			}, 
			health = 1500, 
			damage = 30, 
			spawnsAtTimeInWave = 0, 
			spawnsAtWave = 11, 
			blockDamage = 75, 
			range = 10 * l__BLOCK_SIZE__3, 
			hitbox = Vector3.new(7, 7, 7)
		}, 
		[l__MonsterType__4.SNIPER_PENGUIN] = {
			modelName = "SniperPenguin", 
			animations = {
				walk = l__AnimationType__2.SNIPER_PENGUIN_WALKING_2, 
				jump = l__AnimationType__2.PENGUIN_JUMP_2, 
				idle = l__AnimationType__2.PENGUIN_IDLE_2, 
				attack = l__AnimationType__2.SNIPER_PENGUIN_SHOOT_2
			}, 
			health = 100, 
			damage = 0, 
			spawnsAtTimeInWave = 0, 
			spawnsAtWave = 6, 
			blockDamage = 0, 
			range = 10 * l__BLOCK_SIZE__3, 
			hitbox = Vector3.new(3, 3, 3)
		}, 
		[l__MonsterType__4.BOXER_PENGUIN] = {
			modelName = "BoxerPenguin", 
			animations = {
				walk = l__AnimationType__2.PENGUIN_WALK_2, 
				jump = l__AnimationType__2.PENGUIN_JUMP_2, 
				idle = l__AnimationType__2.PENGUIN_IDLE_2, 
				attack = l__AnimationType__2.PENGUIN_ATTACK_2
			}, 
			health = 100, 
			damage = 20, 
			spawnsAtTimeInWave = 0, 
			spawnsAtWave = 1, 
			blockDamage = 5, 
			range = 4 * l__BLOCK_SIZE__3, 
			hitbox = Vector3.new(3, 3, 3)
		}, 
		[l__MonsterType__4.WIZARD_PENGUIN] = {
			modelName = "WizardPenguin", 
			animations = {
				walk = l__AnimationType__2.PENGUIN_WALK_2, 
				jump = l__AnimationType__2.PENGUIN_JUMP_2, 
				idle = l__AnimationType__2.PENGUIN_IDLE_2, 
				attack = l__AnimationType__2.PENGUIN_ATTACK_2
			}, 
			health = 200, 
			damage = 25, 
			spawnsAtTimeInWave = 0, 
			spawnsAtWave = 8, 
			blockDamage = 5, 
			range = 4 * l__BLOCK_SIZE__3, 
			hitbox = Vector3.new(3, 3, 3)
		}, 
		[l__MonsterType__4.PARACHUTE_PENGUIN] = {
			modelName = "ParachutePenguin", 
			animations = {
				walk = l__AnimationType__2.PENGUIN_WALK_2, 
				jump = l__AnimationType__2.PENGUIN_JUMP_2, 
				idle = l__AnimationType__2.PENGUIN_IDLE_2, 
				attack = l__AnimationType__2.PENGUIN_ATTACK_2
			}, 
			health = 100, 
			damage = 15, 
			spawnsAtTimeInWave = 0, 
			spawnsAtWave = 0, 
			blockDamage = 5, 
			range = 3.8 * l__BLOCK_SIZE__3, 
			hitbox = Vector3.new(3, 3, 3)
		}
	}
};
