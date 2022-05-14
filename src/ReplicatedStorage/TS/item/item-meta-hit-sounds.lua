-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BreakBlockDamageType__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BreakBlockDamageType;
local l__SoundManager__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
return {
	SetupItemMetaHitSounds = function(p1)
		for v2, v3 in ipairs(u1.values(p1)) do
			if v3.block then
				local l__breakType__4 = v3.block.breakType;
				if l__breakType__4 == l__BreakBlockDamageType__2.STONE then
					local l__block__5 = v3.block;
					if l__block__5.placeSound == nil then
						function l__block__5.placeSound()
							return { l__SoundManager__3:createSound(l__GameSound__4.STONE_BREAK) };
						end;
					end;
					local l__block__6 = v3.block;
					if l__block__6.breakSound == nil then
						function l__block__6.breakSound()
							return { l__SoundManager__3:createSound(l__GameSound__4.STONE_BREAK) };
						end;
					end;
				elseif l__breakType__4 == l__BreakBlockDamageType__2.WOOD then
					local l__block__7 = v3.block;
					if l__block__7.placeSound == nil then
						function l__block__7.placeSound()
							return { l__SoundManager__3:createSound(l__GameSound__4.WOOD_BREAK) };
						end;
					end;
					local l__block__8 = v3.block;
					if l__block__8.breakSound == nil then
						function l__block__8.breakSound()
							return { l__SoundManager__3:createSound(l__GameSound__4.WOOD_BREAK) };
						end;
					end;
				elseif l__breakType__4 == l__BreakBlockDamageType__2.DIRT then
					local l__block__9 = v3.block;
					if l__block__9.placeSound == nil then
						function l__block__9.placeSound()
							return { l__SoundManager__3:createSound(l__GameSound__4.GENERIC_BLOCK_PLACE) };
						end;
					end;
					local l__block__10 = v3.block;
					if l__block__10.breakSound == nil then
						function l__block__10.breakSound()
							return { l__SoundManager__3:createSound(l__GameSound__4.GENERIC_BLOCK_BREAK) };
						end;
					end;
				elseif l__breakType__4 == l__BreakBlockDamageType__2.WOOL then
					local l__block__11 = v3.block;
					if l__block__11.placeSound == nil then
						function l__block__11.placeSound()
							return { l__SoundManager__3:createSound(l__GameSound__4.WOOL_BREAK) };
						end;
					end;
					local l__block__12 = v3.block;
					if l__block__12.breakSound == nil then
						function l__block__12.breakSound()
							return { l__SoundManager__3:createSound(l__GameSound__4.WOOL_BREAK) };
						end;
					end;
				end;
			end;
		end;
	end
};
