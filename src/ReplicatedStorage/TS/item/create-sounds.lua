-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__SoundManager__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
return {
	createSounds = function(...)
		local v2 = {};
		local v3 = 0;
		local v4, v5, v6 = ipairs({ ... });
		while true do
			v4(v5, v6);
			if not v4 then
				break;
			end;
			v6 = v4;
			local v7 = l__SoundManager__1:createSound(v5);
			if v7 ~= nil then
				v3 = v3 + 1;
				v2[v3] = v7;
			end;		
		end;
		return v2;
	end
};
