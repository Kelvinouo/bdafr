-- Script Hash: af4e03206106d7388481907b6e538308f5cf9560b17e7054482931612c47dd6848744cdb749091bf453c93ec519c25b7
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "KitSkinController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "KitSkinController";
end;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.equipKitSkin(p3, p4, p5)
	l__default__2.Client:Get("BedwarsEquipKitSkin"):CallServerAsync({
		kit = p4, 
		kitSkin = p5
	}):andThen(function()

	end):catch(function(p6)
		warn(p6);
	end);
	l__ClientStore__3:dispatch({
		type = "EquipKitSkin", 
		kit = p4, 
		kitSkin = p5
	});
	l__SoundManager__4:playSound(l__GameSound__5.ARMOR_UNEQUIP);
end;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__getBedwarsKitMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__BedwarsKitSkinMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local l__MarketplaceService__9 = v2.MarketplaceService;
local l__Players__10 = v2.Players;
function v4.purchaseKitSkin(p7, p8, p9)
	local v6 = table.find(l__ClientStore__3:getState().Bedwars.ownedKits, p9) ~= nil;
	if not v6 and p9 then
		l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
			message = "You can only purchase this kit skin if you own the " .. l__getBedwarsKitMeta__7(p9).name .. " kit."
		});
		return nil;
	end;
	if not v6 then
		l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
			message = "You can only purchase this kit skin if you own the kit."
		});
		return nil;
	end;
	local v7 = l__BedwarsKitSkinMeta__8[p8];
	local v8 = v7.product;
	if v8 ~= nil then
		v8 = v8.devProductId;
	end;
	if v8 ~= nil then
		local v9 = v7.product;
		if v9 ~= nil then
			v9 = v9.devProductId;
		end;
		l__MarketplaceService__9:PromptProductPurchase(l__Players__10.LocalPlayer, v9);
	end;
end;
local l__BedwarsKitSkin__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
function v4.getKitSkin(p10, p11)
	return p11:GetAttribute("KitSkin") or l__BedwarsKitSkin__11.DEFAULT;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
