-- Script Hash: bd506aa23eee8e571ef15015073298b7b59daa6eb2d48f63b7c29697344a45716e95cd6b3b5d9ea808ac0568eeeae921
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local l__BlockFootstepSound__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "footstep-sounds").BlockFootstepSound;
local l__BreakBlockDamageType__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BreakBlockDamageType;
local l__createSounds__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "create-sounds").createSounds;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v2.wool(p1)
	local v3 = {};
	local v4 = p1;
	if v4 ~= nil then
		v4 = v4.displayName;
	end;
	local v5 = v4;
	if v5 == nil then
		v5 = "Wool";
	end;
	v3.displayName = v5;
	v3.footstepSound = l__BlockFootstepSound__1.SAND;
	local v6 = {
		breakType = l__BreakBlockDamageType__2.WOOL, 
		breakSound = function()
			return l__createSounds__3(l__GameSound__4.WOOL_BREAK);
		end, 
		placeSound = function()
			return l__createSounds__3(l__GameSound__4.GENERIC_BLOCK_PLACE);
		end, 
		greedyMesh = {
			textures = {}
		}, 
		health = 10, 
		wool = true
	};
	local v7 = p1;
	if v7 ~= nil then
		v7 = v7.minecraftConversions;
	end;
	v6.minecraftConversions = v7;
	v3.block = v6;
	return v3;
end;
return {
	BaseItems = v2
};
