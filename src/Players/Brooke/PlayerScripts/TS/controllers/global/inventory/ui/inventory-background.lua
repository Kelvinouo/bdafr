-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	InventoryBackground = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local l__useEffect__3 = p2.useEffect;
		local v4 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v5 = p1.Transparency;
		if v5 == nil then
			v5 = 0;
		end;
		v4.BackgroundTransparency = v5;
		v4[u1.Event.InputEnded] = function(p3, p4)
			if Enum.UserInputType.MouseButton1 == p4.UserInputType then

			end;
			if Enum.UserInputType.Touch == p4.UserInputType then

			end;
		end;
		return u1.createFragment({
			InventoryBackground = u1.createElement("Frame", v4)
		});
	end)
};
