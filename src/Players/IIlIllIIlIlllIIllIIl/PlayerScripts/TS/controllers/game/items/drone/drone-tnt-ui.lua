-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ItemType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ActionButton__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ActionButton;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
return {
	DroneTntUi = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local u5 = p2.useValue(-1);
		return p2.useMemo(function()
			local l__items__2 = p1.store.Inventory.observedInventory.inventory.items;
			local function v3(p3)
				return p3.itemType == l__ItemType__1.TNT;
			end;
			local v4 = nil;
			for v5, v6 in ipairs(l__items__2) do
				if v3(v6, v5 - 1, l__items__2) == true then
					v4 = v6;
					break;
				end;
			end;
			if v4 == nil then
				return u2.createFragment();
			end;
			return u2.createElement(l__ActionButton__3, {
				actionName = "drop-tnt", 
				onActivated = function()
					if time() - u5.value > 0.3 then
						u5.value = time();
						l__default__4.Client:Get("RemoteName"):SendToServer();
					end;
				end, 
				interactionKey = Enum.KeyCode.Z, 
				gamepadInteractionKey = Enum.KeyCode.ButtonB, 
				text = "Drop TNT", 
				priority = 80
			});
		end, { p1.store.Inventory.observedInventory.inventory.items });
	end)
};
