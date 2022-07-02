-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Flamework__1 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	InventoryBackground = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
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
		v4[u3.Event.InputEnded] = function(p3, p4)
			if Enum.UserInputType.MouseButton1 == p4.UserInputType then
				local v6 = l__Flamework__1.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):getActiveDragItem();
				if v6 then
					l__KnitClient__2.Controllers.ItemDropController:dropHotbarItem(v6.slotId);
				end;
			end;
			if Enum.UserInputType.Touch == p4.UserInputType then
				local v7 = l__Flamework__1.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):getActiveDragItem();
				if not v7 then
					return;
				end;
				l__KnitClient__2.Controllers.ItemDropController:dropHotbarItem(v7.slotId);
			end;
		end;
		return u3.createFragment({
			InventoryBackground = u3.createElement("Frame", v4)
		});
	end)
};
