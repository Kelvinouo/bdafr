
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
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "GiftController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__PlaceUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__GiftUtils__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-utils").GiftUtils;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KitViewport__6 = v1.import(script, script.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local l__GiftType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsKitMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local l__UILayers__12 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).UILayers;
function v3.KnitStart(p2)
	l__default__2.Client:GetNamespace("Gift"):WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			if l__PlaceUtil__3.isGameServer() then
				return nil;
			end;
			if l__GiftUtils__4.isKitGift(p4.giftType) then
				p4.gift.customImage = u5.createElement(l__KitViewport__6, {
					Kit = p4.giftType, 
					Size = UDim2.fromScale(1, 1), 
					SizeConstraint = "RelativeYY"
				});
			elseif l__GiftUtils__4.isKitSkinGift(p4.giftType) then
				p4.gift.customImage = u5.createElement(l__KitViewport__6, {
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
				if p4.giftType == l__GiftType__7.BattlePass then
					l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__9.BATTLEPASS, {});
					return;
				end;
				if l__GiftUtils__4.isKitGift(p4.giftType) then
					l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__9.KIT_SHOP, {
						SelectedKit = p4.giftType
					});
					return;
				end;
				if l__GiftUtils__4.isKitSkinGift(p4.giftType) then
					local v7 = u10.entries(l__BedwarsKitMeta__11);
					local function v8(p5)
						local v9 = p5[1];
						local v10 = p5[2];
						if not v10.skins then
							return;
						end;
						return table.find(v10.skins, p4.giftType) ~= nil;
					end;
					local v11 = nil;
					for v12, v13 in ipairs(v7) do
						if v8(v13, v12 - 1, v7) == true then
							v11 = v13;
							break;
						end;
					end;
					if v11 then
						l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__9.KIT_SHOP, {
							SelectedKit = v11[1]
						});
						return;
					end;
				else
					l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(l__UILayers__12.MAIN);
				end;
			end;
			l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__9.GIFTED, v5);
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;

