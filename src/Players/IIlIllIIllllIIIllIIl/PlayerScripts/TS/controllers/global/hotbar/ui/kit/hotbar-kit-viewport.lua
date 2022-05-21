-- Script Hash: 884bf676924ace21eb570a00714b8f7d2eecb227c8993a019c2f2fcbfb9cf5e4528254512e35afe84706c43c6ac7fba3
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Flamework__1 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EmptyButton__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).EmptyButton;
local l__KitViewport__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
return {
	HotbarKitViewport = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local l__kit__3 = p1.store.Bedwars.kit;
		local v4 = nil;
		if l__kit__3 and p1.store.Bedwars.equippedKitSkins then
			v4 = p1.store.Bedwars.equippedKitSkins[l__kit__3];
		end;
		local v5 = {
			Size = UDim2.fromScale(1, 1), 
			AnchorPoint = p1.AnchorPoint, 
			Position = p1.Position, 
			SizeConstraint = "RelativeYY"
		};
		local function u7()
			l__Flamework__1.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__2.KIT_SHOP, {
				SelectedKit = l__ClientStore__3:getState().Bedwars.kit
			});
		end;
		v5[u4.Event.MouseButton1Click] = function()
			u7();
		end;
		return u4.createElement(l__EmptyButton__5, v5, { u4.createElement(l__KitViewport__6, {
				Kit = l__kit__3, 
				Skin = v4, 
				Size = UDim2.fromScale(1, 1)
			}) });
	end)
};
