-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "LobbyBundleController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "LobbyBundleController";
end;
local l__WatchCollectionTag__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
local l__BundleType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__WatchCollectionTag__1("holiday-bundle-prompt", function(p3)
		p2:setupLobbyBundlePrompt(p3, l__BundleType__2.HANNAH_BUNDLE);
	end);
end;
local l__BundleMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__MarketplaceService__8 = v3.MarketplaceService;
function v5.setupLobbyBundlePrompt(p4, p5, p6)
	local v7 = l__BundleMeta__3[p6];
	u4("ProximityPrompt", {
		ActionText = "Purchase", 
		ObjectText = v7.name, 
		HoldDuration = 0, 
		MaxActivationDistance = 12, 
		RequiresLineOfSight = false, 
		KeyboardKeyCode = l__Theme__5.promptKeyboardKey, 
		Parent = p5
	}).Triggered:Connect(function(p7)
		if not p7:GetAttribute("Purchased" .. p6) then
			l__MarketplaceService__8:PromptGamePassPurchase(p7, v7.gamepassId);
			return;
		end;
		l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__7.GIFTING, {
			GiftType = p6
		});
	end);
end;
local l__BattlePassUtils__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__ClientStore__10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__GiftType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType;
function v5.setupBattlePassPrompt(p8, p9)
	u4("ProximityPrompt", {
		ActionText = "Purchase", 
		ObjectText = "Season " .. tostring(l__BattlePassUtils__9.BATTLE_PASS_SEASON_NUMBER) .. " Battle Pass", 
		HoldDuration = 0, 
		MaxActivationDistance = 24, 
		RequiresLineOfSight = false, 
		KeyboardKeyCode = l__Theme__5.promptKeyboardKey, 
		Parent = p9
	}).Triggered:Connect(function(p10)
		if not l__ClientStore__10:getState().BattlePass.paid then
			l__MarketplaceService__8:PromptGamePassPurchase(p10, l__BattlePassUtils__9.BATTLE_PASS_GAMEPASS);
			return;
		end;
		l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__7.GIFTING, {
			GiftType = l__GiftType__11.BattlePass
		});
	end);
end;
local l__getBedwarsKitMeta__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__KnitClient__13 = v2.KnitClient;
function v5.setupKitPrompt(p11, p12, p13)
	local v8 = l__getBedwarsKitMeta__12(p13);
	u4("ProximityPrompt", {
		ActionText = "Purchase", 
		ObjectText = v8.name .. " Kit", 
		HoldDuration = 0, 
		MaxActivationDistance = 18, 
		RequiresLineOfSight = false, 
		KeyboardKeyCode = l__Theme__5.promptKeyboardKey, 
		Parent = p12
	}).Triggered:Connect(function(p14)
		if l__KnitClient__13.Controllers.UnlockController:isKitOwned(p13) then
			l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__7.GIFTING, {
				GiftType = p13
			});
			return;
		end;
		local l__gamepassId__9 = v8.gamepassId;
		if l__gamepassId__9 ~= 0 and l__gamepassId__9 == l__gamepassId__9 and l__gamepassId__9 then
			l__MarketplaceService__8:PromptGamePassPurchase(p14, v8.gamepassId);
		end;
	end);
end;
local l__BedwarsKitSkinMeta__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local l__GiftMeta__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta;
local u16 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KitViewport__17 = v1.import(script, script.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local l__KnitClient__18 = v2.KnitClient;
function v5.setupKitSkinPrompt(p15, p16, p17)
	local v10 = l__BedwarsKitSkinMeta__14[p17];
	u4("ProximityPrompt", {
		ActionText = "Purchase", 
		ObjectText = v10.name, 
		HoldDuration = 0, 
		MaxActivationDistance = 24, 
		RequiresLineOfSight = false, 
		KeyboardKeyCode = l__Theme__5.promptKeyboardKey, 
		Parent = p16
	}).Triggered:Connect(function(p18)
		local v11 = nil;
		local v12, v13, v14 = ipairs(l__ClientStore__10:getState().Bedwars.ownedKitSkins);
		while true do
			v12(v13, v14);
			if not v12 then
				break;
			end;
			v14 = v12;
			if v13 == p17 == true then
				v11 = v13;
				break;
			end;		
		end;
		if not v11 then
			if v10.kit then
				l__KnitClient__18.Controllers.KitSkinController:purchaseKitSkin(p17, v10.kit);
			end;
			return;
		end;
		local v15 = {
			GiftType = p17
		};
		local v16 = {};
		for v17, v18 in pairs(l__GiftMeta__15[p17]) do
			v16[v17] = v18;
		end;
		v16.customImage = u16.createElement(l__KitViewport__17, {
			Kit = v10.kit, 
			Skin = p17, 
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY"
		});
		v15.Gift = v16;
		l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__7.GIFTING, v15);
	end);
end;
local l__Players__19 = v3.Players;
function v5.purchaseBundle(p19, p20)
	l__MarketplaceService__8:PromptGamePassPurchase(l__Players__19.LocalPlayer, l__BundleMeta__3[p20].gamepassId);
end;
local v19 = l__KnitClient__13.CreateController(v5.new());
return nil;
