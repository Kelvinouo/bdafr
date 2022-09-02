-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__LegacyKitKnitController__2 = v1.import(script, script.Parent.Parent, "kit", "legacy-kit-controller").LegacyKitKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "FishermanKitController";
	end, 
	__index = l__LegacyKitKnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__BedwarsKit__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v3.constructor(p1)
	l__LegacyKitKnitController__2.constructor(p1, { l__BedwarsKit__1.FISHERMAN });
	p1.Name = "FishermanKitController";
end;
function v3.KnitStart(p2)
	l__LegacyKitKnitController__2.KnitStart(p2);
end;
local l__AnimationType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__ContentProvider__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContentProvider;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v3.onKitEnabled(p3)
	v1.Promise.defer(function()
		local v5 = { l__AnimationType__2.FISHING_ROD_CAST, l__AnimationType__2.FISHING_ROD_CATCH_FAIL, l__AnimationType__2.FISHING_ROD_CATCH_SUCCESS, l__AnimationType__2.FISHING_ROD_IDLE, l__AnimationType__2.FISHING_ROD_PULLING };
		local v6 = table.create(#v5);
		local v7, v8, v9 = ipairs(v5);
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			v9 = v7;
			v6[v7] = u4("Animation", {
				AnimationId = l__GameAnimationUtil__5.getAssetId(v8)
			});		
		end;
		l__ContentProvider__3:PreloadAsync(v6);
	end);
end;
function v3.onKitDisabled(p4)

end;
local v10 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
