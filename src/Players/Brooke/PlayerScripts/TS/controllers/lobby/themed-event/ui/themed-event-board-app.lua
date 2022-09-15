-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ThemedEventBoardCore__2 = v1.import(script, script.Parent, "themed-event-board-core").ThemedEventBoardCore;
return {
	ThemedEventBoardApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p1, p2)
		local v2 = {};
		for v3, v4 in pairs(p2) do
			v2[v3] = v4;
		end;
		v2.PersonalCollectables = p1.ThemedEvent.personalCollectables;
		return v2;
	end)((v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p3, p4)
		local l__useState__5 = p4.useState;
		local v6 = {};
		local v7 = {};
		for v8, v9 in pairs(p3) do
			v7[v8] = v9;
		end;
		v6[#v6 + 1] = u1.createElement(l__ThemedEventBoardCore__2, v7);
		return u1.createElement("SurfaceGui", {
			Face = Enum.NormalId.Back, 
			LightInfluence = 0.25, 
			SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
		}, v6);
	end)))
};
