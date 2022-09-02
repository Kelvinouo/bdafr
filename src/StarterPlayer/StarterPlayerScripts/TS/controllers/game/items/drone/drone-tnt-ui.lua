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
			local v2 = nil;
			local v3, v4, v5 = ipairs(p1.store.Inventory.observedInventory.inventory.items);
			while true do
				v3(v4, v5);
				if not v3 then
					break;
				end;
				v5 = v3;
				if v4.itemType == l__ItemType__1.TNT == true then
					v2 = v4;
					break;
				end;			
			end;
			if v2 == nil then
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
