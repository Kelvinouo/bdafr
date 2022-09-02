-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "GiftController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "GiftController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__PlaceUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__GiftUtils__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-utils").GiftUtils;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KitViewport__5 = v1.import(script, script.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local l__GiftType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsKitMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local l__UILayers__11 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).UILayers;
function v3.KnitStart(p2)
	l__default__1.Client:GetNamespace("Gift"):WaitFor("GiftReceived"):andThen(function(p3)
		p3:Connect(function(p4)
			if l__PlaceUtil__2.isGameServer() then
				return nil;
			end;
			if l__GiftUtils__3.isKitGift(p4.giftType) then
				p4.gift.customImage = u4.createElement(l__KitViewport__5, {
					Kit = p4.giftType, 
					Size = UDim2.fromScale(1, 1), 
					SizeConstraint = "RelativeYY"
				});
			elseif l__GiftUtils__3.isKitSkinGift(p4.giftType) then
				p4.gift.customImage = u4.createElement(l__KitViewport__5, {
					Skin = p4.giftType, 
					Size = UDim2.fromScale(1, 1), 
					SizeConstraint = "RelativeYY"
				});
			end;
			local v5 = {
				giftName = p4.gift.name
			};
			local v6 = p4.gift.imageId;
			if v6 == nil then
				v6 = nil;
			end;
			v5.giftImageId = v6;
			v5.giftCustomImage = p4.gift.customImage and nil;
			v5.fromPlayer = p4.fromPlayer;
			v5.message = p4.message;
			function v5.onGiftClick()
				if p4.giftType == l__GiftType__6.BattlePass then
					l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__8.BATTLEPASS, {});
					return;
				end;
				if l__GiftUtils__3.isKitGift(p4.giftType) then
					l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__8.KIT_SHOP, {
						SelectedKit = p4.giftType
					});
					return;
				end;
				if l__GiftUtils__3.isKitSkinGift(p4.giftType) then
					local v7 = nil;
					local v8, v9, v10 = ipairs((u9.entries(l__BedwarsKitMeta__10)));
					while true do
						v8(v9, v10);
						if not v8 then
							break;
						end;
						v10 = v8;
						local v11 = v9[1];
						local v12 = v9[2];
						if v12.skins then
							local v13 = table.find(v12.skins, p4.giftType) ~= nil;
						else
							v13 = nil;
						end;
						if v13 == true then
							v7 = v9;
							break;
						end;					
					end;
					if v7 then
						l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__8.KIT_SHOP, {
							SelectedKit = v7[1]
						});
						return;
					end;
				else
					l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(l__UILayers__11.MAIN);
				end;
			end;
			l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__8.GIFTED, v5);
		end);
	end);
end;
local v14 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
