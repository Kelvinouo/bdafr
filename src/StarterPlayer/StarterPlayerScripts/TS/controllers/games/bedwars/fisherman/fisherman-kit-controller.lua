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
local u1 = l__LegacyKitKnitController__2;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v3.constructor(p1)
	u1.constructor(p1, { l__BedwarsKit__2.FISHERMAN });
	p1.Name = "FishermanKitController";
end;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__AnimationType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__ContentProvider__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContentProvider;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameAnimationUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v3.onKitEnabled(p3)
	v1.Promise.defer(function()
		local v5 = { l__AnimationType__3.FISHING_ROD_CAST, l__AnimationType__3.FISHING_ROD_CATCH_FAIL, l__AnimationType__3.FISHING_ROD_CATCH_SUCCESS, l__AnimationType__3.FISHING_ROD_IDLE, l__AnimationType__3.FISHING_ROD_PULLING };
		local function v6(p4)
			return u5("Animation", {
				AnimationId = l__GameAnimationUtil__6.getAssetId(p4)
			});
		end;
		local v7 = table.create(#v5);
		for v8, v9 in ipairs(v5) do
			v7[v8] = v6(v9, v8 - 1, v5);
		end;
		l__ContentProvider__4:PreloadAsync(v7);
	end);
end;
function v3.onKitDisabled(p5)

end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
