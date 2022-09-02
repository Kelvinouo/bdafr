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
		blastResistance = 0.65, 
		wool = true
	};
	local v7 = p1;
	if v7 ~= nil then
		v7 = v7.minecraftConversions;
	end;
	v6.minecraftConversions = v7;
	v3.block = v6;
	local v8 = p1;
	if v8 ~= nil then
		v8 = v8.image;
	end;
	if v8 ~= "" and v8 then
		v3.image = p1.image;
	end;
	local v9 = p1;
	if v9 ~= nil then
		v9 = v9.description;
	end;
	if v9 ~= "" and v9 then
		v3.description = p1.description;
	end;
	return v3;
end;
return {
	BaseItems = v2
};
